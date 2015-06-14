Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 14 Jun 2015 21:30:52 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [GIT PULL] Allwinner late clock changes for 4.2
Message-ID: <20150614193052.GA22385@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
List-ID: <linux-clk.vger.kernel.org>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

I totally forgot to send you this pull request with these two patches
before.

Given that they're pretty minor (one "simple" clock addition and one
fix) and that they've been in linux-next for quite some time now, and
have been tested by kernelci, I hope you'll consider it for inclusion.

Sorry for that,
Maxime

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-clocks-for-4.2

for you to fetch changes up to ec80749dfd859b560e8864d665d38d7a63e6a7f2:

  clk: sunxi: Add support for the usb-clk on sun8i a23 and a33 SoCs (2015-0=
6-02 10:24:39 +0200)

----------------------------------------------------------------
Allwinner clocks additions for 4.2

One error fix, and one patch to add support for the USB clock found on the
Allwinner A23 and A33

----------------------------------------------------------------
Hans de Goede (1):
      clk: sunxi: Add support for the usb-clk on sun8i a23 and a33 SoCs

Maxime Ripard (1):
      clk: sunxi: Fix of_io_request_and_map error check

 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-sun9i-core.c                | 10 +++++-----
 drivers/clk/sunxi/clk-sunxi.c                     |  2 ++
 drivers/clk/sunxi/clk-usb.c                       | 11 +++++++++++
 4 files changed, 19 insertions(+), 5 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVfdZsAAoJEBx+YmzsjxAgPw8P/1yRcSVqNyVl9Yyyd9K05FOZ
cWdKGIbre7bLH4LRrqPCChBuFH963NdnX5JW5qJZIzrgKIZIWfUdFNAvS34oJ2Ij
3C6MMN58w56FtKtxT36fxRhQJ4IqXFEtrWVEK7vfslycwbhOscTL9e7mfJ9BKaKo
W6htoWh+lp+fcdtxtMPhkPtTkjywAQ4A10AZvlsnqIM2+1JG9vy67Rpg1q//Ts4r
e+yi8+teFiJ4sKI0JBY7v1XnQzTWg6GcEyhDX6lQ84Ji2ufKO8Ged5GXeSpjdx7J
gJlEUVe2HmkJGKaLR1odILAxR+5NFAjXYCeIJ9m3wLiZwHtg9q7zm0aH6QKmgeKo
NcPPRklKiZz9oT1OvYe4X7pARi72mgCvGAKGdo1mqICwTCzGNJYCS0wqo5ImOtub
j3m9vj2nZLUkiRsiNCSydQikBTN5DkgWth5VdWTLTLP/YCQ6gjX7u7Y/efM6WhU3
HbcHQRIvIfpDxK9CtqpyssvBOr3umNkGC7kjMl17iCinFstskakknuEtRxTw4DD2
U7VSwXisB6pWAsbDuS5xDaZD/uYUC+cCEtx0IfIxq18bUlUZi2lYnegIsvkFuAKk
E9CbDx5hnQXTSBWxnrCf6r89CphWPT5Dy8BqZOOdVKUZR+VcIOUvR4pcqW9s5yMx
dZxkCXqMj0ygX6Fu1U28
=RZ7Z
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
