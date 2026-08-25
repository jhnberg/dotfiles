#! /usr/bin/env sh
#
# This is a utility for synching the actual files with the repository.
# This allows me to experiment with the files until I feel happy with the
# results, at which point I can sync them and commit them to this repository.
#
# Exampels:
#
# sync-files.sh /path/to/file
# sync-files.sh /path/to/dir

set -o errexit -o nounset -o pipefail

TARGET_PATH=$(realpath $1)

case $TARGET_PATH in
"${HOME}/"*)
    LOCAL_PATH="$(dirname home/${TARGET_PATH#${HOME}/})/"
    rsync -avA --delete "${TARGET_PATH}" "${LOCAL_PATH}"
    ;;
"/etc/"*)
    # Sync files into the ./etc directory relative to the absolute path. This
    # makes it easy to filter out files and directoreis which we do not want to
    # include. Such as files we want to generate or other system specific
    # files.
    rsync -avA --delete --relative                            \
          --exclude='/etc/portage/make.conf'                  \
          --exclude='/etc/portage/make.profile'               \
          --exclude='/etc/portage/binrepos.conf/*'            \
          --exclude='/etc/portage/package.use/.*'             \
          --exclude='/etc/portage/package.use/00-cpuflags'       \
          --exclude='/etc/portage/package.use/00-videocards'     \
          --exclude='/etc/portage/postsync.d/*'               \
          --exclude='/etc/portage/savedconfig/sys-firmware/*' \
          --exclude='/etc/portage/savedconfig/sys-kernel/*'   \
          "${TARGET_PATH}" "${PWD}/"
    ;;
"/var/db/repos/local/"*)
    rsync -avA --delete "${TARGET_PATH}" "${PWD}/pkgs"
    ;;
"/var/db/repos/local")
    # This is the same as above but for the whole directory, and we also add
    # the / at the end to only sync the files inside the local directory and
    # not the directory itself.
    rsync -avA --delete "${TARGET_PATH}/" "${PWD}/pkgs"
    ;;
*)
    echo "Unsupported path!" >> /dev/stderr
    exit 1
    ;;
esac
