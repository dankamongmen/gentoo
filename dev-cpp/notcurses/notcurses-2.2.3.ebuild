# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
inherit cmake-multilib

DESCRIPTION="Blingful TUIs and character graphics"
HOMEPAGE="https://notcurses.com"
SRC_URI="https://github.com/dankamongmen/notcurses/archive/v${PV}.tar.gz -> ${P}.tar.gz https://github.com/dankamongmen/notcurses/releases/download/v${PV}/notcurses-doc-${PV}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-libs/libunistring
	media-video/ffmpeg
	>=sys-libs/readline-8.0"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/pandoc )"

src_configure() {
	local mycmakeargs=(
		-DUSE_DOCTEST=OFF
		-DUSE_QRCODEGEN=OFF
		-DUSE_STATIC=OFF
		-DUSE_PANDOC="$(usex doc)"
	)
	cmake-multilib_src_configure
}

src_compile() {
	cmake-multilib_src_compile
}

src_test() {
	multilib_src_test
}
