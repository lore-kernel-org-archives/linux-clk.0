Return-Path: <jon.mason@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <1470830763-29189-1-git-send-email-zajec5@gmail.com>
References: <1470830763-29189-1-git-send-email-zajec5@gmail.com>
From: Jon Mason <jon.mason@broadcom.com>
Date: Wed, 10 Aug 2016 13:22:09 -0400
Message-ID: <CAC3K-4pvDjziC08fzRjHoi9Tb=smnmNMzfxgG60hqAy1yC13gA@mail.gmail.com>
Subject: Re: [PATCH V3] clk: bcm: Add driver for Northstar ILP clock
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, Eric Anholt <eric@anholt.net>,
	Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 10, 2016 at 8:05 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This clock is present on cheaper Northstar devices like BCM53573 or
> BCM47189 using Corex-A7. ILP is a part of PMU (Power Management Unit)
> and so it should be defined as one of its subnodes (subdevices). For
> more details see Documentation entry.
>
> Unfortunately there isn't a set of registers related to ILP clock only.
> We use registers 0x66c, 0x674 and 0x6dc and between them there are e.g.
> "retention*" and "control_ext" regs. This is why this driver maps all
> 0x1000 B of space.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> V2: Rebase on top of clk-next
>     Use ALP as parent clock
>     Improve comments
>     Switch from ioremap_nocache to ioremap
>     Check of_clk_add_provide result for error
> V3: Drop #include <linux/moduleh>
>     Make ILP DT entry part of PMU
>     Describe ILP as subdevice of PMU in Documentation
> ---
>  .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  40 ++++++
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-ns-ilp.c                       | 146 +++++++++++++++=
++++++
>  3 files changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-ilp.t=
xt
>  create mode 100644 drivers/clk/bcm/clk-ns-ilp.c
>
> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt b/Do=
cumentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> new file mode 100644
> index 0000000..a18c73f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> @@ -0,0 +1,40 @@
> +Broadcom Northstar ILP clock
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +This binding is used for ILP clock (sometimes referred as "slow clock")
> +on Broadcom Northstar devices using Corex-A7 CPU.
> +
> +This clock is part of PMU (Power Management Unit), a Broadcom's device
> +handing power-related aspects. Please note PMU contains more subdevices,
> +ILP is only one of them.
> +
> +ILP's rate has to be calculated on runtime and it depends on ALP clock
> +which has to be referenced.
> +
> +Required properties:
> +- compatible: "brcm,ns-ilp"
> +- reg: iomem address range of PMU (Power Management Unit)
> +- reg-names: "pmu", the only needed & supported reg right now
> +- clocks: has to reference an ALP clock
> +- #clock-cells: should be <0>
> +
> +Example:
> +
> +pmu@18012000 {
> +       compatible =3D "simple-bus";
> +       ranges =3D <0x00000000 0x18012000 0x00001000>;

I don't see a corresponding DT entry in this patch, but 18012000 is
the PCI block.  So, I am concerned this will collide if used there.

I looked at the NS register reference guide, and I cannot find the
registers you are trying to reference.  Is this supposed to be
referencing the LCPLL clock registers in DMU?  If so, there is already
a driver in there for this (see drivers/clk/bcm/clk-nsp.c).

> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +
> +       ilp: ilp@0 {
> +               compatible =3D "brcm,ns-ilp";
> +               reg =3D <0 0x1000>;
> +               reg-names =3D "pmu";
> +               clocks =3D <&alp>;
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "ilp";
> +       };
> +};
> diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> index 1d79bd2..1389379 100644
> --- a/drivers/clk/bcm/Makefile
> +++ b/drivers/clk/bcm/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_COMMON_CLK_IPROC)        +=3D clk-ns2.o
>  obj-$(CONFIG_ARCH_BCM_CYGNUS)  +=3D clk-cygnus.o
>  obj-$(CONFIG_ARCH_BCM_NSP)     +=3D clk-nsp.o
>  obj-$(CONFIG_ARCH_BCM_5301X)   +=3D clk-nsp.o
> +obj-$(CONFIG_ARCH_BCM_5301X)   +=3D clk-ns-ilp.o
> diff --git a/drivers/clk/bcm/clk-ns-ilp.c b/drivers/clk/bcm/clk-ns-ilp.c
> new file mode 100644
> index 0000000..53b4a23
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-ns-ilp.c
> @@ -0,0 +1,146 @@
> +/*
> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +
> +#define PMU_XTAL_FREQ_RATIO                    0x66c
> +#define  XTAL_ALP_PER_4ILP                     0x00001fff
> +#define  XTAL_CTL_EN                           0x80000000
> +#define PMU_SLOW_CLK_PERIOD                    0x6dc
> +
> +struct ns_ilp {
> +       struct clk *clk;
> +       struct clk_hw hw;
> +       void __iomem *pmu;
> +};
> +
> +static int ns_ilp_enable(struct clk_hw *hw)
> +{
> +       struct ns_ilp *ilp =3D container_of(hw, struct ns_ilp, hw);
> +
> +       writel(0x10199, ilp->pmu + PMU_SLOW_CLK_PERIOD);
> +       writel(0x10000, ilp->pmu + 0x674);
> +
> +       return 0;
> +}
> +
> +static unsigned long ns_ilp_recalc_rate(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       struct ns_ilp *ilp =3D container_of(hw, struct ns_ilp, hw);
> +       void __iomem *pmu =3D ilp->pmu;
> +       u32 last_val, cur_val;
> +       u32 sum =3D 0, num =3D 0, loop_num =3D 0;
> +       u32 avg;
> +
> +       /* Enable measurement */
> +       writel(XTAL_CTL_EN, pmu + PMU_XTAL_FREQ_RATIO);
> +
> +       /* Read initial value */
> +       last_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP=
;
> +
> +       /*
> +        * At minimum we should loop for a bit to let hardware do the
> +        * measurement. This isn't very accurate however, so for a better
> +        * precision lets try getting 20 different values for and use ave=
rage.
> +        */
> +       while (num < 20) {
> +               cur_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_P=
ER_4ILP;
> +
> +               if (cur_val !=3D last_val) {
> +                       /* Got different value, use it */
> +                       sum +=3D cur_val;
> +                       num++;
> +                       loop_num =3D 0;
> +                       last_val =3D cur_val;
> +               } else if (++loop_num > 5000) {
> +                       /* Same value over and over, give up */
> +                       sum +=3D cur_val;
> +                       num++;
> +                       break;
> +               }
> +       }
> +
> +       /* Disable measurement to save power */
> +       writel(0x0, pmu + PMU_XTAL_FREQ_RATIO);
> +
> +       avg =3D sum / num;
> +
> +       return parent_rate * 4 / avg;
> +}
> +
> +static const struct clk_ops ns_ilp_clk_ops =3D {
> +       .enable =3D ns_ilp_enable,
> +       .recalc_rate =3D ns_ilp_recalc_rate,
> +};
> +
> +static void ns_ilp_init(struct device_node *np)
> +{
> +       struct ns_ilp *ilp;
> +       struct resource res;
> +       struct clk_init_data init =3D { 0 };
> +       const char *parent_name;
> +       int index;
> +       int err;
> +
> +       ilp =3D kzalloc(sizeof(*ilp), GFP_KERNEL);
> +       if (!ilp)
> +               return;
> +
> +       parent_name =3D of_clk_get_parent_name(np, 0);
> +       if (!parent_name) {
> +               err =3D -ENOENT;
> +               goto err_free_ilp;
> +       }
> +
> +       /* TODO: This looks generic, try making it OF helper. */
> +       index =3D of_property_match_string(np, "reg-names", "pmu");
> +       if (index < 0) {
> +               err =3D index;
> +               goto err_free_ilp;
> +       }
> +       err =3D of_address_to_resource(np, index, &res);
> +       if (err)
> +               goto err_free_ilp;
> +       ilp->pmu =3D ioremap(res.start, resource_size(&res));
> +       if (IS_ERR(ilp->pmu)) {
> +               err =3D PTR_ERR(ilp->pmu);
> +               goto err_free_ilp;
> +       }
> +
> +       init.name =3D np->name;
> +       init.ops =3D &ns_ilp_clk_ops;
> +       init.parent_names =3D &parent_name;
> +       init.num_parents =3D 1;
> +
> +       ilp->hw.init =3D &init;
> +       ilp->clk =3D clk_register(NULL, &ilp->hw);
> +       if (WARN_ON(IS_ERR(ilp->clk)))
> +               goto err_unmap_pmu;
> +
> +       err =3D of_clk_add_provider(np, of_clk_src_simple_get, ilp->clk);
> +       if (err)
> +               goto err_clk_unregister;
> +
> +       return;
> +
> +err_clk_unregister:
> +       clk_unregister(ilp->clk);
> +err_unmap_pmu:
> +       iounmap(ilp->pmu);
> +err_free_ilp:
> +       kfree(ilp);
> +       pr_err("Failed to init ILP clock: %d\n", err);
> +}
> +CLK_OF_DECLARE(ns_ilp_clk, "brcm,ns-ilp", ns_ilp_init);
> --
> 1.8.4.5
>
