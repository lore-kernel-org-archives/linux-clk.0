Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-arm-kernel@lists.infradead.org,  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,  Russell King <rmk+kernel@arm.linux.org.uk>,  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: mvebu: support for 98DX3236 SoC
References: <20161222041328.3303-1-chris.packham@alliedtelesis.co.nz>
	<20161222041328.3303-2-chris.packham@alliedtelesis.co.nz>
Date: Wed, 04 Jan 2017 18:32:08 +0100
In-Reply-To: <20161222041328.3303-2-chris.packham@alliedtelesis.co.nz> (Chris
	Packham's message of "Thu, 22 Dec 2016 17:13:24 +1300")
Message-ID: <87o9zmenon.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,
=20
 On jeu., d=C3=A9c. 22 2016, Chris Packham <chris.packham@alliedtelesis.co.=
nz> wrote:

> The 98DX3236, 98DX3336, 98DX4521 and variants have a different TCLK from
> the Armada XP (200MHz vs 250MHz). The CPU core clock is fixed at 800MHz.
>
> The clock gating options are a subset of those on the Armada XP.
>
> The core clock divider is different to the Armada XP also.

This patch looks good, however you should update the device tree binding
documentation too.

Thanks,

Gregory

>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/clk/mvebu/Makefile             |   2 +-
>  drivers/clk/mvebu/armada-xp.c          |  42 +++++++
>  drivers/clk/mvebu/clk-cpu.c            |  33 +++++-
>  drivers/clk/mvebu/mv98dx3236-corediv.c | 207 +++++++++++++++++++++++++++=
++++++
>  4 files changed, 280 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/clk/mvebu/mv98dx3236-corediv.c
>
> diff --git a/drivers/clk/mvebu/Makefile b/drivers/clk/mvebu/Makefile
> index d9ae97fb43c4..6a3681e3d6db 100644
> --- a/drivers/clk/mvebu/Makefile
> +++ b/drivers/clk/mvebu/Makefile
> @@ -9,7 +9,7 @@ obj-$(CONFIG_ARMADA_39X_CLK)	+=3D armada-39x.o
>  obj-$(CONFIG_ARMADA_37XX_CLK)	+=3D armada-37xx-xtal.o
>  obj-$(CONFIG_ARMADA_37XX_CLK)	+=3D armada-37xx-tbg.o
>  obj-$(CONFIG_ARMADA_37XX_CLK)	+=3D armada-37xx-periph.o
> -obj-$(CONFIG_ARMADA_XP_CLK)	+=3D armada-xp.o
> +obj-$(CONFIG_ARMADA_XP_CLK)	+=3D armada-xp.o mv98dx3236-corediv.o
>  obj-$(CONFIG_ARMADA_AP806_SYSCON) +=3D ap806-system-controller.o
>  obj-$(CONFIG_ARMADA_CP110_SYSCON) +=3D cp110-system-controller.o
>  obj-$(CONFIG_DOVE_CLK)		+=3D dove.o dove-divider.o
> diff --git a/drivers/clk/mvebu/armada-xp.c b/drivers/clk/mvebu/armada-xp.c
> index b3094315a3c0..0413bf8284e0 100644
> --- a/drivers/clk/mvebu/armada-xp.c
> +++ b/drivers/clk/mvebu/armada-xp.c
> @@ -52,6 +52,12 @@ static u32 __init axp_get_tclk_freq(void __iomem *sar)
>  	return 250000000;
>  }
>=20=20
> +/* MV98DX3236 TCLK frequency is fixed to 200MHz */
> +static u32 __init mv98dx3236_get_tclk_freq(void __iomem *sar)
> +{
> +	return 200000000;
> +}
> +
>  static const u32 axp_cpu_freqs[] __initconst =3D {
>  	1000000000,
>  	1066000000,
> @@ -89,6 +95,12 @@ static u32 __init axp_get_cpu_freq(void __iomem *sar)
>  	return cpu_freq;
>  }
>=20=20
> +/* MV98DX3236 CLK frequency is fixed to 800MHz */
> +static u32 __init mv98dx3236_get_cpu_freq(void __iomem *sar)
> +{
> +	return 800000000;
> +}
> +
>  static const int axp_nbclk_ratios[32][2] __initconst =3D {
>  	{0, 1}, {1, 2}, {2, 2}, {2, 2},
>  	{1, 2}, {1, 2}, {1, 1}, {2, 3},
> @@ -158,6 +170,14 @@ static const struct coreclk_soc_desc axp_coreclks =
=3D {
>  	.num_ratios =3D ARRAY_SIZE(axp_coreclk_ratios),
>  };
>=20=20
> +static const struct coreclk_soc_desc mv98dx3236_coreclks =3D {
> +	.get_tclk_freq =3D mv98dx3236_get_tclk_freq,
> +	.get_cpu_freq =3D mv98dx3236_get_cpu_freq,
> +	.get_clk_ratio =3D NULL,
> +	.ratios =3D NULL,
> +	.num_ratios =3D 0,
> +};
> +
>  /*
>   * Clock Gating Control
>   */
> @@ -195,6 +215,15 @@ static const struct clk_gating_soc_desc axp_gating_d=
esc[] __initconst =3D {
>  	{ }
>  };
>=20=20
> +static const struct clk_gating_soc_desc mv98dx3236_gating_desc[] __initc=
onst =3D {
> +	{ "ge1", NULL, 3, 0 },
> +	{ "ge0", NULL, 4, 0 },
> +	{ "pex00", NULL, 5, 0 },
> +	{ "sdio", NULL, 17, 0 },
> +	{ "xor0", NULL, 22, 0 },
> +	{ }
> +};
> +
>  static void __init axp_clk_init(struct device_node *np)
>  {
>  	struct device_node *cgnp =3D
> @@ -206,3 +235,16 @@ static void __init axp_clk_init(struct device_node *=
np)
>  		mvebu_clk_gating_setup(cgnp, axp_gating_desc);
>  }
>  CLK_OF_DECLARE(axp_clk, "marvell,armada-xp-core-clock", axp_clk_init);
> +
> +static void __init mv98dx3236_clk_init(struct device_node *np)
> +{
> +	struct device_node *cgnp =3D
> +		of_find_compatible_node(NULL, NULL, "marvell,armada-xp-gating-clock");
> +
> +	mvebu_coreclk_setup(np, &mv98dx3236_coreclks);
> +
> +	if (cgnp)
> +		mvebu_clk_gating_setup(cgnp, mv98dx3236_gating_desc);
> +}
> +CLK_OF_DECLARE(mv98dx3236_clk, "marvell,mv98dx3236-core-clock",
> +	       mv98dx3236_clk_init);
> diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
> index 5837eb8a212f..29f295e7a36b 100644
> --- a/drivers/clk/mvebu/clk-cpu.c
> +++ b/drivers/clk/mvebu/clk-cpu.c
> @@ -165,7 +165,9 @@ static const struct clk_ops cpu_ops =3D {
>  	.set_rate =3D clk_cpu_set_rate,
>  };
>=20=20
> -static void __init of_cpu_clk_setup(struct device_node *node)
> +/* Add parameter to allow this to support different clock operations. */
> +static void __init _of_cpu_clk_setup(struct device_node *node,
> +			const struct clk_ops *cpu_clk_ops)
>  {
>  	struct cpu_clk *cpuclk;
>  	void __iomem *clock_complex_base =3D of_iomap(node, 0);
> @@ -218,7 +220,7 @@ static void __init of_cpu_clk_setup(struct device_nod=
e *node)
>  		cpuclk[cpu].hw.init =3D &init;
>=20=20
>  		init.name =3D cpuclk[cpu].clk_name;
> -		init.ops =3D &cpu_ops;
> +		init.ops =3D cpu_clk_ops;
>  		init.flags =3D 0;
>  		init.parent_names =3D &cpuclk[cpu].parent_name;
>  		init.num_parents =3D 1;
> @@ -243,5 +245,30 @@ static void __init of_cpu_clk_setup(struct device_no=
de *node)
>  	iounmap(clock_complex_base);
>  }
>=20=20
> +/* Use this function to call the generic setup with the correct
> + * clock operation
> + */
> +static void __init of_cpu_clk_setup(struct device_node *node)
> +{
> +	_of_cpu_clk_setup(node, &cpu_ops);
> +}
> +
>  CLK_OF_DECLARE(armada_xp_cpu_clock, "marvell,armada-xp-cpu-clock",
> -					 of_cpu_clk_setup);
> +					of_cpu_clk_setup);
> +
> +/* Define the clock and operations for the mv98dx3236 - it cannot perform
> + * any operations.
> + */
> +static const struct clk_ops mv98dx3236_cpu_ops =3D {
> +	.recalc_rate =3D NULL,
> +	.round_rate =3D NULL,
> +	.set_rate =3D NULL,
> +};
> +
> +static void __init of_mv98dx3236_cpu_clk_setup(struct device_node *node)
> +{
> +	_of_cpu_clk_setup(node, &mv98dx3236_cpu_ops);
> +}
> +
> +CLK_OF_DECLARE(mv98dx3236_cpu_clock, "marvell,mv98dx3236-cpu-clock",
> +					 of_mv98dx3236_cpu_clk_setup);
> diff --git a/drivers/clk/mvebu/mv98dx3236-corediv.c b/drivers/clk/mvebu/m=
v98dx3236-corediv.c
> new file mode 100644
> index 000000000000..3060764a8e5d
> --- /dev/null
> +++ b/drivers/clk/mvebu/mv98dx3236-corediv.c
> @@ -0,0 +1,207 @@
> +/*
> + * MV98DX3236 Core divider clock
> + *
> + * Copyright (C) 2015 Allied Telesis Labs
> + *
> + * Based on armada-xp-corediv.c
> + * Copyright (C) 2015 Marvell
> + *
> + * John Thompson <john.thompson@alliedtelesis.co.nz>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +#include <linux/kernel.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include "common.h"
> +
> +#define CORE_CLK_DIV_RATIO_MASK		0xff
> +
> +#define CLK_DIV_RATIO_NAND_MASK 0x0f
> +#define CLK_DIV_RATIO_NAND_OFFSET 6
> +#define CLK_DIV_RATIO_NAND_FORCE_RELOAD_BIT 26
> +
> +#define RATIO_RELOAD_BIT BIT(10)
> +#define RATIO_REG_OFFSET 0x08
> +
> +/*
> + * This structure represents one core divider clock for the clock
> + * framework, and is dynamically allocated for each core divider clock
> + * existing in the current SoC.
> + */
> +struct clk_corediv {
> +	struct clk_hw hw;
> +	void __iomem *reg;
> +	spinlock_t lock;
> +};
> +
> +static struct clk_onecell_data clk_data;
> +
> +
> +#define to_corediv_clk(p) container_of(p, struct clk_corediv, hw)
> +
> +static int mv98dx3236_corediv_is_enabled(struct clk_hw *hwclk)
> +{
> +	/* Core divider is always active */
> +	return 1;
> +}
> +
> +static int mv98dx3236_corediv_enable(struct clk_hw *hwclk)
> +{
> +	/* always succeeds */
> +	return 0;
> +}
> +
> +static void mv98dx3236_corediv_disable(struct clk_hw *hwclk)
> +{
> +	/* can't be disabled so is left alone */
> +}
> +
> +static unsigned long mv98dx3236_corediv_recalc_rate(struct clk_hw *hwclk,
> +					 unsigned long parent_rate)
> +{
> +	struct clk_corediv *corediv =3D to_corediv_clk(hwclk);
> +	u32 reg, div;
> +
> +	reg =3D readl(corediv->reg + RATIO_REG_OFFSET);
> +	div =3D (reg >> CLK_DIV_RATIO_NAND_OFFSET) & CLK_DIV_RATIO_NAND_MASK;
> +	return parent_rate / div;
> +}
> +
> +static long mv98dx3236_corediv_round_rate(struct clk_hw *hwclk,
> +			       unsigned long rate, unsigned long *parent_rate)
> +{
> +	/* Valid ratio are 1:4, 1:5, 1:6 and 1:8 */
> +	u32 div;
> +
> +	div =3D *parent_rate / rate;
> +	if (div < 4)
> +		div =3D 4;
> +	else if (div > 6)
> +		div =3D 8;
> +
> +	return *parent_rate / div;
> +}
> +
> +static int mv98dx3236_corediv_set_rate(struct clk_hw *hwclk, unsigned lo=
ng rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_corediv *corediv =3D to_corediv_clk(hwclk);
> +	unsigned long flags =3D 0;
> +	u32 reg, div;
> +
> +	div =3D parent_rate / rate;
> +
> +	spin_lock_irqsave(&corediv->lock, flags);
> +
> +	/* Write new divider to the divider ratio register */
> +	reg =3D readl(corediv->reg + RATIO_REG_OFFSET);
> +	reg &=3D ~(CLK_DIV_RATIO_NAND_MASK << CLK_DIV_RATIO_NAND_OFFSET);
> +	reg |=3D (div & CLK_DIV_RATIO_NAND_MASK) << CLK_DIV_RATIO_NAND_OFFSET;
> +	writel(reg, corediv->reg + RATIO_REG_OFFSET);
> +
> +	/* Set reload-force for this clock */
> +	reg =3D readl(corediv->reg) | BIT(CLK_DIV_RATIO_NAND_FORCE_RELOAD_BIT);
> +	writel(reg, corediv->reg);
> +
> +	/* Now trigger the clock update */
> +	reg =3D readl(corediv->reg + RATIO_REG_OFFSET) | RATIO_RELOAD_BIT;
> +	writel(reg, corediv->reg + RATIO_REG_OFFSET);
> +
> +	/*
> +	 * Wait for clocks to settle down, and then clear all the
> +	 * ratios request and the reload request.
> +	 */
> +	udelay(1000);
> +	reg &=3D ~(CORE_CLK_DIV_RATIO_MASK | RATIO_RELOAD_BIT);
> +	writel(reg, corediv->reg + RATIO_REG_OFFSET);
> +	udelay(1000);
> +
> +	spin_unlock_irqrestore(&corediv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops ops =3D {
> +	.enable =3D mv98dx3236_corediv_enable,
> +	.disable =3D mv98dx3236_corediv_disable,
> +	.is_enabled =3D mv98dx3236_corediv_is_enabled,
> +	.recalc_rate =3D mv98dx3236_corediv_recalc_rate,
> +	.round_rate =3D mv98dx3236_corediv_round_rate,
> +	.set_rate =3D mv98dx3236_corediv_set_rate,
> +};
> +
> +static void __init mv98dx3236_corediv_clk_init(struct device_node *node)
> +{
> +	struct clk_init_data init;
> +	struct clk_corediv *corediv;
> +	struct clk **clks;
> +	void __iomem *base;
> +	const __be32 *off;
> +	const char *parent_name;
> +	const char *clk_name;
> +	int len;
> +	struct device_node *dfx_node;
> +
> +	dfx_node =3D of_parse_phandle(node, "base", 0);
> +	if (WARN_ON(!dfx_node))
> +		return;
> +
> +	off =3D of_get_property(node, "reg", &len);
> +	if (WARN_ON(!off))
> +		return;
> +
> +	base =3D of_iomap(dfx_node, 0);
> +	if (WARN_ON(!base))
> +		return;
> +
> +	of_node_put(dfx_node);
> +
> +	parent_name =3D of_clk_get_parent_name(node, 0);
> +
> +	clk_data.clk_num =3D 1;
> +
> +	/* clks holds the clock array */
> +	clks =3D kcalloc(clk_data.clk_num, sizeof(struct clk *),
> +				GFP_KERNEL);
> +	if (WARN_ON(!clks))
> +		goto err_unmap;
> +	/* corediv holds the clock specific array */
> +	corediv =3D kcalloc(clk_data.clk_num, sizeof(struct clk_corediv),
> +				GFP_KERNEL);
> +	if (WARN_ON(!corediv))
> +		goto err_free_clks;
> +
> +	spin_lock_init(&corediv->lock);
> +
> +	of_property_read_string_index(node, "clock-output-names",
> +					  0, &clk_name);
> +
> +	init.num_parents =3D 1;
> +	init.parent_names =3D &parent_name;
> +	init.name =3D clk_name;
> +	init.ops =3D &ops;
> +	init.flags =3D 0;
> +
> +	corediv[0].reg =3D (void *)((int)base + be32_to_cpu(*off));
> +	corediv[0].hw.init =3D &init;
> +
> +	clks[0] =3D clk_register(NULL, &corediv[0].hw);
> +	WARN_ON(IS_ERR(clks[0]));
> +
> +	clk_data.clks =3D clks;
> +	of_clk_add_provider(node, of_clk_src_onecell_get, &clk_data);
> +	return;
> +
> +err_free_clks:
> +	kfree(clks);
> +err_unmap:
> +	iounmap(base);
> +}
> +
> +CLK_OF_DECLARE(mv98dx3236_corediv_clk, "marvell,mv98dx3236-corediv-clock=
",
> +	       mv98dx3236_corediv_clk_init);
> --=20
> 2.11.0.24.ge6920cf
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
