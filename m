Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v2 2/3] clk: bcm2835: Support for clock parent selection
In-Reply-To: <1447251765-16297-3-git-send-email-repk@triplefau.lt>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt> <1447251765-16297-3-git-send-email-repk@triplefau.lt>
Date: Wed, 18 Nov 2015 10:30:17 -0800
Message-ID: <87egfn2m9y.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> Some bcm2835 clocks used by hardware (like "PWM" or "H264") can have mult=
iple
> parent clocks. These clocks divide the rate of a parent which can be sele=
cted by
> setting the proper bits in the clock control register.
>
> Previously all these parents where handled by a mux clock. But a mux clock
> cannot be used because updating clock control register to select parent n=
eeds a
> password to be xor'd with the parent index.
>
> This patch get rid of mux clock and make these clocks handle their own pa=
rent,
> allowing them to select the one to use.
>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 122 ++++++++++++++++++++++++++----------=
------
>  1 file changed, 77 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 1237716..2b01a53 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1198,16 +1198,6 @@ static long bcm2835_clock_rate_from_divisor(struct=
 bcm2835_clock *clock,
>  	return temp;
>  }
>=20=20
> -static long bcm2835_clock_round_rate(struct clk_hw *hw,
> -				     unsigned long rate,
> -				     unsigned long *parent_rate)
> -{
> -	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
> -	u32 div =3D bcm2835_clock_choose_div(hw, rate, *parent_rate);
> -
> -	return bcm2835_clock_rate_from_divisor(clock, *parent_rate, div);
> -}
> -
>  static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
>  					    unsigned long parent_rate)
>  {
> @@ -1279,13 +1269,75 @@ static int bcm2835_clock_set_rate(struct clk_hw *=
hw,
>  	return 0;
>  }
>=20=20
> +static int bcm2835_clock_determine_rate(struct clk_hw *hw,
> +		struct clk_rate_request *req)
> +{
> +	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
> +	struct clk_hw *parent, *best_parent =3D NULL;
> +	struct clk_rate_request parent_req;
> +	unsigned long rate, best_rate =3D 0;
> +	unsigned long prate, best_prate =3D 0;
> +	size_t i;
> +	u32 div;
> +
> +	/*
> +	 * Select parent clock that results in the closest but lower rate
> +	 */
> +	for (i =3D 0; i < clk_hw_get_num_parents(hw); ++i) {
> +		parent =3D clk_hw_get_parent_by_index(hw, i);
> +		if (!parent)
> +			continue;
> +		parent_req =3D *req;

parent_req appears dead, so it should be removed.

> +		prate =3D clk_hw_get_rate(parent);
> +		div =3D bcm2835_clock_choose_div(hw, req->rate, prate);
> +		rate =3D bcm2835_clock_rate_from_divisor(clock, prate, div);
> +		if (rate > best_rate && rate <=3D req->rate) {
> +			best_parent =3D parent;
> +			best_prate =3D prate;
> +			best_rate =3D rate;
> +		}
> +	}
> +
> +	if (!best_parent)
> +		return -EINVAL;
> +
> +	req->best_parent_hw =3D best_parent;
> +	req->best_parent_rate =3D best_prate;

I think you're supposed to req->rate =3D best_rate, here, too.  With these
two fixes,

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWTMO6AAoJELXWKTbR/J7odQ4QAI6xO4pl6H8GnnL0qKR/eFNE
Sx3I9xnWm7ua+K+pvewXZhOkv9l5rYJwk+rH2Oyxk3mqTvcco4xhALHwWM05osXo
2JIDrv9kcaOLZlQcyR2zm7rlchrFqPABrFhtEPi7CkfQaZASo6f/G+0xm9oIDOgn
urQeEjFavgHty9J/NKnVHDNQkunD70I7LxLowyO/Z5genKY1kSR74FWUoSj7TZU5
clt22zlBuPjxl3RtnmOhlnOfEkQo16h3ZLde3Qm1hvFLFK7phQmB5LF1Q5R3FuBr
pOz5asfMViydTRUx3hw3RCzI2nJ6UpxiqbDDtei1dt1ZQrtj5le+6A+cCk/BKzIR
V1TANXE1UJWceVoXwm/SpBvibtOAZcpv0kme8QZA3Cs6Bdc0T04KbP3VeHuERTb9
+fqjvUaAPsW7IZIk5mF7p6CREO557o5KaIkuYSStTT/dsZsSVFs0r1v3JRk5tiJN
cQ2+Ldehook0/ZqTjogpEBganhtl9yxQj85aAARpLmsTs4cpZudeHpVxDh/84+vt
+LWARUdmZCiBDDCGtT9yvPVDPGVB5Um/ro0ikx1nYhIcDb+ZxrhfOzrKyXBuNQ/g
fZ+e3Ji3HLv3CBlrsxykeJbbACquJEqIVtRFWrVOTU76LGLKbM4VbbTvrs7Iw9I1
Owm6FeYRg39E0Y+PynC1
=Oi1z
-----END PGP SIGNATURE-----
--=-=-=--
