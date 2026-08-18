FROM gentoo/stage3:systemd as base

# Update packages and install essentials
RUN emerge -q --sync
RUN MAKEOPTS="-j$(nproc)"     \
    emerge -uqvDN @world      \
                  dev-vcs/git

# Install a minimal set of packages
RUN mkdir -p /etc/portage/repos.conf
COPY ./etc/portage/repos.conf/ /etc/portage/repos.conf/
RUN emerge -v --sync $(portageq get_repos / | xargs -n1 | grep -vxF gentoo | xargs)
COPY ./etc/portage/package.accept_keywords/ /etc/portage/package.accept_keywords/
COPY ./etc/portage/make.conf /etc/portage/
COPY ./etc/portage/package.use/00-cpuflags /etc/portage/package.use/
COPY ./etc/portage/package.use/00-videocards /etc/portage/package.use/
RUN MAKEOPTS="-j$(nproc)"                                               \
    emerge -qv --ignore-default-opts app-admin/sudo                     \
                                     app-editors/neovim                 \
                                     app-shells/zsh                     \
                                     app-shells/gentoo-zsh-completions  \
                                     app-shells/zsh-autosuggestions     \
                                     app-shells/zsh-syntax-highlighting \
                                     app-shells/zsh-completions         \
                                     app-misc/fastfetch                 \
                                     app-misc/tmux                      \
                                     app-portage/eix                    \
                                     sys-apps/ripgrep                   \
                                     sys-process/htop                   \
                                     sys-process/btop                   \
                                     x11-misc/xdg-user-dirs             \
                                     x11-themes/catppuccin-btop

# Create a user with a home directory and sudo permissions.
ARG USERNAME=docker
ARG USER_UID=1000
ARG USER_GID=1000
RUN useradd --shell $(which zsh) --create-home $USERNAME
RUN mkdir -p /etc/sudoers.d/
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL | tee /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME

# Finally, configure the created users home directory.
USER $USERNAME
WORKDIR /home/$USERNAME
RUN xdg-user-dirs-update
RUN mkdir -p Projects
COPY --chown=$USERNAME:$USERNAME . Projects/dotfiles
RUN cd Projects/dotfiles && ./scripts/install.sh
CMD zsh
