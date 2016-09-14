Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 14:45:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 1/4] clk: sunxi-ng: Add A64 clocks
Message-ID: <20160914214554.GH7243@codeaurora.org>
References: <20160909201029.24530-1-maxime.ripard@free-electrons.com>
 <20160909201029.24530-2-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160909201029.24530-2-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/09, Maxime Ripard wrote:
> index 106cba27c331..964f22091a10 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -22,3 +22,4 @@ obj-$(CONFIG_SUN6I_A31_CCU)	+= ccu-sun6i-a31.o
>  obj-$(CONFIG_SUN8I_A23_CCU)	+= ccu-sun8i-a23.o
>  obj-$(CONFIG_SUN8I_A33_CCU)	+= ccu-sun8i-a33.o
>  obj-$(CONFIG_SUN8I_H3_CCU)	+= ccu-sun8i-h3.o
> +obj-$(CONFIG_SUN50I_A64_CCU)	+= ccu-sun50i-a64.o

Maybe do alphanumeric ordering?

> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> new file mode 100644
> index 000000000000..d51ee416f515
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -0,0 +1,870 @@
> +
> +static void __init sun50i_a64_ccu_setup(struct device_node *node)
> +{
> +	void __iomem *reg;
> +	u32 val;
> +
> +	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Could not map the clock registers\n",
> +		       of_node_full_name(node));
> +		return;
> +	}
> +
> +	/* Force the PLL-Audio-1x divider to 4 */
> +	val = readl(reg + SUN50I_A64_PLL_AUDIO_REG);
> +	val &= ~GENMASK(19, 16);
> +	writel(val | (3 << 16), reg + SUN50I_A64_PLL_AUDIO_REG);
> +
> +	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> +
> +	sunxi_ccu_probe(node, reg, &sun50i_a64_ccu_desc);
> +}
> +CLK_OF_DECLARE(sun50i_a64_ccu, "allwinner,sun50i-a64-ccu",
> +	       sun50i_a64_ccu_setup);

Is there a reason it can't be a platform driver?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
