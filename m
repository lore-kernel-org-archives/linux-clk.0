Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55C910E5.3080206@gmail.com>
Date: Mon, 10 Aug 2015 23:00:21 +0200
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 05/26] clk: Convert __clk_get_flags() to clk_hw_get_flags()
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org> <1438362246-6664-6-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-6-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 31.07.2015 19:03, Stephen Boyd wrote:
> Mostly converted with the following snippet:
>
> @@
> struct clk_hw *E;
> @@
>
> -__clk_get_flags(E->clk)
> +clk_hw_get_flags(E)
>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Coquelin <mcoquelin.stm32@gmail.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

I guess this already is in some branch to get merged.
Anyway, of course you get my belated

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

for the clk-si5351 part.


> ---
>   drivers/clk/clk-cdce706.c       | 2 +-
>   drivers/clk/clk-composite.c     | 2 +-
>   drivers/clk/clk-divider.c       | 2 +-
>   drivers/clk/clk-fixed-factor.c  | 2 +-
>   drivers/clk/clk-si5351.c        | 4 ++--
>   drivers/clk/clk-stm32f4.c       | 2 +-
>   drivers/clk/qcom/clk-rcg.c      | 2 +-
>   drivers/clk/qcom/clk-rcg2.c     | 2 +-
>   drivers/clk/st/clk-flexgen.c    | 2 +-
>   drivers/clk/sunxi/clk-factors.c | 2 +-
>   drivers/clk/sunxi/clk-sunxi.c   | 2 +-
>   drivers/clk/ti/clk.c            | 4 ++--
>   drivers/clk/ti/clockdomain.c    | 4 ++--
>   drivers/clk/ti/divider.c        | 2 +-
>   drivers/clk/ti/dpll.c           | 4 ++--
>   drivers/clk/ti/dpll3xxx.c       | 2 +-
>   drivers/clk/ti/interface.c      | 2 +-
>   17 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
> index 21830526fd8e..01877f64eff6 100644
> --- a/drivers/clk/clk-cdce706.c
> +++ b/drivers/clk/clk-cdce706.c
> @@ -310,7 +310,7 @@ static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>   	if (!mul)
>   		div = CDCE706_DIVIDER_DIVIDER_MAX;
>
> -	if (__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT) {
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>   		unsigned long best_diff = rate;
>   		unsigned long best_div = 0;
>   		struct clk *gp_clk = cdce->clkin_clk[cdce->clkin[0].parent];
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index 7835cc4d1cf9..15bbe7e96e10 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -78,7 +78,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
>   		   mux_hw && mux_ops && mux_ops->set_parent) {
>   		req->best_parent_hw = NULL;
>
> -		if (__clk_get_flags(hw->clk) & CLK_SET_RATE_NO_REPARENT) {
> +		if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
>   			parent = clk_get_parent(mux_hw->clk);
>   			req->best_parent_hw = __clk_get_hw(parent);
>   			req->best_parent_rate = __clk_get_rate(parent);
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index a417162537b8..79003042aabb 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -290,7 +290,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
>
>   	maxdiv = _get_maxdiv(table, width, flags);
>
> -	if (!(__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT)) {
> +	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
>   		parent_rate = *best_parent_rate;
>   		bestdiv = _div_round(table, parent_rate, rate, flags);
>   		bestdiv = bestdiv == 0 ? 1 : bestdiv;
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> index fccabe497f6e..4a8ebfd82734 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -41,7 +41,7 @@ static long clk_factor_round_rate(struct clk_hw *hw, unsigned long rate,
>   {
>   	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
>
> -	if (__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT) {
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>   		unsigned long best_parent;
>
>   		best_parent = (rate / fix->mult) * fix->div;
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 9e6de57eae3b..aa31ac5f5439 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -663,7 +663,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
>   		divby4 = 1;
>
>   	/* multisync can set pll */
> -	if (__clk_get_flags(hwdata->hw.clk) & CLK_SET_RATE_PARENT) {
> +	if (clk_hw_get_flags(hwdata->hw) & CLK_SET_RATE_PARENT) {
>   		/*
>   		 * find largest integer divider for max
>   		 * vco frequency and given target rate
> @@ -1013,7 +1013,7 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
>   		rate = SI5351_CLKOUT_MIN_FREQ;
>
>   	/* request frequency if multisync master */
> -	if (__clk_get_flags(hwdata->hw.clk) & CLK_SET_RATE_PARENT) {
> +	if (clk_hw_get_flags(hwdata->hw) & CLK_SET_RATE_PARENT) {
>   		/* use r divider for frequencies below 1MHz */
>   		rdiv = SI5351_OUTPUT_CLK_DIV_1;
>   		while (rate < SI5351_MULTISYNTH_MIN_FREQ &&
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 3f6f7ad39490..5cfe50717536 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -175,7 +175,7 @@ static long clk_apb_mul_round_rate(struct clk_hw *hw, unsigned long rate,
>   	if (readl(base + STM32F4_RCC_CFGR) & BIT(am->bit_idx))
>   		mult = 2;
>
> -	if (__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT) {
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>   		unsigned long best_parent = rate / mult;
>
>   		*prate =
> diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
> index e5c60826b7a9..070162abc2b6 100644
> --- a/drivers/clk/qcom/clk-rcg.c
> +++ b/drivers/clk/qcom/clk-rcg.c
> @@ -420,7 +420,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
>   	if (index < 0)
>   		return index;
>
> -	clk_flags = __clk_get_flags(hw->clk);
> +	clk_flags = clk_hw_get_flags(hw);
>   	p = clk_get_parent_by_index(hw->clk, index);
>   	if (clk_flags & CLK_SET_RATE_PARENT) {
>   		rate = rate * f->pre_div;
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index d1d24917c531..98cf7192a61d 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -192,7 +192,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw,
>   	if (index < 0)
>   		return index;
>
> -	clk_flags = __clk_get_flags(hw->clk);
> +	clk_flags = clk_hw_get_flags(hw);
>   	p = clk_get_parent_by_index(hw->clk, index);
>   	if (clk_flags & CLK_SET_RATE_PARENT) {
>   		if (f->pre_div) {
> diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
> index ec20a2c6f9f3..965b13ba3515 100644
> --- a/drivers/clk/st/clk-flexgen.c
> +++ b/drivers/clk/st/clk-flexgen.c
> @@ -109,7 +109,7 @@ static long flexgen_round_rate(struct clk_hw *hw, unsigned long rate,
>   	/* Round div according to exact prate and wished rate */
>   	div = clk_best_div(*prate, rate);
>
> -	if (__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT) {
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>   		*prate = rate * div;
>   		return rate;
>   	}
> diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
> index 574a3da33b58..b8c3ee5688f4 100644
> --- a/drivers/clk/sunxi/clk-factors.c
> +++ b/drivers/clk/sunxi/clk-factors.c
> @@ -92,7 +92,7 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
>   		parent = clk_get_parent_by_index(clk, i);
>   		if (!parent)
>   			continue;
> -		if (__clk_get_flags(clk) & CLK_SET_RATE_PARENT)
> +		if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)
>   			parent_rate = __clk_round_rate(parent, req->rate);
>   		else
>   			parent_rate = __clk_get_rate(parent);
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 76e07a19ad38..305193db6048 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -133,7 +133,7 @@ static int sun6i_ahb1_clk_determine_rate(struct clk_hw *hw,
>   		parent = clk_get_parent_by_index(clk, i);
>   		if (!parent)
>   			continue;
> -		if (__clk_get_flags(clk) & CLK_SET_RATE_PARENT)
> +		if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)
>   			parent_rate = __clk_round_rate(parent, req->rate);
>   		else
>   			parent_rate = __clk_get_rate(parent);
> diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
> index ace35047783b..b5bcd77e8d0f 100644
> --- a/drivers/clk/ti/clk.c
> +++ b/drivers/clk/ti/clk.c
> @@ -339,11 +339,11 @@ struct clk __init *ti_clk_register_clk(struct ti_clk *setup)
>   	if (!IS_ERR(clk)) {
>   		setup->clk = clk;
>   		if (setup->clkdm_name) {
> -			if (__clk_get_flags(clk) & CLK_IS_BASIC) {
> +			clk_hw = __clk_get_hw(clk);
> +			if (clk_hw_get_flags(clk_hw) & CLK_IS_BASIC) {
>   				pr_warn("can't setup clkdm for basic clk %s\n",
>   					setup->name);
>   			} else {
> -				clk_hw = __clk_get_hw(clk);
>   				to_clk_hw_omap(clk_hw)->clkdm_name =
>   					setup->clkdm_name;
>   				omap2_init_clk_clkdm(clk_hw);
> diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
> index 08a38c954510..362a62c10311 100644
> --- a/drivers/clk/ti/clockdomain.c
> +++ b/drivers/clk/ti/clockdomain.c
> @@ -120,12 +120,12 @@ static void __init of_ti_clockdomain_setup(struct device_node *node)
>   			       __func__, node->full_name, i, PTR_ERR(clk));
>   			continue;
>   		}
> -		if (__clk_get_flags(clk) & CLK_IS_BASIC) {
> +		clk_hw = __clk_get_hw(clk);
> +		if (clk_hw_get_flags(clk_hw) & CLK_IS_BASIC) {
>   			pr_warn("can't setup clkdm for basic clk %s\n",
>   				__clk_get_name(clk));
>   			continue;
>   		}
> -		clk_hw = __clk_get_hw(clk);
>   		to_clk_hw_omap(clk_hw)->clkdm_name = clkdm_name;
>   		omap2_init_clk_clkdm(clk_hw);
>   	}
> diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
> index ff5f117950a9..b6b2ac37dfad 100644
> --- a/drivers/clk/ti/divider.c
> +++ b/drivers/clk/ti/divider.c
> @@ -155,7 +155,7 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
>
>   	maxdiv = _get_maxdiv(divider);
>
> -	if (!(__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT)) {
> +	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
>   		parent_rate = *best_parent_rate;
>   		bestdiv = DIV_ROUND_UP(parent_rate, rate);
>   		bestdiv = bestdiv == 0 ? 1 : bestdiv;
> diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
> index 3999894149a9..5519b386edc0 100644
> --- a/drivers/clk/ti/dpll.c
> +++ b/drivers/clk/ti/dpll.c
> @@ -163,7 +163,7 @@ static void __init _register_dpll(struct clk_hw *hw,
>   	clk = clk_register(NULL, &clk_hw->hw);
>
>   	if (!IS_ERR(clk)) {
> -		omap2_init_clk_hw_omap_clocks(clk);
> +		omap2_init_clk_hw_omap_clocks(&clk_hw->hw);
>   		of_clk_add_provider(node, of_clk_src_simple_get, clk);
>   		kfree(clk_hw->hw.init->parent_names);
>   		kfree(clk_hw->hw.init);
> @@ -320,7 +320,7 @@ static void _register_dpll_x2(struct device_node *node,
>   	if (IS_ERR(clk)) {
>   		kfree(clk_hw);
>   	} else {
> -		omap2_init_clk_hw_omap_clocks(clk);
> +		omap2_init_clk_hw_omap_clocks(&clk_hw->hw);
>   		of_clk_add_provider(node, of_clk_src_simple_get, clk);
>   	}
>   }
> diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
> index b0aa87b35f24..353a9b772025 100644
> --- a/drivers/clk/ti/dpll3xxx.c
> +++ b/drivers/clk/ti/dpll3xxx.c
> @@ -711,7 +711,7 @@ static struct clk_hw_omap *omap3_find_clkoutx2_dpll(struct clk_hw *hw)
>   		do {
>   			parent = __clk_get_parent(hw->clk);
>   			hw = __clk_get_hw(parent);
> -		} while (hw && (__clk_get_flags(hw->clk) & CLK_IS_BASIC));
> +		} while (hw && (clk_hw_get_flags(hw) & CLK_IS_BASIC));
>   		if (!hw)
>   			break;
>   		pclk = to_clk_hw_omap(hw);
> diff --git a/drivers/clk/ti/interface.c b/drivers/clk/ti/interface.c
> index c76230d8dd04..e505e6f8228d 100644
> --- a/drivers/clk/ti/interface.c
> +++ b/drivers/clk/ti/interface.c
> @@ -63,7 +63,7 @@ static struct clk *_register_interface(struct device *dev, const char *name,
>   	if (IS_ERR(clk))
>   		kfree(clk_hw);
>   	else
> -		omap2_init_clk_hw_omap_clocks(clk);
> +		omap2_init_clk_hw_omap_clocks(&clk_hw->hw);
>
>   	return clk;
>   }
>

