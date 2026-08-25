#!/usr/bin/env bash
#
# This script automatically configures portage on a system it is run on.

set -o errexit -o pipefail -o nounset

PORTAGE_DIR=/etc/portage
PORTAGE_REPOS_DIR=/var/db/repos

if [[ $EUID != 0 ]]
then
    echo "Please run as root" > /dev/stderr
    exit 1
fi

if ! [[ -d "${PORTAGE_DIR}" ]]
then
    echo "No portage directory found!" > /dev/stderr
    exit 1
fi

# Directoreis in the PORTAGE_DIR which should exits.
DIRS=("env/"
      "repos.conf/"
      "sets/"
      "package.use/"
      "patches/**/*/"
     )

# The files in PORTAGE_DIR which will be copied. These files are copied on each
# invocation
COPY_FILES=("env/*"
            "repos.conf/eselect-repo.conf"
            "repos.conf/local.conf"
            "sets/**"
            "package.env"
            "package.license"
            "package.use/10-core"
            "package.use/20-static"
            "package.use/20-test"
            "package.use/20-xorg"
            "package.use/30-misc"
            "package.use/50-llvm"
            "package.use/50-lua"
            "package.use/50-python"
            "package.use/50-qemu"
            "package.use/50-ruby"
            "package.use/50-steam"
            "package.mask/**"
            "package.accept_keywords/**"
            "patches/**/*/*.patch"
           )

# These files are only copies if they do not already exist, with the intention
# that they should be edited to configure the system.
TEMPLATE_FILES=("make.conf"
                "package.use/00-videocards"
               )

for path in ${DIRS[@]}
do
    for dir in etc/portage/${path[@]}
    do
        echo "[DIR]  ${dir#etc/portage/}"
        mkdir -p "${PORTAGE_DIR}/${dir#etc/portage/}"
    done
done

for path in ${COPY_FILES[@]}
do
    for file in etc/portage/${path[@]}
    do
        echo "[COPY] ${file#etc/portage/}"
        cp -f ${file} ${PORTAGE_DIR}/${file#etc/portage/}
    done
done

for path in ${TEMPLATE_FILES[@]}
do
    for file in etc/portage/${path[@]}
    do
        echo "[TEMPLATE] ${file#etc/portage/}"
        cp --update=none ${file} ${PORTAGE_DIR}/${file#etc/portage/}
    done
done

# Install the files for the local repository, these will not be synced online
# as they are just conveniences.
mkdir -p "${PORTAGE_REPOS_DIR}/local"
rsync -avA --delete "${PWD}/pkgs/" "${PORTAGE_REPOS_DIR}/local/"
chown -R portage:portage "${PORTAGE_REPOS_DIR}/local"

# The enabled repos should are automatically detected.
#
# We must get the list of repos last as this only makes sense after we populate
# all other directories e.g. the portage/repos.conf/ directory.
REPOS=$(portageq get_repos / | xargs -n1 | grep -vxF gentoo \
                             | grep -vxF local | xargs)
echo "[REPOS] Syncing... ${REPOS[@]}"
emerge --ignore-default-opts -v --sync ${REPOS[@]}
