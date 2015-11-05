Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH 1/2] clk: bcm2835: Support for clock parent selection
In-Reply-To: <1446678502-16243-2-git-send-email-repk@triplefau.lt>
References: <1446678502-16243-1-git-send-email-repk@triplefau.lt> <1446678502-16243-2-git-send-email-repk@triplefau.lt>
Date: Wed, 04 Nov 2015 18:03:31 -0800
Message-ID: <87si4l2oek.fsf@eliezer.anholt.net>
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
> parents. These clocks divide the rate of one parent which can be selected=
 by
> setting the proper bits in their clock control register.
>
> Previously all these parents where handled by a mux clock. But a mux clock
> cannot be used because updating clock control register to select parent n=
eeds a
> password to be xor'd with the parent index.

Good point.  I previously was doing parent detection from muxes
manually, then simplified to using the generic mux later.  I didn't have
any clocks I wanted to change mux on, so I missed this requirement.

It looks like there's not too much work to folding the muxing back into
the driver, so it seems like you have a good plan.

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
> @@ -1278,13 +1268,69 @@ static int bcm2835_clock_set_rate(struct clk_hw *=
hw,
>  	return 0;
>  }
>=20=20
> +static int bcm2835_clock_determine_source(struct clk_hw *hw,
> +		struct clk_rate_request *req)
> +{
> +	struct clk_hw *parent, *best_parent =3D NULL;
> +	struct clk_rate_request parent_req;
> +	unsigned long prate, best_rate =3D ULONG_MAX;
> +	size_t i;
> +
> +	/*
> +	 * Select parent clock that has the closest but higher rate
> +	 */
> +	for (i =3D 0; i < clk_hw_get_num_parents(hw); ++i) {
> +		parent =3D clk_hw_get_parent_by_index(hw, i);
> +		if (!parent)
> +			continue;
> +		parent_req =3D *req;
> +		prate =3D clk_hw_get_rate(parent);
> +		if (prate < best_rate && prate >=3D req->rate) {
> +			best_parent =3D parent;
> +			best_rate =3D prate;
> +		}
> +	}
> +
> +	if (!best_parent)
> +		return -EINVAL;
> +
> +	req->best_parent_hw =3D best_parent;
> +	req->best_parent_rate =3D best_rate;
> +
> +	return 0;
> +}

It looks like you've dropped the use of the divisor off of the PLL
channel when setting a rate.  That seems bad for all the other clocks in
the system, and a feature we couldn't lose.

Also, you're choosing the lowest but higher rate, while
mux_is_better_rate() chooses the highest but lower rate (which seems
much safer).  What led to that choice?

Also, if we're going to have this function, I think it should be called
"bcm2835_clock_determine_rate" to match the method name.

The parent get/setting looks good, though.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWOrjzAAoJELXWKTbR/J7oFwwQALeYXA1EP7yEG+tIYYEK3s+L
x+BvJ48kdHDD7cYVnDWzViyo/ivbPrDS7BgflogFd1cpSR1lopM8/PBsJ7wNWXvQ
nageUxR5XgiDcouxV9svIDDoVnqxFE0DUBYuaHUxAlxfYlLiTtE5G0KG9LRixQCS
j7g1IihbXPKSstCmf0bGzlktQJkKNALDxqt+qW9bhpCAW8b05P6s39GIJjglFZRv
b/Fm7O2rp1duEiNxXjG+yNEstNyHUe9H0kkjW/PdXwdUwYspR1pU5hWR2eqNm2jT
mI4rnZ7Nzal5k50YZ720EejXr1C8UG8q0KdiyZcV4xJeLfQ3muycv2dquH8v3YwM
O1L7WNmcZc1qewL7siKeQUM4tLQnklhJQ1tLTa0TafL17vSOI3JKrySLuqihJGiD
IYzkGb5Y2Sztr+gsIQtSGYH0H8yslu5B0im5oJQMVWXqs4KdPy6pEJ6zCNaLoFBo
04WEudgcXcZglVuQfPkR9onR+9AIADIbJVXOEdbpoSoqIdEPLOcLlRlbGV6PWIxI
d3PFvkSazUkndRCOjK+hSca1xJsVaeNupM5DWiWzPCj/N7KcEAtJGIa1jG0eLKYa
SYvwmD+lhc/YZP9xmn7SQb2akewEO1PtXJNgXCJNGKvlHMczhHdFwxttc6lI+NDF
q7O/ZM2XGPAq5p28Zdsk
=Qb/t
-----END PGP SIGNATURE-----
--=-=-=--
