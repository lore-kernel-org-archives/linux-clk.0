Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 May 2015 16:44:39 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/8] clk: sunxi: Add a driver for the PLL2
Message-ID: <20150515144439.GZ4004@lukather>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-4-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64jVksA5rapnAPn9yefEeXnfFw5FwdnXPP0G9FvzWnVBg@mail.gmail.com>
 <20150515074520.GR4004@lukather>
 <CAGb2v64gbY1n4kVBc55hm=jwC3N-eKjWXCgEJr-+J6tYsD7sQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qicHaSekiYEWE95x"
In-Reply-To: <CAGb2v64gbY1n4kVBc55hm=jwC3N-eKjWXCgEJr-+J6tYsD7sQA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--qicHaSekiYEWE95x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2015 at 05:15:32PM +0800, Chen-Yu Tsai wrote:
> On Fri, May 15, 2015 at 3:45 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, May 14, 2015 at 05:43:51PM +0800, Chen-Yu Tsai wrote:
> >> Hi,
> >>
> >> On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > The PLL2 on the A10 and later SoCs is the clock used for all the aud=
io
> >> > related operations.
> >> >
> >> > This clock has a somewhat complex output tree, with three outputs (2=
X, 4X
> >> > and 8X) with a fixed divider from the base clock, and an output (1X)=
 with a
