Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 26 Feb 2016 11:48:30 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] arm: Allwinner clocks changes for 4.6
Message-ID: <20160226194830.GA21652@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
List-ID: <linux-clk.vger.kernel.org>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clocks-for-4.6

for you to fetch changes up to 6e17b4181603d183d20c73f4535529ddf2a2a020:

  clk: sunxi: Add apb0 gates for H3 (2016-02-25 11:30:32 -0800)

----------------------------------------------------------------
Allwinner clocks additions for 4.6

A bunch of things, mostly:
  - Finally switched everything over to OF_CLK_DECLARE, which should remove
    orphans clocks entirely
  - Reworked the clk-factors to be able to add new parameters
  - Improved the error reporting
  - A bunch of new clocks for new SoCs.

----------------------------------------------------------------
Andre Przywara (4):
      clk: sunxi: improve error reporting for the mux clock
      clk: sunxi: improve mux_clk error handling and reporting
      clk: sunxi: improve divider_clk error handling and reporting
      clk: sunxi: Improve divs_clk error handling and reporting

Arnd Bergmann (1):
      clk: sunxi: don't mark sun6i_ar100_data __initconst

Chen-Yu Tsai (11):
      clk: sunxi: usb: Sort clk providers by chip family and name
      clk: sunxi: factors: Make struct clk_factors_config table const
      clk: sunxi: factors: Add clk cleanup in sunxi_factors_register() erro=
r path
      clk: sunxi: factors: Add unregister function
      clk: sunxi: factors: Consolidate get_factors parameters into a struct
      clk: sunxi: factors: Support custom formulas
      clk: sunxi: factors: Drop round_rate from clk ops
      clk: sunxi: rewrite sun6i-a31-ahb1-clk using factors clk with custom =
recalc
      clk: sunxi: rewrite sun6i-ar100 using factors clk
      clk: sunxi: rewrite sun8i-a23-mbus-clk using the simpler composite clk
      clk: sunxi: Fix sun8i-a23-apb0-clk divider flags

Krzysztof Adamski (1):
      clk: sunxi: Add apb0 gates for H3

Maxime Ripard (5):
      clk: sunxi: Make clocks setup functions return their clock
      clk: sunxi: Make clocks setup functions take const pointer
      clk: sunxi: convert current clocks registration to CLK_OF_DECLARE
      clk: sunxi: Remove old probe and protection code
      clk: sunxi: Remove clk_register_clkdev calls

Stephen Boyd (1):
      clk: sunxi: Drop clk.h include

Vishnu Patekar (2):
      clk: sunxi: Add apb0 gates for A83T
      clk: sunxi: add bus gates for A83T

 Documentation/devicetree/bindings/clock/sunxi.txt |   4 +
 drivers/clk/sunxi/clk-a10-hosc.c                  |   3 +-
 drivers/clk/sunxi/clk-a20-gmac.c                  |   2 -
 drivers/clk/sunxi/clk-factors.c                   | 123 ++-
 drivers/clk/sunxi/clk-factors.h                   |  26 +-
 drivers/clk/sunxi/clk-mod0.c                      |  23 +-
 drivers/clk/sunxi/clk-simple-gates.c              |   4 +
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c          |   2 -
 drivers/clk/sunxi/clk-sun6i-ar100.c               | 235 ++----
 drivers/clk/sunxi/clk-sun8i-apb0.c                |   2 +-
 drivers/clk/sunxi/clk-sun8i-bus-gates.c           |   3 +-
 drivers/clk/sunxi/clk-sun8i-mbus.c                | 127 ++--
 drivers/clk/sunxi/clk-sun9i-core.c                |  86 +--
 drivers/clk/sunxi/clk-sunxi.c                     | 863 ++++++++++--------=
----
 drivers/clk/sunxi/clk-usb.c                       |  24 +-
 15 files changed, 691 insertions(+), 836 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW0KwOAAoJEBx+YmzsjxAgWw8P/2lcTwUVVdR9048jN2WLAmGY
qCZkKdf6naviKFtBGJH+st3/E5xELyBg2uU8ySRoEcfdrkiqZ5+oPkg2zb/yr5Bp
jS/5i6I3JA5x1751+vgwIfLtkCXhJhIaPCGIWSK1jrFkV9IMCoc30VWeIn27sqrW
hliZTMr2QOEO+owmZOxyxYx0rVGjswZONQS7kZzXNux1uy/ZTvY49kqDH8MIOruL
zEi5UT95HNwmqtYfJ5lRplJL75ekMQs6b9NQO/YNxJZbYdu2424kG+v1R8M2Fsgg
/v+2BIQfJX66o9UJW59zHtzeTXaQcxfpIZWOSp91mcFpQrYH/E2XYoC/ZJg9oDu0
/S3AMlfFjg3Jy3TOCSwyBmmyeVBE+IcVJgw8I8SU4K7vF6JA3NUPe9AGikPJl+2f
VorQfUx/YpEJljc/iM4KsKT/3NcBYOFBi3Iaea47T3TgIXIs3XAD80gUEJTMN4tq
bwAn5iv040c9BS2FS7K9WQZ1issRvQVrr3S2NDnol2f3sE8vIIz/pVCcBABCMURQ
2hEjl941XDuW9g0DtfQMoU6Hin+KJSjS+Is+vQ+wbK+272Fy4vfTJtYvGi7Plibd
1JxfzraASLJROz3bP8+R2g1ErTMaarCy+RlBblLBnGaqzz+H2AASJZe2j26BQaHh
LtyOdX+LeqbDWSZoIu1d
=cJ5X
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
