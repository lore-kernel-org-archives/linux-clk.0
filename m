Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 20 Oct 2016 19:30:53 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 5/9] clk: sunxi-ng: Implement minimum for multipliers
Message-ID: <20161020173053.bz2jgy6jgy43own5@lukather>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <dc2601d4f35d9921ec50ed443cdd413f699fa270.1476196031.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67Mo41RHiWd=9+ggcDDmWJ2Miyo17Nni3p3mmAzoJng3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="44ivtlr2o67s4exo"
In-Reply-To: <CAGb2v67Mo41RHiWd=9+ggcDDmWJ2Miyo17Nni3p3mmAzoJng3w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--44ivtlr2o67s4exo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 11:06:21PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 11, 2016 at 10:28 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Allow the CCU drivers to specify a multiplier for their clocks.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu_mult.c |  2 +-
> >  drivers/clk/sunxi-ng/ccu_mult.h | 13 +++++++++----
> >  drivers/clk/sunxi-ng/ccu_nk.c   |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nkm.c  |  8 ++++----
> >  drivers/clk/sunxi-ng/ccu_nkmp.c |  4 ++--
> >  drivers/clk/sunxi-ng/ccu_nm.c   |  2 +-
> >  6 files changed, 21 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu=
_mult.c
> > index 6a02ffee5386..678b6cb49f01 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mult.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mult.c
> > @@ -105,7 +105,7 @@ static int ccu_mult_set_rate(struct clk_hw *hw, uns=
igned long rate,
> >         ccu_mux_helper_adjust_parent_for_prediv(&cm->common, &cm->mux, =
-1,
> >                                                 &parent_rate);
> >
> > -       _cm.min =3D 1;
> > +       _cm.min =3D cm->mult.min;
> >         _cm.max =3D 1 << cm->mult.width;
> >         ccu_mult_find_best(parent_rate, rate, &_cm);
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mult.h b/drivers/clk/sunxi-ng/ccu=
_mult.h
> > index 113780b7558e..c1a2134bdc71 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mult.h
> > +++ b/drivers/clk/sunxi-ng/ccu_mult.h
> > @@ -7,14 +7,19 @@
> >  struct ccu_mult_internal {
> >         u8      shift;
> >         u8      width;
> > +       u8      min;
> >  };
> >
> > -#define _SUNXI_CCU_MULT(_shift, _width)                \
> > -       {                                       \
> > -               .shift  =3D _shift,               \
> > -               .width  =3D _width,               \
> > +#define _SUNXI_CCU_MULT_MIN(_shift, _width, _min)      \
> > +       {                                               \
> > +               .shift  =3D _shift,                       \
> > +               .width  =3D _width,                       \
> > +               .min    =3D _min,                         \
> >         }
> >
> > +#define _SUNXI_CCU_MULT(_shift, _width)                \
> > +       _SUNXI_CCU_MULT_MIN(_shift, _width, 1)
> > +
> >  struct ccu_mult {
> >         u32                     enable;
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_n=
k.c
> > index a42d870ba0ef..eaf0fdf78d2b 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nk.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nk.c
> > @@ -97,9 +97,9 @@ static long ccu_nk_round_rate(struct clk_hw *hw, unsi=
gned long rate,
> >         if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
> >                 rate *=3D nk->fixed_post_div;
> >
> > -       _nk.min_n =3D 1;
> > +       _nk.min_n =3D nk->n.min;
> >         _nk.max_n =3D 1 << nk->n.width;
> > -       _nk.min_k =3D 1;
> > +       _nk.min_k =3D nk->k.min;
> >         _nk.max_k =3D 1 << nk->k.width;
> >
> >         ccu_nk_find_best(*parent_rate, rate, &_nk);
> > @@ -122,9 +122,9 @@ static int ccu_nk_set_rate(struct clk_hw *hw, unsig=
ned long rate,
> >         if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
> >                 rate =3D rate * nk->fixed_post_div;
> >
> > -       _nk.min_n =3D 1;
> > +       _nk.min_n =3D nk->n.min;
> >         _nk.max_n =3D 1 << nk->n.width;
> > -       _nk.min_k =3D 1;
> > +       _nk.min_k =3D nk->k.min;
> >         _nk.max_k =3D 1 << nk->k.width;
> >
> >         ccu_nk_find_best(parent_rate, rate, &_nk);
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_=
nkm.c
> > index b2a5fccf2f8c..715b49211ddb 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> > @@ -100,9 +100,9 @@ static unsigned long ccu_nkm_round_rate(struct ccu_=
mux_internal *mux,
> >         struct ccu_nkm *nkm =3D data;
> >         struct _ccu_nkm _nkm;
> >
> > -       _nkm.min_n =3D 1;
> > +       _nkm.min_n =3D nkm->n.min;
> >         _nkm.max_n =3D 1 << nkm->n.width;
> > -       _nkm.min_k =3D 1;
> > +       _nkm.min_n =3D nkm->k.min;
>=20
> Typo here.
>=20
> >         _nkm.max_k =3D 1 << nkm->k.width;
> >         _nkm.min_m =3D 1;
> >         _nkm.max_m =3D nkm->m.max ?: 1 << nkm->m.width;
> > @@ -129,9 +129,9 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, unsi=
gned long rate,
> >         unsigned long flags;
> >         u32 reg;
> >
> > -       _nkm.min_n =3D 1;
> > +       _nkm.min_n =3D nkm->n.min;
> >         _nkm.max_n =3D 1 << nkm->n.width;
> > -       _nkm.min_k =3D 1;
> > +       _nkm.min_n =3D nkm->k.min;
>=20
> And here.
>=20
> >         _nkm.max_k =3D 1 << nkm->k.width;
> >         _nkm.min_m =3D 1;
> >         _nkm.max_m =3D nkm->m.max ?: 1 << nkm->m.width;
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu=
_nkmp.c
> > index 2c1398192e48..7968e0bac5db 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> > @@ -107,9 +107,9 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, =
unsigned long rate,
> >         struct ccu_nkmp *nkmp =3D hw_to_ccu_nkmp(hw);
> >         struct _ccu_nkmp _nkmp;
> >
> > -       _nkmp.min_n =3D 1;
> > +       _nkmp.min_n =3D nkmp->n.min;
> >         _nkmp.max_n =3D 1 << nkmp->n.width;
> > -       _nkmp.min_k =3D 1;
> > +       _nkmp.min_n =3D nkmp->k.min;
>=20
> And here.
>=20
> >         _nkmp.max_k =3D 1 << nkmp->k.width;
> >         _nkmp.min_m =3D 1;
> >         _nkmp.max_m =3D nkmp->m.max ?: 1 << nkmp->m.width;
> > diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_n=
m.c
> > index 2a190bc032a9..b1f3f0e8899d 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nm.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> > @@ -93,7 +93,7 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsi=
gned long rate,
> >         struct ccu_nm *nm =3D hw_to_ccu_nm(hw);
> >         struct _ccu_nm _nm;
> >
> > -       _nm.min_n =3D 1;
> > +       _nm.min_n =3D nm->n.min;
> >         _nm.max_n =3D 1 << nm->n.width;
> >         _nm.min_m =3D 1;
> >         _nm.max_m =3D nm->m.max ?: 1 << nm->m.width;
> > --
> > git-series 0.8.10
>=20
> Otherwise,
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Fixed and applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--44ivtlr2o67s4exo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCP9MAAoJEBx+YmzsjxAg5IIQALH/yQUQHRExoi7wJZ80loln
oCnW/T4VaPXdQC4mqy9oWZfRWVgY7S4t+MT0fNm1dPcsRiqq42i5I3V/AqVhosWQ
JYwjXyzEB1BHHObJq0OblWkspRYnvaFKTmubO9BVYsIKXyp9sk1z3oYzDLbnzwPm
ohfqx+n9SO9ylKjQOpHQvP01n7kyaEhfbT/3/1iu+Kb/sMObir1aMMc00yskV6ks
wiPpXOBdleocsJj+ptBC/BNLfkiIkHecsFB2r0NHe1D4r9O+B3rKmXlplYzAL/cb
GBzXZK7A9CPCIHZFL9PV+UzcmImznP/5XXtlfVcnmWB5qtHJjpYoIBvF7Wpr5rAv
nwIq1g7GYkvu9bBwznmne23AzVigwsoBvKmLRvBULp8BAuvy5n3g4o6T3zGV+srZ
jBoVB8yAHd3GgEptGTWMNc9VVwYkhcX25qgj/fhRVm/TZTxqSIQqMWx286T1STJG
+IxJOWIR1VEQS9p97r6XY8OEPu4ZVlPrmoDORPYqvKwDyLqoo1hgrM3/XaW0GRZS
LBOgV/xjTgwihmD3l62kHbvJtBGFd0MkNIWgTlzChmLxcyQVau73Q5hgI70KPETf
6cas3yRLyzm6Q+AlprZsIWVKD4BETk5DYjjClpszdQ9T145xblxKmLHVFLYWBk0D
tvF+6gZsFMfI7GMN47OD
=H2dZ
-----END PGP SIGNATURE-----

--44ivtlr2o67s4exo--