> >> > post divider.
> >> >
> >> > However, we can simplify things since the 1X divider can be fixed, a=
nd we
> >> > end up by having a base clock not exposed to any device (or at least
> >> > directly, since the 4X output doesn't have any divider), and 4 fixed
> >> > divider clocks that will be exposed.
> >> >
> >> > This clock seems to have been introduced, at least in this form, in =
the
> >> > revision B of the A10, but we don't have any information on the cloc=
k used
> >> > on the revision A.
> >> >
> >> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> > ---
> >> >  drivers/clk/sunxi/Makefile                 |   1 +
> >> >  drivers/clk/sunxi/clk-a10-pll2.c           | 176 ++++++++++++++++++=
+++++++++++
> >> >  include/dt-bindings/clock/sun4i-a10-pll2.h |  53 +++++++++
> >> >  3 files changed, 230 insertions(+)
> >> >  create mode 100644 drivers/clk/sunxi/clk-a10-pll2.c
> >> >  create mode 100644 include/dt-bindings/clock/sun4i-a10-pll2.h
> >> >
> >> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> >> > index 058f273d6154..eb36c38d4120 100644
> >> > --- a/drivers/clk/sunxi/Makefile
> >> > +++ b/drivers/clk/sunxi/Makefile
> >> > @@ -4,6 +4,7 @@
> >> >
> >> >  obj-y +=3D clk-sunxi.o clk-factors.o
> >> >  obj-y +=3D clk-a10-hosc.o
> >> > +obj-y +=3D clk-a10-pll2.o
> >> >  obj-y +=3D clk-a20-gmac.o
> >> >  obj-y +=3D clk-mod0.o
> >> >  obj-y +=3D clk-sun8i-mbus.o
> >> > diff --git a/drivers/clk/sunxi/clk-a10-pll2.c b/drivers/clk/sunxi/cl=
k-a10-pll2.c
> >> > new file mode 100644
> >> > index 000000000000..4d0369626dba
> >> > --- /dev/null
> >> > +++ b/drivers/clk/sunxi/clk-a10-pll2.c
> >> > @@ -0,0 +1,176 @@
> >> > +/*
> >> > + * Copyright 2013 Emilio L=F3pez
> >> > + * Emilio L=F3pez <emilio@elopez.com.ar>
> >> > + *
> >> > + * Copyright 2015 Maxime Ripard
> >> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> >> > + *
> >> > + * This program is free software; you can redistribute it and/or mo=
dify
> >> > + * it under the terms of the GNU General Public License as publishe=
d by
> >> > + * the Free Software Foundation; either version 2 of the License, or
> >> > + * (at your option) any later version.
> >> > + *
> >> > + * This program is distributed in the hope that it will be useful,
> >> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> > + * GNU General Public License for more details.
> >> > + */
> >> > +
> >> > +#include <linux/clk-provider.h>
> >> > +#include <linux/of.h>
> >> > +#include <linux/of_address.h>
> >> > +#include <linux/slab.h>
> >> > +
> >> > +#include <dt-bindings/clock/sun4i-a10-pll2.h>
> >> > +
> >> > +#include "clk-factors.h"
> >> > +
> >> > +#define SUN4I_PLL2_ENABLE              31
> >> > +#define SUN4I_PLL2_POST_DIV            26
> >> > +#define SUN4I_PLL2_POST_DIV_MASK       0xF
> >> > +#define SUN4I_PLL2_N                   8
> >> > +#define SUN4I_PLL2_N_MASK              0x7F
> >> > +#define SUN4I_PLL2_PRE_DIV             0
> >> > +#define SUN4I_PLL2_PRE_DIV_MASK                0x1F
> >> > +
> >> > +#define SUN4I_PLL2_POST_DIV_VALUE      21
>=20
> Another thing:
>=20
> This says 21, which obviously exceeds the mask defined above,
> but the comment in the section below (in the original code)
> says 4. I assume the comment was right, based on the user
> manual?
>=20
> Maybe it should be swapped with SUN4I_PLL2_PRE_DIV_VALUE?
> I get PRE_DIV =3D 21 for generating a clock close to 22.5792 MHz.

You're right. POST_DIV_VALUE and PRE_DIV_VALUE are inverted....

I wonder how that was even working...

> Seems AC97 might need another frequency, but the manual isn't
> clear, and we can handle it when we add AC97 anyway.

I'm not even sure there's a board out there with an AC97 codec...

>=20
> >> > +#define SUN4I_PLL2_PRE_DIV_VALUE       4
> >> > +
> >> > +#define SUN4I_PLL2_OUTPUTS             4
> >> > +
> >> > +static void sun4i_a10_get_pll2_base_factors(u32 *freq, u32 parent_r=
ate,
> >> > +                                           u8 *n, u8 *k, u8 *m, u8 =
*p)
> >> > +{
> >> > +       /*
> >> > +        * Normalize the frequency to a multiple of (24 MHz / Fixed
> >> > +        * PRE-DIV)
> >> > +        */
> >> > +       *freq =3D round_down(*freq, parent_rate / SUN4I_PLL2_PRE_DIV=
_VALUE);
> >> > +
> >> > +       /* We were called to round the frequency, we can return */
> >> > +       if (!n)
> >> > +               return;
> >> > +
> >> > +       *n =3D *freq * SUN4I_PLL2_PRE_DIV_VALUE / parent_rate;
> >> > +
> >> > +       /*
> >> > +        * Even though the pre-divider can be changed, we don't real=
ly
> >> > +        * care and we can just fix it to 4.
> >> > +        */
> >> > +       *m =3D SUN4I_PLL2_PRE_DIV_VALUE;
> >> > +}
> >> > +
> >> > +static struct clk_factors_config sun4i_a10_pll2_base_config =3D {
> >> > +       .mshift =3D SUN4I_PLL2_PRE_DIV,
> >> > +       .mwidth =3D 5,
> >> > +       .nshift =3D SUN4I_PLL2_N,
> >> > +       .nwidth =3D 7,
> >> > +
> >> > +       .m_zero =3D 1,
> >> > +       .n_zero =3D 1,
> >> > +};
> >> > +
> >> > +static const struct factors_data sun4i_a10_pll2_base_data __initcon=
st =3D {
> >> > +       .enable =3D SUN4I_PLL2_ENABLE,
> >> > +       .table =3D &sun4i_a10_pll2_base_config,
> >> > +       .getter =3D sun4i_a10_get_pll2_base_factors,
> >> > +       .name =3D "pll2-base",
> >> > +};
> >> > +
> >> > +static DEFINE_SPINLOCK(sun4i_a10_pll2_lock);
> >> > +
> >> > +static void __init sun4i_pll2_setup(struct device_node *node)
> >> > +{
> >> > +       const char *clk_name =3D node->name, *parent;
> >> > +       struct clk_onecell_data *clk_data;
> >> > +       struct clk **clks, *base_clk;
> >> > +       void __iomem *reg;
> >> > +       u32 val;
> >> > +
> >> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(nod=
e));
> >> > +       if (IS_ERR(reg))
> >> > +               return;
> >> > +
> >> > +       clk_data =3D kzalloc(sizeof(*clk_data), GFP_KERNEL);
> >> > +       if (!clk_data)
> >> > +               goto err_unmap;
> >> > +
> >> > +       clks =3D kcalloc(SUN4I_PLL2_OUTPUTS, sizeof(struct clk *), G=
FP_KERNEL);
> >> > +       if (!clks)
> >> > +               goto err_free_data;
> >> > +
> >> > +       base_clk =3D sunxi_factors_register(node, &sun4i_a10_pll2_ba=
se_data,
> >> > +                                         &sun4i_a10_pll2_lock, reg);
> >>
> >> Why aren't you using divs_clk for this? It seems right for the job.
> >
> > As far as I know, divs_clk can only handle a single divider, and not
> > two subsequent dividers like this one uses.
>=20
> I thought we were setting the post divider to 4 so the outputs match
> the names? Maybe we could get it in as is (with the above comment
> addressed), and refactor it later. I'm still stuck on factors_clk
> stuff....

We are, but the pre-div is considered as the M factor, and the N
factor as N, so we can't really consider it as a single divider.

Thinking a bit more about this, what we could do though, is splitting
the pll2-base clock in half, one that would expose a single divider
using clk-divider for the pre-divider, then a factor clock for the N
factor, and then multiple dividers for the post-divider and other
outputs.

I wonder if that could not even be made that way for all the factors
clock. That would reduce the needed logic in the drivers a lot.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qicHaSekiYEWE95x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVVgZXAAoJEBx+YmzsjxAgsS4QAK6BufDdwBVJnFe86SQHtmNd
3MWHk1Xc3nnMGSxJiP4pzneVrQPjmLkF7W1SNbo5XU2jKRqzhpC6sgCsryyG4Y16
kVnH7AF1a4HwztEk8sH2VwzYKjWOYawEdzwW+D+pSGzoFc2Py3Dv7eEeqFDo10Dr
RuBRZW4kpXo5bZCC28Vl8lK67CTvGJkYc5SkawBEVaM6Q1xJRSh4m/bDOQBY5dSf
hprKVTIbMetBRlj8TOk8hoUh7CuiKouQH7BvxBbxhrVX1vrLF+ZYDQsVNfMzaE9N
Cu1sjKLdrPhluzQVFuVWZwc+RwuQbLCkMm/qky5syH5ajnbh65EvuLViCgYOjeHT
EDOO3a7BVU932LA+fwCIoqtb2WoFvGcOEuU2lj2q0mugnQ/MdvNWm3aUMEI5p2Kw
WZuxQ/vbUQ/Sz6puqsT1OWBHKfjBCFGNvwtd/FdtEjblosHumLVfzzLWh1h6y8Ir
+dVopLWwcrYV0IUiau02mqvxD5BFd8hAi+Nt0ycU1oo8FCse6W+7e21B2kFr8RAy
htlMMm6hGhdlYykTpfc7xYZyEpvaTzUTCbq2NfjPNyYeSkaJFm7Mjtrr/jzJ4RVI
ftnCU5F4dIMKXHkllNSL3Xj755HsDmuK/trhHwmCXSpf20lFXgT8OWlmLrG+8n5D
mJU5fZU92AKs34xkPL2O
=PnWF
-----END PGP SIGNATURE-----

--qicHaSekiYEWE95x--
