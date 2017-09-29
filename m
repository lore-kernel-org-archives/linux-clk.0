Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 29 Sep 2017 10:46:58 +0200
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
Subject: Re: [PATCH v3 01/14] clk: sunxi-ng: sun6i: Export video PLLs
Message-ID: <20170929084658.la46onmwcibicd4b@flea>
References: <20170929082306.16193-1-wens@csie.org>
 <20170929082306.16193-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pxhgzwx355vzrns3"
In-Reply-To: <20170929082306.16193-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--pxhgzwx355vzrns3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 08:22:53AM +0000, Chen-Yu Tsai wrote:
> The 2x outputs of the 2 video PLL clocks are directly used by the
> HDMI controller block.
>=20
> Export them so they can be referenced in the device tree.
>=20
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pxhgzwx355vzrns3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzgiCAAoJEBx+YmzsjxAgQ7MP/0TSc03krtRgkkhKG/FU7TYH
QrqlRF+fmCItse6NF02XQTMHjHzz9DD4xjbtOykSEAIu+wd3bjEF1UBORA81slgL
j1SEbr4de2ic+UzR6aM6sl0/27jNC2lJhQR3nSEL+6TNkxh0tnLObo2NoBSRRExf
H6EkD4dt0OYiA90LQ7OkoqiIcjmWMXryGMDbeFrxhrcHG+9j7ltfupfzz7a8nIYr
lhXUUdoFH5+zzkU6GQoE2OhAHGHbRrerOWLnHu2HDGD5W6fRQU+EONdU31tGDYuZ
cmqWosiGvC/F8Sa6DJ3rhC/cViPwr9VzHQ6bEah1i5MoB/ykP1Hbe0tzQvm5iblI
JjQZuqqu9ryNQITyFm/fo0rXy1SiCi/YJs69fHj9dURxdtZopw4zdKAERblSiXKe
qfpbTH6FNHH0yv1bpKz7WVOC3VFTaj69zEsK9xOmmNNgLbrPzMDmUAmWjBZmubk3
hGe3DdFRL1ng3qrbklTQNbH7unw/ODfLpkgQ11zONhI6y0Q7rDjJAygT4gEkPamM
qciNUra8kf8SLcoCxdH+N/gdL3FaFs6ktAw64w3mnwidkQmXXaZaXLfMsTHQU8IH
LEdKH9pVUmUIW7XJyr9sTQb9HaM1+Dv8ERuM+db+OeKyYQi0ZiwKsGnSPQg/mFaQ
nT9/YDRjhe0yptAdqNyw
=lyjP
-----END PGP SIGNATURE-----

--pxhgzwx355vzrns3--
