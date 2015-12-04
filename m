Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: bcm2835: Support for clock parent selection
In-Reply-To: <20151118192423.GC491@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt> <1447251765-16297-3-git-send-email-repk@triplefau.lt> <87egfn2m9y.fsf@eliezer.anholt.net> <20151118192423.GC491@cruxbox>
Date: Thu, 03 Dec 2015 16:37:07 -0800
Message-ID: <87io4fgibw.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> On Wed, Nov 18, 2015 at 10:30:17AM -0800, Eric Anholt wrote:
>
> [...]
>
>> > +static int bcm2835_clock_determine_rate(struct clk_hw *hw,
>> > +		struct clk_rate_request *req)
>> > +{
>> > +	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
>> > +	struct clk_hw *parent, *best_parent =3D NULL;
>> > +	struct clk_rate_request parent_req;
>> > +	unsigned long rate, best_rate =3D 0;
>> > +	unsigned long prate, best_prate =3D 0;
>> > +	size_t i;
>> > +	u32 div;
>> > +
>> > +	/*
>> > +	 * Select parent clock that results in the closest but lower rate
>> > +	 */
>> > +	for (i =3D 0; i < clk_hw_get_num_parents(hw); ++i) {
>> > +		parent =3D clk_hw_get_parent_by_index(hw, i);
>> > +		if (!parent)
>> > +			continue;
>> > +		parent_req =3D *req;
>>=20
>> parent_req appears dead, so it should be removed.
>
> Yes, will do thanks.
>
>> > +		prate =3D clk_hw_get_rate(parent);
>> > +		div =3D bcm2835_clock_choose_div(hw, req->rate, prate);
>> > +		rate =3D bcm2835_clock_rate_from_divisor(clock, prate, div);
>> > +		if (rate > best_rate && rate <=3D req->rate) {
>> > +			best_parent =3D parent;
>> > +			best_prate =3D prate;
>> > +			best_rate =3D rate;
>> > +		}
>> > +	}
>> > +
>> > +	if (!best_parent)
>> > +		return -EINVAL;
>> > +
>> > +	req->best_parent_hw =3D best_parent;
>> > +	req->best_parent_rate =3D best_prate;
>>=20
>> I think you're supposed to req->rate =3D best_rate, here, too.  With the=
se
>> two fixes,
>
> I did not set req->rate to best_rate in order to avoid rounding down
> twice the actual clock rate.
>
> Indeed with patch 1 from this patchset bcm2835_clock_choose_div()
> chooses a divisor that produces a rate lower or equal to the requested
> one. As we call bcm2835_clock_choose_div() twice when using
> clk_set_rate() (once with ->determine_rate() and once with ->set_rate()),
> if I set req->rate in bcm2835_clock_determine_rate to the rounded down
> one, the final rate will likely be again rounded down in
> bcm2835_clock_set_rate().

If we pass bcm2835_clock_rate_from_divisor(bcm2835_clock_choose_div()),
to bcm2835_clock_choose_div(), will it actually give a different divisor
than the first call?  (That seems like an unfortunate problem in our
implementation, if so).

I'd be willing to go along with this, but if so I'd like a comment
explaining why we aren't setting the field that we should pretty
obviously be setting.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWYOAzAAoJELXWKTbR/J7oDvoP/1yoH8cvVKhG6Xh/eIbKLhN/
YiP9JrY8BqOX2pNpU4u7/tNWNUTzg/N097l1CqzR4oxrI00VXDkY5OSAFjzqo1+R
pD9G/QBJ1nISx3MggRjqpmXDxj0ZmPqL+bSxcgU2FJ2QR2hn20X74CdlF1+F55T3
l0XyMkIkUEYkOeA9pWS/OBwhU7tYtsDhB0aRRgfJ+Xa91VdAEhFu4ZsQAGip9A/8
cMNazbEr0Nwka6KmgzTA9323YOJbQAqEQO1mDglBSc1O+nTS4DMjo9/2CbmLNzR2
O0EtKP1eWCph1pCjnkn+rAF5DJr9CKAGei2YhupQ7orA24cYeqVmUWOXqssOG0KB
vAW3MHnjqxzRtsnTCHp0hecI2Mq6HObOStVRDoEI6gLW5GH/EqEgLvJtRCwvOHo6
NdfCVUCVRI/7i2NpnJeFHmuDf7UDyeGnIl4Cb3ttw+qu6fyNt7sSehso9btoxT6j
+XXUBC0o5K5S0gQgwQmSYwawJ3agAzudUKiyfhzOnDUa371qqnl4LWgUYUrBde8D
0ye2XqfHRS7hkHR4zTrmhcAc6XR4djp2KDrRsZWl2/QONjwkUUq+sAfrtzZY24sq
/j5L4EJ4jGvyhvu/auKKbT6JN1OKPd3Ol0z7mF++0iIZKXPw4tqb8ImvIVYcC6r9
I9oFe9fiUnaJkPPilQOO
=dd0X
-----END PGP SIGNATURE-----
--=-=-=--
