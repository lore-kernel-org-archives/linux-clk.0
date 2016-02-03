Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 Feb 2016 21:29:26 +0100
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
Subject: Re: [PATCH v2 07/26] clk: sunxi: Add TCON channel1 clock
Message-ID: <20160203202926.GE3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-8-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65_jsmiQ6DNCznFuQCcWxqs1N2fYJ-8OiUJ_BR+jf314w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ep0oHQY+/Gbo/zt0"
In-Reply-To: <CAGb2v65_jsmiQ6DNCznFuQCcWxqs1N2fYJ-8OiUJ_BR+jf314w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--ep0oHQY+/Gbo/zt0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 17, 2016 at 12:36:20AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Thu, Jan 14, 2016 at 11:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The TCON is a controller generating the timings to output videos signal=
s,
> > acting like both a CRTC and an encoder.
> >
> > It has two channels depending on the output, each channel being driven =
by
> > its own clock (and own clock controller).
> >
> > Add a driver for the channel 1 clock.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
> >  drivers/clk/sunxi/Makefile                        |   1 +
> >  drivers/clk/sunxi/clk-sun4i-tcon-ch1.c            | 154 ++++++++++++++=
++++++++
> >  3 files changed, 156 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
> >
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docume=
ntation/devicetree/bindings/clock/sunxi.txt
> > index bb9fb78dcff8..fe34fc56e803 100644
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> > @@ -67,6 +67,7 @@ Required properties:
> >         "allwinner,sun7i-a20-out-clk" - for the external output clocks
> >         "allwinner,sun7i-a20-gmac-clk" - for the GMAC clock module on A=
20/A31
> >         "allwinner,sun4i-a10-tcon-ch0-clk" - for the TCON channel 0 clo=
ck on the A10
> > +       "allwinner,sun4i-a10-tcon-ch1-clk" - for the TCON channel 1 clo=
ck on the A10
> >         "allwinner,sun4i-a10-usb-clk" - for usb gates + resets on A10 /=
 A20
