Return-Path: <wens@wens.csie.org>
Date: Thu, 28 Dec 2017 16:25:24 +0800
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner clock changes for 4.16
Message-ID: <20171228082524.GA13649@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
List-ID: <linux-clk.vger.kernel.org>


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-4.16

for you to fetch changes up to e952ca3c6b2ffdfbf9618e4bd3e9aad1ff3f5eb4:

  clk: sunxi-ng: sun8i: a83t: Use sigma-delta modulation for audio PLL (2017-12-08 10:08:32 +0100)

----------------------------------------------------------------
Allwinner clock changes for 4.16

Fixed-post-divider support is added for two types of our clocks.
This in turn is used to support odd clocks on some of our SoCs.
On the A64, the MMC module clocks have a hidden post-divider.
On the A83T, a post-divider is needed to support programming
sigma-delta modulation with known fixed parameters from the
BSP kernel for the audio PLL.

There's also a small cleanup to use the shorter PTR_ERR_OR_ZERO
macro in various functions.

----------------------------------------------------------------
Chen-Yu Tsai (5):
      clk: sunxi-ng: Support fixed post-dividers on MP style clocks
      clk: sunxi-ng: sun50i: a64: Add 2x fixed post-divider to MMC module clocks
      clk: sunxi-ng: Support fixed post-dividers on NM style clocks
      clk: sunxi-ng: sun8i: a83t: Add /2 fixed post divider to audio PLL
      clk: sunxi-ng: sun8i: a83t: Use sigma-delta modulation for audio PLL

Vasyl Gomonovych (1):
      clk: sunxi: Use PTR_ERR_OR_ZERO()

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 57 +++++++++++++++++++++++------------
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 18 +++++++++--
 drivers/clk/sunxi-ng/ccu_mp.c         | 20 ++++++++++--
 drivers/clk/sunxi-ng/ccu_mp.h         | 24 +++++++++++++++
 drivers/clk/sunxi-ng/ccu_nm.c         | 50 ++++++++++++++++++++++--------
 drivers/clk/sunxi-ng/ccu_nm.h         |  2 ++
 drivers/clk/sunxi/clk-sun8i-apb0.c    |  5 +--
 7 files changed, 134 insertions(+), 42 deletions(-)

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAlpEqnIACgkQOJpUIZwP
JDDg3BAAsBq0RudOHnnVT9+urRjOXSEz970OAvzoQM+fJNLwyL5SElgk5hdXc7ba
IlcJ2FQLJwFZ4DVTOHcswFkRkSOhCBoEAC1i+LKeV4MgJq/DeqqGV/EEmiqztGjs
j4dox4SifeLQx5eqJJsnxlaEZRmPpb2HXH3/4oKV61zdh5OumGl7e4RncXZKkwGJ
pRt8spUBGFa1O8fayQlyrRgcIcR962ZY/0BJVMO4zZUIt2ootWsLcXLmLUeX1r4r
e4CJ3t0RChiJkglKONDa2DPt4Sk/Tk1AmwrwEf7OgsGp/vjYOBPiaWr9oeR/xOC9
f7iA9Slkn9WOLGhWzouK6K4kMyvz9FvOTHyxLnbsuPxJcMx8JgvdkbtXFCwmCcgy
qT4kNlVDLpy7foDEFJBPPkVAJTetzQDpYMcmcl6pVB2O2ZtIeoG5liEJKW3rKvIx
DAOI5zz9PlDXLJv1uo9H3he4y3AQCTubzuSgVPn8XYRCFfGDE9dZKyzaU483mVC2
WRhlVJ6VVMCI4NJu6WB2d3sxTs/OeyeJCFvtCWhennSNl7wJSw14IwFJNa1i98pv
DCJ82vm9nm3AlqzwBlQoM5kpWVW/0TnbehMlHwzUdC+BrSrsQsmviAGfjxeynZIh
X99F9VLklFevgz1LZGOZ6hEf7Ov4Lf1BvLdh768UB7e50u3+vF8=
=Y7Bt
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
