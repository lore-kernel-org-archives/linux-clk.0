Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: bcm2835: Always round up clock divisor
In-Reply-To: <20151118191141.GB491@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt> <1447251765-16297-2-git-send-email-repk@triplefau.lt> <87h9kj2mhi.fsf@eliezer.anholt.net> <20151118191141.GB491@cruxbox>
Date: Thu, 03 Dec 2015 16:31:25 -0800
Message-ID: <87lh9bgile.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> Hi,
>
> On Wed, Nov 18, 2015 at 10:25:45AM -0800, Eric Anholt wrote:
>> Remi Pommarel <repk@triplefau.lt> writes:
>>=20
>> > Make bcm2835_clock_choose_div always round up the chosen MASH divisor =
so that
>> > the resulting average rate will not be higher than the requested one.
>> >
>> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
>> > ---
>> >  drivers/clk/bcm/clk-bcm2835.c | 15 ++++++++-------
>> >  1 file changed, 8 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm28=
35.c
>> > index 39bf582..1237716 100644
>> > --- a/drivers/clk/bcm/clk-bcm2835.c
>> > +++ b/drivers/clk/bcm/clk-bcm2835.c
>> > @@ -1152,18 +1152,19 @@ static u32 bcm2835_clock_choose_div(struct clk=
_hw *hw,
>> >  {
>> >  	struct bcm2835_clock *clock =3D bcm2835_clock_from_hw(hw);
>> >  	const struct bcm2835_clock_data *data =3D clock->data;
>> > -	u32 unused_frac_mask =3D GENMASK(CM_DIV_FRAC_BITS - data->frac_bits,=
 0);
>> > +	u32 unused_frac_mask =3D
>> > +		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
>> >  	u64 temp =3D (u64)parent_rate << CM_DIV_FRAC_BITS;
>> > +	u64 rem;
>> >  	u32 div;
>> >=20=20
>> > -	do_div(temp, rate);
>> > +	rem =3D do_div(temp, rate);
>> >  	div =3D temp;
>> >=20=20
>> > -	/* Round and mask off the unused bits */
>> > -	if (unused_frac_mask !=3D 0) {
>> > -		div +=3D unused_frac_mask >> 1;
>> > -		div &=3D ~unused_frac_mask;
>> > -	}
>> > +	/* Round up and mask off the unused bits */
>> > +	if ((div & unused_frac_mask) !=3D 0 || rem !=3D 0)
>> > +		div +=3D unused_frac_mask + 1;
>> > +	div &=3D ~unused_frac_mask;
>>=20
>> Suppose we've got 8 of our 12 frac bits populated.  You've added a ">>
>> 1" to the unused_frac_mask, so it's only 0x7 instead of 0xf.  When you
>> say "round up", you add 0x8 (the high bit of the unused mask") then and
>> with ~0x7.  If you started with 0x1 in the low bits of div, you'd end up
>> with 0x8, so you've set an unused bit instead of actually rounding up.
>>=20
>> Did my logic work, here?  I think you just want to drop the ">>1" in
>> unused_frac_mask.
>
> I don't think so.
>
> If we have 8 of our 12 frac bits populated GENMASK(12 - 8, 0) will be 0x1f
> because GENMASK(4, 0) generates a mask from bit at position 0 to bit at
> position 4 inclusively (which is the fifth bit). So GENMASK(4, 0) >> 1 wi=
ll
> be 0xf which is what we want here.

Oh, that was an existing bug you were fixing!  You're right.  I even got
the GENMASK call right at the end of the function, I'd just botched this
one.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWYN7dAAoJELXWKTbR/J7o4D0P/2lNJcN3jOF70sZJbZyS7I/d
gL8FGlvJ6sAMHYVXuzjusLD+874MRE6p76RfjNxYHls9+4GPeGQYo0aa/8sGrXZL
JkIS1MVw5kTsZcb2gnlgIgUt8bJTQVdQVWzxzwPKJfdDcIPnUJQbXa9FtqCWAUuO
Lgpcv6MZgSEyxVuOWpqhkKStiZ0RWXRFaIlovSvg8R1yh80FP1UODt+g9E9n3XWb
ou0oKNjFpPAQSzDc0HKHRGWv+K379Rhyjpm9sq0AONhE93Csn+1s4XHFHA/H1Adz
AbkId95yi16UPaeVWCiu3Lo07OGeFP3d8vlvbwiSNT0BCXtlXT8KAVlscPjpTO+g
n9QJMz2EOxIFNz+kKewFqyE3g746keMomtWUJ5q0RNIWYDnBzr4OHxCwZKJbOoO+
ObjgYuhLTCHXyW4PBhFn3WWGR9ZZZz3e0eQMYrfgr1dD01RiE2rx/UqslS3qvDfq
9epcE3JAaq6dpINuEtttU6HD78pzdArBK7klgfpPyMgk/phyc4uQ/WGYfY3aITlZ
Td3HWYysy+gnOVak5X+n3Jkg0HV1HszSDhgcyXjyCNvZCLBM4ElaFbdYul88XdzC
5WkGJxImzsQOEXtXrHrg6wGVCnnP9b0pfNyftTSlOnJ0Zvu4XGz2GLUm8MBmPAUp
Hj26+piLw2sgDKYxGBH7
=AZh4
-----END PGP SIGNATURE-----
--=-=-=--
