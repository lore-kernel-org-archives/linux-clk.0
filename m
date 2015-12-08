Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v3 1/4] clk: bcm2835: add a round up ability to the clock divisor
In-Reply-To: <1449418969-5565-2-git-send-email-repk@triplefau.lt>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt> <1449418969-5565-2-git-send-email-repk@triplefau.lt>
Date: Mon, 07 Dec 2015 17:28:28 -0800
Message-ID: <878u55d8zn.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> Make bcm2835_clock_choose_div to optionally round up the chosen MASH divi=
sor
> so that the resulting average rate will not be higher than the requested =
one.
>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 39bf582..9e881ee 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1148,22 +1148,24 @@ static int bcm2835_clock_is_on(struct clk_hw *hw)
>=20=20
>  static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
>  				    unsigned long rate,
> -				    unsigned long parent_rate)
> +				    unsigned long parent_rate,
> +				    bool round_up)
>  {
>  	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
>  	const struct bcm2835_clock_data *data =3D clock->data;
> -	u32 unused_frac_mask =3D GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0);
> +	u32 unused_frac_mask =3D
> +		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
>  	u64 temp =3D (u64)parent_rate << CM_DIV_FRAC_BITS;
> +	u64 rem;
>  	u32 div;
>=20=20
> -	do_div(temp, rate);
> +	rem =3D do_div(temp, rate);
>  	div =3D temp;
>=20=20
> -	/* Round and mask off the unused bits */
> -	if (unused_frac_mask !=3D 0) {
> -		div +=3D unused_frac_mask >> 1;
> -		div &=3D ~unused_frac_mask;
> -	}
> +	/* Round up and mask off the unused bits */
> +	if (round_up && ((div & unused_frac_mask) !=3D 0 || rem !=3D 0))
> +		div +=3D unused_frac_mask + 1;
> +	div &=3D ~unused_frac_mask;
>=20=20
>  	/* Clamp to the limits. */
>  	div =3D max(div, unused_frac_mask + 1);
> @@ -1202,7 +1204,7 @@ static long bcm2835_clock_round_rate(struct clk_hw =
*hw,
>  				     unsigned long *parent_rate)
>  {
>  	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
> -	u32 div =3D bcm2835_clock_choose_div(hw, rate, *parent_rate);
> +	u32 div =3D bcm2835_clock_choose_div(hw, rate, *parent_rate, false);
>=20=20
>  	return bcm2835_clock_rate_from_divisor(clock, *parent_rate, div);
>  }
> @@ -1271,7 +1273,7 @@ static int bcm2835_clock_set_rate(struct clk_hw *hw,
>  	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
>  	struct bcm2835_cprman *cprman =3D clock->cprman;
>  	const struct bcm2835_clock_data *data =3D clock->data;
> -	u32 div =3D bcm2835_clock_choose_div(hw, rate, parent_rate);
> +	u32 div =3D bcm2835_clock_choose_div(hw, rate, parent_rate, false);

I think you meant ", true" on one of these.  With that fixed,

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWZjI8AAoJELXWKTbR/J7oaU4P/R1XbS+GLlFko9lTHWmOq67t
VD2S4uwrmcP4EE6MiLxdwUCjsVC6MldMl0//o+jJy2nZLFfLFVm6Y3XxR/EzUzGY
yqOg0UQttMTqBidrbAxvH/BYiKh6gxMgfOPAaRsxlCJWWUelL2baCSZjzsp1SBSF
W+5c/63ccKVTdwEDz3MZkr0hx9dae5Xb7JhI0GLWlBAp4Opn44ZukMdTMuif3sEH
7Z1IoDSYFgck52KsDwTLvKV1TcMkK9xPwRPbcXstIUzlv+ZBRRLCfDyt3F64uDBQ
bozELZHgfQ10TwseUqyRZn2kthNotlpsJj/Os2c6fAzHK4YwMGdRENVnI6aB2gtw
ZksMVKIPIekerkFYH74YDDnZKt1sc+m87SC4Xi0XycOyhyAqPgUJLwnQlPOEEwHv
lpA7fnFjXYK6Dxu0D+cG/hoY66HTWaj61l9XybL5Py96ZY9peWh58aODSflg558E
77jw47UyihuRmyiYyiyQi4XjKDS1QxIv+czWD4tkDYa3qQnSbyDQPhMOAmY89Lwf
lcDbIdvXXWEe7hBIuVM4svUvCsupk4T8n9x6j81ASzmksHhER4mKIJI5hFVguq9I
ztQ4LvGjAeq/rzEI4VdovFsMjpFiLUvlPsZoZRm35L/nrMiL67ie+2bbyuemlTzJ
x7v+dtn+qfH5cWjb298t
=D9p9
-----END PGP SIGNATURE-----
--=-=-=--
