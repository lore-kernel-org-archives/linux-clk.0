Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 29 Apr 2016 18:49:33 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clocks additions for 4.7
Message-ID: <20160429164933.GA8913@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
List-ID: <linux-clk.vger.kernel.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following tag for the next merge window.

Thanks!
Maxime

The following changes since commit 92a39d9043ba5ff98adb1c31491f00c7bea5466e:

  clk: composite: Add unregister function (2016-04-21 14:43:28 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clocks-for-4.7

for you to fetch changes up to ff2bb89335daec6053b5ac778369f7f72b931142:

  clk: sunxi: Let divs clocks read the base factor clock name from devicetr=
ee (2016-04-25 10:57:45 +0200)

----------------------------------------------------------------
Allwinner clocks additions for 4.7

As usual, a bunch of clocks patches for 4.7, mostly fixes and cleanups, and
display-related clocks.

----------------------------------------------------------------
Andrea Venturi (1):
      clk: sunxi: mod1 clock should modify it's parent

Jean-Francois Moine (1):
      clk: sunxi: Add sun6i/8i display support

Jens Kuske (1):
      clk: sunxi: Let divs clocks read the base factor clock name from devi=
cetree

Maxime Ripard (3):
      dt-bindings: clk: sun5i: add DRAM gates compatible
      clk: sunxi: Add PLL3 clock
      clk: sunxi: Add TCON channel1 clock

Vaishali Thakkar (1):
      clk: sunxi: Use resource_size

 Documentation/devicetree/bindings/clock/sunxi.txt |   4 +
 drivers/clk/sunxi/Makefile                        |   2 +
 drivers/clk/sunxi/clk-a10-mod1.c                  |   2 +-
 drivers/clk/sunxi/clk-sun4i-pll3.c                |  98 +++++++
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c            | 300 ++++++++++++++++++=
++++
 drivers/clk/sunxi/clk-sun9i-mmc.c                 |   2 +-
 drivers/clk/sunxi/clk-sunxi.c                     |  79 +++++-
 7 files changed, 474 insertions(+), 13 deletions(-)
 create mode 100644 drivers/clk/sunxi/clk-sun4i-pll3.c
 create mode 100644 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXI5CdAAoJEBx+YmzsjxAg7EYQAIsq8zVbzFqV9vMQtfFDxT7x
Mh6TRlx0HCvIRxLG9BZkBbcTiPr07211P/mf1+2OvXxwEUK4TIWD31Oh1FJpzvWo
GUuXayOx9mDxjrjxPCTmBb4FBkwZEmM2UC3ZqYOvN/frmkoISLtMXmXkVm3S8ZAN
XyZ8uBmInokiQN+liG63IPlpMMwi68EFLPWJu4/3IGh4p0zhhRGGRX0k8E+fwqr7
bkKqeFJ9bmME/6KRxqgbCK39xI2YStT1v6PVXobu4SqXha0Omqj2q5CQXFyHJFH3
2B9hYJ3ou1U5IdKkOTzh4ij4IZR2wvdGvMlL9Uv63DpAPgQkuHn057K9pujmku6J
sC1md5wXtiRYJ4+vucpUunMsymJC+wTqzXwq4chzDZ/P6tuH9/b3LOcv+pA7C/qq
k1Qi1kD9Zqo8uT3Y/hTmHSF1Tm5fhUWNV4SYb38fjVGU/WxtBFKradeYlObOK1TQ
nv5/gqwlZN90dqVURoczE09cAci7NJYHhgg373/DbZOtB7TtPnDXPJV86OWlTWd5
I6iyfertgOR/dGEiH4ExMfBtH3bT7xJCHe30qW7Hr5aQrqdpax7lkQgUkysGOTzm
PSQHOxUOQ3vAY+ygevXCqfYB/bSq57rEz7NohZcPraHob8BxRTFiLCZ77RS476Lj
TSml1mv0WgW1Q+ZeadWX
=+GLK
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
