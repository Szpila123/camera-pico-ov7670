### Development container for easier compilation environment setup

FROM debian:latest

ARG EDITORPKG=vim

# Install all packages
RUN apt update && apt install --no-install-recommends -y\
    cmake gcc-arm-none-eabi gcc g++ libstdc++-arm-none-eabi-newlib libnewlib-arm-none-eabi\
    automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev git\
    bash-completion python3 ssh ca-certificates

# Project directory should be copied to pi-pico
RUN mkdir -p /var/pi-pico/ext/pico-sdk
COPY . /var/pi-pico/
WORKDIR /var/pi-pico
RUN git clone https://github.com/raspberrypi/pico-sdk.git ext/pico-sdk

# Setup environment
ENV PICO_SDK_PATH="/var/pi-pico/ext/pico-sdk"
