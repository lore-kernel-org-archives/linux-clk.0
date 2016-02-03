Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 Feb 2016 21:18:34 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 05/26] clk: sunxi: Add display and TCON0 clocks driver
Message-ID: <20160203201834.GC3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65=EVTQo8KFMECVR4=94i0rt0V1H07hWKyXShSZxGYKEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
In-Reply-To: <CAGb2v65=EVTQo8KFMECVR4=94i0rt0V1H07hWKyXShSZxGYKEQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 16, 2016 at 11:29:41PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Thu, Jan 14, 2016 at 11:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The A10 SoCs and its relatives has a special clock controller to drive =
the
> > display engines (both frontend and backend), that have a lot in common =
with
> > the clock to drive the first TCON channel.
> >
> > Add a driver to support both.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +
> >  drivers/clk/sunxi/Makefile                        |   1 +
> >  drivers/clk/sunxi/clk-sun4i-display.c             | 241 ++++++++++++++=
++++++++
> >  3 files changed, 244 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-sun4i-display.c
> >
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docume=
ntation/devicetree/bindings/clock/sunxi.txt
> > index 8a47b77abfca..5360554a7d3f 100644
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> > @@ -55,6 +55,7 @@ Required properties:
> >         "allwinner,sun9i-a80-apb1-gates-clk" - for the APB1 gates on A80
> >         "allwinner,sun6i-a31-apb2-gates-clk" - for the APB2 gates on A31
> >         "allwinner,sun8i-a23-apb2-gates-clk" - for the APB2 gates on A23
> > +       "allwinner,sun4i-a10-display-clk" - for the display clocks on t=
he A10
> >         "allwinner,sun5i-a13-mbus-clk" - for the MBUS clock on A13
> >         "allwinner,sun4i-a10-mmc-clk" - for the MMC clock
> >         "allwinner,sun9i-a80-mmc-clk" - for mmc module clocks on A80
> > @@ -64,6 +65,7 @@ Required properties:
> >         "allwinner,sun8i-a23-mbus-clk" - for the MBUS clock on A23
> >         "allwinner,sun7i-a20-out-clk" - for the external output clocks
> >         "allwinner,sun7i-a20-gmac-clk" - for the GMAC clock module on A=
20/A31
> > +       "allwinner,sun4i-a10-tcon-ch0-clk" - for the TCON channel 0 clo=
ck on the A10
> >         "allwinner,sun4i-a10-usb-clk" - for usb gates + resets on A10 /=
 A20
