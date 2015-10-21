Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 21 Oct 2015 21:58:56 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner clock changes for 4.4
Message-ID: <20151021195856.GA5155@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
List-ID: <linux-clk.vger.kernel.org>


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following patches for the next merge window.

Thanks!
Maxime

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clocks-for-4.4

for you to fetch changes up to 9b038bc58ad2658c76fd8b50bb333dfd4454573c:

  clk: sunxi: mod1 clock support (2015-10-21 21:51:29 +0200)

----------------------------------------------------------------
Allwinner clock additions for 4.4

  - Support for the Audio PLL and child clocks
  - Support for the A33 AHB gates
  - New clk-multiplier generic driver

----------------------------------------------------------------
Emilio L=F3pez (2):
      clk: sunxi: codec clock support
      clk: sunxi: mod1 clock support

Maxime Ripard (4):
      clk: sunxi: Add A33 gates support
      clk: Add a basic multiplier clock
      clk: sunxi: Add a driver for the PLL2
      clk: sunxi: pll2: Add A13 support

 drivers/clk/Makefile                       |   1 +
 drivers/clk/clk-multiplier.c               | 181 ++++++++++++++++++++++++
 drivers/clk/sunxi/Makefile                 |   3 +
 drivers/clk/sunxi/clk-a10-codec.c          |  44 ++++++
 drivers/clk/sunxi/clk-a10-mod1.c           |  81 +++++++++++
 drivers/clk/sunxi/clk-a10-pll2.c           | 216 +++++++++++++++++++++++++=
++++
 drivers/clk/sunxi/clk-simple-gates.c       |   2 +
 include/dt-bindings/clock/sun4i-a10-pll2.h |  53 +++++++
 include/linux/clk-provider.h               |  42 ++++++
 9 files changed, 623 insertions(+)
 create mode 100644 drivers/clk/clk-multiplier.c
 create mode 100644 drivers/clk/sunxi/clk-a10-codec.c
 create mode 100644 drivers/clk/sunxi/clk-a10-mod1.c
 create mode 100644 drivers/clk/sunxi/clk-a10-pll2.c
 create mode 100644 include/dt-bindings/clock/sun4i-a10-pll2.h

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWJ+6AAAoJEBx+YmzsjxAgTPkQAJOcRwVGoVi6rSRG8tOLzHtn
bZzggztyRmP4018jxKDYL/nbC0XqiB+BjV6Zk5clSQL7dOG6EVbxeHRpNcQQ73yy
JTcC+5O34PAFGaaVCfBoIkiKzosQAV1nlcFovksDkODaswgo5wIKPAP3EOFrtH/i
LGLRRfXrT2PTlw0SdFbuer/IBoO+zy/xFr25WRR7USpnbIdohIjRwgilrnLWpQct
Ciw80gScCGX77ypkOV3vaMhOUvwIhymwwupOSYj4eQEL13Jnu6jgFdGAwhnYz0Fu
UqH4e3ZcaV8oDxZ0tKEddpPoeaxk48n74L5XQX8ETE647nOtz7AMONTL0/fb20me
egy/zl8ftH5JugD3hVNq1OUouDaL9fPvpBPGWHzgoYMzByVz892yfG2alwTFILJD
DHzZyjG6cmp5gi0aH5gJveKRQLAVdvovwBsxmoBXjfVeBn3VttF7c93eMOmUe8OE
auzyKQpO4iD1Gb8x/HCHC+Z0S1EGRXAmbOuXEFzUGEQKATHrnUOJFHJwHyio1ua0
hGt1yrNFfclkx2AsZYa7vm3qFPh2CFaEZ7d9Bh7OkO8lnmtuoLcIYPdNu8JEGA05
SJmi7l/VKgS90fSFAPd/G9ch2snQbb0iNclVPTpQkDELSx92Zq6fwzMWoQkw6xou
TV+yDz/+zmRWkUsrh8FC
=LJDZ
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
