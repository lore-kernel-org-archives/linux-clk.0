Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: bcm2835: Support for clock parent selection
In-Reply-To: <20151204203706.GI12775@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt> <1447251765-16297-3-git-send-email-repk@triplefau.lt> <87egfn2m9y.fsf@eliezer.anholt.net> <20151118192423.GC491@cruxbox> <87io4fgibw.fsf@eliezer.anholt.net> <20151204203706.GI12775@cruxbox>
Date: Sat, 05 Dec 2015 16:19:14 -0800
Message-ID: <87poyk1la5.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> On Thu, Dec 03, 2015 at 04:37:07PM -0800, Eric Anholt wrote:
>> Remi Pommarel <repk@triplefau.lt> writes:
>>=20
>> > On Wed, Nov 18, 2015 at 10:30:17AM -0800, Eric Anholt wrote:
>> >
>> > [...]
>> >
>> >> > +static int bcm2835_clock_determine_rate(struct clk_hw *hw,
>> >> > +		struct clk_rate_request *req)
>> >> > +{
>> >> > +	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
>> >> > +	struct clk_hw *parent, *best_parent =3D NULL;
>> >> > +	struct clk_rate_request parent_req;
>> >> > +	unsigned long rate, best_rate =3D 0;
>> >> > +	unsigned long prate, best_prate =3D 0;
>> >> > +	size_t i;
>> >> > +	u32 div;
>> >> > +
>> >> > +	/*
>> >> > +	 * Select parent clock that results in the closest but lower rate
>> >> > +	 */
>> >> > +	for (i =3D 0; i < clk_hw_get_num_parents(hw); ++i) {
>> >> > +		parent =3D clk_hw_get_parent_by_index(hw, i);
>> >> > +		if (!parent)
>> >> > +			continue;
>> >> > +		parent_req =3D *req;
>> >>=20
>> >> parent_req appears dead, so it should be removed.
>> >
>> > Yes, will do thanks.
>> >
>> >> > +		prate =3D clk_hw_get_rate(parent);
>> >> > +		div =3D bcm2835_clock_choose_div(hw, req->rate, prate);
>> >> > +		rate =3D bcm2835_clock_rate_from_divisor(clock, prate, div);
>> >> > +		if (rate > best_rate && rate <=3D req->rate) {
>> >> > +			best_parent =3D parent;
>> >> > +			best_prate =3D prate;
>> >> > +			best_rate =3D rate;
>> >> > +		}
>> >> > +	}
>> >> > +
>> >> > +	if (!best_parent)
>> >> > +		return -EINVAL;
>> >> > +
>> >> > +	req->best_parent_hw =3D best_parent;
>> >> > +	req->best_parent_rate =3D best_prate;
>> >>=20
>> >> I think you're supposed to req->rate =3D best_rate, here, too.  With =
these
>> >> two fixes,
>> >
>> > I did not set req->rate to best_rate in order to avoid rounding down
>> > twice the actual clock rate.
>> >
>> > Indeed with patch 1 from this patchset bcm2835_clock_choose_div()
>> > chooses a divisor that produces a rate lower or equal to the requested
>> > one. As we call bcm2835_clock_choose_div() twice when using
>> > clk_set_rate() (once with ->determine_rate() and once with ->set_rate(=
)),
>> > if I set req->rate in bcm2835_clock_determine_rate to the rounded down
>> > one, the final rate will likely be again rounded down in
>> > bcm2835_clock_set_rate().
>>=20
>> If we pass bcm2835_clock_rate_from_divisor(bcm2835_clock_choose_div()),
>> to bcm2835_clock_choose_div(), will it actually give a different divisor
>> than the first call?  (That seems like an unfortunate problem in our
>> implementation, if so).
>
> Unfortunately yes. Because we want the divided rate to be lower or equal
> to the expected one, I round up the div each time the div_64() produces a
> reminder. Thus calling bcm2835_clock_choose_div() with
> bcm2835_clock_rate_from_divisor(bcm2835_clock_choose_div()) will still
> likely see a reminder from div_64().
>
>>=20
>> I'd be willing to go along with this, but if so I'd like a comment
>> explaining why we aren't setting the field that we should pretty
>> obviously be setting.
>
> I can either put a comment here explaining why we do not update
> req->rate or do as the patch attached at the end.
>
> This patch adds an argument to bcm2835_clock_choose_div() to switch on or
> off the div round up. Then bcm2835_clock_determine_rate() could choose
> the appropriate divisor that produces the highest lower rate while
> bcm2835_clock_set_rate() can actually set the divisor which will remain
> the same.
>
> On second though I prefer the second solution. What do you think ?

Make "round_up" be bool and use true/false as its values, and it looks
good to me!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWY38CAAoJELXWKTbR/J7o9hwP+wSKrtETrYZESQBsma/IuQyP
EtElkDemzBNK2KgYMxSzoNDqZBYVX01G9kFo3cCV8UfQToRe+LAorJx5Q81y+GCY
JSv9bcwxXRWjIXBqoD0Mf9ACkNPif9dCkCUFBn1YVq9ffetUC3kgrZ3xz/FR8Bu7
0wLdrR46mlfE5XXUwcy9lJwTib188PcEzYm5zvDWpd2i5C4e0oL2YPB1eRLiv/ia
PnG7w3jFo3N9xrSMVciCy2lcbBjsiUTr/ISJyda/aNLR1czYS9Jhu5z1grcqb1E6
KUjLR5jkkDxSgSgWzYtFJ8vdNaWIUlwKa+m5p5u3Dc/hi+5JbnxMdgWD7QMC8rC0
9RWpxx1ESQkWr7cymnHkOhutJ/yyjoMJ7zhzO9JkDaqQ6HOBcBH/MHMDAQzFsJOl
oJiJTjsyDD0v9PRlpu/tXyXAcDKPepXbr1XKXyH9X0/+Mhr8uXYl9NrpZBXR6obb
NapwKzSuBc2e68RMnZfoDZHmIuDVxJg+3K64BJuvOIVOpspiTqky4g7naeTb5/zL
w0BLsiVpgBDMmycRNh8A/GyBWlX8GGcLrAAoWOvB92BVdwTTiNtwij1w2XI4zDXZ
/OFuY7r4kj19nG83SUPOy6CcOtBEpNHcXJCYusTaxJk57yeBgfTBSjnVVc8SC+sX
2XX44KYQEpJhfiBItFnB
=SnOk
-----END PGP SIGNATURE-----
--=-=-=--
