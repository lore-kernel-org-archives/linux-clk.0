Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 10:52:35 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>
Subject: Re: [PATCH v6 1/6] clk: sunxi-ng: div: Add support for fixed
 post-divider
Message-ID: <20170717085235.i7pwwql5dgmnf6kk@flea>
References: <cover.ba2aaaa405a7ec685034e34926b8855fd6c9ab86.1500043741.git-series.plaes@plaes.org>
 <946794e97ae2c36cd67c272099e8236a589efc28.1500043741.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibu6dk4rnnvbnws3"
In-Reply-To: <946794e97ae2c36cd67c272099e8236a589efc28.1500043741.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--ibu6dk4rnnvbnws3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 05:49:23PM +0300, Priit Laes wrote:
> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
> 6 is fixed post-divider.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 15 +++++++++++++--
>  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
>  2 files changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index c0e5c10..744502a 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -21,6 +21,9 @@ static unsigned long ccu_div_round_rate(struct ccu_mux_=
internal *mux,
>  {
>  	struct ccu_div *cd =3D data;
> =20
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		rate *=3D cd->fixed_post_div;
> +
>  	return divider_round_rate_parent(&cd->common.hw, parent,
>  					 rate, parent_rate,
>  					 cd->div.table, cd->div.width,


You still haven't addressed the biggest issue with this patch, see:
https://patchwork.kernel.org/patch/9825565/

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ibu6dk4rnnvbnws3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbHrTAAoJEBx+YmzsjxAgGx0QAJG9X6+IZF5gx14V4mos6/oi
BnDTmBNfj6a8TP9XUlvr2wqLCnvW5VhuiEtndtI9Rt119/M/NS1Bq2xbKtpKt9eR
5tP0gv1uJmRHFJi6RJE8pW2wjvr8ajM3tYl+uSKGzqVowrIN4RWWG4nP+84A48pz
+Zbq5/6vMr/wj49WrVCdABcUbMYL+sghpjxeMZd0U1/vP2JHGe9t1ndmR2abJ0fq
dFDn0LP8KZUrLVr+I2+KoaD2l3sDhVqyUXvXo1RBCCCrG/ZyDNUyMoOU6nNuo6b4
ongwJyUC6nP4XPG6bRZxFWq3Hgx/kdG5/b1MNvy26qo0uTHw+El/pumAfA00rL1a
Ao0fg3y7miv1WZeRsin8qtjXvV46yCCMyxzRqgpusH4X+20HbZl7scW8gx27lPjc
wvcslBKnY5jjfFtSMyPwGzDzJmblst0egbM9g7wt975wAZ6xDi492jynnlCUxlb7
s+C1RpFR2vPY3YfUDEC/rLX4zVtdGs8v2/6om+ztlAjoTEe/5nynq26Asveb6HOX
wOQOjAqlDtdBdpb9EqaVvf5Sk2FsRNIRiTLpchH3iQfc1P3vPFj79bajXVUJLkx/
9RmxmbZqjdmh0pg+TRqDsiDllF86BGkWwUqUnpTT+fn+mV3jolUkgS6Ni9KJugAy
vwnZrTzegFKeCcg4TCiJ
=q79E
-----END PGP SIGNATURE-----

--ibu6dk4rnnvbnws3--
