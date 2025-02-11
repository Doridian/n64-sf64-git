#!/bin/sh
set -e

export SHIP_HOME="${HOME}/.config/n64/sf64"
export SDL_VIDEODRIVER=wayland
mkdir -p "${SHIP_HOME}"

if [ ! -f "${SHIP_HOME}/sf64.o2r" ]; then
  ln -sf /opt/n64/sf64-git/sf64.o2r "${SHIP_HOME}/sf64.o2r"
fi

cd "${SHIP_HOME}"
exec /opt/n64/sf64-git/Starship
