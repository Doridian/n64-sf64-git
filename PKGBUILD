# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=sf64-git
pkgver=r1254.8c3f57af
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
    'sf64-git.desktop'
)
sha256sums=(
    'SKIP'
    '385bcf1901ed12fb1152f3c227d1968cc54ae41e8566da66695df71af40a573f'
    'SKIP'
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
  cd "${srcdir}/${pkgname}"

  install -Dm755 "${srcdir}/launch.sh" "${pkgdir}/opt/sf64-git/launch.sh"
  install -Dm644 "${srcdir}/sf64-git.desktop" "${pkgdir}/usr/share/applications/sf64-git.desktop"
  install -Dm755 build-cmake/Starship "${pkgdir}/opt/sf64-git/Starship"
  install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/sf64-git.png"
  install -Dm644 build-cmake/sf64.otr "${pkgdir}/opt/sf64-git/sf64.otr"
  install -Dm644 build-cmake/sf64.otr "${pkgdir}/opt/sf64-git/sf64.otr"
}

# vim:set ts=2 sw=2 et:
