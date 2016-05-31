Return-Path: <v1ron@mail.ru>
Date: Tue, 31 May 2016 21:38:54 +0300
From: Roman Volkov <v1ron@mail.ru>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd
 <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Roman
 Volkov <rvolkov@v1ros.org>, Tony Prisk <linux@prisktech.co.nz>
Subject: Re: [PATCH 2/2] clk/vt8500: Fix compilation warnings
Message-ID: <20160531213854.343e6129@v1ron-s7>
In-Reply-To: <4814911.mY88HjlURn@wuerfel>
References: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
	<1464120473-1808-3-git-send-email-v1ron@mail.ru>
	<4814911.mY88HjlURn@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

=D0=92 Tue, 31 May 2016 12:51:55 +0200
Arnd Bergmann <arnd@arndb.de> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On Tuesday, May 24, 2016 11:07:53 PM CEST Roman Volkov wrote:
> > From: Roman Volkov <rvolkov@v1ros.org>
> >=20
> > GCC 5.3.0 still throws the following warnings for functions
> > wm8750_find_pll_bits() and wm8850_find_pll_bits():
> >=20
> > warning: 'best_div2' may be used uninitialized in this function
> > warning: 'best_div1' may be used uninitialized in this function
> > warning: 'best_mul' may be used uninitialized in this function
> >=20
> > These warnings are false positives, the variables are controlled
> > by checking the value of the variable 'best_err' which is -1 by
> > default. It is safe to initialize all these variables to zero.
> >=20
> > Fixes: 090341b0a95d ("clk: vt8500: fix sign of possible PLL values")
> > Signed-off-by: Roman Volkov <rvolkov@v1ros.org> =20
>=20
> With gcc-5.3 and linux-4.7-rc1, they should be gone now (no longer
> warning about this with gcov enabled), but I still get them with
> gcc-4.9.
>=20
> > diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
> > index 77650f19a9b6..7c970d7c0a6a 100644
> > --- a/drivers/clk/clk-vt8500.c
> > +++ b/drivers/clk/clk-vt8500.c
> > @@ -461,7 +461,7 @@ static int wm8750_find_pll_bits(unsigned long
> > rate, unsigned long parent_rate, {
> >  	u32 mul;
> >  	int div1, div2;
> > -	u32 best_mul, best_div1, best_div2;
> > +	u32 best_mul =3D 0, best_div1 =3D 0, best_div2 =3D 0;
> >  	unsigned long tclk, rate_err, best_err;
> > =20
> >  	best_err =3D (unsigned long)-1;
> > @@ -513,7 +513,7 @@ static int wm8850_find_pll_bits(unsigned long
> > rate, unsigned long parent_rate, {
> >  	u32 mul;
> >  	int div1, div2;
> > -	u32 best_mul, best_div1, best_div2;
> > +	u32 best_mul =3D 0, best_div1 =3D 0, best_div2 =3D 0;
> >  	unsigned long tclk, rate_err, best_err;
> > =20
> >  	best_err =3D (unsigned long)-1;
> >  =20
>=20
> I see you only patch two instances but not the third one. I think
> we should do it consistently at least.
>=20
> Coincidentally, I've just done another patch for this myself, since
> it's the last gcc-4.9 warning we get in linux-4.7.
>=20
> My version below
>=20
> commit a38daeb34a2dc9d39ee1f153244cfcd83e865e0d
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Tue May 31 10:41:26 2016 +0200
>=20
> clk: vt8500: fix gcc-4.9 warnings
>=20
> This fixes some false positive warnings we get with older compiler
> versions:
>=20
> clk-vt8500.c: In function =E2=80=98wm8650_find_pll_bits=E2=80=99:
> clk-vt8500.c:430:12: =E2=80=98best_div2=E2=80=99 may be used uninitialize=
d in this
> function clk-vt8500.c:429:12: =E2=80=98best_div1=E2=80=99 may be used uni=
nitialized
> in this function clk-vt8500.c:428:14: =E2=80=98best_mul=E2=80=99 may be u=
sed
> uninitialized in this function clk-vt8500.c: In function
> =E2=80=98wm8750_find_pll_bits=E2=80=99: clk-vt8500.c:509:12: =E2=80=98bes=
t_div2=E2=80=99 may be used
> uninitialized in this function clk-vt8500.c:508:12: =E2=80=98best_div1=E2=
=80=99 may
> be used uninitialized in this function clk-vt8500.c:507:14:
> =E2=80=98best_mul=E2=80=99 may be used uninitialized in this function clk=
-vt8500.c:
> In function =E2=80=98wm8850_find_pll_bits=E2=80=99: clk-vt8500.c:560:12: =
=E2=80=98best_div2=E2=80=99
> may be used uninitialized in this function clk-vt8500.c:559:12:
> =E2=80=98best_div1=E2=80=99 may be used uninitialized in this function
> clk-vt8500.c:558:14: =E2=80=98best_mul=E2=80=99 may be used uninitialized=
 in this
> function
>=20
> As the local variables are only use for temporaries, we can just
> as well assign the final values directly, which also makes the
> code slightly shorter.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
> index b0f76a84f1e9..d5a3453970d0 100644
> --- a/drivers/clk/clk-vt8500.c
> +++ b/drivers/clk/clk-vt8500.c
> @@ -388,7 +388,6 @@ static int wm8650_find_pll_bits(unsigned long
> rate, unsigned long parent_rate, {
>  	u32 mul, div1;
>  	int div2;
> -	u32 best_mul, best_div1, best_div2;
>  	unsigned long tclk, rate_err, best_err;
> =20
>  	best_err =3D (unsigned long)-1;
> @@ -411,9 +410,9 @@ static int wm8650_find_pll_bits(unsigned long
> rate, unsigned long parent_rate,=20
>  				if (rate_err < best_err) {
>  					best_err =3D rate_err;
> -					best_mul =3D mul;
> -					best_div1 =3D div1;
> -					best_div2 =3D div2;
> +					*multiplier =3D mul;
> +					*divisor1 =3D div1;
> +					*divisor2 =3D div2;
>  				}
>  			}
> =20
> @@ -425,10 +424,6 @@ static int wm8650_find_pll_bits(unsigned long
> rate, unsigned long parent_rate, /* if we got here, it wasn't an
> exact match */ pr_warn("%s: requested rate %lu, found rate %lu\n",
> __func__, rate, rate - best_err);
> -	*multiplier =3D best_mul;
> -	*divisor1 =3D best_div1;
> -	*divisor2 =3D best_div2;
> -
>  	return 0;
>  }
> =20
> @@ -464,7 +459,6 @@ static int wm8750_find_pll_bits(unsigned long
> rate, unsigned long parent_rate, {
>  	u32 mul;
>  	int div1, div2;
> -	u32 best_mul, best_div1, best_div2;
>  	unsigned long tclk, rate_err, best_err;
> =20
>  	best_err =3D (unsigned long)-1;
> @@ -488,9 +482,9 @@ static int wm8750_find_pll_bits(unsigned long
> rate, unsigned long parent_rate,=20
>  				if (rate_err < best_err) {
>  					best_err =3D rate_err;
> -					best_mul =3D mul;
> -					best_div1 =3D div1;
> -					best_div2 =3D div2;
> +					*multiplier =3D mul;
> +					*divisor1 =3D div1;
> +					*divisor2 =3D div2;
>  				}
>  			}
> =20
> @@ -503,10 +497,7 @@ static int wm8750_find_pll_bits(unsigned long
> rate, unsigned long parent_rate, pr_warn("%s: requested rate %lu,
> found rate %lu\n", __func__, rate, rate - best_err);
> =20
> -	*filter =3D wm8750_get_filter(parent_rate, best_div1);
> -	*multiplier =3D best_mul;
> -	*divisor1 =3D best_div1;
> -	*divisor2 =3D best_div2;
> +	*filter =3D wm8750_get_filter(parent_rate, *divisor1);
> =20
>  	return 0;
>  }
> @@ -516,7 +507,6 @@ static int wm8850_find_pll_bits(unsigned long
> rate, unsigned long parent_rate, {
>  	u32 mul;
>  	int div1, div2;
> -	u32 best_mul, best_div1, best_div2;
>  	unsigned long tclk, rate_err, best_err;
> =20
>  	best_err =3D (unsigned long)-1;
> @@ -540,9 +530,9 @@ static int wm8850_find_pll_bits(unsigned long
> rate, unsigned long parent_rate,=20
>  				if (rate_err < best_err) {
>  					best_err =3D rate_err;
> -					best_mul =3D mul;
> -					best_div1 =3D div1;
> -					best_div2 =3D div2;
> +					*multiplier =3D mul;
> +					*divisor1 =3D div1;
> +					*divisor2 =3D div2;
>  				}
>  			}
> =20
> @@ -555,10 +545,6 @@ static int wm8850_find_pll_bits(unsigned long
> rate, unsigned long parent_rate, pr_warn("%s: requested rate %lu,
> found rate %lu\n", __func__, rate, rate - best_err);
> =20
> -	*multiplier =3D best_mul;
> -	*divisor1 =3D best_div1;
> -	*divisor2 =3D best_div2;
> -
>  	return 0;
>  }
> =20
>=20
>=20

Arnd, your version is fine for me. We may apply it instead.

As you can see, I attached another patch where the logic for WM8650 is
completely reworked. This patch also removes the warning, that is why
fixing the wm8650 function is not necessary.

What about the WM8650 enhancement? Can I apply it on top of your
changes?

Regards,
Roman
