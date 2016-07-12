Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Gregory CLEMENT <gregory.clement@free-electrons.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <87r3aystsl.fsf@free-electrons.com>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rob Herring" <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, "Jason Cooper" <jason@lakedaemon.net>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, "Nadav Haklai" <nadavh@marvell.com>,
 "Victor Gu" <xigu@marvell.com>,
 "Romain Perier" <romain.perier@free-electrons.com>,
 "Omri Itach" <omrii@marvell.com>, "Marcin Wojtas" <mw@semihalf.com>,
 "Wilson Ding" <dingwei@marvell.com>, "Hua Jing" <jinghua@marvell.com>,
 "Terry Zhou" <bjzhou@marvell.com>
References: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
 <1467931071-31004-7-git-send-email-gregory.clement@free-electrons.com>
 <146800242289.73491.4169295036354147972@resonance>
 <87r3aystsl.fsf@free-electrons.com>
Message-ID: <146834449725.73491.6964712305765408246@resonance>
Subject: Re: [PATCH v2 6/6] clk: mvebu: Add the peripheral clock driver for Armada
 3700
Date: Tue, 12 Jul 2016 10:28:17 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Gregory CLEMENT (2016-07-12 09:30:34)
> Hi Michael,
>  =

>  On ven., juil. 08 2016, Michael Turquette <mturquette@baylibre.com> wrot=
e:
> =

> > Quoting Gregory CLEMENT (2016-07-07 15:37:51)
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/clk.h>
> >
> > Same question as my previous email. Is clk.h necessary? Is this driver
> > also a clk consumer?
> =

> I think I can remove it indeed.
> =

