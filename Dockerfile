FROM registry.fedoraproject.org/f33/fedora-toolbox:33
COPY codium.repo /etc/yum.repos.d/

RUN set -x \
  \
  && dnf install -y \
    mesa-vulkan-drivers \
    xdg-user-dirs \
    pulseaudio \
    libXrandr \
    libXcursor \
    codium \
  && dnf clean all \
  # UE4 finds vscode at /usr/bin/code
  && ln -s /usr/bin/codium /usr/bin/code