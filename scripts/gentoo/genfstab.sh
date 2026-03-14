#!/usr/bin/env bash
#
# This script generates the entries for the /etc/fstab file. If the fstab file
# has not yet been populated, then the output of this script can be appeded to
# fstab e.g. with tee -a /etc/fstab.
#
# The format expected in the fstab is that each line corresonds to a filesystem
# and should look something like this:
#
# <filesystem> <mountpoint> <fype> <options> <dump> <pass>
#
# NOTE: Instead of specifying the block device of the disk e.g. /dev/sda we use
#       UUIDs as this is more reliable if the disk enumeration changes.
#       Alternatively labels could be used to achive the same results. But this
#       seem to require more work to setup.

set -o errexit -o pipefail -o nounset

findmnt --real --list --json --output "UUID,TARGET,FSTYPE,OPTIONS"                          \
    | jq -r '.filesystems[] | [ "UUID=" + .uuid, .target, .fstype, .options, 0, 0 ] | @tsv' \
    | column --table
