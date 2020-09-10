#!/bin/sh

: ${PREFIX:="/usr/local"}
: ${SHARE_DIR:="${PREFIX}/share"}
: ${BIN_DIR:="${PREFIX}/bin"}

VERSION="3.16.5"
ARCH=`uname -p`
OS=`uname -s | tr '[[:upper:]]' '[[:lower:]]'`

if [ ! -z $1 ]; then
    VERSION="$1"
fi

CMAKE_VERSION=`echo ${VERSION} | sed -Ee 's/\.[[:digit:]]+$//'`

mkdir -p share
ln -s -f ${SHARE_DIR}/cmake share/cmake-${CMAKE_VERSION}
ln -s -f ${SHARE_DIR}/aclocal share/aclocal
ln -s -f ${PREFIX}/bin bin

cat <<__EOF__ >package.json
{
    "description": "CMake is an open-source, cross-platform family of tools designed to build, test and package software.",
    "name": "tool-cmake",
    "system": [
        "${OS}_${ARCH}"
    ],
    "url": "https://github.com/trombik/platformio-freebsd-tool-cmake",
    "version": "${VERSION}"
}
__EOF__