> >         "allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
> >         "allwinner,sun6i-a31-usb-clk" - for usb gates + resets on A31
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > index cb4c299214ce..a991cd8ca509 100644
> > --- a/drivers/clk/sunxi/Makefile
> > +++ b/drivers/clk/sunxi/Makefile
> > @@ -10,6 +10,7 @@ obj-y +=3D clk-a10-pll2.o
> >  obj-y +=3D clk-a20-gmac.o
> >  obj-y +=3D clk-mod0.o
> >  obj-y +=3D clk-simple-gates.o
> > +obj-y +=3D clk-sun4i-display.o
> >  obj-y +=3D clk-sun8i-mbus.o
> >  obj-y +=3D clk-sun9i-core.o
> >  obj-y +=3D clk-sun9i-mmc.o
> > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c b/drivers/clk/sunxi/=
clk-sun4i-display.c
> > new file mode 100644
> > index 000000000000..9dc6894f0934
> > --- /dev/null
> > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > @@ -0,0 +1,241 @@
> > +/*
> > + * Copyright 2015 Maxime Ripard
> > + *
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
> > +#include <linux/kernel.h>
> > +#include <linux/of_address.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +struct sun4i_a10_display_clk_data {
> > +       bool    has_div;
> > +       bool    has_rst;
> > +       u8      parents;
> > +
> > +       u8      offset_en;
> > +       u8      offset_div;
> > +       u8      offset_mux;
> > +       u8      offset_rst;
> > +
> > +       u8      width_div;
> > +       u8      width_mux;
> > +};
> > +
> > +struct reset_data {
> > +       void __iomem                    *reg;
> > +       spinlock_t                      *lock;
> > +       struct reset_controller_dev     rcdev;
> > +       u8                              offset;
> > +};
> > +
> > +static DEFINE_SPINLOCK(sun4i_a10_display_lock);
> > +
> > +static inline struct reset_data *rcdev_to_reset_data(struct reset_cont=
roller_dev *rcdev)
> > +{
> > +       return container_of(rcdev, struct reset_data, rcdev);
> > +};
> > +
> > +static int sun4i_a10_display_assert(struct reset_controller_dev *rcdev,
> > +                                   unsigned long id)
> > +{
> > +       struct reset_data *data =3D rcdev_to_reset_data(rcdev);
> > +       unsigned long flags;
> > +       u32 reg;
> > +
> > +       spin_lock_irqsave(data->lock, flags);
> > +
> > +       reg =3D readl(data->reg);
> > +       writel(reg & ~BIT(data->offset), data->reg);
> > +
> > +       spin_unlock_irqrestore(data->lock, flags);
> > +
> > +       return 0;
> > +}
> > +
> > +static int sun4i_a10_display_deassert(struct reset_controller_dev *rcd=
ev,
> > +                                     unsigned long id)
> > +{
> > +       struct reset_data *data =3D rcdev_to_reset_data(rcdev);
> > +       unsigned long flags;
> > +       u32 reg;
> > +
> > +       spin_lock_irqsave(data->lock, flags);
> > +
> > +       reg =3D readl(data->reg);
> > +       writel(reg | BIT(data->offset), data->reg);
> > +
> > +       spin_unlock_irqrestore(data->lock, flags);
> > +
> > +       return 0;
> > +}
> > +
> > +static int sun4i_a10_display_status(struct reset_controller_dev *rcdev,
> > +                                   unsigned long id)
> > +{
> > +       struct reset_data *data =3D rcdev_to_reset_data(rcdev);
> > +
> > +       return !(readl(data->reg) & BIT(data->offset));
> > +}
> > +
> > +static const struct reset_control_ops sun4i_a10_display_reset_ops =3D {
> > +       .assert         =3D sun4i_a10_display_assert,
> > +       .deassert       =3D sun4i_a10_display_deassert,
> > +       .status         =3D sun4i_a10_display_status,
> > +};
> > +
> > +static int sun4i_a10_display_reset_xlate(struct reset_controller_dev *=
rcdev,
> > +                                        const struct of_phandle_args *=
spec)
> > +{
> > +       /* We only have a single reset signal */
> > +       return 0;
> > +}
> > +
> > +static void __init sun4i_a10_display_init(struct device_node *node,
> > +                                         struct sun4i_a10_display_clk_=
data *data)
> > +{
> > +       const char *parents[data->parents];
> > +       const char *clk_name =3D node->name;
> > +       struct reset_data *reset_data;
> > +       struct clk_divider *div =3D NULL;
> > +       struct clk_gate *gate;
> > +       struct clk_mux *mux;
> > +       void __iomem *reg;
> > +       struct clk *clk;
> > +       int i;
> > +
> > +       of_property_read_string(node, "clock-output-names", &clk_name);
> > +
> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +       if (IS_ERR(reg)) {
> > +               pr_err("%s: Could not map the clock registers\n", clk_n=
ame);
> > +               return;
> > +       }
> > +
> > +       of_clk_parent_fill(node, parents, data->parents);
>=20
> What if someone uses an incorrect DT that has less parents described?

Then here be dragons ? :)

I'll fix that.

> > +
> > +       mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
> > +       if (!mux)
> > +               return;
> > +
> > +       mux->reg =3D reg;
> > +       mux->shift =3D data->offset_mux;
> > +       mux->mask =3D (1 << data->width_mux) - 1;
> > +       mux->lock =3D &sun4i_a10_display_lock;
> > +
> > +       gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> > +       if (!gate)
> > +               goto free_mux;
> > +
> > +       gate->reg =3D reg;
> > +       gate->bit_idx =3D data->offset_en;
> > +       gate->lock =3D &sun4i_a10_display_lock;
> > +
> > +       if (data->has_div) {
> > +               div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> > +               if (!div)
> > +                       goto free_gate;
> > +
> > +               div->reg =3D reg;
> > +               div->shift =3D data->offset_div;
> > +               div->width =3D data->width_div;
> > +               div->lock =3D &sun4i_a10_display_lock;
> > +       }
> > +
> > +       clk =3D clk_register_composite(NULL, clk_name,
> > +                                    parents, data->parents,
> > +                                    &mux->hw, &clk_mux_ops,
> > +                                    data->has_div ? &div->hw : NULL,
> > +                                    data->has_div ? &clk_divider_ops :=
 NULL,
> > +                                    &gate->hw, &clk_gate_ops,
> > +                                    0);
> > +       if (IS_ERR(clk)) {
> > +               pr_err("%s: Couldn't register the clock\n", clk_name);
> > +               goto free_div;
> > +       }
> > +
> > +       of_clk_add_provider(node, of_clk_src_simple_get, clk);
>=20
> Check for errors?

Yep.

