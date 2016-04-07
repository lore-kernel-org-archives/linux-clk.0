Return-Path: <yassinjaffer@gmail.com>
Date: Thu, 7 Apr 2016 04:55:42 -0700 (PDT)
From: Yassin Jaffer <yassinjaffer@gmail.com>
To: linux-sunxi <linux-sunxi@googlegroups.com>
Cc: dev@linux-sunxi.org, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, wens@csie.org, emilio@elopez.com.ar,
	mturquette@baylibre.com, sboyd@codeaurora.org, hdegoede@redhat.com,
	patchesrdh@mveas.com, jenskuske@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <ed04cdff-ef29-4fdf-811a-d8084ca86e4a@googlegroups.com>
In-Reply-To: <20160318192535.GR30977@lukather>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
 <20160318192535.GR30977@lukather>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors Interface) module
 clock driver for sun[457]i
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_1562_1348376410.1460030142312"
List-ID: <linux-clk.vger.kernel.org>

------=_Part_1562_1348376410.1460030142312
Content-Type: multipart/alternative;
	boundary="----=_Part_1563_2068990815.1460030142313"

------=_Part_1563_2068990815.1460030142313
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime

I had a look at your display clock driver.The only issue I have is setting 
the clock parents. A simple mask wont do it. 
I guess using table is the only way. The CSI is only clock which is using 
irregular parents mux. The remaining clocks
including VE, can be based on your display clock driver. 
Thanx.

