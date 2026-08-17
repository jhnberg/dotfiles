#!/usr/bin/env bash
#
# This script automatically configures portage on a system it is run on.

set -o errexit -o pipefail -o nounset

PORTAGE_DIR=/etc/portage

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
            "package.accept_keywords/**"
            "patches/**/*/*.patch"
           )

# These files are only copies if they do not already exist, with the intention
# that they should be edited to configure the system.
TEMPLATE_FILES=("make.conf"
               )

# The M4 files which will generate configuration files in PORTAGE_DIR.
M4=("package.use/cpuflags.m4"
    "package.use/videocards.m4"
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

for path in ${M4[@]}
do
    echo "[M4]   ${path%.m4}"
    m4 m4/${path} > ${PORTAGE_DIR}/${path%.m4}
done

# The enabled repos should are automatically detected.
#
# We must get the list of repos last as this only makes sense after we populate
# all other directores e.g. the portage/repos.conf/ directory.
REPOS=$(portageq get_repos / | xargs -n1 | grep -vxF gentoo | xargs)
echo "[REPOS] Syncing... ${REPOS[@]}"
emerge --ignore-default-opts -v --sync ${REPOS[@]}
