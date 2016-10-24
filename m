Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 24 Oct 2016 18:03:06 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 4/9] clk: sunxi-ng: Add minimums for all the relevant
 structures and clocks
Message-ID: <20161024160306.gahnf564jcmzenv3@lukather>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <a96b56fb7bda849e087b63a04ff76d1396c44d72.1476196031.git-series.maxime.ripard@free-electrons.com>
 <72be1b2a-e2db-7220-aa49-96d22860100c@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fe72uyvzsaelwtch"
In-Reply-To: <72be1b2a-e2db-7220-aa49-96d22860100c@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--fe72uyvzsaelwtch
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2016 at 11:57:11PM +0100, Andr=E9 Przywara wrote:
> Salut,
>=20
> On 11/10/16 15:28, Maxime Ripard wrote:
> > Modify the current clocks we have to be able to specify the minimum for
> > each clocks we support, just like we support the max.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu_mult.c |  7 ++++++-
> >  drivers/clk/sunxi-ng/ccu_nk.c   | 12 ++++++++----
> >  drivers/clk/sunxi-ng/ccu_nkm.c  | 18 ++++++++++++------
> >  drivers/clk/sunxi-ng/ccu_nkmp.c | 16 ++++++++++++----
> >  drivers/clk/sunxi-ng/ccu_nm.c   | 12 ++++++++----
> >  5 files changed, 46 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu=
_mult.c
> > index 32a1964439a2..6a02ffee5386 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mult.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mult.c
> > @@ -14,7 +14,7 @@
> >  #include "ccu_mult.h"
> > =20
> >  struct _ccu_mult {
> > -	unsigned long	mult, max;
> > +	unsigned long	mult, min, max;
> >  };
> > =20
> >  static void ccu_mult_find_best(unsigned long parent, unsigned long rat=
e,
> > @@ -23,6 +23,9 @@ static void ccu_mult_find_best(unsigned long parent, =
unsigned long rate,
> >  	int _mult;
> > =20
> >  	_mult =3D rate / parent;
> > +	if (_mult < mult->min)
> > +		_mult =3D mult->min;
> > +
> >  	if (_mult > mult->max)
> >  		_mult =3D mult->max;
> > =20
> > @@ -37,6 +40,7 @@ static unsigned long ccu_mult_round_rate(struct ccu_m=
ux_internal *mux,
> >  	struct ccu_mult *cm =3D data;
> >  	struct _ccu_mult _cm;
> > =20
> > +	_cm.min =3D 1;
> >  	_cm.max =3D 1 << cm->mult.width;
> >  	ccu_mult_find_best(parent_rate, rate, &_cm);
> > =20
> > @@ -101,6 +105,7 @@ static int ccu_mult_set_rate(struct clk_hw *hw, uns=
igned long rate,
> >  	ccu_mux_helper_adjust_parent_for_prediv(&cm->common, &cm->mux, -1,
> >  						&parent_rate);
> > =20
> > +	_cm.min =3D 1;
> >  	_cm.max =3D 1 << cm->mult.width;
> >  	ccu_mult_find_best(parent_rate, rate, &_cm);
> > =20
> > diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_n=
k.c
> > index e7e2e75618ef..a42d870ba0ef 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nk.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nk.c
> > @@ -14,8 +14,8 @@
> >  #include "ccu_nk.h"
> > =20
> >  struct _ccu_nk {
> > -	unsigned long	n, max_n;
> > -	unsigned long	k, max_k;
> > +	unsigned long	n, min_n, max_n;
> > +	unsigned long	k, min_k, max_k;
> >  };
> > =20
> >  static void ccu_nk_find_best(unsigned long parent, unsigned long rate,
> > @@ -25,8 +25,8 @@ static void ccu_nk_find_best(unsigned long parent, un=
signed long rate,
> >  	unsigned int best_k =3D 0, best_n =3D 0;
> >  	unsigned int _k, _n;
> > =20
> > -	for (_k =3D 1; _k <=3D nk->max_k; _k++) {
> > -		for (_n =3D 1; _n <=3D nk->max_n; _n++) {
> > +	for (_k =3D nk->min_k; _k <=3D nk->max_k; _k++) {
> > +		for (_n =3D nk->min_n; _n <=3D nk->max_n; _n++) {
> >  			unsigned long tmp_rate =3D parent * _n * _k;
> > =20
> >  			if (tmp_rate > rate)
> > @@ -97,7 +97,9 @@ static long ccu_nk_round_rate(struct clk_hw *hw, unsi=
gned long rate,
> >  	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
> >  		rate *=3D nk->fixed_post_div;
> > =20
> > +	_nk.min_n =3D 1;
> >  	_nk.max_n =3D 1 << nk->n.width;
> > +	_nk.min_k =3D 1;
> >  	_nk.max_k =3D 1 << nk->k.width;
> > =20
> >  	ccu_nk_find_best(*parent_rate, rate, &_nk);
> > @@ -120,7 +122,9 @@ static int ccu_nk_set_rate(struct clk_hw *hw, unsig=
ned long rate,
> >  	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
> >  		rate =3D rate * nk->fixed_post_div;
> > =20
> > +	_nk.min_n =3D 1;
> >  	_nk.max_n =3D 1 << nk->n.width;
> > +	_nk.min_k =3D 1;
> >  	_nk.max_k =3D 1 << nk->k.width;
> > =20
> >  	ccu_nk_find_best(parent_rate, rate, &_nk);
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_=
nkm.c
> > index 0b08d000eb38..b2a5fccf2f8c 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> > @@ -14,9 +14,9 @@
> >  #include "ccu_nkm.h"
> > =20
> >  struct _ccu_nkm {
> > -	unsigned long	n, max_n;
> > -	unsigned long	k, max_k;
> > -	unsigned long	m, max_m;
> > +	unsigned long	n, min_n, max_n;
> > +	unsigned long	k, min_k, max_k;
> > +	unsigned long	m, min_m, max_m;
> >  };
> > =20
> >  static void ccu_nkm_find_best(unsigned long parent, unsigned long rate,
> > @@ -26,9 +26,9 @@ static void ccu_nkm_find_best(unsigned long parent, u=
nsigned long rate,
> >  	unsigned long best_n =3D 0, best_k =3D 0, best_m =3D 0;
> >  	unsigned long _n, _k, _m;
> > =20
> > -	for (_k =3D 1; _k <=3D nkm->max_k; _k++) {
> > -		for (_n =3D 1; _n <=3D nkm->max_n; _n++) {
> > -			for (_m =3D 1; _n <=3D nkm->max_m; _m++) {
> > +	for (_k =3D nkm->min_k; _k <=3D nkm->max_k; _k++) {
> > +		for (_n =3D nkm->min_n; _n <=3D nkm->max_n; _n++) {
> > +			for (_m =3D nkm->min_m; _n <=3D nkm->max_m; _m++) {
>=20
> should be _m in the condition
>=20
> >  				unsigned long tmp_rate;
> > =20
> >  				tmp_rate =3D parent * _n * _k / _m;
> > @@ -100,8 +100,11 @@ static unsigned long ccu_nkm_round_rate(struct ccu=
_mux_internal *mux,
> >  	struct ccu_nkm *nkm =3D data;
> >  	struct _ccu_nkm _nkm;
> > =20
> > +	_nkm.min_n =3D 1;
> >  	_nkm.max_n =3D 1 << nkm->n.width;
> > +	_nkm.min_k =3D 1;
> >  	_nkm.max_k =3D 1 << nkm->k.width;
> > +	_nkm.min_m =3D 1;
> >  	_nkm.max_m =3D nkm->m.max ?: 1 << nkm->m.width;
> > =20
> >  	ccu_nkm_find_best(parent_rate, rate, &_nkm);
> > @@ -126,8 +129,11 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, uns=
igned long rate,
> >  	unsigned long flags;
> >  	u32 reg;
> > =20
> > +	_nkm.min_n =3D 1;
> >  	_nkm.max_n =3D 1 << nkm->n.width;
> > +	_nkm.min_k =3D 1;
> >  	_nkm.max_k =3D 1 << nkm->k.width;
> > +	_nkm.min_m =3D 1;
> >  	_nkm.max_m =3D nkm->m.max ?: 1 << nkm->m.width;
> > =20
> >  	ccu_nkm_find_best(parent_rate, rate, &_nkm);
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu=
_nkmp.c
> > index 4b457d8cce11..2c1398192e48 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> > @@ -27,10 +27,10 @@ static void ccu_nkmp_find_best(unsigned long parent=
, unsigned long rate,
> >  	unsigned long best_n =3D 0, best_k =3D 0, best_m =3D 0, best_p =3D 0;
> >  	unsigned long _n, _k, _m, _p;
> > =20
> > -	for (_k =3D 1; _k <=3D nkmp->max_k; _k++) {
> > -		for (_n =3D 1; _n <=3D nkm->max_n; _n++) {
> > -			for (_m =3D 1; _n <=3D nkm->max_m; _m++) {
> > -				for (_p =3D 1; _p <=3D nkmp->max_p; _p <<=3D 1) {
> > +	for (_k =3D nkmp->min_k; _k <=3D nkmp->max_k; _k++) {
> > +		for (_n =3D nkmp->min_n; _n <=3D nkmp->max_n; _n++) {
> > +			for (_m =3D nkmp->min_m; _n <=3D nkmp->max_m; _m++) {
>=20
> Same here: _m <=3D ...
>=20
> > +				for (_p =3D nkmp->min_p; _p <=3D nkmp->max_p; _p <<=3D 1) {
> >  					unsigned long tmp_rate;
> > =20
> >  					tmp_rate =3D parent * _n * _k / (_m * _p);
> > @@ -107,9 +107,13 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw,=
 unsigned long rate,
> >  	struct ccu_nkmp *nkmp =3D hw_to_ccu_nkmp(hw);
> >  	struct _ccu_nkmp _nkmp;
> > =20
> > +	_nkmp.min_n =3D 1;
> >  	_nkmp.max_n =3D 1 << nkmp->n.width;
> > +	_nkmp.min_k =3D 1;
> >  	_nkmp.max_k =3D 1 << nkmp->k.width;
> > +	_nkmp.min_m =3D 1;
> >  	_nkmp.max_m =3D nkmp->m.max ?: 1 << nkmp->m.width;
> > +	_nkmp.min_p =3D 1;
> >  	_nkmp.max_p =3D nkmp->p.max ?: 1 << ((1 << nkmp->p.width) - 1);
> > =20
> >  	ccu_nkmp_find_best(*parent_rate, rate, &_nkmp);
> > @@ -125,9 +129,13 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw, un=
signed long rate,
> >  	unsigned long flags;
> >  	u32 reg;
> > =20
> > +	_nkmp.min_n =3D 1;
> >  	_nkmp.max_n =3D 1 << nkmp->n.width;
> > +	_nkmp.min_k =3D 1;
> >  	_nkmp.max_k =3D 1 << nkmp->k.width;
> > +	_nkmp.min_m =3D 1;
> >  	_nkmp.max_m =3D nkmp->m.max ?: 1 << nkmp->m.width;
> > +	_nkmp.min_p =3D 1;
> >  	_nkmp.max_p =3D nkmp->p.max ?: 1 << ((1 << nkmp->p.width) - 1);
> > =20
> >  	ccu_nkmp_find_best(parent_rate, rate, &_nkmp);
> > diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_n=
m.c
> > index c6d652289320..2a190bc032a9 100644
> > --- a/drivers/clk/sunxi-ng/ccu_nm.c
> > +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> > @@ -15,8 +15,8 @@
> >  #include "ccu_nm.h"
> > =20
> >  struct _ccu_nm {
> > -	unsigned long	n, max_n;
> > -	unsigned long	m, max_m;
> > +	unsigned long	n, min_n, max_n;
> > +	unsigned long	m, min_m, max_m;
> >  };
> > =20
> >  static void ccu_nm_find_best(unsigned long parent, unsigned long rate,
> > @@ -26,8 +26,8 @@ static void ccu_nm_find_best(unsigned long parent, un=
signed long rate,
> >  	unsigned long best_n =3D 0, best_m =3D 0;
> >  	unsigned long _n, _m;
> > =20
> > -	for (_n =3D 1; _n <=3D nm->max_n; _n++) {
> > -		for (_m =3D 1; _n <=3D nm->max_m; _m++) {
> > +	for (_n =3D nm->min_n; _n <=3D nm->max_n; _n++) {
> > +		for (_m =3D nm->min_m; _n <=3D nm->max_m; _m++) {
>=20
> And here: _m <=3D ...
>=20
> Interestingly those typos were already in the code before.

Good catches, I've amended the commit in my branch (since I apparently
forgot to push...). Thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fe72uyvzsaelwtch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDjC6AAoJEBx+YmzsjxAg0cAP/2L6FU+l4G7DMdlSfJJxFQVX
bQWkUjbZibD2DDPIMf4Y2OBHPDes+z4bsMCbPxzSPkvWEL+IQ3osJBo10I47GUtb
iXiDi9nXoCMlgxYHhhJjPZg8uJHnulwDwr4WNLzQcbzr7QRh9rXL4+Jeez89UK9H
njfJuvfBepxOUKoPNXqi27rJSnL0vtAxl7m804z72PUv4GDK3Z2vLpfwWCpFOyv4
/bUSE48FG38Ge2dM1ZxroOL3Juu7f/uipGvzQHY6eQ9kKITFLctyP7qD9VGKIoUn
inymV3vrjt5CJys++P1btBOUns+q+I1DgbPR3TyNUbm9KwKzneutG8qtb2V5w1/e
DORC5zhN1XD4SGeiAKG1axs7DYKU1wB7u/Sl3YhrRpfZ7f040LkEG32SWB2P3waE
9dGLDgL4VJjkkQAOQacj7S6HmhQcvNAY9EYiKkO4CDnnNpdnYljKrKA168MW9Wh6
x+amSqDCW0dnoV3zRKDwIbPgM0Q/aF5o98e3bi9ramWP+sigNIL1XboEQLhnKWQ2
8907lRrzQWOgPOEdfKBkkJRB0227qFjHsnocrmMQDW72qgiQ9DLufyIoM3FQ8FQ+
mquXF/THSwOv3S3oHdoKjiiqopPWm2ROcFvyWVV3lRDCXCVYpLO6282IPuzyud+U
6gYXTSctGhdmdXLfXJu9
=jwWb
-----END PGP SIGNATURE-----

--fe72uyvzsaelwtch--
