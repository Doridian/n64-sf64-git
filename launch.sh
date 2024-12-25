#!/bin/sh
set -e

export SHIP_HOME="${HOME}/.config/starship"
export SDL_VIDEODRIVER=wayland
mkdir -p "${SHIP_HOME}"

if [ ! -f "${SHIP_HOME}/sf64.otr" ]; then
  ln -sf /opt/starship-git/sf64.otr "${SHIP_HOME}/sf64.otr"
fi

cd "${SHIP_HOME}"
exec /opt/starship-git/Starship
