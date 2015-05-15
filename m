Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 May 2015 09:41:07 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 5/8] clk: sunxi: mod1 clock support
Message-ID: <20150515074107.GP4004@lukather>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65RTFcKAYOsgJo0A8jPKRfuSvHyiX-7KG_qvjMy0uBbZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bvgsfYmVhxWy/2TA"
In-Reply-To: <CAGb2v65RTFcKAYOsgJo0A8jPKRfuSvHyiX-7KG_qvjMy0uBbZQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--bvgsfYmVhxWy/2TA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 09:43:19PM +0800, Chen-Yu Tsai wrote:
> On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > From: Emilio L=F3pez <emilio@elopez.com.ar>
> >
> > The module 1 type of clocks consist of a gate and a mux and are used on
> > the audio blocks to mux and gate the PLL2 outputs for AC97, IIS or
> > SPDIF. This commit adds support for them on the sunxi clock driver.
> >
> > Signed-off-by: Emilio L=F3pez <emilio@elopez.com.ar>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi/Makefile       |  1 +
> >  drivers/clk/sunxi/clk-a10-mod1.c | 85 ++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 86 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-a10-mod1.c
> >
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > index 6fa845e13067..960eeabc375f 100644
> > --- a/drivers/clk/sunxi/Makefile
> > +++ b/drivers/clk/sunxi/Makefile
> > @@ -5,6 +5,7 @@
> >  obj-y +=3D clk-sunxi.o clk-factors.o
> >  obj-y +=3D clk-a10-codec.o
> >  obj-y +=3D clk-a10-hosc.o
> > +obj-y +=3D clk-a10-mod1.o
> >  obj-y +=3D clk-a10-pll2.o
> >  obj-y +=3D clk-a20-gmac.o
> >  obj-y +=3D clk-mod0.o
> > diff --git a/drivers/clk/sunxi/clk-a10-mod1.c b/drivers/clk/sunxi/clk-a=
10-mod1.c
> > new file mode 100644
> > index 000000000000..6fc1b7a6de00
> > --- /dev/null
> > +++ b/drivers/clk/sunxi/clk-a10-mod1.c
> > @@ -0,0 +1,85 @@
> > +/*
> > + * Copyright 2013 Emilio L=F3pez
> > + *
> > + * Emilio L=F3pez <emilio@elopez.com.ar>
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
> > +#include <linux/clkdev.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +
> > +static DEFINE_SPINLOCK(mod1_lock);
> > +
> > +#define SUN4I_MOD1_ENABLE      31
> > +#define SUN4I_MOD1_MUX         16
> > +#define SUN4I_MOD1_MUX_WIDTH   2
> > +#define SUN4I_MOD1_MAX_PARENTS 4
> > +
> > +static void __init sun4i_mod1_clk_setup(struct device_node *node)
> > +{
> > +       struct clk *clk;
> > +       struct clk_mux *mux;
> > +       struct clk_gate *gate;
> > +       const char *parents[4];
> > +       const char *clk_name =3D node->name;
> > +       void __iomem *reg;
> > +       int i =3D 0;
> > +
> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +       if (IS_ERR(reg))
> > +               return;
> > +
> > +       mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
> > +       if (!mux)
> > +               goto err_unmap;
> > +
> > +       gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> > +       if (!gate)
> > +               goto err_free_mux;
> > +
> > +       of_property_read_string(node, "clock-output-names", &clk_name);
> > +       reg =3D of_iomap(node, 0);
>=20
> Is this left over from some change?

Yes :/

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--bvgsfYmVhxWy/2TA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVVaMTAAoJEBx+YmzsjxAg23sP/15ot6WpfmJxyhtF1BOMMPgW
E1mnxiIclgIDm/cV1FBap1Kmkz6xiufhLu/wxoaw+4dzAyLxBOyWgoMWE+Whj0Ec
KS4fhlL2CG4zetO41QVBpc0ef9D34JBLIrCVHZTydnr6A+olgprz7NjbAItKqX2R
cr9ckycZNC/8KciBlFqSBcbvz11bboGAKd0jjWwZendhmcU1umEq/TuhWjXmr2Kx
BG59Ji63XxjCJVS1fcPuHBz6klj3tcHSxQ0cf9wB0s+S+2yhd7OIBPrQp1n0N14h
gAdRc1iH9Qqdp3Cj3pskItavQhhBuKolKGUpCacwbkKR2lljN1VBOmthJkxPZx7J
c9RNcK30xBLoHz+B1IC/JT0YB9RTSQuoqtE08KwAcfl15VlKXA+i9BkH7T7NdZiX
ZmaybyyhBzmfmCYrgmlOJ6yX8Mfd8N1Vc5t4vTczznhgTCUTR4RqJ9PTUw4wo4DM
CLqxEPhJ7Wz11TvH1tl6UziXzEWwmnDwXLBFnu1vLs0EVqobCUX5fFjlOyZnNEP+
tke3iKw5M08oGnlqbAKhodb1nrsLK9gKc8wiI6YXAFB+oWritte3fwB8gj7dTSKv
lNuG79TfG3YY5Tv+6LEHgNUlfUS6h71FsXA1L6ROpq2en3aYKnJIb30DJN60n+cW
0/cb065DQjKW9IlFT10N
=nQYg
-----END PGP SIGNATURE-----

--bvgsfYmVhxWy/2TA--
