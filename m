Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:60343 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932578AbeFYP7D (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Jun 2018 11:59:03 -0400
Date: Mon, 25 Jun 2018 17:58:50 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 4/7] clk: sunxi-ng: add A64 compatible string
Message-ID: <20180625155850.m4unvqyxc3aavrkv@flea>
References: <20180622124540.56203-1-icenowy@aosc.io>
 <20180622124540.56203-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s24chzv6ebukab2t"
In-Reply-To: <20180622124540.56203-3-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--s24chzv6ebukab2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 08:45:37PM +0800, Icenowy Zheng wrote:
> As claiming Allwinner A64 SRAM C is a prerequisite for all sub-blocks of
> the A64 DE2, not only the CCU sub-block, a bus driver is then written for
> enabling the access to the whole DE2 part by claiming the SRAM.
>=20
> In this situation, the A64 compatible string will be just added with no
> other requirments, as they're processed by the parent bus driver.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> No changes since v1.
>=20
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index 468d1abaf0ee..8df7cd93453e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -292,13 +292,10 @@ static const struct of_device_id sunxi_de2_clk_ids[=
] =3D {
>  		.compatible =3D "allwinner,sun50i-h5-de2-clk",
>  		.data =3D &sun50i_a64_de2_clk_desc,
>  	},
> -	/*
> -	 * The Allwinner A64 SoC needs some bit to be poke in syscon to make
> -	 * DE2 really working.
> -	 * So there's currently no A64 compatible here.
> -	 * H5 shares the same reset line with A64, so here H5 is using the
> -	 * clock description of A64.
> -	 */
> +	{
> +		.compatible =3D "allwinner,sun50i-a64-de2-clk",
> +		.data =3D &sun50i_a64_de2_clk_desc,
> +	},

This should be before the h5 (and possibly others?) compatible.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--s24chzv6ebukab2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsxETkACgkQ0rTAlCFN
r3QjGhAAhLQktmBNA7t0D+LUfCjkTQE93/Q7KKSyDIlaioog2CZfORXpRkbkI2a+
TA3/9sx3QjS6HVIRP/Fq0dW8wS6h7JcBBPd63MU1pwjPrVq1GPF1XvUUsvQsVjpC
K7Bco5h+O/ICrEYAwm4QzGFUymkeOrlJk55mM2DYPSnZf5q6BnoOW/lx9DvdAbXB
92xuhU0p3SK9Wrm55wN2Ynf4+e7+QE2WnZMajhNSs2iWVAgLoxK0Exk7yJ2KMz7j
thUknWa0dwWf5Do/ynRK64BNXH/h0sajiXi3pYh8jxVpeWlRPiIGx88o4l2AoIls
hRQJ5oVgZKWW+dPvIjzPPBHbJRfK7v9+bcfvt5I+i0/+O1pYT1MXMxiYowd6PVte
v84tzh2795n/UzJVTaT/2Fqvtj4ogzoPy5dtfwo6Jb7Z78f3OZl4HGWtPKTEAAmb
hISoI4PB+xMQv9zKhO9gvJtPR9SjxE8kOc5H/4ASXNWbYesnFdjNXmBAqVZCwpmk
p1Vl86w+2nXsOGHW60qM1qExRScPJx0Pyf9LcVPzHUEZE8QId4qC7nVclh7oHKbn
nmlyf0RXJTSN5+oZ+yAum4cwelS0oGwzaUuW1/B5QOlGaAWi3bG1KzAAtQ4W7L0A
pb56sjSPUHakigHRUxr7MG6w+CftrsISdIU1+KqfQLkyiVdu8ik=
=Hj2q
-----END PGP SIGNATURE-----

--s24chzv6ebukab2t--
