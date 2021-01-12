FROM registry.fedoraproject.org/f33/fedora-toolbox:33

RUN set -x \
  \
  && dnf install -y \
    mesa-vulkan-drivers \
    xdg-user-dirs \
    pulseaudio \
    libXrandr \
    libXcursor \
  && dnf clean all