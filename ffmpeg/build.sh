#!/bin/bash

mkdir -vp ${PREFIX}/bin;

export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"

ARCH="$(uname 2>/dev/null)"

LinuxInstallation() {

    chmod +x configure;

    ./configure \
        --enable-gpl \
        --enable-nonfree \
        --enable-shared \
        --enable-pic \
        --enable-libx264 \
        --enable-openssl \
        --disable-podpages \
        --prefix=${PREFIX} || return 1;
    make || return 1;
    make install || return 1;

    return 0;
}

DarwinInstallation() {
    # Derived from the Homebrew Formula
    # https://github.com/Homebrew/homebrew/blob/master/Library/Formula/ffmpeg.rb

    chmod +x configure;

    ./configure \
        --enable-gpl \
        --enable-nonfree \
        --enable-shared \
        --enable-pic \
        --enable-libx264 \
        --enable-openssl \
        --disable-podpages \
        --prefix=${PREFIX} || return 1;
    make || return 1;
    make install || return 1;
    install_name_tool -id $PREFIX/lib/libavcodec.55.dylib libavcodec.55.dylib
    install_name_tool -id $PREFIX/lib/libavdevice.55.dylib libavdevice.55.dylib
    install_name_tool -id $PREFIX/lib/libavformat.55.dylib libavformat.55.dylib
    install_name_tool -id $PREFIX/lib/libswresample.0.dylib libswresample.0.dylib
    install_name_tool -id $PREFIX/lib/libswscale.2.dylib libswscale.2.dylib


    return 0;
}

case ${ARCH} in
    'Linux')
        LinuxInstallation || exit 1;
        ;;
    'Darwin')
        DarwinInstallation || exit 1;
	;;
    *)
        echo -e "Unsupported machine type: ${ARCH}";
        exit 1;
        ;;
esac
