Return-Path: <wens@wens.csie.org>
Date: Fri, 23 Feb 2018 19:31:20 +0800
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner clock fixes for 4.16
Message-ID: <20180223113120.GA2659@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
List-ID: <linux-clk.vger.kernel.org>


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-4.16

for you to fetch changes up to 5682e268350f9eccdbb04006605c1b7068a7b323:

  clk: sunxi-ng: a31: Fix CLK_OUT_* clock ops (2018-02-19 08:59:50 +0100)

----------------------------------------------------------------
Allwinner clock fixes for 4.16

A critical fix for the A31 sunxi-ng clock driver. The CLK_OUT clocks
had definitions paired with the incorrect type of clk ops. This results
in a serious oops starting with commit 946797aa3f08 ("clk: sunxi-ng:
Support fixed post-dividers on MP style clocks"), which exposed the
incorrect clk ops when it added a new field to the data structures,
which then nudged the underlying (compatible but incorrect) data
structures out of alignment.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: a31: Fix CLK_OUT_* clock ops

 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAlqP+4gACgkQOJpUIZwP
JDB1yw//RnOdS0C0Hu2UW52g3tMlPD19wDo5JTwCSiD8XsEnvGnR1DCShGXclk1d
dDu/L51Ukcdhp578sJkZzm4icrEghf6F040Onqo+IhFG/JCdobV3x6Cve1CbbrG7
NSp/8uGlR/al0pmXwC5UTcUs8QVmxuCQIaSqdYM9GCIYpHDd6Jy1Gpyws/Ui9uJZ
mm5k1Ex2cAZVVYsvECOHI5NgRNdzju0zWW6HMaj1hN/jl0sbS0yYUN9zM2dto2Tl
dpiJ6RfCfcUGD5Jt/7OCuQs3UPucZN4xjIwU5U+t1hHQjNziEm04jW8ToLirSmD/
xkB4G5U0DqS9tMClRjZVxRXMRtOiI1ugAjHtdhOIxCE6vT8+fdnYf9PecbDOgbQE
MO1BvfwwP3VU2L9IrdNPwCWg+JQt/nA0qQmOk64M4pG5nSDu0Bl3QEhVRn+b89tp
JGfIYrSzC+ch3Hftmxtv9GhFi+aWZfkj5xv1tejMfae6RA00bJkMybheqa8g2dtc
H2cggkx4HVWwsaBm0hs3nmF7zQbIwq6UP8A4xwgoLhJsmcEYdtIRb7BuQB+eBntb
is+m7mPoHKi7W7u+mgapqnpLHeDS5zzj1Td2H3vl1cDJxkL1IUfTlqK+S2f8Mh48
yHkY1WSXGrcZOgK/t9iOwrzC97sCFJiD9gUK9h5glvh5La0Nufo=
=qbOL
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
