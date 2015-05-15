Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 May 2015 09:45:20 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/8] clk: sunxi: Add a driver for the PLL2
Message-ID: <20150515074520.GR4004@lukather>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-4-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64jVksA5rapnAPn9yefEeXnfFw5FwdnXPP0G9FvzWnVBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1GSL5ZULXUIqbbH1"
In-Reply-To: <CAGb2v64jVksA5rapnAPn9yefEeXnfFw5FwdnXPP0G9FvzWnVBg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--1GSL5ZULXUIqbbH1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 05:43:51PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The PLL2 on the A10 and later SoCs is the clock used for all the audio
> > related operations.
> >
> > This clock has a somewhat complex output tree, with three outputs (2X, =
4X
> > and 8X) with a fixed divider from the base clock, and an output (1X) wi=
th a
> > post divider.
> >
> > However, we can simplify things since the 1X divider can be fixed, and =
we
> > end up by having a base clock not exposed to any device (or at least
> > directly, since the 4X output doesn't have any divider), and 4 fixed
> > divider clocks that will be exposed.
> >
> > This clock seems to have been introduced, at least in this form, in the
> > revision B of the A10, but we don't have any information on the clock u=
sed
> > on the revision A.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi/Makefile                 |   1 +
> >  drivers/clk/sunxi/clk-a10-pll2.c           | 176 +++++++++++++++++++++=
++++++++
> >  include/dt-bindings/clock/sun4i-a10-pll2.h |  53 +++++++++
> >  3 files changed, 230 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-a10-pll2.c
> >  create mode 100644 include/dt-bindings/clock/sun4i-a10-pll2.h
> >
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > index 058f273d6154..eb36c38d4120 100644
> > --- a/drivers/clk/sunxi/Makefile
> > +++ b/drivers/clk/sunxi/Makefile
> > @@ -4,6 +4,7 @@
> >
> >  obj-y +=3D clk-sunxi.o clk-factors.o
> >  obj-y +=3D clk-a10-hosc.o
> > +obj-y +=3D clk-a10-pll2.o
> >  obj-y +=3D clk-a20-gmac.o
> >  obj-y +=3D clk-mod0.o
> >  obj-y +=3D clk-sun8i-mbus.o
> > diff --git a/drivers/clk/sunxi/clk-a10-pll2.c b/drivers/clk/sunxi/clk-a=
10-pll2.c
> > new file mode 100644
> > index 000000000000..4d0369626dba
> > --- /dev/null
> > +++ b/drivers/clk/sunxi/clk-a10-pll2.c
> > @@ -0,0 +1,176 @@
> > +/*
> > + * Copyright 2013 Emilio L=F3pez
> > + * Emilio L=F3pez <emilio@elopez.com.ar>
> > + *
> > + * Copyright 2015 Maxime Ripard
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/slab.h>
> > +
> > +#include <dt-bindings/clock/sun4i-a10-pll2.h>
> > +
> > +#include "clk-factors.h"
> > +
> > +#define SUN4I_PLL2_ENABLE              31
> > +#define SUN4I_PLL2_POST_DIV            26
> > +#define SUN4I_PLL2_POST_DIV_MASK       0xF
> > +#define SUN4I_PLL2_N                   8
> > +#define SUN4I_PLL2_N_MASK              0x7F
> > +#define SUN4I_PLL2_PRE_DIV             0
> > +#define SUN4I_PLL2_PRE_DIV_MASK                0x1F
> > +
> > +#define SUN4I_PLL2_POST_DIV_VALUE      21
> > +#define SUN4I_PLL2_PRE_DIV_VALUE       4
> > +
> > +#define SUN4I_PLL2_OUTPUTS             4
> > +
> > +static void sun4i_a10_get_pll2_base_factors(u32 *freq, u32 parent_rate,
> > +                                           u8 *n, u8 *k, u8 *m, u8 *p)
> > +{
> > +       /*
> > +        * Normalize the frequency to a multiple of (24 MHz / Fixed
> > +        * PRE-DIV)
> > +        */
> > +       *freq =3D round_down(*freq, parent_rate / SUN4I_PLL2_PRE_DIV_VA=
LUE);
> > +
> > +       /* We were called to round the frequency, we can return */
> > +       if (!n)
> > +               return;
> > +
> > +       *n =3D *freq * SUN4I_PLL2_PRE_DIV_VALUE / parent_rate;
> > +
> > +       /*
> > +        * Even though the pre-divider can be changed, we don't really
> > +        * care and we can just fix it to 4.
> > +        */
> > +       *m =3D SUN4I_PLL2_PRE_DIV_VALUE;
> > +}
> > +
> > +static struct clk_factors_config sun4i_a10_pll2_base_config =3D {
> > +       .mshift =3D SUN4I_PLL2_PRE_DIV,
> > +       .mwidth =3D 5,
> > +       .nshift =3D SUN4I_PLL2_N,
> > +       .nwidth =3D 7,
> > +
> > +       .m_zero =3D 1,
> > +       .n_zero =3D 1,
> > +};
> > +
> > +static const struct factors_data sun4i_a10_pll2_base_data __initconst =
=3D {
> > +       .enable =3D SUN4I_PLL2_ENABLE,
> > +       .table =3D &sun4i_a10_pll2_base_config,
> > +       .getter =3D sun4i_a10_get_pll2_base_factors,
> > +       .name =3D "pll2-base",
> > +};
> > +
> > +static DEFINE_SPINLOCK(sun4i_a10_pll2_lock);
> > +
> > +static void __init sun4i_pll2_setup(struct device_node *node)
> > +{
> > +       const char *clk_name =3D node->name, *parent;
> > +       struct clk_onecell_data *clk_data;
> > +       struct clk **clks, *base_clk;
> > +       void __iomem *reg;
> > +       u32 val;
> > +
> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +       if (IS_ERR(reg))
> > +               return;
> > +
> > +       clk_data =3D kzalloc(sizeof(*clk_data), GFP_KERNEL);
> > +       if (!clk_data)
> > +               goto err_unmap;
> > +
> > +       clks =3D kcalloc(SUN4I_PLL2_OUTPUTS, sizeof(struct clk *), GFP_=
KERNEL);
> > +       if (!clks)
> > +               goto err_free_data;
> > +
> > +       base_clk =3D sunxi_factors_register(node, &sun4i_a10_pll2_base_=
data,
> > +                                         &sun4i_a10_pll2_lock, reg);
>=20
> Why aren't you using divs_clk for this? It seems right for the job.

As far as I know, divs_clk can only handle a single divider, and not
two subsequent dividers like this one uses.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--1GSL5ZULXUIqbbH1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVVaQQAAoJEBx+YmzsjxAgLzsQAIUkGm4MORhNYEJziRKZrdvx
6GZYv6V5CmoLce76Z+7J1u1wws5SuqYl8mspC6si6tu4H6wG/Pn+XCqrkwc2X2bb
ul5QVwU+7I8s/8T0zetXH7wTs87a8FQHD6MunB1KTiexcavo/XAB0s1nqflnWppg
52faXERjHA7+frXK4VZTHFmnmHKu7ZZXRAVtpYaIHdCt/P/HFE7vG6A3gGmNNZPZ
6KjcPW2JW077z/R2X1JVCS2G6AH4j+2WTfwTk8GcmT2+ZnJmfVI8r0sg7JWp+LHC
m0Jm6u99bbzi/9eKCzg30Pe7HeC1L8UBnOo/55Su35a1tMfLI1OJXUposo5fEqBD
V6qZ2yK2VyywDkr4n7h0G6fmsSfFg+PppMX1gX1shszhCGcTgdzAlumYmarL57Mz
gK0vodJkGu7CXDMfUfcJIvdQaZIWIemiviIimiHNbAS6ZnqKOKNCOI1w9FJeHa/d
Pb3Tm/brFI3wYfpcKLkVO7YF/MbyRTtki393DF9W5WyltjWlqbKb90Oc0V6FNXHg
2nxOQ3CtcHkLeQJnDy1/qk9k5WoTHgPlVNbNpyRDic41NVLJHDdvqih0KfamkUqZ
Nstj9ln+nnI3d9xcF4mWEzv/3Ed53BUlG4s/pcO68OLHXMaxezzS6vtYeG6kDSYE
BhQHO28xQlZtCZAfBYY7
=0aba
-----END PGP SIGNATURE-----

--1GSL5ZULXUIqbbH1--
