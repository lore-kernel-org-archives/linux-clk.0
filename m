Return-Path: <James.Hogan@imgtec.com>
Date: Fri, 12 Aug 2016 14:16:59 +0100
From: James Hogan <james.hogan@imgtec.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: divider: Fix clk_divider_round_rate() to use
 clk_readl()
Message-ID: <20160812131659.GR19514@jhogan-linux.le.imgtec.org>
References: <1471005474-32301-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HAv5+T9jbwMPl6Kw"
In-Reply-To: <1471005474-32301-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

--HAv5+T9jbwMPl6Kw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 02:37:54PM +0200, Geert Uytterhoeven wrote:
> clk-divider uses clk_readl()/clk_writel() everywhere, except in
> clk_divider_round_rate(), where plain readl() is used. Change this to
> clk_readl(), as it makes a difference on powerpc.
>=20
> Fixes: e6d5e7d90be92cee ("clk-divider: Fix READ_ONLY when divider > 1")

Hmm yes, sorry. I don't know how I managed to do that considering the
prevalance of clk_readl() at the time.

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Thanks
James

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Found by code inspection, untested on powerpc.
> ---
>  drivers/clk/clk-divider.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index a0f55bc1ad3d277f..96386ffc84835f12 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -352,7 +352,7 @@ static long clk_divider_round_rate(struct clk_hw *hw,=
 unsigned long rate,
> =20
>  	/* if read only, just return current value */
>  	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> -		bestdiv =3D readl(divider->reg) >> divider->shift;
> +		bestdiv =3D clk_readl(divider->reg) >> divider->shift;
>  		bestdiv &=3D div_mask(divider->width);
>  		bestdiv =3D _get_div(divider->table, bestdiv, divider->flags,
>  			divider->width);
> --=20
> 1.9.1
>=20

--HAv5+T9jbwMPl6Kw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXrcxLAAoJEGwLaZPeOHZ6pEkQAMAbtsJIUeVjl1ZVPEMGOa7c
TPky9glda252NbkxFfTUF+ks3miq8Mv0KyY4w814C1FTzz/unQLO+5e/V2q19FS9
0N4VDfFFLnglwbpepF7gqDJL+r/w0h7HgO6uz7ja1Lf4l/xfeLHXv3NlLwfXmIPb
N/IVy6FdGYCd4PmWOLlFWMJ3Ev0DNgae0/Bosg/wHuR4OE6X/uKgN8N4QDRGO//0
OVAXweOYlHi6azLAovM3qesV1AMy8McvpacQZLMpeLfLg2ftqaZfK+U5jG3/4Qli
2rqQjcGO5jMClIzD915KKqgyRBHRIxeGpCVo1SY+EZxgXmklG6MbNXRWe54Fi/O0
xEdwwkODhLyQBTOAZhRMlGLHr4tX/PyIqfskspNmZIvo1f0evQlIu4gqK6KTMJPl
xGO+g1Ry3TwjPubBA+5gcFm+zZXNROpO2KHG4aqtr7hw8FE7LUbjSA14Zf3MfVG3
ySO3GB59s+CCfSlFzWrLcrWvMyyYfPp7A1A3753Z/rVXCDa0i44uHq5sbC/if9lB
hPFXtQfkLofEe3sH0UaHfpOiIeH8fs85UaEWwHbRt1H9DctkcVvzFsqiA5QOqECc
nbXw/D/l7habnLszPZhQkLXo8UnbebC1Rr6MPbUT1wE+7Kewv8ANggG1ngpi/fOa
gdO3ZS80Nd8VKKLEy6Ou
=4rEt
-----END PGP SIGNATURE-----

--HAv5+T9jbwMPl6Kw--
