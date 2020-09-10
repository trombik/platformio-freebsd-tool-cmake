# `platformio-freebsd-tool-cmake`

Trick `platformio` so that it thinks `tool-cmake`, a `platformio` package, is
installed.

## Rationale

Same as in
[`trombik/platformio-freebsd-toolchain-xtensa`](https://github.com/trombik/platformio-freebsd-toolchain-xtensa).


## What it does

`init.sh` creates symlinks to the directories where the system package
installed the tool-chain, and creates `package.json`.

## Requirements

Install the following packages.

- `cmake`

## Usage

```console
cd ~/.platformio/packages
git clone https://github.com/trombik/platformio-freebsd-tool-cmake.git tool-cmake
cd tool-cmake
./init.sh
```

`init.sh` creates symlinks and `package.json`.

## Further improvement

The script should be able to support other OSes, such as OpenBSD as long as a
package for the OS is provided.
