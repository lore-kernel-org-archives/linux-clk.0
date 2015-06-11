Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 11 Jun 2015 11:06:53 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: dinguyen@opensource.altera.com
Cc: sboyd@codeaurora.org, mturquette@linaro.org, dinh.linux@gmail.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>
Subject: Re: [PATCH 5/6] clk: sunxi: make use of of_clk_parent_fill helper
 function
Message-ID: <20150611090653.GH19653@lukather>
References: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
 <1433972965-24974-6-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
In-Reply-To: <1433972965-24974-6-git-send-email-dinguyen@opensource.altera.com>
List-ID: <linux-clk.vger.kernel.org>


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dinh,

On Wed, Jun 10, 2015 at 04:49:24PM -0500, dinguyen@opensource.altera.com wr=
ote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>=20
> Use of_clk_parent_fill to fill in the parent clock names' array.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: "Emilio L=F3pez" <emilio@elopez.com.ar>
> ---
>  drivers/clk/sunxi/clk-a20-gmac.c    |  3 +--
>  drivers/clk/sunxi/clk-factors.c     |  4 +---
>  drivers/clk/sunxi/clk-sun6i-ar100.c |  3 +--
>  drivers/clk/sunxi/clk-sunxi.c       | 10 ++--------
>  4 files changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-a20-gmac.c b/drivers/clk/sunxi/clk-a20=
-gmac.c
> index 0dcf4f2..a432edd 100644
> --- a/drivers/clk/sunxi/clk-a20-gmac.c
> +++ b/drivers/clk/sunxi/clk-a20-gmac.c
> @@ -80,8 +80,7 @@ static void __init sun7i_a20_gmac_clk_setup(struct devi=
ce_node *node)
>  		goto free_mux;
> =20
>  	/* gmac clock requires exactly 2 parents */
> -	parents[0] =3D of_clk_get_parent_name(node, 0);
> -	parents[1] =3D of_clk_get_parent_name(node, 1);
> +	of_clk_parent_fill(node, parents, 2);
>  	if (!parents[0] || !parents[1])

Maybe this check can be changed to something like:

if (of_clk_parent_fill(node, parents, 2) !=3D 2)
   goto free_gate;

Would that make sense?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVeU+tAAoJEBx+YmzsjxAgyy8P/R49ph2FHk/pLnYmdiWmign0
pQXwX8SdsLb7a48lOrIVTyJaNiPvwIYwK8eV6RaXtaVGnVSmDkdaNDO3ugeNt5rz
gBNxzPwxbM/fVuctdvk8NJVG/3fXKM0ShhzOG9chkJVhMl6Smw1iYKms7daUTGKH
pFoS8fnNEh+dR+fY3SFW5J3GZFGQ5BXpLSX80sfuz5BIm0V0Jz6AAy8ghCm6V0uX
LG9OtFsZoZsZ7Fl1LtY8TPVmYLr6nfn8s/RtCt1qHQTlagbFsuGjlZ9Y/4S3GG+g
j0ZiWrdCt477gRogdDP+GtWisMVWKGbTm/ajt72fTxehXF20XS+wHpa8dc1wAhTn
KhVrFgFl+W+ThpsDVrD3vXFKAYx9kI5c0mEgh/Mg2T9Wj/LlOghMwDiC0TV22mgw
EHv5GJWUrijre0lAdBYYdxiyBtbc7NsiMFtElx7J3g1DinAffUMkFZPQtstp7qSQ
rKQkR6JTaKbB2lEUssBhWNulw695mA/XsYxpksWaAgChkyhAUVSPf90fIS7UaTTR
4Yw4MrCckd0+GYhIIE5JqGVcLNzAC2fwjpkSXWTulh7bKLem7FGeeaSWFeoKeNHr
ebs6IOUyI6RBWOsIgKMEim03DLyfL1aTsbpu8ztfubg19vQuXWP4lFbSdg6VnKKB
ydrl8rNnvtDiPUL87GJg
=fbn4
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
