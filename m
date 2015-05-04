Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 4 May 2015 14:51:46 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: sunxi: support the cpus (cpu special) clock
 on the Allwinner A80
Message-ID: <20150504125146.GA3274@lukather>
References: <1430410206-4410-1-git-send-email-wens@csie.org>
 <1430410206-4410-3-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
In-Reply-To: <1430410206-4410-3-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 01, 2015 at 12:10:03AM +0800, Chen-Yu Tsai wrote:
> The "cpus" clock is the clock for the embedded processor in the A80.
> It is also part of the PRCM clock tree.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
>  drivers/clk/sunxi/Makefile                        |   2 +-
>  drivers/clk/sunxi/clk-sun9i-cpus.c                | 243 ++++++++++++++++=
++++++
>  3 files changed, 245 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/sunxi/clk-sun9i-cpus.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index 2015b2beb957..c52735b0b924 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -27,6 +27,7 @@ Required properties:
>  	"allwinner,sun5i-a10s-ahb-gates-clk" - for the AHB gates on A10s
>  	"allwinner,sun7i-a20-ahb-gates-clk" - for the AHB gates on A20
>  	"allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
> +	"allwinner,sun9i-a80-cpus-clk" - for the CPUS on A80
>  	"allwinner,sun6i-a31-ahb1-clk" - for the AHB1 clock on A31
>  	"allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
>  	"allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 058f273d6154..f0f33131b048 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -13,4 +13,4 @@ obj-y +=3D clk-usb.o
> =20
>  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
>  	clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
> -	clk-sun8i-apb0.o
> +	clk-sun8i-apb0.o clk-sun9i-cpus.o

I'm really not sure about that option selection.

If you only select the A31, you will get drivers that won't be
relevant at all here.

How about something like

ifeq ($(CONFIG_MFD_SUN6I_PRCM), y)
obj-$(CONFIG_MACH_SUN6I) =3D ....
obj-$(CONFIG_MACH_SUN8I) =3D ....
obj-$(CONFIG_MACH_SUN9I) =3D ....
endif

?

> diff --git a/drivers/clk/sunxi/clk-sun9i-cpus.c b/drivers/clk/sunxi/clk-s=
un9i-cpus.c
> new file mode 100644
> index 000000000000..1ec61ccf8cbf
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-sun9i-cpus.c
> @@ -0,0 +1,243 @@
> +/*
> + * Copyright (C) 2015 Chen-Yu Tsai
> + *
> + * Chen-Yu Tsai <wens@csie.org>
> + *
> + * Allwinner A80 CPUS clock driver
> + *
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static DEFINE_SPINLOCK(sun9i_a80_cpus_lock);
> +
> +/**
> + * sun9i_a80_cpus_clk_setup() - Setup function for a80 cpus composite clk
> + */
> +
> +#define SUN9I_CPUS_MAX_PARENTS		4
> +#define SUN9I_CPUS_MUX_PARENT_PLL4	3
> +#define SUN9I_CPUS_MUX_SHIFT		16
> +/* un-shifted mask is what mux_clk expects */
> +#define SUN9I_CPUS_MUX_MASK		0x3
> +#define SUN9I_CPUS_MUX_GET_PARENT(reg)	((reg >> SUN9I_CPUS_MUX_SHIFT) & \
> +					 SUN9I_CPUS_MUX_MASK)
> +
> +#define SUN9I_CPUS_DIV_SHIFT		4
> +#define SUN9I_CPUS_DIV_MASK		(0x3 << SUN9I_CPUS_DIV_SHIFT)
> +#define SUN9I_CPUS_DIV_GET(reg)		((reg & SUN9I_CPUS_DIV_MASK) >> \
> +						SUN9I_CPUS_DIV_SHIFT)
> +#define SUN9I_CPUS_DIV_SET(reg, div)	((reg & ~SUN9I_CPUS_DIV_MASK) | \
> +						(div << SUN9I_CPUS_DIV_SHIFT))
> +#define SUN9I_CPUS_PLL4_DIV_SHIFT	8
> +#define SUN9I_CPUS_PLL4_DIV_MASK	(0x1f << SUN9I_CPUS_PLL4_DIV_SHIFT)

You have some masks that are shifted, some that are not.

I don't really have a preference, but being consistent would be great.

(and you can use GENMASK to generate your masks).

> +#define SUN9I_CPUS_PLL4_DIV_GET(reg)	((reg & SUN9I_CPUS_PLL4_DIV_MASK) >=
> \
> +						SUN9I_CPUS_PLL4_DIV_SHIFT)
> +#define SUN9I_CPUS_PLL4_DIV_SET(reg, div) ((reg & ~SUN9I_CPUS_PLL4_DIV_M=
ASK) | \
> +						(div << SUN9I_CPUS_PLL4_DIV_SHIFT))
> +
> +struct sun9i_a80_cpus_clk {
> +	struct clk_hw hw;
> +	void __iomem *reg;
> +};
> +
> +#define to_sun9i_a80_cpus_clk(_hw) container_of(_hw, struct sun9i_a80_cp=
us_clk, hw)
> +
> +static unsigned long sun9i_a80_cpus_clk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)

