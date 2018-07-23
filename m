Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] clk: meson: meson8b: register the clock controller
 early
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
 khilman@baylibre.com, linux-clk@vger.kernel.org
References: <20180721191400.15558-1-martin.blumenstingl@googlemail.com>
 <20180721191400.15558-2-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <48cd5097-1567-2af4-55e9-ce9e2a103da1@baylibre.com>
Date: Mon, 23 Jul 2018 09:54:18 +0200
MIME-Version: 1.0
In-Reply-To: <20180721191400.15558-2-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 21/07/2018 21:13, Martin Blumenstingl wrote:
> Until now only the reset controller (part of the clock controller
> register space) was registered early in the boot process, while the
> clock controller itself was registered later on.
> However, some parts of the SoC are initialized early in the boot process,
> such as the SRAM and the TWD timer. The bootloader already enables these
> clocks so we didn't see any issues so far.
> 
> Register the clock controller early so other drivers (such as the SRAM
> and TWD timer) can use the clocks early in the boot process.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 94 ++++++++++++++-----------------------
>  1 file changed, 34 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 17f56f600e09..1caaa780201b 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -11,7 +11,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/init.h>
>  #include <linux/of_address.h>
> -#include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include <linux/regmap.h>
> @@ -22,8 +21,6 @@
>  
>  static DEFINE_SPINLOCK(meson_clk_lock);
>  
> -static void __iomem *clk_base;
> -
>  struct meson8b_clk_reset {
>  	struct reset_controller_dev reset;
>  	void __iomem *base;
> @@ -1106,62 +1103,12 @@ static const struct regmap_config clkc_regmap_config = {
>  	.reg_stride     = 4,
>  };
>  
> -static int meson8b_clkc_probe(struct platform_device *pdev)
> -{
> -	int ret, i;
> -	struct device *dev = &pdev->dev;
> -	struct regmap *map;
> -
> -	if (!clk_base)
> -		return -ENXIO;
> -
> -	map = devm_regmap_init_mmio(dev, clk_base, &clkc_regmap_config);
> -	if (IS_ERR(map))
> -		return PTR_ERR(map);
> -
> -	/* Populate regmap for the regmap backed clocks */
> -	for (i = 0; i < ARRAY_SIZE(meson8b_clk_regmaps); i++)
> -		meson8b_clk_regmaps[i]->map = map;
> -
> -	/*
> -	 * register all clks
> -	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
> -	 */
> -	for (i = CLKID_XTAL; i < CLK_NR_CLKS; i++) {
> -		/* array might be sparse */
> -		if (!meson8b_hw_onecell_data.hws[i])
> -			continue;
> -
> -		ret = devm_clk_hw_register(dev, meson8b_hw_onecell_data.hws[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> -					   &meson8b_hw_onecell_data);
> -}
> -
> -static const struct of_device_id meson8b_clkc_match_table[] = {
> -	{ .compatible = "amlogic,meson8-clkc" },
> -	{ .compatible = "amlogic,meson8b-clkc" },
> -	{ .compatible = "amlogic,meson8m2-clkc" },
> -	{ }
> -};
> -
> -static struct platform_driver meson8b_driver = {
> -	.probe		= meson8b_clkc_probe,
> -	.driver		= {
> -		.name	= "meson8b-clkc",
> -		.of_match_table = meson8b_clkc_match_table,
> -	},
> -};
> -
> -builtin_platform_driver(meson8b_driver);
> -
> -static void __init meson8b_clkc_reset_init(struct device_node *np)
> +static void __init meson8b_clkc_init(struct device_node *np)
>  {
>  	struct meson8b_clk_reset *rstc;
> -	int ret;
> +	void __iomem *clk_base;
> +	struct regmap *map;
> +	int i, ret;
>  
>  	/* Generic clocks, PLLs and some of the reset-bits */
>  	clk_base = of_iomap(np, 1);
> @@ -1170,6 +1117,10 @@ static void __init meson8b_clkc_reset_init(struct device_node *np)
>  		return;
>  	}
>  
> +	map = regmap_init_mmio(NULL, clk_base, &clkc_regmap_config);
> +	if (IS_ERR(map))
> +		return;
> +
>  	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
>  	if (!rstc)
>  		return;
> @@ -1185,11 +1136,34 @@ static void __init meson8b_clkc_reset_init(struct device_node *np)
>  		       __func__, ret);
>  		return;
>  	}
> +
> +	/* Populate regmap for the regmap backed clocks */
> +	for (i = 0; i < ARRAY_SIZE(meson8b_clk_regmaps); i++)
> +		meson8b_clk_regmaps[i]->map = map;
> +
> +	/*
> +	 * register all clks
> +	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
> +	 */
> +	for (i = CLKID_XTAL; i < CLK_NR_CLKS; i++) {
> +		/* array might be sparse */
> +		if (!meson8b_hw_onecell_data.hws[i])
> +			continue;
> +
> +		ret = clk_hw_register(NULL, meson8b_hw_onecell_data.hws[i]);
> +		if (ret)
> +			return;
> +	}
> +
> +	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
> +				     &meson8b_hw_onecell_data);
> +	if (ret)
> +		pr_err("%s: failed to register clock provider\n", __func__);
>  }
>  
>  CLK_OF_DECLARE_DRIVER(meson8_clkc, "amlogic,meson8-clkc",
> -		      meson8b_clkc_reset_init);
> +		      meson8b_clkc_init);
>  CLK_OF_DECLARE_DRIVER(meson8b_clkc, "amlogic,meson8b-clkc",
> -		      meson8b_clkc_reset_init);
> +		      meson8b_clkc_init);
>  CLK_OF_DECLARE_DRIVER(meson8m2_clkc, "amlogic,meson8m2-clkc",
> -		      meson8b_clkc_reset_init);
> +		      meson8b_clkc_init);
> 

Hi Martin,

Yes this will register early, but the CCF maintainers want to get rid of this and switch
new drivers to actual drivers, the solution is to switch to core_initcall/postcore_initcall/subsys_initcall
depending on when the SRAM and TWD are registered.

Neil
