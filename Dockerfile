FROM haskell

# 1. these add system dependencies for the stg-interpreter
RUN apt update && apt install -y pkg-config libbz2-dev 

RUN echo "Installing system dependencies required to compile GHC." &&\
    apt install -y \
      libzstd-dev \
      mc \
      autoconf \
      build-essential \
      curl \
      gcc \
      git \
      libc6-dev \
      libffi-dev \
      libgmp-dev \
      libncurses-dev \
      libtinfo5 \
      python3 \
      python3-sphinx \
      wget \
      xz-utils \
      libgl1-mesa-dev \
      libxi-dev \
      libxrandr-dev \
      libxcursor-dev \
      libxinerama-dev \
      openjdk-11-jre \
      vim \
      freeglut3-dev

RUN wget -q --show-progress https://github.com/gephi/gephi/releases/download/v0.9.2/gephi-0.9.2-linux.tar.gz &&\
    tar xzf gephi-0.9.2-linux.tar.gz


RUN cabal update && cabal install happy-1.19.12 && cabal install alex-3.2.6

# 2. ghcup is required for installing a specific version of ghc systemwide.
ARG GHCUP_BIN_DIR="/root/.ghcup/bin"
ARG GHCUP_VERSION="0.1.17.2"
ARG GHCUP_CHECKSUM="e9adb022b9bcfe501caca39e76ae7241af0f30fbb466a2202837a7a578607daf"

ENV PATH=${GHCUP_BIN_DIR}:${PATH}
ENV DISPLAY=:0

COPY ./fetch_ghcup.sh /tmp/fetch_ghcup.sh
RUN chmod +x /tmp/fetch_ghcup.sh

RUN echo "Downloading and installing 'ghcup'." &&\
    ./tmp/fetch_ghcup.sh \
      "${GHCUP_VERSION}" \
      "${GHCUP_CHECKSUM}" \
      "/tmp/ghcup" &&\
    mv /tmp/ghcup /usr/bin/ghcup &&\
    chmod +x /usr/bin/ghcup &&\
    rm /tmp/fetch_ghcup.sh

# 3. install the specific ghc version
RUN ghcup install ghc 8.8.3 && ghcup set ghc 8.8.3

# 4. add the projects to the image so we can build them
ADD ./. /root/

# 5. we first install the stg interpreter as per instructions, note the sytem dependencies of (1)
WORKDIR /root/ghc-whole-program-compiler-project/external-stg-interpreter/
RUN stack setup && stack install

WORKDIR /root/ghc-whole-program-compiler-project/mod-pak
RUN stack install
WORKDIR /root/ghc-whole-program-compiler-project/ghc-wpc

RUN ./boot
RUN ./configure
RUN hadrian/build-stack -j || hadrian/build-stack -j

# 6. zstd .zip support

# zstd support for unzip
WORKDIR /root/unzip-zstd
RUN make -f unix/Makefile generic_zstd && cp unzip $HOME/.local/bin

# midnight commander zstd-zip browsing
WORKDIR /root/
RUN unzip mc-zstd-support.zip

# make base available (who knows how t
WORKDIR /root/ghc-whole-program-compiler-project/external-stg-interpreter/data/cbits.so-script/
RUN cp /root/ghc-whole-program-compiler-project/external-stg-interpreter/data/libHSbase-4.14.0.0.cbits.so ./
RUN ./c
RUN cp /root/ghc-whole-program-compiler-project/ghc-wpc/_build/stage1/rts/build/libffi.so /usr/lib/x86_64-linux-gnu/libffi.so.7
RUN cp ./libHSbase-4.14.0.0.cbits.so /root/demo-01-tsumupto/
WORKDIR /root/
