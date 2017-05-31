Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Phil Elwell <phil@raspberrypi.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: bcm2835: Minimise clock jitter for PCM clock
In-Reply-To: <a507a7e7-3c64-1dcb-98f1-a7f94364f26c@raspberrypi.org>
References: <b9208d9b-c7bb-49a3-85d9-231c8b41eb8c@raspberrypi.org> <a507a7e7-3c64-1dcb-98f1-a7f94364f26c@raspberrypi.org>
Date: Wed, 31 May 2017 14:36:05 -0700
Message-ID: <87bmq8btfe.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Phil Elwell <phil@raspberrypi.org> writes:

> Fractional clock dividers generate accurate average frequencies but
> with jitter, particularly when the integer divisor is small.
>
> Introduce a new metric of clock accuracy to penalise clocks with a good
> average but worse jitter compared to clocks with an average which is no
> better but with lower jitter. The metric is the ideal rate minus the
> worse deviation from that ideal using the nearest integer divisors.

"worst" the second time

> Use this metric for parent selection for clocks requiring low jitter
> (currently just PCM).
>
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 40 +++++++++++++++++++++++++++++++++++--=
---
>  1 file changed, 35 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 81ecd4c..c7ee951 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -530,6 +530,7 @@ struct bcm2835_clock_data {
>=20=20
>  	bool is_vpu_clock;
>  	bool is_mash_clock;
> +	bool low_jitter;
>=20=20
>  	u32 tcnt_mux;
>  };
> @@ -1124,7 +1125,8 @@ static unsigned long bcm2835_clock_choose_div_and_p=
rate(struct clk_hw *hw,
>  							int parent_idx,
>  							unsigned long rate,
>  							u32 *div,
> -							unsigned long *prate)
> +							unsigned long *prate,
> +							unsigned long *avgrate)
>  {
>  	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
>  	struct bcm2835_cprman *cprman =3D clock->cprman;
> @@ -1136,11 +1138,34 @@ static unsigned long bcm2835_clock_choose_div_and=
_prate(struct clk_hw *hw,
>  	parent =3D clk_hw_get_parent_by_index(hw, parent_idx);
>=20=20
>  	if (!(BIT(parent_idx) & data->set_rate_parent)) {
> +		unsigned long tmp_rate;
> +
>  		*prate =3D clk_hw_get_rate(parent);
>  		*div =3D bcm2835_clock_choose_div(hw, rate, *prate, true);
>=20=20
> -		return bcm2835_clock_rate_from_divisor(clock, *prate,
> -						       *div);
> +		tmp_rate =3D bcm2835_clock_rate_from_divisor(clock, *prate, *div);
> +		*avgrate =3D tmp_rate;
> +
> +		if (data->low_jitter && (*div & CM_DIV_FRAC_MASK)) {
> +			unsigned long high, low;
> +			u32 int_div =3D *div & ~CM_DIV_FRAC_MASK;
> +
> +			high =3D bcm2835_clock_rate_from_divisor(clock, *prate,
> +							       int_div);
> +			int_div +=3D CM_DIV_FRAC_MASK + 1;
> +			low =3D bcm2835_clock_rate_from_divisor(clock, *prate,
> +							      int_div);
> +
> +			/*
> +			 * Return a value which is the maximum deviation
> +			 * below the ideal rate, for use as a metric.
> +			 */
> +			if ((tmp_rate - low) < (high - tmp_rate))
> +				tmp_rate =3D low;
> +			else
> +				tmp_rate -=3D high - tmp_rate;

Simplification suggestion: Remove tmp_rate variable, just assign to
rate_from_divisor result to *avgrate.  At the end of the low_jitter
block, just "return *avgrate - max(*avgrate - low, high - *avgrate)".

With that, feel free to add:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkvN0UACgkQtdYpNtH8
nuijaxAAtbF3m4UusEJMMTiFcLpnpemsQdMBbA37xQRPwvh2oK6/DGAHf2qezYUi
yiHYq/JXqoC+lWJUtsZAbsbWGJqgFehAkw4FlS7fJG6RtHcdX87C5vaTnv72V6m6
M++LyWk/KunG1jpvCo34PonHVUZMlowxzac4nG5AkhJIKLChbLPWPapoAVneG0hV
cwm62OthWvYC65FB/+bAumrYtDk0V/srJJ1s9GgmUoMKREOxbQQ3BMfKwal5yf5W
jXz8YPmCMG+fskSwKwyqVg4RVpdFj1SOMTPZRv50+QELCWw8VxB2qumdbV7RcHvZ
NJNr7f84rvQavmCQNKnSgSkQd+eN8098DNtmrJUPRGJTzStoCYZit3w0CqOMWuOY
ARk1+BNKiNfT2VM2vcmidfZjwrVpXEvxxIPcAogcYTmKhXHTvtGfW5J0uOdR1f/x
D+X9Q6cXLhFvCkdJTLJmQxzdboFvM2PpLGWkuWw8NHYBTbPVKMvXYZ0op1KJL6ry
z6XHx5q66WqcaAemgXY/CxOe3aYXbnQDaSCbjL7UdwPIuHRoM9j+7K3QTz5sVjjJ
P2cCMHJaIkQFTaxoAjgZVjLhHISwS6/2R/i9yZTQrOtwuowl1PFHJDfk0YRrF6oT
Uy2RySKezpF50a9Cly1BnrvRIiBZMTnPQwDXygG1b+i/00xhvsk=
=kflZ
-----END PGP SIGNATURE-----
--=-=-=--
