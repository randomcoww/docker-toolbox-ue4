FROM registry.fedoraproject.org/f33/fedora-toolbox:33

ARG GITHUB_TOKEN
ARG BRANCH
WORKDIR /src

RUN set -x \
  \
  && dnf -y install \
    make \
  && dnf clean all \
  \
  && git clone --depth=1 -b ${BRANCH} \
    https://${GITHUB_TOKEN}:x-oauth-basic@github.com/EpicGames/UnrealEngine.git \
  && cd UnrealEngine \
  && rm -rf .git \
  && ./Setup.sh \
  && ./GenerateProjectFiles.sh \
  && make -j "$(getconf _NPROCESSORS_ONLN)" 

WORKDIR /src/UnrealEngine