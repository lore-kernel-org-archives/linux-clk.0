Return-Path: <wens@wens.csie.org>
Date: Mon, 21 Aug 2017 10:45:31 +0800
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner clock changes for 4.14 round 2
Message-ID: <20170821024531.7ghc3n5r57qrrou4@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xdmxfzybeync3pds"
List-ID: <linux-clk.vger.kernel.org>


--xdmxfzybeync3pds
Content-Type: text/plain; charset=big5
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here is the second round of Allwinner clock changes for 4.14.
It includes and supercedes the first pull request I sent two weeks ago.

Please pull.

Thanks!
ChenYu


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.14-2

for you to fetch changes up to cd030a78f7aa06fe216f6665a6ea84b8f3e5b3d3:

  clk: sunxi-ng: support R40 SoC (2017-08-19 17:04:37 +0800)

----------------------------------------------------------------
Allwinner clock changes for 4.14, round 2

Usual improvements:

  - Added support for fixed post-divider on divider and NKM-style clocks

  - Added driver for R40 CCU

Non critical fixes (from round 1):

  - Fix sunxi-ng/ccu-sunxi-r.h header file guard macro typo

  - Make fractional clock modes really used and correctly configured

  - Make H3 cpu clock rate change correctly to be used with cpufreq

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: h3: gate then ungate PLL CPU clk after rate change

Icenowy Zheng (4):
      clk: sunxi-ng: allow set parent clock (PLL_CPUX) for CPUX clock on H3
      clk: sunxi-ng: nkm: add support for fixed post-divider
      dt-bindings: add compatible string for Allwinner R40 CCU
      clk: sunxi-ng: support R40 SoC

Jernej =C5=A0krabec (4):
      clk: sunxi-ng: Fix fractional mode for N-M clocks
      clk: sunxi-ng: multiplier: Fix fractional mode
      clk: sunxi-ng: Make fractional helper less chatty
      clk: sunxi-ng: Wait for lock when using fractional mode

Jonathan Liu (1):
      dt-bindings: clock: sunxi-ccu: Add compatibles for sun5i CCU driver

Matthias Kaehlcke (1):
      clk: sunxi-ng: Fix header guard of ccu-sun8i-r.h

Priit Laes (1):
      clk: sunxi-ng: div: Add support for fixed post-divider

 .../devicetree/bindings/clock/sunxi-ccu.txt        |    4 +
 drivers/clk/sunxi-ng/Kconfig                       |    5 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   13 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.h                 |    2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               | 1290 ++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h               |   69 ++
 drivers/clk/sunxi-ng/ccu_div.c                     |   22 +-
 drivers/clk/sunxi-ng/ccu_div.h                     |    3 +-
 drivers/clk/sunxi-ng/ccu_frac.c                    |   14 +-
 drivers/clk/sunxi-ng/ccu_frac.h                    |    2 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |   10 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   22 +-
 drivers/clk/sunxi-ng/ccu_nkm.h                     |    2 +
 drivers/clk/sunxi-ng/ccu_nm.c                      |   19 +-
 include/dt-bindings/clock/sun8i-r40-ccu.h          |  187 +++
 include/dt-bindings/reset/sun8i-r40-ccu.h          |  130 ++
 17 files changed, 1773 insertions(+), 22 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
 create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h

--xdmxfzybeync3pds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAlmaSUsACgkQOJpUIZwP
JDAeeg//RWWDdkHmeMVh2CfIRgEsGqaVncaDzn3C7RlS3M9b/sRlIrj6udx5lwvm
GjRVOXvaBinMzA2WszPp6kflFqpS/N7BAogR27lQrc7dk/RJ44iv6bvvN0/mruzt
FEVD7/6YM5sUD8+gvzKycTXvL4vhZ86K1GkBZhdfaS1PE0z8JzTZ+wAl7a7Eu/0c
NK7Pu7GqL/VCQBAMOeh+pZQ7Bz453jwbw4zkPw7zfOtf3SO8wWadANy7+uyS0G76
e95ZoFLNiuIwbRvy+nPs4WPqmL+pknZ7xR2W8r1G36TBvpLLjxDxuF//gBK1IQRn
APO8Kt1uTidew0k6pqMcAyf1aDngz/QkDLgTRkr4tjd4HBtSXS+PpvQTjnLGNh+2
zFGVrmy4hmMXZQrGl9HmYaIm38dZ5SfixP5FEkxTqmZoAtVLwe7NwjbD4ndc0705
/tGgPtVIWq2ZBkLHksWNJPxI1p/Smkx86ImWauMbsMs4QVTxdfY28pRq0Z6dKNmC
+FKITaGqHlg/5NXy/Rj56E4TzxS/h/T1kakW3pkLh1YStAf4+T3NpmMOZ3vrry/1
iOF/DjVxrIIbt+KCLp2XP0xS0p1Q0hxm2NHAsPrmm130lamvIgpZ1XrIKIbDnxS5
n7UjEdZyx59Vjh0nYDEvscq1g+ITJZO4OTlUqi8zuiXTz/pxHgY=
=GFgM
-----END PGP SIGNATURE-----

--xdmxfzybeync3pds--