On Monday, March 21, 2016 at 7:42:48 PM UTC+11, Maxime Ripard wrote:
>
> Hi Yassin, 
>
> On Thu, Mar 17, 2016 at 07:43:42PM +1100, yassin...@gmail.com 
> <javascript:> wrote: 
> > From: Yassin Jaffer <yassin...@gmail.com <javascript:>> 
> > 
> > This patch adds a composite clock type consisting of 
> > a clock gate, mux, configurable dividers, and a reset control. 
> > 
> > Signed-off-by: Yassin Jaffer <yassin...@gmail.com <javascript:>> 
> > --- 
> >  Documentation/devicetree/bindings/clock/sunxi.txt |   1 + 
> >  drivers/clk/sunxi/Makefile                        |   1 + 
> >  drivers/clk/sunxi/clk-a10-csi.c                   | 188 
> ++++++++++++++++++++++ 
> >  3 files changed, 190 insertions(+) 
> >  create mode 100644 drivers/clk/sunxi/clk-a10-csi.c 
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt 
> b/Documentation/devicetree/bindings/clock/sunxi.txt 
> > index e59f57b..c3826f7 100644 
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt 
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt 
> > @@ -77,6 +77,7 @@ Required properties: 
> >          "allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on 
> A80 
> >          "allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets 
> on A80 
> >          "allwinner,sun4i-a10-ve-clk" - for the Video Engine clock 
> > +        "allwinner,sun4i-a10-csi-clk" - for the CSI module 
> >   
> >  Required properties for all clocks: 
> >  - reg : shall be the control register address for the clock. 
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile 
> > index 3fd7901..42ce752 100644 
> > --- a/drivers/clk/sunxi/Makefile 
> > +++ b/drivers/clk/sunxi/Makefile 
> > @@ -7,6 +7,7 @@ obj-y += clk-a10-codec.o 
> >  obj-y += clk-a10-hosc.o 
> >  obj-y += clk-a10-mod1.o 
> >  obj-y += clk-a10-pll2.o 
> > +obj-y += clk-a10-csi.o 
> >  obj-y += clk-a10-ve.o 
> >  obj-y += clk-a20-gmac.o 
> >  obj-y += clk-mod0.o 
> > diff --git a/drivers/clk/sunxi/clk-a10-csi.c 
> b/drivers/clk/sunxi/clk-a10-csi.c 
> > new file mode 100644 
> > index 0000000..f17d206 
> > --- /dev/null 
> > +++ b/drivers/clk/sunxi/clk-a10-csi.c 
> > @@ -0,0 +1,188 @@ 
> > +/* 
> > + * Copyright 2016 Yassin Jaffer 
> > + * 
> > + * Yassin Jaffer <yassin...@gmail.com <javascript:>> 
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
> > +#include <linux/of_address.h> 
> > +#include <linux/reset-controller.h> 
> > +#include <linux/slab.h> 
> > +#include <linux/spinlock.h> 
> > + 
> > +static DEFINE_SPINLOCK(sun4i_csi_lock); 
> > + 
> > +#define SUN4I_CSI_PARENTS       5 
> > +#define SUN4I_CSI_GATE_BIT      31 
> > +#define SUN4I_CSI_RESET_BIT     30 
> > +#define SUN4I_CSI_MUX_SHIFT     24 
> > +#define SUN4I_CSI_DIV_WIDTH     5 
> > +#define SUN4I_CSI_DIV_SHIFT     0 
> > + 
> > +static u32 sun4i_csi_mux_table[SUN4I_CSI_PARENTS] = { 
> > +        0x0, 
> > +        0x1, 
> > +        0x2, 
> > +        0x5, 
> > +        0x6, 
> > +}; 
> > + 
> > +struct csi_reset_data { 
> > +        void __iomem                        *reg; 
> > +        spinlock_t                        *lock; /* lock for reset 
> handling */ 
> > +        struct reset_controller_dev        rcdev; 
> > +}; 
> > + 
> > +static int sun4i_csi_assert(struct reset_controller_dev *rcdev, 
> > +                            unsigned long id) 
> > +{ 
> > +        struct csi_reset_data *data = container_of(rcdev, 
> > +                                                  struct 
> csi_reset_data, 
> > +                                                  rcdev); 
> > +        unsigned long flags; 
> > +        u32 reg; 
> > + 
> > +        spin_lock_irqsave(data->lock, flags); 
> > + 
> > +        reg = readl(data->reg); 
> > +        writel(reg & ~BIT(SUN4I_CSI_RESET_BIT), data->reg); 
> > + 
> > +        spin_unlock_irqrestore(data->lock, flags); 
> > + 
> > +        return 0; 
> > +} 
> > + 
> > +static int sun4i_csi_deassert(struct reset_controller_dev *rcdev, 
> > +                              unsigned long id) 
> > +{ 
> > +        struct csi_reset_data *data = container_of(rcdev, 
> > +                                                  struct 
> csi_reset_data, 
> > +                                                  rcdev); 
> > +        unsigned long flags; 
> > +        u32 reg; 
> > + 
> > +        spin_lock_irqsave(data->lock, flags); 
> > + 
> > +        reg = readl(data->reg); 
> > +        writel(reg | BIT(SUN4I_CSI_RESET_BIT), data->reg); 
> > + 
> > +        spin_unlock_irqrestore(data->lock, flags); 
> > + 
> > +        return 0; 
> > +} 
> > + 
> > +static int sun4i_csi_of_xlate(struct reset_controller_dev *rcdev, 
> > +                              const struct of_phandle_args *reset_spec) 
> > +{ 
> > +        if (WARN_ON(reset_spec->args_count != 0)) 
> > +                return -EINVAL; 
> > + 
> > +        return 0; 
> > +} 
> > + 
> > +static struct reset_control_ops sun4i_csi_reset_ops = { 
> > +        .assert                = sun4i_csi_assert, 
> > +        .deassert        = sun4i_csi_deassert, 
> > +}; 
> > + 
> > +static void __init sun4i_csi_clk_setup(struct device_node *node) 
> > +{ 
> > +        const char *parents[SUN4I_CSI_PARENTS]; 
> > +        const char *clk_name = node->name; 
> > +        struct csi_reset_data *reset_data; 
> > +        struct clk_divider *div; 
> > +        struct clk_gate *gate; 
> > +        struct clk_mux *mux; 
> > +        void __iomem *reg; 
> > +        struct clk *clk; 
> > +        int i = 0; 
> > + 
> > +        reg = of_io_request_and_map(node, 0, of_node_full_name(node)); 
> > +        if (IS_ERR(reg)) 
> > +                return; 
> > + 
> > +        of_property_read_string(node, "clock-output-names", &clk_name); 
> > + 
> > +        i = of_clk_parent_fill(node, parents, SUN4I_CSI_PARENTS); 
> > + 
> > +        mux = kzalloc(sizeof(*mux), GFP_KERNEL); 
> > +        if (!mux) 
> > +                goto err_unmap; 
> > + 
> > +        mux->reg = reg; 
> > +        mux->shift = SUN4I_CSI_MUX_SHIFT; 
> > +        mux->table = sun4i_csi_mux_table; 
> > +        mux->lock = &sun4i_csi_lock; 
> > + 
> > +        gate = kzalloc(sizeof(*gate), GFP_KERNEL); 
> > +        if (!gate) 
> > +                goto err_free_mux; 
> > + 
> > +        gate->reg = reg; 
> > +        gate->bit_idx = SUN4I_CSI_GATE_BIT; 
> > +        gate->lock = &sun4i_csi_lock; 
> > + 
> > +        div = kzalloc(sizeof(*div), GFP_KERNEL); 
> > +        if (!div) 
> > +                goto err_free_gate; 
> > + 
> > +        div->reg = reg; 
> > +        div->shift = SUN4I_CSI_DIV_SHIFT; 
> > +        div->width = SUN4I_CSI_DIV_WIDTH; 
> > +        div->lock = &sun4i_csi_lock; 
> > + 
> > +        clk = clk_register_composite(NULL, clk_name, 
> > +                                     parents, i, 
> > +                                     &mux->hw, &clk_mux_ops, 
> > +                                     &div->hw, &clk_divider_ops, 
> > +                                     &gate->hw, &clk_gate_ops, 
> > +                                     CLK_SET_RATE_PARENT); 
> > +        if (IS_ERR(clk)) 
> > +                goto err_free_div; 
> > + 
> > +        of_clk_add_provider(node, of_clk_src_simple_get, clk); 
> > + 
> > +        reset_data = kzalloc(sizeof(*reset_data), GFP_KERNEL); 
> > +        if (!reset_data) 
> > +                goto err_free_clk; 
> > + 
> > +        reset_data->reg = reg; 
> > +        reset_data->lock = &sun4i_csi_lock; 
> > +        reset_data->rcdev.nr_resets = 1; 
> > +        reset_data->rcdev.ops = &sun4i_csi_reset_ops; 
> > +        reset_data->rcdev.of_node = node; 
> > +        reset_data->rcdev.of_xlate = sun4i_csi_of_xlate; 
> > +        reset_data->rcdev.of_reset_n_cells = 0; 
> > + 
> > +        if (reset_controller_register(&reset_data->rcdev)) 
> > +                goto err_free_reset; 
> > + 
> > +        return; 
> > + 
> > +err_free_reset: 
> > +        kfree(reset_data); 
> > +err_free_clk: 
> > +        clk_unregister(clk); 
> > +err_free_div: 
> > +        kfree(div); 
> > +err_free_gate: 
> > +        kfree(gate); 
> > +err_free_mux: 
> > +        kfree(mux); 
> > +err_unmap: 
> > +        iounmap(reg); 
> > +} 
> > + 
> > +CLK_OF_DECLARE(sun4i_csi, "allwinner,sun4i-a10-csi-clk", 
> > +               sun4i_csi_clk_setup); 
> > + 
>
> That's great, but it shares a lot of infrastructure of boilerplate 
> code with the display clocks that are part of my DRM serie. 
>
> I plan to post them early next week, I'll cc you so that you can base 
> your clock on top of it. 
>
> Thanks! 
> Maxime 
>
> -- 
> Maxime Ripard, Free Electrons 
> Embedded Linux, Kernel and Android engineering 
> http://free-electrons.com 
>

