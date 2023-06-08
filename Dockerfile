### Development container for easier compilation environment setup

FROM debian:latest

ARG EDITORPKG=vim

# Install all packages
RUN apt update && apt install --no-install-recommends -y\
    cmake gcc-arm-none-eabi gcc g++ libstdc++-arm-none-eabi-newlib libnewlib-arm-none-eabi\
    automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev git\
    bash-completion python3 ssh ca-certificates

# Setup environment
ENV PROJECT_PATH='/var/pi-pico'
ENV PICO_SDK_PATH="${PROJECT_PATH}/ext/pico-sdk"

# Project directory should be copied to pi-pico
RUN mkdir -p ${PICO_SDK_PATH}
COPY . ${PROJECT_PATH}
WORKDIR ${PROJECT_PATH}

# Clone pico-sdk
RUN git clone https://github.com/raspberrypi/pico-sdk.git ${PICO_SDK_PATH}
