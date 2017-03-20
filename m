Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 20 Mar 2017 10:50:04 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner clock fixes for 4.11
Message-ID: <20170320095004.4vd2edph2u7kxi7l@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uptsiwuzc25fq3y3"
List-ID: <linux-clk.vger.kernel.org>


--uptsiwuzc25fq3y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following patches for one of the 4.11's rc

Thanks!
Maxime

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clk-fixes-for-4.11

for you to fetch changes up to b467e08a15563dede0d37d3233baa24fb97a7310:

  clk: sunxi-ng: fix recalc_rate formula of NKMP clocks (2017-03-20 10:34:0=
5 +0100)

----------------------------------------------------------------
Allwinner clock fixes for 4.11

A few fixes for a bunch of clocks on a few SoCs. The most important one is
probably one that fixes the NKMP clock frequency calculation and could end
up with clocking the CPU frequency to out of bounds rates.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi: ccu-sun5i needs nkmp

Chen-Yu Tsai (2):
      clk: sunxi-ng: mp: Adjust parent rate for pre-dividers
      clk: sunxi-ng: sun6i: Fix enable bit offset for hdmi-ddc module clock

Icenowy Zheng (1):
      clk: sunxi-ng: fix recalc_rate formula of NKMP clocks

Philipp Tomsich (1):
      clk: sunxi-ng: Fix div/mult settings for osc12M on A64

 drivers/clk/sunxi-ng/Kconfig          | 1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c  | 2 +-
 drivers/clk/sunxi-ng/ccu_mp.c         | 8 ++++++++
 drivers/clk/sunxi-ng/ccu_nkmp.c       | 2 +-
 5 files changed, 12 insertions(+), 3 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uptsiwuzc25fq3y3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz6XIAAoJEBx+YmzsjxAg7WMQALrL+/M4Q/e6qmwWJVE27UZ1
dVzJRCAr9ERhePEAvtpZfQ6fVpoL9PCZIW3wNw4IYi+JAA6ieehvsj5/qSWFOuhD
k3ryh32sR0uhtv2PzqGLfU50bcABbzau9U3s4hjVaOvYG5LD8Al/odqfNZiBFfY5
kpveitzLSyNL/WKyOlqK7ypWmpiiP80A698OP89TaOis21/8e8yV5L7jFgC27+ie
IZ2wNGYEfj3kuuCZCaZT2y7FiuHS+LOdLBPsUnzTcT7Q2UMSHGugUMDFoVSppqb5
2DoDEEZ2cu+hg0CxB94pSV45Lri5fcp8BejFpJTSy0hQ9HETQKE+6LRgJ132lOxG
Nmvk05LtOkUKJ07oTL+0k7aExUVoIK/hJi/37sLq4Ie7cE+rfvi7JwCn2Ik/Va/j
77eTv9N3Uj8L49mXMZlKLnYchedssJDLMOTg6Dbc0mxxTJVZUyJUGtCCC8pemvbb
JOs2+RZKvZ4Ilbeu33qBK5BlDGCxxbJOLH0kIkcnbicBYhLd3vjLQdwqL/ZU4U66
O+/k/5jRpJLNgCw5hDLl+/wcaJJ27vT6XjLmwp98v/zyyCc7YA6Ce0M0xRMW+6wD
5XHsY/kGF+6hEiFasJVT/6Qq/6vrH+aA/XZ5sYxz3z8Gpqy0Yk8MfTc46ufryk7O
g3cmoPkVr6sxqOPUVjno
=MPmc
-----END PGP SIGNATURE-----

--uptsiwuzc25fq3y3--