------=_Part_1563_2068990815.1460030142313
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Maxime<br><br>I had a look at your display clock driver=
.The only issue I have is setting the clock parents. A simple mask wont do =
it. <br>I guess using table is the only way. The CSI is only clock which is=
 using irregular parents mux. The remaining clocks<br>including VE, can be =
based on your display clock driver. <br>Thanx.<br><br>On Monday, March 21, =
2016 at 7:42:48 PM UTC+11, Maxime Ripard wrote:<blockquote class=3D"gmail_q=
uote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;pad=
ding-left: 1ex;">Hi Yassin,
<br>
<br>On Thu, Mar 17, 2016 at 07:43:42PM +1100, <a href=3D"javascript:" targe=
t=3D"_blank" gdf-obfuscated-mailto=3D"5XrHfbBmAwAJ" rel=3D"nofollow" onmous=
edown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.hr=
ef=3D&#39;javascript:&#39;;return true;">yassin...@gmail.com</a> wrote:
<br>&gt; From: Yassin Jaffer &lt;<a href=3D"javascript:" target=3D"_blank" =
gdf-obfuscated-mailto=3D"5XrHfbBmAwAJ" rel=3D"nofollow" onmousedown=3D"this=
.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;jav=
ascript:&#39;;return true;">yassin...@gmail.com</a>&gt;
<br>&gt;=20
<br>&gt; This patch adds a composite clock type consisting of
<br>&gt; a clock gate, mux, configurable dividers, and a reset control.
<br>&gt;=20
<br>&gt; Signed-off-by: Yassin Jaffer &lt;<a href=3D"javascript:" target=3D=
"_blank" gdf-obfuscated-mailto=3D"5XrHfbBmAwAJ" rel=3D"nofollow" onmousedow=
n=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=
=3D&#39;javascript:&#39;;return true;">yassin...@gmail.com</a>&gt;
<br>&gt; ---
<br>&gt; =C2=A0Documentation/devicetree/<wbr>bindings/clock/sunxi.txt | =C2=
=A0 1 +
<br>&gt; =C2=A0drivers/clk/sunxi/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +
<br>&gt; =C2=A0drivers/clk/sunxi/clk-a10-<wbr>csi.c =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 188 ++++++++++++++++++++++
<br>&gt; =C2=A03 files changed, 190 insertions(+)
<br>&gt; =C2=A0create mode 100644 drivers/clk/sunxi/clk-a10-csi.<wbr>c
<br>&gt;=20
<br>&gt; diff --git a/Documentation/devicetree/<wbr>bindings/clock/sunxi.tx=
t b/Documentation/devicetree/<wbr>bindings/clock/sunxi.txt
<br>&gt; index e59f57b..c3826f7 100644
<br>&gt; --- a/Documentation/devicetree/<wbr>bindings/clock/sunxi.txt
<br>&gt; +++ b/Documentation/devicetree/<wbr>bindings/clock/sunxi.txt
<br>&gt; @@ -77,6 +77,7 @@ Required properties:
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;allwin=
ner,sun9i-a80-<wbr>usb-mod-clk&quot; - for usb gates + resets on A80
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;allwin=
ner,sun9i-a80-<wbr>usb-phy-clk&quot; - for usb phy gates + resets on A80
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;allwin=
ner,sun4i-a10-<wbr>ve-clk&quot; - for the Video Engine clock
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;allwinner,s=
un4i-a10-<wbr>csi-clk&quot; - for the CSI module
<br>&gt; =C2=A0
<br>&gt; =C2=A0Required properties for all clocks:
<br>&gt; =C2=A0- reg : shall be the control register address for the clock.
<br>&gt; diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefi=
le
<br>&gt; index 3fd7901..42ce752 100644
<br>&gt; --- a/drivers/clk/sunxi/Makefile
<br>&gt; +++ b/drivers/clk/sunxi/Makefile
<br>&gt; @@ -7,6 +7,7 @@ obj-y +=3D clk-a10-codec.o
<br>&gt; =C2=A0obj-y +=3D clk-a10-hosc.o
<br>&gt; =C2=A0obj-y +=3D clk-a10-mod1.o
<br>&gt; =C2=A0obj-y +=3D clk-a10-pll2.o
<br>&gt; +obj-y +=3D clk-a10-csi.o
<br>&gt; =C2=A0obj-y +=3D clk-a10-ve.o
<br>&gt; =C2=A0obj-y +=3D clk-a20-gmac.o
<br>&gt; =C2=A0obj-y +=3D clk-mod0.o
<br>&gt; diff --git a/drivers/clk/sunxi/clk-a10-<wbr>csi.c b/drivers/clk/su=
nxi/clk-a10-<wbr>csi.c
<br>&gt; new file mode 100644
<br>&gt; index 0000000..f17d206
<br>&gt; --- /dev/null
<br>&gt; +++ b/drivers/clk/sunxi/clk-a10-<wbr>csi.c
<br>&gt; @@ -0,0 +1,188 @@
<br>&gt; +/*
<br>&gt; + * Copyright 2016 Yassin Jaffer
<br>&gt; + *
<br>&gt; + * Yassin Jaffer &lt;<a href=3D"javascript:" target=3D"_blank" gd=
f-obfuscated-mailto=3D"5XrHfbBmAwAJ" rel=3D"nofollow" onmousedown=3D"this.h=
ref=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javas=
cript:&#39;;return true;">yassin...@gmail.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This program is free software; you can redistribute it and/or =
modify
<br>&gt; + * it under the terms of the GNU General Public License as publis=
hed by
<br>&gt; + * the Free Software Foundation; either version 2 of the License,=
 or
<br>&gt; + * (at your option) any later version.
<br>&gt; + *
<br>&gt; + * This program is distributed in the hope that it will be useful=
,
<br>&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of
<br>&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See=
 the
<br>&gt; + * GNU General Public License for more details.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;linux/clk-provider.h&gt;
<br>&gt; +#include &lt;linux/of_address.h&gt;
<br>&gt; +#include &lt;linux/reset-controller.h&gt;
<br>&gt; +#include &lt;linux/slab.h&gt;
<br>&gt; +#include &lt;linux/spinlock.h&gt;
<br>&gt; +
<br>&gt; +static DEFINE_SPINLOCK(sun4i_csi_<wbr>lock);
<br>&gt; +
<br>&gt; +#define SUN4I_CSI_PARENTS =C2=A0 =C2=A0 =C2=A0 5
<br>&gt; +#define SUN4I_CSI_GATE_BIT =C2=A0 =C2=A0 =C2=A031
<br>&gt; +#define SUN4I_CSI_RESET_BIT =C2=A0 =C2=A0 30
<br>&gt; +#define SUN4I_CSI_MUX_SHIFT =C2=A0 =C2=A0 24
<br>&gt; +#define SUN4I_CSI_DIV_WIDTH =C2=A0 =C2=A0 5
<br>&gt; +#define SUN4I_CSI_DIV_SHIFT =C2=A0 =C2=A0 0
<br>&gt; +
<br>&gt; +static u32 sun4i_csi_mux_table[SUN4I_CSI_<wbr>PARENTS] =3D {
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x2,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x5,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x6,
<br>&gt; +};
<br>&gt; +
<br>&gt; +struct csi_reset_data {
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0*reg=
;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spinlock_t=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*lock;=
 /* lock for reset handling */
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct reset_cont=
roller_dev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>rcdev;
<br>&gt; +};
<br>&gt; +
<br>&gt; +static int sun4i_csi_assert(struct reset_controller_dev *rcdev,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0 =C2=A0unsigned long id)
<br>&gt; +{
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct csi_reset_=
data *data =3D container_of(rcdev,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0struct csi_reset_data,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0rcdev);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long fla=
gs;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 reg;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave=
(<wbr>data-&gt;lock, flags);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D readl(dat=
a-&gt;reg);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(reg &amp; =
~BIT(SUN4I_CSI_RESET_BIT), data-&gt;reg);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_<wbr>=
irqrestore(data-&gt;lock, flags);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
<br>&gt; +}
<br>&gt; +
<br>&gt; +static int sun4i_csi_deassert(struct reset_controller_dev *rcdev,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long id)
<br>&gt; +{
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct csi_reset_=
data *data =3D container_of(rcdev,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0struct csi_reset_data,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0rcdev);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long fla=
gs;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 reg;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave=
(<wbr>data-&gt;lock, flags);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D readl(dat=
a-&gt;reg);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(reg | BIT(=
SUN4I_CSI_RESET_BIT), data-&gt;reg);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_<wbr>=
irqrestore(data-&gt;lock, flags);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
<br>&gt; +}
<br>&gt; +
<br>&gt; +static int sun4i_csi_of_xlate(struct reset_controller_dev *rcdev,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct of_phandle_args *reset_spec)
<br>&gt; +{
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON(reset=
_spec-&gt;args_<wbr>count !=3D 0))
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
<br>&gt; +}
<br>&gt; +
<br>&gt; +static struct reset_control_ops sun4i_csi_reset_ops =3D {
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.assert=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>=C2=A0=C2=A0=3D sun4i_csi_assert,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.deassert=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D sun4i_csi_deassert,
<br>&gt; +};
<br>&gt; +
<br>&gt; +static void __init sun4i_csi_clk_setup(struct device_node *node)
<br>&gt; +{
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *paren=
ts[SUN4I_CSI_PARENTS];
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *clk_n=
ame =3D node-&gt;name;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct csi_reset_=
data *reset_data;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk_divide=
r *div;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk_gate *=
gate;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk_mux *m=
ux;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *reg=
;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk *clk;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i =3D 0;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D of_io_req=
uest_and_map(node, 0, of_node_full_name(node));
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(reg))
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_property_read_=
<wbr>string(node, &quot;clock-output-names&quot;, &amp;clk_name);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i =3D of_clk_pare=
nt_fill(node, parents, SUN4I_CSI_PARENTS);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mux =3D kzalloc(s=
izeof(*mux), GFP_KERNEL);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!mux)
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_unmap;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mux-&gt;reg =3D r=
eg;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mux-&gt;shift =3D=
 SUN4I_CSI_MUX_SHIFT;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mux-&gt;table =3D=
 sun4i_csi_mux_table;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mux-&gt;lock =3D =
