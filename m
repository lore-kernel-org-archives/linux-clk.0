Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 22 May 2016 21:20:58 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 05/16] clk: sunxi-ng: Add mux clock support
Message-ID: <20160522192058.GY27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66FShuDB_YH37x+VymjrpD+Q9OA2D=b3=MyaLkfFySvmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ejxBj3YzjByOPzh0"
In-Reply-To: <CAGb2v66FShuDB_YH37x+VymjrpD+Q9OA2D=b3=MyaLkfFySvmQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--ejxBj3YzjByOPzh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 22, 2016 at 12:18:26AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 9, 2016 at 4:01 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some clocks in the Allwinner SoCs clocks unit are just muxes.
> >
> > However, those muxes might also be found in some other complicated cloc=
ks
> > that would benefit from the code in there to deal with "advanced" featu=
res,
> > like pre-dividers.
> >
> > Introduce a set of helpers to reduce the code duplication in such cases.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile  |   1 +
> >  drivers/clk/sunxi-ng/ccu_mux.c | 187 +++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/sunxi-ng/ccu_mux.h |  80 +++++++++++++++++-
> >  3 files changed, 264 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_mux.c
> >
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index fc01127b3b45..aa5c411ff8ea 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -3,3 +3,4 @@ obj-y +=3D ccu_reset.o
> >
> >  obj-y +=3D ccu_fixed_factor.o
> >  obj-y +=3D ccu_gate.o
> > +obj-y +=3D ccu_mux.o
> > diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_=
mux.c
> > new file mode 100644
> > index 000000000000..cb54a8931de3
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> > @@ -0,0 +1,187 @@
> > +/*
> > + * Copyright (C) 2016 Maxime Ripard
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_gate.h"
> > +#include "ccu_mux.h"
> > +
> > +void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
> > +                                            struct ccu_mux_internal *c=
m,
> > +                                            int parent_index,
> > +                                            unsigned long *parent_rate)
> > +{
> > +       u8 prediv =3D 1;
> > +       u32 reg;
> > +
> > +       if (!((common->features & CCU_FEATURE_FIXED_PREDIV) ||
> > +             (common->features & CCU_FEATURE_VARIABLE_PREDIV)))
> > +               return;
> > +
> > +       reg =3D readl(common->base + common->reg);
> > +       if (parent_index < 0) {
> > +               parent_index =3D reg >> cm->shift;
> > +               parent_index &=3D (1 << cm->width) - 1;
> > +       }
> > +
> > +       if (common->features & CCU_FEATURE_FIXED_PREDIV)
> > +               if (parent_index =3D=3D cm->fixed_prediv.index)
> > +                       prediv =3D cm->fixed_prediv.div;
> > +
> > +       if (common->features & CCU_FEATURE_VARIABLE_PREDIV)
> > +               if (parent_index =3D=3D cm->variable_prediv.index) {
> > +                       u8 div;
> > +
> > +                       div =3D reg >> cm->variable_prediv.shift;
> > +                       div &=3D (1 << cm->variable_prediv.width) - 1;
> > +                       prediv =3D div + 1;
> > +               }
> > +
> > +       *parent_rate =3D *parent_rate / prediv;
> > +}
> > +
> > +int ccu_mux_helper_determine_rate(struct ccu_common *common,
> > +                                 struct ccu_mux_internal *cm,
> > +                                 struct clk_rate_request *req,
> > +                                 unsigned long (*round)(struct ccu_mux=
_internal *,
> > +                                                        unsigned long,
> > +                                                        unsigned long,
> > +                                                        void *),
> > +                                 void *data)
> > +{
> > +       unsigned long best_parent_rate =3D 0, best_rate =3D 0;
> > +       struct clk_hw *best_parent, *hw =3D &common->hw;
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
> > +               unsigned long tmp_rate, parent_rate;
> > +               struct clk_hw *parent;
> > +
> > +               parent =3D clk_hw_get_parent_by_index(hw, i);
> > +               if (!parent)
> > +                       continue;
> > +
> > +               parent_rate =3D clk_hw_get_rate(parent);
>=20
> Using clk-mux.c as a reference, you should honor CLK_SET_RATE_PARENT here.
>=20
> > +               ccu_mux_helper_adjust_parent_for_prediv(common, cm, i,
> > +                                                       &parent_rate);
>=20
> ccu_mux_helper_adjust_parent_for_prediv can modify parent_rate. You
> should probably save a copy...
>=20
> > +
> > +               tmp_rate =3D round(cm, clk_hw_get_rate(parent), req->ra=
te, data);
> > +               if (tmp_rate =3D=3D req->rate) {
> > +                       best_parent =3D parent;
> > +                       best_parent_rate =3D parent_rate;
>=20
> ... to assign to best_parent_rate. The returned best_parent_rate is used
> to change the parent clock rate. This happens if CLK_SET_RATE_PARENT is s=
et.
> The CCF doesn't know about our predivs, so you should pass back the origi=
nal
> rate, not the one after the prediv.
>
> I suppose you didn't run into problems as CLK_SET_RATE_PARENT was not used
> anywhere?

Probably, yes. You do have a good point, but I'm a bit unconfident
merging some code that hasn't been tested, and will probably end up
broken anyway. This is always something that we can add later.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ejxBj3YzjByOPzh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXQgaaAAoJEBx+YmzsjxAguLQQALDTZqTnpdJLg3LPffvp5S7Y
2ZPJr97NXa4yqm+TfQ3IVmjm2FfNN6aptG55+VqWsEzGo8Pl4EQhFXpayOjVys3j
vcnBvb38TlkaY/CuZxQdg6DhtzIqWxBElXjkHWMb8t2CSJ2c0BcM07xL08D+YRSc
JdkGjBwzEb+h6n7VcScIq29SCfjT44TFSfAmfuNngDtTJIwkUT0Nn1Shd0a0cgmv
7zDzQVGypVfxsoEmwT9ucGRIoTxfUPfJz5G5TWb+vTE6S1dcTkRRgDL2xabllW6a
q/RxC++f8fshc9G8bkiXETub9rX8tIZ5YaBYguFos7s1AtfCIlgX05tSUT020qpK
uWZ85q4CL9dCrgLL+rCmuj5vBcA/B37ZdfCJnXLcKg3xIKn53/r8PfnnYAGTghh7
0hsqHs9G0Lif67I6VHVAZw2MrqhMR0DUeT6fAJqiMAxVhI8b5T0BK29qkH2vBM0w
RVpPkrfwhknQh93YRgMNBmeZdafD+5I9B2vGbZyylKXLT3QHJFdncAggPPB+NqX3
b+V4AbRAyKg4BhmHS8jHfE/SkyOcRKUMyfViJ6LboSfJxvde4J9C7Rw7jxTpDnJH
7IqEsAxxRCki6mzlZc/TEMfe+PTx3OQ/o1srInFfEb7l38CAfyiPgGsABFqJmtug
rHARIfGvm06a3IKj5Hs1
=geBW
-----END PGP SIGNATURE-----

--ejxBj3YzjByOPzh0--
