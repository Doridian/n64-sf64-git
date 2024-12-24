# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=starship-git
pkgver=r1251.d5ac40a4
pkgrel=1
pkgdesc='Recompilation of Star Fox 64 for modern systems'
arch=('any')
url='https://github.com/HarbourMasters/Starship.git'
license=('MIT')
makedepends=('git' 'cmake' 'ninja' 'lsb-release' 'boost')
depends=('sdl2' 'libpng' 'libzip' 'nlohmann-json' 'tinyxml2' 'spdlog' 'sdl2_net')
source=(
    "${pkgname}::git+${url}"
    'baserom.us.rev1.z64' # Copyrighted, you have to find this yourself
    'launch.sh'
)
sha256sums=(
    'SKIP'
    '385bcf1901ed12fb1152f3c227d1968cc54ae41e8566da66695df71af40a573f'
    'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  #export CFLAGS="${CFLAGS} -Wno-format-security"
  #export CXXFLAGS="${CXXFLAGS} -Wno-format-security"
  export CFLAGS=""
  export CXXFLAGS=""
  export LDFLAGS=""

  git submodule update --init --recursive

  # Release builds are broken
  #cmake -DCMAKE_BUILD_TYPE:STRING=Release -H. -Bbuild-cmake -GNinja
  cmake -H. -Bbuild-cmake -GNinja

  cp -vf "${srcdir}/baserom.us.rev1.z64" "${srcdir}/${pkgname}/"
  cmake --build build-cmake --target ExtractAssets 

  #cmake --build build-cmake --config Release
  cmake --build build-cmake
}

package() {
  install -Dm755 "${srcdir}/launch.sh" "${pkgdir}/usr/bin/starship"
  cd "${srcdir}/${pkgname}"
  install -Dm755 build-cmake/Starship "${pkgdir}/opt/starship/Starship"
  install -Dm644 build-cmake/sf64.otr "${pkgdir}/opt/starship/sf64.otr"
  #install -Dm644 baserom.us.rev1.z64 "${pkgdir}/opt/starship/baserom.us.rev1.z64"
}

# vim:set ts=2 sw=2 et:
