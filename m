Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 21 Jan 2017 23:13:09 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/7] clk: sunxi-ng: Implement multiplier maximum
Message-ID: <20170121221309.rf6tpidpipoe2tfj@lukather>
References: <cover.5df5469d9c7a6233e225a875dca513a03b05e871.1484897383.git-series.maxime.ripard@free-electrons.com>
 <8e38914c705c32f3f0daa4a16979cbb9cae5e689.1484897383.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65p9rQv+AQqTVs=wtJbesQNF36YNdeTSSGp=c9SSyjViw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vnyqbkxsuimbhk3"
In-Reply-To: <CAGb2v65p9rQv+AQqTVs=wtJbesQNF36YNdeTSSGp=c9SSyjViw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--5vnyqbkxsuimbhk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 21, 2017 at 09:27:42AM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 20, 2017 at 3:29 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu_mult.c | 16 +++++++++++++---
> >  drivers/clk/sunxi-ng/ccu_mult.h | 10 ++++++----
> >  drivers/clk/sunxi-ng/ccu_nk.c   |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nkm.c  |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nkmp.c |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nm.c   |  4 ++--
> >  6 files changed, 33 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu=
_mult.c
> > index 8b7ee7baa85b..8724c01171b1 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mult.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mult.c
> > @@ -40,8 +40,13 @@ static unsigned long ccu_mult_round_rate(struct ccu_=
mux_internal *mux,
> >         struct ccu_mult *cm =3D data;
> >         struct _ccu_mult _cm;
> >
> > -       _cm.min =3D 1;
> > -       _cm.max =3D 1 << cm->mult.width;
> > +       _cm.min =3D cm->mult.min;
>=20
> This particular line should probably be in a separate patch fixing
> commit 2beaa601c849 ("clk: sunxi-ng: Implement minimum for multipliers")?
> It kind of sticks out, and doesn't match the commit message.

Indeed (also because there's no commit message, I'll fix that.)

> > +
> > +       if (cm->mult.max)
> > +               _cm.max =3D cm->mult.max;
> > +       else
> > +               _cm.max =3D (1 << cm->mult.width) + cm->mult.offset - 1;
> > +
> >         ccu_mult_find_best(parent_rate, rate, &_cm);
> >
> >         return parent_rate * _cm.mult;
> > @@ -114,7 +119,12 @@ static int ccu_mult_set_rate(struct clk_hw *hw, un=
signed long rate,
> >                                                 &parent_rate);
> >
> >         _cm.min =3D cm->mult.min;
> > -       _cm.max =3D 1 << cm->mult.width;
> > +
> > +       if (cm->mult.max)
> > +               _cm.max =3D cm->mult.max;
> > +       else
> > +               _cm.max =3D (1 << cm->mult.width) + cm->mult.offset - 1;
>=20
> The changes look good. Thinking about this more, you might need to
> adjust the default minimum to account for the offset as well? At
> the moment it doesn't really affect us, as the offset is either
> 1 or 0, which means a minimum of 1 is equally good. But leaving
> a potential error in there doesn't feel right.

I'm not sure we should really care, I'm not aware of any SoC that
would have such a clock, either in the "old" or "new" ones. I'm not
sure we should fix that isn't broken.

> Said change would be against patch 2, so
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>=20
> for this patch once the first comment is addressed.

I'll do that change and respin the serie, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5vnyqbkxsuimbhk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYg9zwAAoJEBx+YmzsjxAg2qwP/RZaqwnQ8iWBgbBS4uJP7Ptp
kV+eTA8fk+PmykJqRO0TKKVo/+Y2f9uwh7DVgm2ixpX7BZucZWpljNfNlKbJ7kmE
RySGAtuf2RsBTBza8t7hnYHRHHTQoRPL0gi5ZRx7Vml46iMVNEmGWgIzC6MLUO+O
Q/u6rTAjORJ2f0Akp3/B0d046a4rUkkqmuotogCIXOOjGGspU1zCSHyfRZdqwabl
4wQgeAlFO9DWPL66DjgxevgCeYmzme0YLeID7tFirX+hlNKRQ0wgaODzwLicG6BN
9IKI3qQ/Ov//8QhYWg08bc7gF/Xtp+opHCg8jnj4BDlNEUv6N1nkFyojcD2MGXEr
if4B+t61ykrTiuVbZM5EJH72EqdWG7R+Ys797UIbtI2VroLVEt6LPenzLukjARDd
XP2+A0rk7HuL5VwoRqHMqGWfIYnqDHZfrcOmtlI0ANlBvo0LS8IfQWEGQNfpEX6i
zlvyt1lSTrK4d3kqWQT+Rb6MFGxj3RVnUXUBZ0Kw+GrgOWGfG+NSljObQsWXmPMl
NnUeLQ+sRDqrRrmSCk4zGIXLDjDZm8JAhRVftw4jeWS/nbN5+T8NMS9dRVFoR2Af
VfQYirKsgN/m7B8HV7p/X2oJMKjl0mn2nsZTqfVrpvdFQl1pHPdNP4PUELZQfyOc
Cjfl3ZNiv7E1JiUe2u/m
=QkEp
-----END PGP SIGNATURE-----

--5vnyqbkxsuimbhk3--
