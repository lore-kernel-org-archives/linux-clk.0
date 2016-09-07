Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 7 Sep 2016 21:33:35 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner clock fixes for 4.8
Message-ID: <20160907193335.GA4283@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
List-ID: <linux-clk.vger.kernel.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following tag for the 4.8 release.

Thanks!
Maxime

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clk-fixes-for-4.8

for you to fetch changes up to 6654674cb7b5953ac04fc9d7f5f511676ae97e29:

  clk: sunxi-ng: Fix wrong reset register offsets (2016-08-29 08:38:55 +020=
0)

----------------------------------------------------------------
Clock Fixes for the Allwinner SoCs, 4.8 Edition

The usual bunch of fixes to the our clock drivers, mostly targetted to the
brand new sunxi-ng drivers.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      clk: sunxi-ng: Fix inverted test condition in ccu_helper_wait_for_lock
      clk: sunxi-ng: nk: Make ccu_nk_find_best static

Jorik Jonker (1):
      clk: sunxi-ng: Fix wrong reset register offsets

Wei Yongjun (2):
      clk: sunxi: pll2: Fix return value check in sun4i_pll2_setup()
      clk: sunxi: Fix return value check in sun8i_a23_mbus_setup()

 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 16 ++++++++--------
 drivers/clk/sunxi-ng/ccu_common.c   |  2 +-
 drivers/clk/sunxi-ng/ccu_nk.c       |  6 +++---
 drivers/clk/sunxi/clk-a10-pll2.c    |  4 ++--
 drivers/clk/sunxi/clk-sun8i-mbus.c  |  2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0GuPAAoJEBx+YmzsjxAglMQP/07Umfq0BYQlrCiLuMKPRMwa
UhAVd0lvZS7IHpIHDuZGuNtFlNlUDLFa7W29YwIUFqLpfHF66827kZge4SlzV4Oc
lMWq9PZoj8Mb6kagn8UeolfuIazMGqdHCxRkFIe7XuqHwX9ZGvCn6cywrPkkIbS1
2O0RGiF6jKn7hcuiCy8DtChAKIzF4StCdMB15mYZDDFo6Istp999MiK4wEwJ3SNC
8wgSOP5u5p4IV2pY1KavaMXKZqMzBQeTcuASdYqwZqPX284E5VHyzuffvDKMlJs/
H++A0+blt9jxaD1ZSbWohY3RffMB0Vcq2OGR8P/bUacz3/jfPyHM6cWcG+Wj9A2h
onjqhoTIknWqkpuPhCNmyYoNBNQC27izWKcSAivFcNBE7Ign3TT2SugQc2HCHDLv
jYYW2rtVZHnLEDCTfPFhRbrag1vfDUK47WyV7EmumSJljh62NknguPUp2TQFLrKj
BP5i2WI7NWr3tE9LB9cpE0M1HL/zyWGTgHRwSc/wn69thbgCgQpe4rN/DRroWQ90
u/+Y2Q2Qphwi72AdewtZ9VFQ+QVcaGiqSvy4OkqAAQmczZBBUYUuG/b8FOwGe9FV
+QUHnLc4lDQmEvqIy4yU+HiTG1OeBYlDJGiku/RCTmVwi05FEWYimIyMTsgNLeXY
sx+nVYbOIBPSi3SpqbIE
=YjYr
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
