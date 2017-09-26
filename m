Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Sep 2017 11:56:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 05/13] drm/sun4i: hdmi: create a regmap for later use
Message-ID: <20170926095647.o4p72dd6n3257n5m@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-6-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7by3ndkwhayzdm3u"
In-Reply-To: <20170926065919.24446-6-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--7by3ndkwhayzdm3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:11AM +0000, Chen-Yu Tsai wrote:
> The HDMI driver is written with readl/writel I/O to the registers.
> However, to support the A31 variant, which has a different layout
> for the DDC registers, it was recommended to use regfields to have
> a cleaner implementation. To use regfields, we need to create an
> underlying regmap.
>=20
> This patch only adds the regmap. It does not convert the existing
> driver accesses to use regmap.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7by3ndkwhayzdm3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyiRfAAoJEBx+YmzsjxAgSxcQAJhOedHLqmYnKELB0+Ii54gQ
bfhO+5OPyN3NGBO8/FwM1ce9/XFCZS4d/hHvvw974nVV1efM8oNAmSuyptz+wSWF
rLRjxk8xwf5+D/BlkmoLemtc503PZCvFT6WGxFIVQ3gD1cl0Jk4Fne4OHvrhVY3s
5iI0WV3tvZlq0EU6aUKv05fKJ6ThwEmwAXSkfTAtcot/bLDAP8O+1ApjP9ujxQp9
foUpJXECV/ll78UAJBesfsgzGketBJc5vtUjHF6O+JbmfWJss/3uReh8djnc8emJ
eB1XKB5C3/qLddNKPCovai++gpu/liqhK1Wp9EMh9lHOq+3CtuuRVFkdZCYFy4s2
0paKWa9dMZg36LK8V1TRGoXJYrckd9sMWx1ONhdKAtm7aMrlUgsWWe9X0tgRqxne
AR8q1zBANaxfg5mYafjqwo19jOZLUgXs+Wotw2Qk4OE8e0cVZVQhVnyyEOju/2cR
fDGgnE7eoJcoxBEkPEPce/1OM78+5+1V6gXYTU4qTFuJVhOuCtdJ7Zs/F66OUbi9
HSW87/sXpmL2BATPf9lcOfaMVrhrtXJDBI5qziFkLtfXkO93Sodqd8AmyT/5UF7q
4k+MyYy3JDW/38ChlZO5GOJwFRPSipYm4O8I4ZQ2XqMnwpJpsFM4Z+eA6q/AiQUZ
048WJyMLDFfiObKB0jWB
=xYpk
-----END PGP SIGNATURE-----

--7by3ndkwhayzdm3u--
