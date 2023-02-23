# Original source: https://github.com/brokenpylons/docker-lualatex
FROM debian:stretch-slim as installer
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
    perl-modules \
    liburi-encode-perl \
    gnupg \
    wget \
    ca-certificates \
    xzdec && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /install

COPY texlive.profile .

RUN wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xzf- --strip-components=1 && \
    ./install-tl -profile texlive.profile

FROM debian:stretch-slim
ARG DEBIAN_FRONTEND=noninteractive

COPY --from=installer /usr/local/texlive /usr/local/texlive

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        perl-modules \
        liburi-encode-perl \
        gnupg \
        wget \
        latexmk && \
    rm -rf /var/lib/apt/lists/*

ENV HOME=/tmp PATH="/usr/local/texlive/bin/x86_64-linux:$PATH"

RUN tlmgr init-usertree &&\
    tlmgr install \
    collection-latex \
    collection-luatex \
    collection-latexextra \
    collection-fontsextra \ && \
    rm -rf /usr/local/texlive/texmf-var/*


COPY entrypoint.sh /app/
RUN chmod 755 /app/entrypoint.sh

WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/app/entrypoint.sh"]