> >         "allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
> >         "allwinner,sun6i-a31-usb-clk" - for usb gates + resets on A31
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > index 40c32ffd912c..0a20873cd103 100644
> > --- a/drivers/clk/sunxi/Makefile
> > +++ b/drivers/clk/sunxi/Makefile
> > @@ -12,6 +12,7 @@ obj-y +=3D clk-mod0.o
> >  obj-y +=3D clk-simple-gates.o
> >  obj-y +=3D clk-sun4i-display.o
> >  obj-y +=3D clk-sun4i-pll3.o
> > +obj-y +=3D clk-sun4i-tcon-ch1.o
> >  obj-y +=3D clk-sun8i-mbus.o
> >  obj-y +=3D clk-sun9i-core.o
> >  obj-y +=3D clk-sun9i-mmc.o
> > diff --git a/drivers/clk/sunxi/clk-sun4i-tcon-ch1.c b/drivers/clk/sunxi=
/clk-sun4i-tcon-ch1.c
> > new file mode 100644
> > index 000000000000..51ddc38821f7
> > --- /dev/null
> > +++ b/drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
> > @@ -0,0 +1,154 @@
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
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define SUN4I_TCON_CH1_SCLK_NAME_LEN   32
> > +
> > +#define SUN4I_A10_TCON_CH1_SCLK2_PARENTS       4
> > +
> > +#define SUN4I_A10_TCON_CH1_SCLK2_GATE_BIT      31
> > +#define SUN4I_A10_TCON_CH1_SCLK2_MUX_MASK      3
> > +#define SUN4I_A10_TCON_CH1_SCLK2_MUX_SHIFT     24
> > +#define SUN4I_A10_TCON_CH1_SCLK2_DIV_WIDTH     4
> > +#define SUN4I_A10_TCON_CH1_SCLK2_DIV_SHIFT     0
> > +
> > +#define SUN4I_A10_TCON_CH1_SCLK1_GATE_BIT      15
> > +#define SUN4I_A10_TCON_CH1_SCLK1_DIV_WIDTH     1
> > +#define SUN4I_A10_TCON_CH1_SCLK1_DIV_SHIFT     11
> > +
> > +static DEFINE_SPINLOCK(sun4i_a10_tcon_ch1_lock);
> > +
> > +static void __init sun4i_a10_tcon_ch1_setup(struct device_node *node)
> > +{
> > +       const char *sclk2_parents[SUN4I_A10_TCON_CH1_SCLK2_PARENTS];
> > +       const char *sclk1_name =3D node->name;
> > +       const char *sclk2_name;
> > +       struct clk_divider *sclk1_div, *sclk2_div;
> > +       struct clk_gate *sclk1_gate, *sclk2_gate;
> > +       struct clk_mux *sclk2_mux;
> > +       struct clk *sclk1, *sclk2;
> > +       void __iomem *reg;
> > +       int i, ret;
> > +
> > +       of_property_read_string(node, "clock-output-names",
> > +                               &sclk1_name);
> > +
> > +       sclk2_name =3D kasprintf(GFP_KERNEL, "%s2", sclk1_name);
> > +       if (!sclk2_name)
> > +               return;
> > +
> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +       if (IS_ERR(reg)) {
> > +               pr_err("%s: Could not map the clock registers\n", sclk2=
_name);
> > +               return;
> > +       }
> > +
> > +       for (i =3D 0; i < SUN4I_A10_TCON_CH1_SCLK2_PARENTS; i++)
> > +               sclk2_parents[i] =3D of_clk_get_parent_name(node, i);
>=20
> of_clk_parent_fill?

Indeed

>=20
> > +
> > +       sclk2_mux =3D kzalloc(sizeof(*sclk2_mux), GFP_KERNEL);
> > +       if (!sclk2_mux)
> > +               return;
> > +
> > +       sclk2_mux->reg =3D reg;
> > +       sclk2_mux->shift =3D SUN4I_A10_TCON_CH1_SCLK2_MUX_SHIFT;
> > +       sclk2_mux->mask =3D SUN4I_A10_TCON_CH1_SCLK2_MUX_MASK;
> > +       sclk2_mux->lock =3D &sun4i_a10_tcon_ch1_lock;
> > +
> > +       sclk2_gate =3D kzalloc(sizeof(*sclk2_gate), GFP_KERNEL);
> > +       if (!sclk2_gate)
> > +               goto free_sclk2_mux;
> > +
> > +       sclk2_gate->reg =3D reg;
> > +       sclk2_gate->bit_idx =3D SUN4I_A10_TCON_CH1_SCLK2_GATE_BIT;
> > +       sclk2_gate->lock =3D &sun4i_a10_tcon_ch1_lock;
> > +
> > +       sclk2_div =3D kzalloc(sizeof(*sclk2_div), GFP_KERNEL);
> > +       if (!sclk2_div)
> > +               goto free_sclk2_gate;
> > +
> > +       sclk2_div->reg =3D reg;
> > +       sclk2_div->shift =3D SUN4I_A10_TCON_CH1_SCLK2_DIV_SHIFT;
> > +       sclk2_div->width =3D SUN4I_A10_TCON_CH1_SCLK2_DIV_WIDTH;
> > +       sclk2_div->lock =3D &sun4i_a10_tcon_ch1_lock;
> > +
> > +       sclk2 =3D clk_register_composite(NULL, sclk2_name, sclk2_parent=
s,
> > +                                      SUN4I_A10_TCON_CH1_SCLK2_PARENTS,
> > +                                      &sclk2_mux->hw, &clk_mux_ops,   =
                                &
>=20
> > +                                      sclk2_div->hw, &clk_divider_ops,
>=20
> Placement of the "&" is very weird.

Hmm, right. I don't know what happened here, but it's obviously wrong :)

>=20
> > +                                      &sclk2_gate->hw, &clk_gate_ops,
> > +                                      0);
> > +       if (IS_ERR(sclk2)) {
> > +               pr_err("%s: Couldn't register the clock\n", sclk2_name);
> > +               goto free_sclk2_div;
> > +       }
> > +
> > +       sclk1_div =3D kzalloc(sizeof(*sclk1_div), GFP_KERNEL);
> > +       if (!sclk1_div)
> > +               goto free_sclk2;
> > +
> > +       sclk1_div->reg =3D reg;
> > +       sclk1_div->shift =3D SUN4I_A10_TCON_CH1_SCLK1_DIV_SHIFT;
> > +       sclk1_div->width =3D SUN4I_A10_TCON_CH1_SCLK1_DIV_WIDTH;
> > +       sclk1_div->lock =3D &sun4i_a10_tcon_ch1_lock;
> > +
> > +       sclk1_gate =3D kzalloc(sizeof(*sclk1_gate), GFP_KERNEL);
> > +       if (!sclk1_gate)
> > +               goto free_sclk1_mux;
> > +
> > +       sclk1_gate->reg =3D reg;
> > +       sclk1_gate->bit_idx =3D SUN4I_A10_TCON_CH1_SCLK1_GATE_BIT;
> > +       sclk1_gate->lock =3D &sun4i_a10_tcon_ch1_lock;
> > +
> > +       sclk1 =3D clk_register_composite(NULL, sclk1_name, &sclk2_name,=
 1,
> > +                                      NULL, NULL,
> > +                                      &sclk1_div->hw, &clk_divider_ops,
> > +                                      &sclk1_gate->hw, &clk_gate_ops,
> > +                                      0);
> > +       if (IS_ERR(sclk1)) {
> > +               pr_err("%s: Couldn't register the clock\n", sclk1_name);
> > +               goto free_sclk1_gate;
> > +       }
> > +
> > +       ret =3D of_clk_add_provider(node, of_clk_src_simple_get, sclk1);
> > +       if (WARN_ON(ret))
> > +               goto free_sclk1;
> > +
> > +       return;
> > +
> > +free_sclk1:
> > +       clk_unregister_composite(sclk1);
> > +free_sclk1_gate:
> > +       kfree(sclk1_gate);
> > +free_sclk1_mux:
> > +       kfree(sclk1_div);
> > +free_sclk2:
> > +       clk_unregister(sclk2);
> > +free_sclk2_div:
> > +       kfree(sclk2_div);
> > +free_sclk2_gate:
> > +       kfree(sclk2_gate);
> > +free_sclk2_mux:
> > +       kfree(sclk2_mux);
>=20
> Cleanup after of_io_request_and_map?