These lines above generate checkpatch warnings, please fix them.

> +	struct sun9i_a80_cpus_clk *cpus =3D to_sun9i_a80_cpus_clk(hw);
> +	unsigned long rate;
> +	u32 reg;
> +
> +	/* Fetch the register value */
> +	reg =3D readl(cpus->reg);
> +
> +	/* apply pre-divider first if parent is pll4 */
> +	if (SUN9I_CPUS_MUX_GET_PARENT(reg) =3D=3D SUN9I_CPUS_MUX_PARENT_PLL4)
> +		parent_rate /=3D SUN9I_CPUS_PLL4_DIV_GET(reg) + 1;
> +
> +	/* clk divider */
> +	rate =3D parent_rate / (SUN9I_CPUS_DIV_GET(reg) + 1);
> +
> +	return rate;
> +}
> +
> +static long sun9i_a80_cpus_clk_round(unsigned long rate, u8 *divp, u8 *p=
re_divp,
> +				 u8 parent, unsigned long parent_rate)
> +{
> +	u8 div, pre_div =3D 1;
> +
> +	/*
> +	 * clock can only divide, so we will never be able to achieve
> +	 * frequencies higher than the parent frequency
> +	 */
> +	if (parent_rate && rate > parent_rate)
> +		rate =3D parent_rate;
> +
> +	div =3D DIV_ROUND_UP(parent_rate, rate);
> +
> +	/* calculate pre-divider if parent is pll4 */
> +	if (parent =3D=3D SUN9I_CPUS_MUX_PARENT_PLL4 && div > 4) {
> +		/* pre-divider is 1 ~ 32 */
> +		if (div < 32) {
> +			pre_div =3D div;
> +			div =3D 1;
> +		} else if (div < 64) {
> +			pre_div =3D DIV_ROUND_UP(div, 2);
> +			div =3D 2;
> +		} else if (div < 96) {
> +			pre_div =3D DIV_ROUND_UP(div, 3);
> +			div =3D 3;
> +		} else {
> +			pre_div =3D DIV_ROUND_UP(div, 4);
> +			div =3D 4;
> +		}
> +	}
> +
> +	/* we were asked to pass back divider values */
> +	if (divp) {
> +		*divp =3D div - 1;
> +		*pre_divp =3D pre_div - 1;
> +	}
> +
> +	return parent_rate / pre_div / div;
> +}
> +
> +static long sun9i_a80_cpus_clk_determine_rate(struct clk_hw *hw,
> +					      unsigned long rate,
> +					      unsigned long min_rate,
> +					      unsigned long max_rate,
> +					      unsigned long *best_parent_rate,
> +					      struct clk_hw **best_parent_clk)
> +{
> +	struct clk *clk =3D hw->clk, *parent, *best_parent =3D NULL;
> +	int i, num_parents;
> +	unsigned long parent_rate, best =3D 0, child_rate, best_child_rate =3D =
0;
> +
> +	/* find the parent that can help provide the fastest rate <=3D rate */
> +	num_parents =3D __clk_get_num_parents(clk);
> +	for (i =3D 0; i < num_parents; i++) {
> +		parent =3D clk_get_parent_by_index(clk, i);
> +		if (!parent)
> +			continue;
> +		if (__clk_get_flags(clk) & CLK_SET_RATE_PARENT)
> +			parent_rate =3D __clk_round_rate(parent, rate);
> +		else
> +			parent_rate =3D __clk_get_rate(parent);
> +
> +		child_rate =3D sun9i_a80_cpus_clk_round(rate, NULL, NULL, i,
> +						  parent_rate);
> +
> +		if (child_rate <=3D rate && child_rate > best_child_rate) {
> +			best_parent =3D parent;
> +			best =3D parent_rate;
> +			best_child_rate =3D child_rate;
> +		}
> +	}
> +
> +	if (best_parent)
> +		*best_parent_clk =3D __clk_get_hw(best_parent);
> +	*best_parent_rate =3D best;
> +
> +	return best_child_rate;
> +}
> +
> +static int sun9i_a80_cpus_clk_set_rate(struct clk_hw *hw, unsigned long =
rate,
> +				   unsigned long parent_rate)
> +{
> +	struct sun9i_a80_cpus_clk *cpus =3D to_sun9i_a80_cpus_clk(hw);
> +	unsigned long flags;
> +	u8 div, pre_div, parent;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&sun9i_a80_cpus_lock, flags);
> +
> +	reg =3D readl(cpus->reg);
> +
> +	/* need to know which parent is used to apply pre-divider */
> +	parent =3D SUN9I_CPUS_MUX_GET_PARENT(reg);
> +	sun9i_a80_cpus_clk_round(rate, &div, &pre_div, parent, parent_rate);
> +
> +	reg =3D SUN9I_CPUS_DIV_SET(reg, div);
> +	reg =3D SUN9I_CPUS_PLL4_DIV_SET(reg, pre_div);
> +	writel(reg, cpus->reg);
> +
> +	spin_unlock_irqrestore(&sun9i_a80_cpus_lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops sun9i_a80_cpus_clk_ops =3D {
> +	.determine_rate	=3D sun9i_a80_cpus_clk_determine_rate,
> +	.recalc_rate	=3D sun9i_a80_cpus_clk_recalc_rate,
> +	.set_rate	=3D sun9i_a80_cpus_clk_set_rate,
> +};

It all looks like you could use the factors clock for this.

The only thing that you seem to be using a custom clock for is the pre
divider on one of the parent, but that's something that could be
reused for other clocks (like the A10 pll6, or the A20 MBUS).

> +
> +static int sun9i_a80_cpus_clk_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	const char *clk_name =3D np->name;
> +	const char *parents[SUN9I_CPUS_MAX_PARENTS];
> +	struct resource *r;
> +	struct sun9i_a80_cpus_clk *cpus;
> +	struct clk_mux *mux;
> +	struct clk *clk;
> +	int i =3D 0;
> +
> +	cpus =3D devm_kzalloc(&pdev->dev, sizeof(*cpus), GFP_KERNEL);
> +	if (!cpus)
> +		return -ENOMEM;
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	cpus->reg =3D devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(cpus->reg))
> +		return PTR_ERR(cpus->reg);
> +
> +	/* we have a mux, we will have >1 parents */
> +	while (i < SUN9I_CPUS_MAX_PARENTS &&
> +	       (parents[i] =3D of_clk_get_parent_name(np, i)) !=3D NULL)
> +		i++;
> +
> +	of_property_read_string(np, "clock-output-names", &clk_name);
> +
> +	mux =3D devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
> +	if (!mux)
> +		return -ENOMEM;
> +
> +	/* set up clock properties */
> +	mux->reg =3D cpus->reg;
> +	mux->shift =3D SUN9I_CPUS_MUX_SHIFT;
> +	mux->mask =3D SUN9I_CPUS_MUX_MASK;
> +	mux->lock =3D &sun9i_a80_cpus_lock;
> +
> +	clk =3D clk_register_composite(NULL, clk_name, parents, i,
> +				     &mux->hw, &clk_mux_ops,
> +				     &cpus->hw, &sun9i_a80_cpus_clk_ops,
> +				     NULL, NULL, 0);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	return of_clk_add_provider(np, of_clk_src_simple_get, clk);
> +}
> +
> +static const struct of_device_id sun9i_a80_cpus_clk_dt_ids[] =3D {
> +	{ .compatible =3D "allwinner,sun9i-a80-cpus-clk" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver sun9i_a80_cpus_clk_driver =3D {
> +	.driver =3D {
> +		.name =3D "sun9i-a80-cpus-clk",
> +		.of_match_table =3D sun9i_a80_cpus_clk_dt_ids,
> +	},
> +	.probe =3D sun9i_a80_cpus_clk_probe,
> +};
> +module_platform_driver(sun9i_a80_cpus_clk_driver);
> +
> +MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
> +MODULE_DESCRIPTION("Allwinner A80 CPUS Clock Driver");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.1.4
>=20

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVR2tiAAoJEBx+YmzsjxAgLQQP/R52hWEcFBB/MHs82If8aSdc
Y6cZfceM/UddbUdnGA0x3VMkT6IZxJTPhu6flWaV9bOyc9FUtMp3ls7THpsYV6wz
NWf3HL9D6iLuUd0WI6oTl34sHo5jzynmC77lsgyGkdkNOmezZQBnf5glT9iiD/KP
zox9d/uBr8TEV9ppqHkbFOYYoIp7+6fCLdDGq0bnmU9IC5vIyE6pIS9B4ynviRlY
yELznQ6HWlGmeBE+NFL+zxfOaadQ3odURDVsqMDWCprhEsKC652nQTqk8hYrPgBJ
JfN8/loGftALRLZk/he/JdRcMY3bxlXh+Q0mVeJk1tcfUNfa29oIhjlnf6runoug
funvKIjliTfol6Iprc2EwjWux7gIqMmAmpEFJNgP0c515EH1SNLemkZpVoZCMKzV
e750W0B8/EC8sRwdxnNtStBcY3TJaFPZV20hnmdH+rGqjm9ogrm3NEoKPrgEySqC
NtUVsSCdP0xT7dtvn+ibxo1uMsKtFsrK6HJ6Fw67Zt0kuJyP9zrcererQxQeS+Dn
asFWDzk50KGxayF9FEa6O9CsLqdiqGzHqFvF9sFggn/PODv2oSANlM9TLPHDfs0g
RbTdlNLjDZHifalSOhs8wescimkR6iZSoLaybfZToW0YQjgegWSG3SJWd8ubxp2f
OTaQm5Op3WXJxD5zDTWL
=HUN4
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
