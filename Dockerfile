FROM gentoo/stage3:systemd as base
RUN emerge -q --sync
RUN MAKEOPTS="-j$(nproc)"   \
    emerge -uqvDN @world

# NOTE any change to the context causes a rebuild. It would be nice to
# avoid this.
FROM base AS install
COPY . /tmp/dotfiles
WORKDIR /tmp/dotfiles
RUN ./scripts/gentoo/install.sh
WORKDIR /
RUN rm -rfd /tmp/dotfiles

FROM install
ARG USERNAME=docker
ARG USER_UID=1000
ARG USER_GID=1000
RUN useradd --create-home $USERNAME
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME

# NOTE any change to the context causes a rebuild. It would be nice to
# avoid this.
COPY . /usr/local/src/dotfiles/

# TODO configure the user
USER $USERNAME
WORKDIR /home/$USERNAME
