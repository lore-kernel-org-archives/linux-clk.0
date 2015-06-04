Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Jun 2015 15:27:52 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>
Cc: Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] clk: sunxi: Add support for the Audio PLL
Message-ID: <20150604132752.GM23777@lukather>
References: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qdlkwHn4NkwSqFTO"
In-Reply-To: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--qdlkwHn4NkwSqFTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

On Thu, May 21, 2015 at 10:53:59PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> This serie adds support for the PLL2 aka the Audio PLL on the
> Allwinner A10 and the later SoCs.
>=20
> This is the first stepping stone to get the audio support merged.
>=20
> This serie is built on top of a generic clk-factor driver to handle
> clock that multiply their parent clock rate (mostly PLL's), in order
> to provide the driver for the PLL2 base clock, and then adds the
> drivers for the clock that derive from the Audio PLL.
>=20
> Thanks!
> Maxime
>=20

Any comments on that (especially the first patch)?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qdlkwHn4NkwSqFTO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVcFJYAAoJEBx+YmzsjxAghxQP/jZf+MTPLwm30pL8iNOsSYFv
v/sq55+vuxByK/dPhbzu5yd34WenwC601BFqq8Lj+5UlBvqawqKczCkofVfW4Qc0
9FbKNHelc2R5Ra0iXZj/kAMrW21YekptRphVEzOiL7NknpD30OEKwKdmGEZ0CvXt
kXQGA9CtWLHX2CdvqUq9GBmzjktX5PI3A5+lPlR5STUB1+ZoQn70eYRxns/BXc4f
BsPmmSw35iu95x9eai5EdMnt8/0BtAL2jFpic8JPKCl2Ia4JXCo0xlhqiZJAWEsR
SKnFbcVtiYeWofustKUdS4e8xGa8c0NSI2rzQAF3tIsg12YGuNyuyFdFxvYO71M0
DtphKjI6Jz58erdawtef9Ij2FYqmxCoylgU4wAiFyJyci5Qjj+2iG+PQ10Q3ypAg
9ZQNVG0ZWkVj5BOOBktEvCc0PANZpHC8INywQBXbaCu6gk2/MrLtozMjy501Zx6D
ZpEwEpmz2lyv4VsV4g0JNMCXWVhqdcc1zqhKpXuZnypz5sqV+nKsBTR3/IAzgjxB
NNve7aPnnFcd/TpPs9QG2fs0aOsVMche1IdDm0ICSjjkw5xX+H+PCflZ0rzQ82Ym
uqYYOGWN74fKamy7PuycVEPqJqPkTSBIdIGotvqVyxbL7ihEsxUdeLOCKKlyRRbR
/Qz4mkCo/Bid0KyCcKvR
=KW+k
-----END PGP SIGNATURE-----

--qdlkwHn4NkwSqFTO--
