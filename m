Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v2 1/3] clk: bcm2835: Always round up clock divisor
In-Reply-To: <1447251765-16297-2-git-send-email-repk@triplefau.lt>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt> <1447251765-16297-2-git-send-email-repk@triplefau.lt>
Date: Wed, 18 Nov 2015 10:25:45 -0800
Message-ID: <87h9kj2mhi.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> Make bcm2835_clock_choose_div always round up the chosen MASH divisor so =
that
> the resulting average rate will not be higher than the requested one.
>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 39bf582..1237716 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1152,18 +1152,19 @@ static u32 bcm2835_clock_choose_div(struct clk_hw=
 *hw,
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
> +	if ((div & unused_frac_mask) !=3D 0 || rem !=3D 0)
> +		div +=3D unused_frac_mask + 1;
> +	div &=3D ~unused_frac_mask;

Suppose we've got 8 of our 12 frac bits populated.  You've added a ">>
1" to the unused_frac_mask, so it's only 0x7 instead of 0xf.  When you
say "round up", you add 0x8 (the high bit of the unused mask") then and
with ~0x7.  If you started with 0x1 in the low bits of div, you'd end up
with 0x8, so you've set an unused bit instead of actually rounding up.

Did my logic work, here?  I think you just want to drop the ">>1" in
unused_frac_mask.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWTMKqAAoJELXWKTbR/J7oFbAP/RRzh/WofbiKoFE2W34d1ZBd
N3X8jmM0PyyXuCOmp1TqmYovOobqL8bDzNSWqEcvsvUUZNmC5hhETTGs4msP2xpb
m9eu/KqdXZpgLni3W62r/2QImZqbui76gBmJsXPOlsZFMuxEvEAv5BT5BZOn0OGk
hQ9yzCPRThinA8P4DRf608e3fyNFOgOOMiMKDqbgPsDpUG7m6mOVqkgJeV/mkuJ6
mIYEJP3BP5WBefxXS6nkVDda7CmaT2Oj+DP2OejX+UI9srNMPDXggJLZIqhdJgph
afFTuWx4yScP4B2Mo2v3Bs8Cd3HB4FJWL+Ozl3JrX7xCWQsWTKBj+v60N4x5HzkF
imDSQf3qUv9J1jcsXQLsvTIa0zo88MT1Eqce0ZaH1fekMlJHVZ7Vh13TkoQ9/HCq
YyAi5Z5ZX/EB//gqPT4dHOr3QhBWSrSjOvLOlEiLcH+z4xX8+hBEYEX1J9vvvZiv
KDuDSTneHqAGBJBl6eBLVZ0p0by3yJEFsDYREPCMqe8zS/VpqliZnBMhpB8MXa5T
1I8+hUXO3mnMlUJB3JSlHPdsT3Rhf1oCx+jq32hXNcdfuKz8LDR7/I7qzadRHZF9
yoiZaJ8UOhIX8Atz9yPtgavkrXXlafUl2vcT4oB5X/F3YjT1Sfxx44wI6SLWysZa
rh/3rUsmcE3fjYS/UCPU
=rpD/
-----END PGP SIGNATURE-----
--=-=-=--
