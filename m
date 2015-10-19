Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Oct 2015 15:27:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: lpc18xx-cgu: fix potential system hang when
 disabling unused clocks
Message-ID: <20151019222743.GD19782@codeaurora.org>
References: <1440527643-2960-1-git-send-email-manabian@gmail.com>
 <1440527643-2960-3-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440527643-2960-3-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/25, Joachim Eastwood wrote:
> diff --git a/drivers/clk/nxp/clk-lpc18xx-cgu.c b/drivers/clk/nxp/clk-lpc18xx-cgu.c
> index e0a3cb8970ab..3d8d0ac38f96 100644
> --- a/drivers/clk/nxp/clk-lpc18xx-cgu.c
> +++ b/drivers/clk/nxp/clk-lpc18xx-cgu.c
> @@ -8,6 +8,7 @@
>   * warranty of any kind, whether express or implied.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
> @@ -480,6 +481,42 @@ static const struct clk_ops lpc18xx_pll1_ops = {
>  	.recalc_rate = lpc18xx_pll1_recalc_rate,
>  };
>  
> +static int lpc18xx_cgu_gate_enabled(struct clk_hw *hw)

s/enabled/enable/?

> +{
> +	return clk_gate_ops.enable(hw);
> +}
> +
> +static void lpc18xx_cgu_gate_disable(struct clk_hw *hw)
> +{
> +	clk_gate_ops.disable(hw);
> +}
> +
> +static int lpc18xx_cgu_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk *parent;
> +
> +	/*
> +	 * The consumer of base clocks needs know if the
> +	 * base clock is really enabled before it can be
> +	 * accessed. It is therefore necessary to verify
> +	 * this all the way up.
> +	 */
> +	parent = clk_get_parent(hw->clk);
> +	if (IS_ERR(parent))
> +		return 0;
> +
> +	if (!__clk_is_enabled(parent))

Same comment as in patch 1.

> +		return 0;
> +
> +	return clk_gate_ops.is_enabled(hw);
> +}
> +
> +static const struct clk_ops lpc18xx_gate_ops = {
> +	.enable = lpc18xx_cgu_gate_enabled,
> +	.disable = lpc18xx_cgu_gate_disable,
> +	.is_enabled = lpc18xx_cgu_gate_is_enabled,
> +};
> +
>  static struct lpc18xx_cgu_pll_clk lpc18xx_cgu_src_clk_plls[] = {
>  	LPC1XX_CGU_CLK_PLL(PLL0USB,	pll0_src_ids, pll0_ops),
>  	LPC1XX_CGU_CLK_PLL(PLL0AUDIO,	pll0_src_ids, pll0_ops),

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
