ARG FEDORA_RELEASE=34
FROM registry.fedoraproject.org/f$FEDORA_RELEASE/fedora-toolbox:$FEDORA_RELEASE
COPY codium.repo /etc/yum.repos.d/

RUN set -x \
  \
  && dnf -y install --nogpgcheck \
    mesa-vulkan-drivers \
    xdg-user-dirs \
    pulseaudio \
    libXrandr \
    libXcursor \
    codium \
  # UE4 finds vscode at /usr/bin/code
  && ln -s /usr/bin/codium /usr/bin/code