> >
> >> +static int armada_3700_add_composite_clk(const struct clk_periph_data=
 *data,
> >> +                                        const char * const *parent_na=
me,
> >> +                                        void __iomem *reg, spinlock_t=
 *lock,
> >> +                                        struct device *dev, struct cl=
k_hw *hw)
> >> +{
> >> +       const struct clk_ops *mux_ops =3D NULL, *gate_ops =3D NULL,
> >> +               *div_ops =3D NULL;
> >> +       struct clk_hw *mux_hw =3D NULL, *gate_hw =3D NULL, *div_hw =3D=
 NULL;
> >> +       const char * const *names;
> >> +       struct clk_mux *mux =3D NULL;
> >> +       struct clk_gate *gate =3D NULL;
> >> +       struct clk_divider *div =3D NULL;
> >> +       struct clk_double_div *double_div =3D NULL;
> >> +       int num_parent;
> >> +       int ret =3D 0;
> >> +
> >> +       if (data->gate_shift !=3D UNUSED) {
> >> +               gate =3D devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
> >> +
> >> +               if (!gate)
> >> +                       return -ENOMEM;
> >> +
> >> +               gate->reg =3D reg + CLK_DIS;
> >> +               gate->bit_idx =3D data->gate_shift;
> >> +               gate->lock =3D lock;
> >> +               gate_ops =3D &clk_gate_ops;
> >> +               gate_hw =3D &gate->hw;
> >> +       }
> >> +
> >> +       if (data->mux_shift !=3D UNUSED) {
> >> +               mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> >> +
> >> +               if (!mux) {
> >> +                       ret =3D -ENOMEM;
> >> +                       goto free_gate;
> >> +               }
> >> +
> >> +               mux->reg =3D reg + TBG_SEL;
> >> +               mux->shift =3D data->mux_shift;
> >> +               mux->mask =3D 0x3;
> >> +               mux->lock =3D lock;
> >> +               mux_ops =3D &clk_mux_ro_ops;
> >> +               mux_hw =3D &mux->hw;
> >> +       }
> >> +
> >> +       if (data->div_reg1 !=3D UNUSED) {
> >> +               if (data->div_reg2 =3D=3D UNUSED) {
> >> +                       const struct clk_div_table *clkt;
> >> +                       int table_size =3D 0;
> >> +
> >> +                       div =3D devm_kzalloc(dev, sizeof(*div), GFP_KE=
RNEL);
> >> +                       if (!div) {
> >> +                               ret =3D -ENOMEM;
> >> +                               goto free_mux;
> >> +                       }
> >> +
> >> +                       div->reg =3D reg + data->div_reg1;
> >> +                       div->table =3D data->table;
> >> +                       for (clkt =3D div->table; clkt->div; clkt++)
> >> +                               table_size++;
> >> +                       div->width =3D order_base_2(table_size);
> >> +                       div->lock =3D lock;
> >> +                       div_ops =3D &clk_divider_ro_ops;
> >> +                       div_hw =3D &div->hw;
> >> +               } else {
> >> +                       double_div =3D devm_kzalloc(dev, sizeof(*doubl=
e_div),
> >> +                                                 GFP_KERNEL);
> >> +                       if (!double_div) {
> >> +                               ret =3D -ENOMEM;
> >> +                               goto free_mux;
> >> +                       }
> >> +
> >> +                       double_div->reg1 =3D reg + data->div_reg1;
> >> +                       double_div->shift1 =3D data->div_shift1;
> >> +                       double_div->reg2 =3D reg + data->div_reg1;
> >> +                       double_div->shift2 =3D data->div_shift2;
> >> +                       div_ops =3D &clk_double_div_ops;
> >> +                       div_hw =3D &double_div->hw;
> >> +               }
> >> +       }
> >> +
> >> +       switch (data->flags) {
> >> +       case XTAL_CHILD:
> >> +               /* the xtal clock is the 5th clock */
> >> +               names =3D &parent_name[4];
> >> +               num_parent =3D 1;
> >> +               break;
> >> +       case TBGA_S_CHILD:
> >> +               /* the TBG A S clock is the 3rd clock */
> >> +               names =3D &parent_name[2];
> >> +               num_parent =3D 1;
> >> +               break;
> >> +       case GBE_CORE_CHILD:
> >> +               names =3D &gbe_name[1];
> >> +               num_parent =3D 1;
> >> +               break;
> >> +       case  GBE_50_CHILD:
> >> +               names =3D &gbe_name[0];
> >> +               num_parent =3D 1;
> >> +               break;
> >> +       case  GBE_125_CHILD:
> >> +               names =3D &gbe_name[2];
> >> +               num_parent =3D 1;
> >> +               break;
> >> +       default:
> >> +               names =3D parent_name;
> >> +               num_parent =3D 4;
> >> +       }
> >> +       hw =3D clk_hw_register_composite(dev, data->name,
> >> +                                    names, num_parent,
> >> +                                    mux_hw, mux_ops,
> >> +                                    div_hw, div_ops,
> >> +                                    gate_hw, gate_ops,
> >> +                                    CLK_IGNORE_UNUSED);
> >> +       if (IS_ERR(hw)) {
> >> +               ret =3D PTR_ERR(hw);
> >> +               goto free_div;
> >> +       }
> >> +
> >> +       return 0;
> >> +free_div:
> >> +       devm_kfree(dev, div);
> >> +       devm_kfree(dev, double_div);
> >> +free_mux:
> >> +       devm_kfree(dev, mux);
> >> +free_gate:
> >> +       devm_kfree(dev, gate);
> >> +       return ret;
> >> +}
> >
> > Can this "add" function (aka registration function) be replaced with
> > static data instead? I think that all of the static data exists already,
> > this function can be removed and your probe can call clk_hw_register
> > directly.
> >
> =

> I see your point and indeed we can remove some allocation. However using
> clk_hw_register with composite clock is not straight forward. Indeed the
> clk_ops is filled in the clk_hw_register_composite function and none of
> these operations are exported outside the clk-composite.c file.
> =

> We can't directly point a clk_gate_ops structure or a clk_divider_ops as
> you did in the drivers/clk/meson/gxbb.c file for example. For clk
> composite it would need modify the framework to either export all the
> operation or to create set of operations directly usable and I would
> like to avoid doing it when we are close to the merge window.
> =

> However I can use static data for the clk_mux, clk_gate and clk_divider
> struct.
> =

> Is it OK for you?

Yes, that sounds good. Let's convert the ones we can for now. Some day
we might have a better solution for the composite clock stuff.

Regards,
Mike

> =

> Thanks,
> =

> Gregory
> =

> > It might need a macro though, since composite clock structures are
> > rather messy. This avoids a lot of unnecessary allocations and time
> > populating data that we already have access to. In general I am trying
> > to encourage clk drivers to use only clk_hw_register() in their probe
> > instead of the helper registration functions.
> >
> > Similarly I am discouraging drivers from populating hw.init at run-time,
> > since we already have that data for that at compile-time.
> >
> > Regards,
> > Mike
> =

> -- =

> Gregory Clement, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
