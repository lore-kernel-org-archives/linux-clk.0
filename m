Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 16 May 2017 19:05:16 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: explicitly include linux/spinlock.h
Message-ID: <20170516170516.d6uvqzhuswj7skjj@flea.home>
References: <20170515102307.28743-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3t557hjcbrutc5jj"
In-Reply-To: <20170515102307.28743-1-tklauser@distanz.ch>
List-ID: <linux-clk.vger.kernel.org>


--3t557hjcbrutc5jj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 12:23:07PM +0200, Tobias Klauser wrote:
> ccu_reset.h and ccu_reset.c use spinlock_t and associated functions but
> rely on implict inclusion of linux/spinlock.h which means that changes
> in other headers could break the build. Thus, add an explicit include.
>=20
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3t557hjcbrutc5jj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGzFMAAoJEBx+YmzsjxAgzmMP/3VguDjCXX0e1tzATiSK93Si
9yzlvcvuT8vVFqtgbycTPB/mfq16FUD0Kpj2m5c4xc1CjH7D6v+W0x4p4Tt6C7G2
lgUyYPgJxgcIPE2Lj4JMFcXyOUNb1/NUIxIfIxXwfLRLg4O4JwVwJjOzs68e+lEz
N4M0XP0yy4mnoH9iW6rII9bEsM97P4CPMOP/4uMiew/cfuQLxV3mbp8XGQdG3gZQ
qUP4fK32eU9n5QAL1W6EBejscjE1hvVg37zcZSNckJxq+BSeUguU07QAAQL7JRtb
7Lwh6uBnaX3ekVlC2p6bjbh+YS/y/f5K/0CRKGy3t2/gBkbU6yB1Hx/r8O4/JYwy
F6YqqRLBgvlMnbupKxotE6pqi69/4JVLZ5u/p10EYyYeRsHMaMQ4DlKMVP1sKDMd
nvpTFVQdsXHwNE5NchtEOFkou2XgvY3Zanv5QQQCTv8NhZT/eObSHObmd+5MJra6
jMBWxuLkgH1rSF7GoQGvzB4pr03ZVRXZ9mGD0saD0pxBQkwABZOAzpC/I20Ay5TM
6My+c77aQhOLnxyiUi/v6HLMpg2pxB+NI2wG7EjfeQzbIIIjuYb+hEeyDEfPgZNW
vo9M0G77T+9C6go70W7w6eg9CyLf8nCZMdfSmUK8/5KUNBiNE8x/RodONv3mL4+g
8mFCnLWH4S/j6acCSWEy
=x7Fm
-----END PGP SIGNATURE-----

--3t557hjcbrutc5jj--
