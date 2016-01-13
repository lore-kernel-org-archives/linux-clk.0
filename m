Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 13 Jan 2016 12:18:09 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Marcus Weseloh <mweseloh42@gmail.com>
Cc: linux-sunxi@googlegroups.com,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Fix mod0 clock calculation to return stable
 results and check divisor size limits
Message-ID: <20160113111809.GA9905@lukather>
References: <1451323892-13060-1-git-send-email-mweseloh42@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
In-Reply-To: <1451323892-13060-1-git-send-email-mweseloh42@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marcus,

Sorry for the reviewing delay.

On Mon, Dec 28, 2015 at 06:31:32PM +0100, Marcus Weseloh wrote:
> This patch fixes some problems in the mod0 clock calculation. It has
> the potential to break stuff, as the issues explained below had the
> effect that clk_set_rate would always return successfully, sometimes
> setting a frequency that is higher than the requested value.

That's actually the expected behaviour of clk_set_rate.

clk_set_rate is supposed to adjust the given clock rate to something
that the clock drivers seems fit. It should only return an error in a
case where you can't change the rate at all (because you didn't pass a
valid struct clk pointer, because changing the rate would violate some
clock flags, etc.). Otherwise, clk_set_rate should succeed.

By returning an error code the clock is higher than the one passed,
you violate that expectation, especially since that is relative to the
clock you passed.

It makes sense in your case to never exceed the given rate, it might
not for a different clock in the tree, or even for a different
instance of the same clock. For example, you could very well have
another case in your system where you should not have rates set that
are below the one given because that would prevent the consumer
device to be usable.

This is why the adjustment is left to the clock driver, and is not
enforced by the framework itself, simply because the framework has no
idea how you want to round your clock rate on that particular clock in
your system.

> Code that "accidentally worked" because of this might fail after
> applying this patch.
>=20
> The problems in detail:
>=20
> 1. If a very low frequency is requested from a high parent clock, the
> divisors "div" and "calcm" might be > 255. This patch changes the type
> of both variables to unsigned int, because the silent cast to u8 will
> result in invalid frequencies and register values.
>=20
> 2. The width of the "m" divisor in the clock control registers is only
> 4 bit, but that limitation is not checked when calculating the divisor
> and the resulting frequency. This patch adds a check that m never
> exceeds the field width.
>=20
> 3. During a call to clk_set_rate, the sun4i_a10_get_mod0_factors
> function is called multiple times: first to find the best parent and
> frequency, then again to calculate the p and m divisors, passing the
> frequencies returned by the previous call(s). In certain cases
> those chained calls do not result in the best frequency choice.

You know the drill by now :)

You're fixing three different issues, please send three different
patches.

>=20
> An example:
> parent_rate =3D 24Mhz, freq =3D 1.4Mhz results in p=3D1, m=3D9, freq=3D13=
33333,3333
> (which gets rounded down to 1333333).
> Calling the function again with parent_rate =3D 24Mhz and freq =3D 1333333
> results in p=3D1, m=3D10, freq=3D1200000.
>=20
> Rounding up the returned frequency removes this problem.
>=20
> Signed-off-by: Marcus Weseloh <mweseloh42@gmail.com>
> ---
>  drivers/clk/sunxi/clk-mod0.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
> index d167e1e..d03f099 100644
> --- a/drivers/clk/sunxi/clk-mod0.c
> +++ b/drivers/clk/sunxi/clk-mod0.c
> @@ -31,7 +31,8 @@
>  static void sun4i_a10_get_mod0_factors(u32 *freq, u32 parent_rate,
>  				       u8 *n, u8 *k, u8 *m, u8 *p)
>  {
> -	u8 div, calcm, calcp;
> +	unsigned int div, calcm;
> +	u8 calcp;
> =20
>  	/* These clocks can only divide, so we will never be able to achieve
>  	 * frequencies higher than the parent frequency */
> @@ -50,8 +51,10 @@ static void sun4i_a10_get_mod0_factors(u32 *freq, u32 =
parent_rate,
>  		calcp =3D 3;
> =20
>  	calcm =3D DIV_ROUND_UP(div, 1 << calcp);
> +	if (calcm > 16)
> +		calcm =3D 16;
> =20
> -	*freq =3D (parent_rate >> calcp) / calcm;
> +	*freq =3D DIV_ROUND_UP(parent_rate >> calcp, calcm);

While the two above seems harmless, this one concerns me a bit. Did
you test the various mod0 clock users and made sure that they were
still working as they used to?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWljJxAAoJEBx+YmzsjxAgzZoQAJ20hCeO/eZuw6OpSadhkCNy
SCPSix92WQue2sHGDdpM8ywYUce0afx++PQBAkMGgWxf3ZaE1XvY/QnBpA/fmmzj
O7LIsvZH/gAFADGfpNG5OfFz6B9XY6mT7239zNQZOF/3/jK5uhf7ymLnYHh1vX0X
TOS0jL4gVQJ8EFD79wWpJYFTeS7A/mwsJpybYEAQxIlCW4dcQUTjSXw+DAWbLJ01
SUjdsP73sAa682zbarF3Mf0Z8AwxhZV0sJXxEIzrFkJ/jFit5vSo+/IqE1T1qKpK
Oep6qQ528VNJ9BrXf0SYRaza1/s41A/+IuQl4US4LaqjTaeB/VoY1oT7zFIu93GR
D1eVRXfSZO7Ycfq25Wq1MtRsvYL5ZFd2FSUCB0wBQUWUn/epUunQkJOqD4/14qca
iu7fquglBj9UMdyNI6EyXnSLvAod1q7qzceU61NGxeEysqRJLLBwbqnSIGSkq8Zz
k8BYyAlPjB8KM1gzXintF2RCA/ho1lP9rDeFX8/52ZtmGUJ37zh7LrBgZP6kLz0/
NBeDDbXHE6YDUrNugrT1Ey0VKbUwYIv36KBpjwXHgoO5ICuAiqdmGs2y5QvZN7on
6l0dBi3k5Q9igzAKOIYWSZTb2QSQCj1uUeAvPdZ8CZavmL0TGXU2ZyyuEaoFVhSm
LceR2iErd1ACZ2UexyFk
=Bcap
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
