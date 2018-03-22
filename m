Return-Path: <maxime.ripard@bootlin.com>
Date: Thu, 22 Mar 2018 17:04:02 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.17
Message-ID: <20180322160402.o2lon3bbncgss4sv@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ltwm67ir4qod67ul"
List-ID: <linux-clk.vger.kernel.org>


--ltwm67ir4qod67ul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here is our usual pull request for the next merge window.

Thanks!
Maxime

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.17

for you to fetch changes up to f422fa558aada511406432bc5974d3a5bf728227:

  clk: sunxi-ng: add missing hdmi-slow clock for H6 CCU (2018-03-21 12:27:1=
3 +0100)

----------------------------------------------------------------
Allwinner clock changes for 4.17

Our usual bunch of changes for the next merge window. The most significant
addition is the support of the H6 clock unit. Other than that, there's a
bunch of fixes for the video clocks on the H3 and H5, and some Kconfig
cleanup.

----------------------------------------------------------------
Corentin Labbe (1):
      clk: sunxi-ng: remove select on obsolete SUNXI_CCU_X kconfig name

Icenowy Zheng (4):
      clk: sunxi-ng: Support fixed post-dividers on NKMP style clocks
      dt-bindings: add device tree binding for Allwinner H6 main CCU
      clk: sunxi-ng: add support for the Allwinner H6 CCU
      clk: sunxi-ng: add missing hdmi-slow clock for H6 CCU

Jernej Skrabec (6):
      clk: sunxi-ng: Mask nkmp factors when setting register
      clk: sunxi-ng: Use u64 for calculation of nkmp rate
      clk: sunxi-ng: Add check for minimal rate to NM PLLs
      clk: sunxi-ng: h3: h5: Add minimal rate for video PLL
      clk: sunxi-ng: h3: h5: Allow some clocks to set parent rate
      clk: sunxi-ng: h3: h5: export CLK_PLL_VIDEO

 .../devicetree/bindings/clock/sunxi-ccu.txt        |    4 +
 drivers/clk/sunxi-ng/Kconfig                       |   12 +-
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c               | 1211 ++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6.h               |   56 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   32 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                |    4 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   56 +-
 drivers/clk/sunxi-ng/ccu_nkmp.h                    |    2 +
 drivers/clk/sunxi-ng/ccu_nm.c                      |    7 +
 drivers/clk/sunxi-ng/ccu_nm.h                      |   27 +
 include/dt-bindings/clock/sun50i-h6-ccu.h          |  125 ++
 include/dt-bindings/clock/sun8i-h3-ccu.h           |    2 +
 include/dt-bindings/reset/sun50i-h6-ccu.h          |   73 ++
 14 files changed, 1578 insertions(+), 34 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6.h
 create mode 100644 include/dt-bindings/clock/sun50i-h6-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-h6-ccu.h

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--ltwm67ir4qod67ul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqz0/EACgkQ0rTAlCFN
r3ReKA//cSShFeUNkQonWsuvVyi+uM1VyhhLWDr12+p2CuASGUlbCF+/cWBjoFkE
29WaCdvtmLYHuDYo5Q4+X6S9oeeHNH55Ar0cNWYSljGP8maSqxdxXnuJou07Ho8A
tS912t3SnQ5zmqjs+c1DdFLNTgEK6Ujr4morirW8DkLWSmhe4fihtptxVek8lbaC
94bQhtb1Wj+YuaGl4qdypj1aek/GK1bwjyt5Bx9PISupUEK7U3tY3NJLwk4kdgKk
qrqWqpkhoaj4xo09zFAHhGhUUczbIKquwxFKL43CATY9OY6YVC9GtWgOE4NkqUBI
Hc9zJEw4b9GkD+H4gBSUGfCOWi60i514wOqoOoxYMMeGmWq/qt7V8hUzx9HswYcE
KY3vswSO477+HCfMm40WBRKN15GBJ6iWJnjnWhJUTUDoH9cl8bge8/h11Nni77Tm
Jzv2rV9/jd1GsVwwKuUUda6tYsX+73spVFMeHCqUzsKENZXuIW5WMOxavOSlP4sw
MsOcZBE7hid5tKjALf4U16muUYefbaNjSXZA01bteeQQnk8aL5XQ/jiv8QyoIwcE
JrZAaNihpU8e2xOINpIuAOPifWwtAKrgLadt8Yr6OaFM38zA+bHN3CE8jvTelmZ1
dGQFuWemR6mW6mG3cvSxPqZLvvOCfQZ6C02Wdx/aAfh5C6F/WEw=
=Rb17
-----END PGP SIGNATURE-----

--ltwm67ir4qod67ul--
