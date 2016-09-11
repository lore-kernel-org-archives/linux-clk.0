Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 11 Sep 2016 22:44:20 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: arm@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner DT changes for 4.9, take 2
Message-ID: <20160911204420.GA11949@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
List-ID: <linux-clk.vger.kernel.org>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following branch for 4.9, based on top of the previous
one.

To maintain bisectability, while avoiding some un-trivial merge
conflicts, I had to merge the clk branch that I've sent a PR to Mike
and Stephen. This branch will of course be stable.

Thanks!
Maxime

The following changes since commit bdc2601b02d31974b5765b93ac263b2eeab2e07c:

  Merge branch 'sunxi/clk-for-4.9' into sunxi/dt-for-4.9 (2016-09-10 11:45:=
28 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-dt-for-4.9-2

for you to fetch changes up to 7a988a4dd29a8cfcf405a12441533d765d25a6b8:

  ARM: dts: gr8: Add support for the GR8 evaluation board (2016-09-11 22:23=
:17 +0200)

----------------------------------------------------------------
Allwinner DT changes for 4.9, take 2

A second set of device tree changes, this time switching a few SoCs to the
new sunxi-ng clock framework. We also added the support for a new SoC
(NextThing GR8 and its evaluation board), and the support for the DRM
driver in the A33.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      ARM: dts: sun6i: switch A31/A31s to new CCU clock bindings
      ARM: dts: sun8i: Move A23/A33 usbphy and usb_otg nodes to common dtsi

Maxime Ripard (3):
      ARM: sun8i: Convert the A23 and A33 to the CCU
      ARM: sun8i: a33: Add display pipeline
      ARM: sun8i: a23/a33: Add RGB666 pins

Myl=E8ne Josserand (2):
      ARM: dts: Add NextThing GR8 dtsi
      ARM: dts: gr8: Add support for the GR8 evaluation board

 arch/arm/boot/dts/Makefile           |    1 +
 arch/arm/boot/dts/ntc-gr8-evb.dts    |  342 +++++++++++
 arch/arm/boot/dts/ntc-gr8.dtsi       | 1087 ++++++++++++++++++++++++++++++=
++++
 arch/arm/boot/dts/sun6i-a31.dtsi     |  424 +++----------
 arch/arm/boot/dts/sun8i-a23-a33.dtsi |  295 +++------
 arch/arm/boot/dts/sun8i-a23.dtsi     |   80 +--
 arch/arm/boot/dts/sun8i-a33.dtsi     |  236 +++++---
 7 files changed, 1791 insertions(+), 674 deletions(-)
 create mode 100644 arch/arm/boot/dts/ntc-gr8-evb.dts
 create mode 100644 arch/arm/boot/dts/ntc-gr8.dtsi

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX1cIjAAoJEBx+YmzsjxAg87QP/1BytHbO73xXMPl7+b1/BjOC
uZ6AG9RvRNTjcypnHeTyiJZsh2WOJ2DH5NNNgh5RyAmz8f0OgGT0Vzer95x3mDO4
2wnF29VJVx5PvWh7JpORT+pW25g19dz5O6lZLp7ua3aheOSiF8WGLmTy/9PJE28g
5InAPkU5sLXGaZ70HwgNXM5Vh0uB6emk5+LEm06X8sBB0h13mvhn25ZjIr0v300a
dc9Gp87S0qalSqBYR8tppZlYNxN3d/kKBRCaNe2hJxPejH7A5nThHwARd1mD6t6I
/+xVpiSh/nwdxa1rkHgvPReXILERdtM/6QmHS3lRBlhTIN0jYFo0SIXoSoWywsRa
jdvFDb0BKta0DrZf/y9bKSApRxjKnWqi5qJoXuSGgHHJKEykhZ9CArZAB8YwUw42
c9b+QMeW3VnhN1S8XFNGb4ih2XeNMyzt5qUnxmnItU94m1iknhU/Pk8MSc0qh9CK
iGo8KzpEq9B2IB3gRIEAaTj0bQbLD2FUPYJdbzpkBPbUCi3GNGdi58DqiMaJw55f
r4Ke7RHobmlWsGf7mfZN7yjcO7YeQFYZW3l0mumSppHcGDW/hob8lPCCdLKljws2
XLUEI/Sg93WV6aYlWoZBe9Xy9K+VEKUUw+WKswRigctZVycBd2SbxM95b/bOpgEu
HZNF5gKZ9eSVJUltDeLV
=q4/x
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
