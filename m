Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 1 Sep 2016 21:54:14 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de, xie.baoyou@zte.com.cn
Subject: Re: [PATCH] clk: sunxi-ng: mark ccu_nk_find_best() static
Message-ID: <20160901195414.GH20462@lukather>
References: <1472727108-18388-1-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwGu8mu1E+uYXPWP"
In-Reply-To: <1472727108-18388-1-git-send-email-baoyou.xie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>


--RwGu8mu1E+uYXPWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 01, 2016 at 06:51:48PM +0800, Baoyou Xie wrote:
> We get 1 warning when building kernel with W=3D1:
> drivers/clk/sunxi-ng/ccu_nk.c:17:6: warning: no previous prototype for 'c=
cu_nk_find_best' [-Wmissing-prototypes]
>=20
> In fact, this function is only used in the file in which it is
> declared and don't need a declaration, but can be made static.
> So this patch marks it 'static'.
>=20
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>

A similar patch has been merged already.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--RwGu8mu1E+uYXPWP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXyIdmAAoJEBx+YmzsjxAgZXsP/2uwWtrrD4UmQQ6LBh4jY3mz
QdLWpxHSKxvy+NuETho0g65dFAvqDERGsoUDFi/TH0YdtQL6WG1WRdgbJiTXBxSo
Z7t760BoNRpQJc5qs/egl+pS2Ky3VsQboWKXGSv8s0g6L9xjWRt4GUR7TaB7H3m5
BEuakosopnRnllVNBVihoRJ7B+7zS65RALPqYVKINF/2NsgmYnlBoKtMUFfjkFHj
9CuQMwD9Tm2A/bKzjWqaKypJkdJjeTqLc6nUcs5yF+ReQEytTqTTMVx9WyS2BbOS
0RRcyrLdG99ayE8fEMFxB1DBeb60+uh6sc7Et4z8m+CTq6k4rldKQQAV0sHqJGK3
u+6950hKkTs6z+WLL6toLz8FKYezE1Ot92elZq6Ozz1QtFks/5bRopFVp+nrotOW
ey243w2E+pvVW5hFR0pVkwW6St/mO4hzEcxTz2Aoz/7Xz1iSfOZN2OdQjfqRqHaR
fxl9dj8eokNMP1DdooWaDO8+ocMZhwEiTEBXGEQ5YwapSmP2J+alcz6siKBWPeH4
ZNaH8xeKgimjTKyKmfd0KBpKb6sCJrjzhTDJnEMrW+0c01/cbEAx4Zvav+hNinnv
zcY3vzPBH4MOb3csSr1czqYSGNT0Nal31JboU/cPT2LMTb51puasPum8CP3SDMyX
7IlPariMvReYeBXm3TDb
=sS/1
-----END PGP SIGNATURE-----

--RwGu8mu1E+uYXPWP--