> > +
> > +       if (!data->has_rst)
> > +               return;
> > +
> > +       reset_data =3D kzalloc(sizeof(*reset_data), GFP_KERNEL);
> > +       if (!reset_data)
> > +               goto free_clk;
> > +
> > +       reset_data->reg =3D reg;
> > +       reset_data->offset =3D data->offset_rst;
> > +       reset_data->lock =3D &sun4i_a10_display_lock;
> > +       reset_data->rcdev.nr_resets =3D 1;
> > +       reset_data->rcdev.ops =3D &sun4i_a10_display_reset_ops;
> > +       reset_data->rcdev.of_node =3D node;
> > +       reset_data->rcdev.of_reset_n_cells =3D 0;
> > +       reset_data->rcdev.of_xlate =3D &sun4i_a10_display_reset_xlate;
> > +
> > +       if (reset_controller_register(&reset_data->rcdev)) {
> > +               pr_err("%s: Couldn't register the reset controller\n",
> > +                      clk_name);
> > +               goto free_reset;
> > +       }
> > +
> > +       return;
> > +
> > +free_reset:
> > +       kfree(reset_data);
> > +free_clk:
> > +       clk_unregister(clk);
> > +free_div:
> > +       if (data->has_div)
> > +               kfree(div);
> > +free_gate:
> > +       kfree(gate);
> > +free_mux:
> > +       kfree(mux);
>=20
> Cleanup after of_io_request_and_map()?

Hmm, indeed...

>=20
> > +}
> > +
> > +static struct sun4i_a10_display_clk_data sun4i_a10_tcon_ch0_data =3D {
> > +       .has_rst        =3D true,
> > +       .parents        =3D 4,
> > +       .offset_en      =3D 31,
> > +       .offset_rst     =3D 29,
>=20
> My datasheets (A10 v1.5, A20 v1.4), say bit 30 for LCD0 ch0 reset.
>=20
> A13 and R8 manuals do not list this clock, but A10s does, which has
> bit 30 for LCD reset and bit 29 for TV encoder reset.
>=20
> I suggest changing has_rst to int, and for sun5i variant, have
> has_rst =3D 2, reset_cells =3D 1, for 2 separate reset controls.
> The tcon and tv encoder bits of the DTSI should be updated as
> well.
>=20
> I assume your tests work because U-boot already de-asserted the
> resets (both if you're using composite output).

You're right, I'll fix it as you suggested.

> > +       .offset_mux     =3D 24,
> > +       .width_mux      =3D 2,
> > +};
> > +
> > +static void __init sun4i_a10_tcon_ch0_setup(struct device_node *node)
> > +{
> > +       sun4i_a10_display_init(node, &sun4i_a10_tcon_ch0_data);
> > +}
> > +CLK_OF_DECLARE(sun4i_a10_tcon_ch0, "allwinner,sun4i-a10-tcon-ch0-clk",
> > +              sun4i_a10_tcon_ch0_setup);
> > +
> > +static struct sun4i_a10_display_clk_data sun4i_a10_display_data =3D {
> > +       .has_div        =3D true,
>=20
> Missing .has_rst =3D true.

Indeed

> > +       .parents        =3D 3,
> > +       .offset_en      =3D 31,
> > +       .offset_rst     =3D 30,
> > +       .offset_mux     =3D 24,
> > +       .offset_div     =3D 0,
>=20
> This is already implied.

Because the structure would already by initialised to 0?

Yeah, true, but I wanted to make that explicit that the div offset is
actually 0, and not something that got forgotten.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsmCaAAoJEBx+YmzsjxAgG+8QAIXwQVmkpCZa3yEkpbjfF9F+
W0sKit9pl38XFAcdvVPld09QF+Bwjnldm39KfIbkjNioByZl6VFFBOohAFwnnppy
RMwggchZ9hVwTqVbu+F4+3ER3sUOFuM1KaF5ICD90o7rRa6AtQHSxYfU7a4dmf6U
4xt1TW/hKL6jOPTi08cQ8dqs+LOoni472W7sdwcG1rdjofWMvEIMZAQev6FEzgih
f00Lf9+2mxNDNPjBxzgDdzvV+3iQF9mH0xJ8s9sneSr/T03lRpTKIP2RlIX/3HBJ
Eupn9MGEXU+V52F7LKZh5ONCSjZjmZ8V3hDXJuHZrJdloCvY7JBrwsi60XZqUHsD
m5+0cwBsnPTitJJ0yxqJsLUEiVFQ/rRyaBadZH+yZonZ0TbPuGj/wQpZHbXUT+pM
KM82OQQmwQf86GBsEx2zeMG2qp12Ubudq8kvcO5ZiwgCBgEI8RE4Fgm8m/l00fZ4
HOTeEDGD+CvUZTOidg8bzy/xFBn8fCjSfRxZb/Xi3g5B/CQU6JPHbWNMfJsBnV6B
3fnnrFI2BfljR6w1bgUt8D+NM4kgyMQxPMmspCsVTAog7hKQ9Dswubq9kupsmlZV
DfmbqQqwMfC2byOTOJs6JEf4OJ1cNr4DO2Sl7UFGpySVLORZx0pJHxFUlonCisRd
bVldPCkE+M3rNEP6YceU
=wf58
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