Indeed.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ep0oHQY+/Gbo/zt0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsmMmAAoJEBx+YmzsjxAghQ4P/RcLO7Ish8LRIAOBd/hxBjTY
G44g8QFlwOuWRFBEnhlzTt8bB4DmvV2ahmXpgpkIsbdvXZ9L5HfNM1ZQZ+387+M0
mLtOroofXYZ+74V3YU8oitMci33hjdgV5Xz6FS7FKQJIxJ13YGs49uct50GuFAeq
x8/fiHC8UVYQja+uLYDURzi5pih7gjQyOdaaQTmPjm1JD6IoxKige2xgmF9Mq4es
shpaKa3gLcMumvQahmPgPb4Dzdz8yZwzbCWaAnwwpA+EMcfHMD5OcaWdhsygzpQS
f6xPBaL3c5sRtbxQrpuhvyvjCaYXhFl7h89K475UcBna9xyNTbbN946gCc3c5156
eU4vYZPBL3rIiDUolJiZs2UdrpuVjgd8QG8L18Q9h5JjTRz9y0mTWtiYeLT5wwha
uz5Xyg3FCzu0jLSAl9VX+4b81ERcNPDq64zsC308YFJ6ZifWJmq4BBjKvjfroUAK
UvN32ne6yDsqon/H4zilnIfqQqMaH/iwOWM3aKNO8EsBso9v8jT0r6rPf7tVUl89
L2zApPTY9+06FNvUry0PpCQXknJ7BNiQhCFQNRiBc2un83h6mTfQg45Ds7WVzmJd
FVszbZscV7m4BwT4RS7MdgqFov1fMwpxP2zrCRHWgx/TTSNyjNChXiTmpDyO5c+O
sJoYNb3JvtiZ4V2lbmbf
=qBu4
-----END PGP SIGNATURE-----

--ep0oHQY+/Gbo/zt0--