&amp;sun4i_csi_lock;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gate =3D kzalloc(=
sizeof(*gate), GFP_KERNEL);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!gate)
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_free_mux;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gate-&gt;reg =3D =
reg;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gate-&gt;bit_idx =
=3D SUN4I_CSI_GATE_BIT;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gate-&gt;lock =3D=
 &amp;sun4i_csi_lock;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0div =3D kzalloc(s=
izeof(*div), GFP_KERNEL);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!div)
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_free_gate;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0div-&gt;reg =3D r=
eg;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0div-&gt;shift =3D=
 SUN4I_CSI_DIV_SHIFT;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0div-&gt;width =3D=
 SUN4I_CSI_DIV_WIDTH;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0div-&gt;lock =3D =
&amp;sun4i_csi_lock;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk =3D clk_regis=
ter_composite(NULL, clk_name,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 p=
arents, i,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 &=
amp;mux-&gt;hw, &amp;clk_mux_ops,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 &=
amp;div-&gt;hw, &amp;clk_divider_ops,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 &=
amp;gate-&gt;hw, &amp;clk_gate_ops,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 C=
LK_SET_RATE_PARENT);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(clk))
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_free_div;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_clk_add_provid=
er(<wbr>node, of_clk_src_simple_get, clk);
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data =3D kz=
alloc(sizeof(*reset_data), GFP_KERNEL);
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!reset_data)
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_free_clk;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data-&gt;re=
g =3D reg;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data-&gt;lo=
ck =3D &amp;sun4i_csi_lock;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data-&gt;rc=
dev.nr_<wbr>resets =3D 1;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data-&gt;rc=
dev.ops =3D &amp;sun4i_csi_reset_ops;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data-&gt;rc=
dev.of_<wbr>node =3D node;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data-&gt;rc=
dev.of_<wbr>xlate =3D sun4i_csi_of_xlate;
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reset_data-&gt;rc=
dev.of_<wbr>reset_n_cells =3D 0;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (reset_control=
ler_register(&amp;<wbr>reset_data-&gt;rcdev))
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_free_reset;
<br>&gt; +
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
<br>&gt; +
<br>&gt; +err_free_reset:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(reset_data)=
;
<br>&gt; +err_free_clk:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_unregister(cl=
k);
<br>&gt; +err_free_div:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(div);
<br>&gt; +err_free_gate:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(gate);
<br>&gt; +err_free_mux:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(mux);
<br>&gt; +err_unmap:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iounmap(reg);
<br>&gt; +}
<br>&gt; +
<br>&gt; +CLK_OF_DECLARE(sun4i_csi, &quot;allwinner,sun4i-a10-csi-clk&quot;=
,
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sun4i_csi_clk_setup);
<br>&gt; +
<br>
<br>That&#39;s great, but it shares a lot of infrastructure of boilerplate
<br>code with the display clocks that are part of my DRM serie.
<br>
<br>I plan to post them early next week, I&#39;ll cc you so that you can ba=
se
<br>your clock on top of it.
<br>
<br>Thanks!
<br>Maxime
<br>
<br>--=20
<br>Maxime Ripard, Free Electrons
<br>Embedded Linux, Kernel and Android engineering
<br><a href=3D"http://free-electrons.com" target=3D"_blank" rel=3D"nofollow=
" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\75http%3A%2F%=
2Ffree-electrons.com\46sa\75D\46sntz\0751\46usg\75AFQjCNGC8C9pT7xKJEabITLGL=
5cqtolifQ&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google.=
com/url?q\75http%3A%2F%2Ffree-electrons.com\46sa\75D\46sntz\0751\46usg\75AF=
QjCNGC8C9pT7xKJEabITLGL5cqtolifQ&#39;;return true;">http://free-electrons.c=
om</a>
<br></blockquote></div>
------=_Part_1563_2068990815.1460030142313--

------=_Part_1562_1348376410.1460030142312--
