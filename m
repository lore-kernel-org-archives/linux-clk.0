Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 22 Nov 2016 15:59:49 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner clock fixes for 4.9, take 2
Message-ID: <20161122145949.quvtzoupxbxbeql6@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hn3prtrvrnleik3h"
List-ID: <linux-clk.vger.kernel.org>


--hn3prtrvrnleik3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here are two new fixes for the 4.9 release.

That should be my final PR for both the 4.9 fixes and 4.10
developments.

Thanks!
Maxime

The following changes since commit ac95330b96376550ae7a533d1396272d675adfa2:

  clk: sunxi: Fix M factor computation for APB1 (2016-11-04 08:49:46 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clk-fixes-for-4.9-2

for you to fetch changes up to df8e3c1fe1050fa2749c346676d12f4d30dcd935:

  clk: sunxi-ng: enable so-said LDOs for A33 SoC's pll-mipi clock (2016-11-=
21 19:50:49 +0100)

----------------------------------------------------------------
Allwinner clock fixes for 4.9, take 2

Two new patches to fix the gating of the MIPI PLL on the A23, A31 and A33.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun6i-a31: Enable PLL-MIPI LDOs when ungating it

Icenowy Zheng (1):
      clk: sunxi-ng: enable so-said LDOs for A33 SoC's pll-mipi clock

 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hn3prtrvrnleik3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIbBAEBCAAGBQJYNF1kAAoJEBx+YmzsjxAgwqcP+N2g7vRjoEdoJnM9OV8NGAqi
44tP/EF6Y/MG8pRmk14qOmmUphPHXnJSJn5rltB1sV2uhnEnzild3PQFhEzpHvFT
lwqvdqHzEP5F+KL8rmLQPX3DEI2k6+0QQRRCWujOLRJJffSSOb27aFs32MB0PC9h
OUFQSCtLbB+02mfe5C20KEsFDDTia5yDWfX6BISlXszZRuzk2HHNnIl1P3irs6VU
gAUz3AEZTPv33fbi7vNXotNjBor273lGq6lXYmP8dbXkfl/SA1OboTk1O5+IENeK
KFB/+IcnRvuMmVaA+FavMMdjweCtldzFOIZ2BT1zJtTWiGe49jmvbjubKrImuVL7
69G5fictklK42qdIFMtSq6JN1fcYf2RA/3Uga8NvsTl51djdfQYUs3O8ds+icqU1
hNMi4GjG4qyUS1sbUSsI1bnJGbPPZBaMMKobDxKBbaAXRRBW34NzRF8980yifTZp
TC3p734oQggFH+XgPWmX1kUqHSBOyIA/oTpt8cztUZ3RUVXyG9aZuAe71iXF6sUZ
Bd1lyAARYkiKw2NjsbjRnaptebCE672AwqZEjxsdFWdDBYpbpcMAuJdLo0WMCoWt
Wb8KX5lBOArUFb6C6YcoFHq2GUOAbZrMChruVa+knLwD0m41BvX8PsogIlVSaukc
bRQfzKYysNZDW9LcZb4=
=YtP8
-----END PGP SIGNATURE-----

--hn3prtrvrnleik3h--
