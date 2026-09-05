#!/usr/bin/env python3
#
# This is a utility for blocking/unblocking the idler. The script is intended
# to be used to implement widgets to manage the idle inhibitor. This script
# accepts command line arguments for specific operations. The --lock/--unlock
# commnad line arguments will inhibit and uninhibit idling. --toggle will
# alternate between inhibit and uninhibit depending on the current state, and
# --state/--watch prints the current state, if idle inhibit is enabled then
# "locked" and "unlocked" otherwise. The current inhibited/uninhibited state is
# tracked by storing a file in $XDG_RUNTIME_DIR, don't create, delete or edit
# this file manually.
#
# Examples:
#
# - Lock idling
#   ``idlelock.py --lock``
# - Unlock idling
#   ``idlelock.py --unlock''
# - Lock/Unlock idling
#   ``idlelock.py --toggle``
# - Check lock state
#   ``idlelock.py --state``
# - Watch lock state
#   ``idlelock.py --watch``

__author__ = 'John Berg'
__license__ = 'MIT'

import argparse
import dbus
import enum
import os
import signal
import sys
import threading
import watchdog.events
import watchdog.observers


class Mode(enum.Enum):
    state = enum.auto()
    watch = enum.auto()
    lock = enum.auto()
    unlock = enum.auto()
    toggle = enum.auto()


user = os.getenv('USER')
runtime_dir = os.getenv('XDG_RUNTIME_DIR')
pid_path = os.path.join(runtime_dir, '{}_idlelock.pid'.format(user))


def main():
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--state',
                       dest='mode',
                       action='store_const',
                       const=Mode.state)
    group.add_argument('--watch',
                       dest='mode',
                       action='store_const',
                       const=Mode.watch)
    group.add_argument('--lock',
                       dest='mode',
                       action='store_const',
                       const=Mode.lock)
    group.add_argument('--unlock',
                       dest='mode',
                       action='store_const',
                       const=Mode.unlock)
    group.add_argument('--toggle',
                       dest='mode',
                       action='store_const',
                       const=Mode.toggle)

    args = parser.parse_args()

    match args.mode if args.mode else Mode.state:
        case Mode.state:
            state()
        case Mode.watch:
            watch()
        case Mode.lock:
            lock()
        case Mode.unlock:
            unlock()
        case Mode.toggle:
            toggle()


def state():
    state = 'locked' if os.path.exists(pid_path) else 'unlocked'
    print(state)
    sys.stdout.flush()


def watch():
    handler = watchdog.events.PatternMatchingEventHandler(
            patterns=[pid_path],
            ignore_directories=True,
            case_sensitive=True)
    handler.on_created = _on_create_or_delete
    handler.on_deleted = _on_create_or_delete

    observer = watchdog.observers.Observer()
    observer.schedule(handler, path=runtime_dir, recursive=False)

    # Print the current state before starting the watching
    state()

    observer.start()
    threading.Event().wait()  # Block indefinetly
    observer.stop()
    observer.join()


def lock():
    if os.path.exists(pid_path):
        sys.stderr.write('Already locked\n')
        return

    # When we inhibit the screensaver, we need to keep the process alive as
    # otherwise the indling will be uninhibited when the process is terminated.
    # As such, we work around this by spawning a daemon which will stay alive
    # and wait for a signal to uninhibit (and terminate).
    if not _daemon():
        sys.exit()

    interface = _get_screensaver_interface()
    cookie = interface.Inhibit(__file__,
                               'User is inhibiting idling')

    with open(pid_path, 'w') as pid_file:
        pid_file.write(str(os.getpid()))

    signal.signal(signal.SIGUSR1, _sighandler)
    signal.signal(signal.SIGUSR2, _sighandler)
    signal.pause()  # Wait for either SIGUSR1 or SIGUSR2

    os.remove(pid_path)
    interface.UnInhibit(cookie)


def unlock():
    if not os.path.exists(pid_path):
        sys.stderr.write('Not locked\n')
        return

    with open(pid_path, 'r') as pid_file:
        os.kill(int(pid_file.read()), signal.SIGUSR1)


def toggle():
    if not os.path.exists(pid_path):
        lock()
    else:
        unlock()


def _on_create_or_delete(evt):
    '''
    This is the callback function for the watchdog handler which is called when
    a file is created/deleted. This should only fire on events related to the
    pid_path.
    '''
    if evt.event_type == 'created':
        print('locked')
    elif evt.event_type == 'deleted':
        print('unlocked')
    sys.stdout.flush()


def _get_screensaver_interface():
    '''
    This is an internal helper function for fetching the dbus interface for
    inhibiting or uninhibiting the system from idling.
    '''

    session_bus = dbus.SessionBus()
    screensaver_obj = session_bus.get_object('org.freedesktop.ScreenSaver',
                                             '/org/freedesktop/ScreenSaver')
    screensaver_if = dbus.Interface(screensaver_obj,
                                    'org.freedesktop.ScreenSaver')
    return screensaver_if


def _daemon():
    '''
    This is the internal helper function for spawning a daemon process. The
    parent process which spawns the daemon returns False, whilst the daemon
    process returns True.
    '''
    if os.fork() > 0:
        return False

    os.setsid()
    os.chdir('/')
    os.umask(0)

    with open(os.devnull, 'r+') as null:
        os.dup2(null.fileno(), sys.stdin.fileno())
        os.dup2(null.fileno(), sys.stdout.fileno())
        os.dup2(null.fileno(), sys.stderr.fileno())

    return True


def _sighandler(signum, frame):
    '''
    This is the generic signal handler which we register with signal.signal()
    to handle signals.
    '''
    pass  # NOP we just need to register handlers so we can call signal.pause()


if __name__ == '__main__':
    main()
