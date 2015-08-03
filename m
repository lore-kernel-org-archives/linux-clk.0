Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55BF2395.8000604@ti.com>
Date: Mon, 3 Aug 2015 11:17:25 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 23/26] clk: tegra: Convert to clk_hw based provider APIs
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org> <1438362246-6664-24-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-24-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/31/2015 08:04 PM, Stephen Boyd wrote:
> We're removing struct clk from the clk provider API, so switch
> this code to using the clk_hw based provider APIs.
>

Subject should be clk: ti: ...

Other than that, seems ok to me. Also, gave clk-next + this set a quick 
testing on the boards accessible to me, and seems to work fine.

So, once the subject is fixed, for TI relevant parts for patches 2, 5, 
7, 8, 23:

Acked-by: Tero Kristo <t-kristo@ti.com>

-Tero

> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>   drivers/clk/ti/autoidle.c  |  8 ++++----
>   drivers/clk/ti/clkt_dpll.c | 11 ++++++-----
>   drivers/clk/ti/clock.h     |  2 +-
>   drivers/clk/ti/divider.c   |  6 +++---
>   drivers/clk/ti/dpll3xxx.c  | 31 ++++++++++++++-----------------
>   drivers/clk/ti/dpll44xx.c  |  4 ++--
>   drivers/clk/ti/gate.c      |  6 +++---
>   7 files changed, 33 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/clk/ti/autoidle.c b/drivers/clk/ti/autoidle.c
> index 527f2c6dd0aa..345af43465f0 100644
> --- a/drivers/clk/ti/autoidle.c
> +++ b/drivers/clk/ti/autoidle.c
> @@ -169,21 +169,21 @@ int __init of_ti_clk_autoidle_setup(struct device_node *node)
>
>   /**
>    * omap2_init_clk_hw_omap_clocks - initialize an OMAP clock
> - * @clk: struct clk * to initialize
> + * @hw: struct clk_hw * to initialize
>    *
>    * Add an OMAP clock @clk to the internal list of OMAP clocks.  Used
>    * temporarily for autoidle handling, until this support can be
>    * integrated into the common clock framework code in some way.  No
>    * return value.
>    */
> -void omap2_init_clk_hw_omap_clocks(struct clk *clk)
> +void omap2_init_clk_hw_omap_clocks(struct clk_hw *hw)
>   {
>   	struct clk_hw_omap *c;
>
> -	if (__clk_get_flags(clk) & CLK_IS_BASIC)
> +	if (clk_hw_get_flags(hw) & CLK_IS_BASIC)
>   		return;
>
> -	c = to_clk_hw_omap(__clk_get_hw(clk));
> +	c = to_clk_hw_omap(hw);
>   	list_add(&c->node, &clk_hw_omap_clocks);
>   }
>
> diff --git a/drivers/clk/ti/clkt_dpll.c b/drivers/clk/ti/clkt_dpll.c
> index a01fc7f305c1..9023ca9caf84 100644
> --- a/drivers/clk/ti/clkt_dpll.c
> +++ b/drivers/clk/ti/clkt_dpll.c
> @@ -16,6 +16,7 @@
>
>   #include <linux/kernel.h>
>   #include <linux/errno.h>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/io.h>
>   #include <linux/clk/ti.h>
> @@ -75,7 +76,7 @@ static int _dpll_test_fint(struct clk_hw_omap *clk, unsigned int n)
>   	dd = clk->dpll_data;
>
>   	/* DPLL divider must result in a valid jitter correction val */
> -	fint = __clk_get_rate(__clk_get_parent(clk->hw.clk)) / n;
> +	fint = clk_hw_get_rate(clk_hw_get_parent(&clk->hw)) / n;
>
>   	if (dd->flags & DPLL_J_TYPE) {
>   		fint_min = OMAP3PLUS_DPLL_FINT_JTYPE_MIN;
> @@ -253,7 +254,7 @@ unsigned long omap2_get_dpll_rate(struct clk_hw_omap *clk)
>   	v >>= __ffs(dd->enable_mask);
>
>   	if (_omap2_dpll_is_in_bypass(v))
> -		return __clk_get_rate(dd->clk_bypass);
> +		return clk_get_rate(dd->clk_bypass);
>
>   	v = ti_clk_ll_ops->clk_readl(dd->mult_div1_reg);
>   	dpll_mult = v & dd->mult_mask;
> @@ -261,7 +262,7 @@ unsigned long omap2_get_dpll_rate(struct clk_hw_omap *clk)
>   	dpll_div = v & dd->div1_mask;
>   	dpll_div >>= __ffs(dd->div1_mask);
>
> -	dpll_clk = (long long)__clk_get_rate(dd->clk_ref) * dpll_mult;
> +	dpll_clk = (long long)clk_get_rate(dd->clk_ref) * dpll_mult;
>   	do_div(dpll_clk, dpll_div + 1);
>
>   	return dpll_clk;
> @@ -300,8 +301,8 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
>
>   	dd = clk->dpll_data;
>
> -	ref_rate = __clk_get_rate(dd->clk_ref);
> -	clk_name = __clk_get_name(hw->clk);
> +	ref_rate = clk_get_rate(dd->clk_ref);
> +	clk_name = clk_hw_get_name(hw);
>   	pr_debug("clock: %s: starting DPLL round_rate, target rate %lu\n",
>   		 clk_name, target_rate);
>
> diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
> index d8aafd333058..90f3f472ae1c 100644
> --- a/drivers/clk/ti/clock.h
> +++ b/drivers/clk/ti/clock.h
> @@ -204,7 +204,7 @@ int ti_clk_retry_init(struct device_node *node, struct clk_hw *hw,
>   		      ti_of_clk_init_cb_t func);
>   int ti_clk_add_component(struct device_node *node, struct clk_hw *hw, int type);
>
> -void omap2_init_clk_hw_omap_clocks(struct clk *clk);
> +void omap2_init_clk_hw_omap_clocks(struct clk_hw *hw);
>   int of_ti_clk_autoidle_setup(struct device_node *node);
>   void omap2_clk_enable_init_clocks(const char **clk_names, u8 num_clocks);
>
> diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
> index b6b2ac37dfad..5b1726829e6d 100644
> --- a/drivers/clk/ti/divider.c
> +++ b/drivers/clk/ti/divider.c
> @@ -109,7 +109,7 @@ static unsigned long ti_clk_divider_recalc_rate(struct clk_hw *hw,
>   	if (!div) {
>   		WARN(!(divider->flags & CLK_DIVIDER_ALLOW_ZERO),
>   		     "%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
> -		     __clk_get_name(hw->clk));
> +		     clk_hw_get_name(hw));
>   		return parent_rate;
>   	}
>
> @@ -181,7 +181,7 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
>   			*best_parent_rate = parent_rate_saved;
>   			return i;
>   		}
> -		parent_rate = __clk_round_rate(__clk_get_parent(hw->clk),
> +		parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
>   				MULT_ROUND_UP(rate, i));
>   		now = DIV_ROUND_UP(parent_rate, i);
>   		if (now <= rate && now > best) {
> @@ -194,7 +194,7 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
>   	if (!bestdiv) {
>   		bestdiv = _get_maxdiv(divider);
>   		*best_parent_rate =
> -			__clk_round_rate(__clk_get_parent(hw->clk), 1);
> +			clk_hw_round_rate(clk_hw_get_parent(hw), 1);
>   	}
>
>   	return bestdiv;
> diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
> index 353a9b772025..f4dec00fb684 100644
> --- a/drivers/clk/ti/dpll3xxx.c
> +++ b/drivers/clk/ti/dpll3xxx.c
> @@ -69,7 +69,7 @@ static int _omap3_wait_dpll_status(struct clk_hw_omap *clk, u8 state)
>   	const char *clk_name;
>
>   	dd = clk->dpll_data;
> -	clk_name = __clk_get_name(clk->hw.clk);
> +	clk_name = clk_hw_get_name(&clk->hw);
>
>   	state <<= __ffs(dd->idlest_mask);
>
> @@ -98,7 +98,7 @@ static u16 _omap3_dpll_compute_freqsel(struct clk_hw_omap *clk, u8 n)
>   	unsigned long fint;
>   	u16 f = 0;
>
> -	fint = __clk_get_rate(clk->dpll_data->clk_ref) / n;
> +	fint = clk_get_rate(clk->dpll_data->clk_ref) / n;
>
>   	pr_debug("clock: fint is %lu\n", fint);
>
> @@ -145,7 +145,7 @@ static int _omap3_noncore_dpll_lock(struct clk_hw_omap *clk)
>   	u8 state = 1;
>   	int r = 0;
>
> -	pr_debug("clock: locking DPLL %s\n", __clk_get_name(clk->hw.clk));
> +	pr_debug("clock: locking DPLL %s\n", clk_hw_get_name(&clk->hw));
>
>   	dd = clk->dpll_data;
>   	state <<= __ffs(dd->idlest_mask);
> @@ -193,7 +193,7 @@ static int _omap3_noncore_dpll_bypass(struct clk_hw_omap *clk)
>   		return -EINVAL;
>
>   	pr_debug("clock: configuring DPLL %s for low-power bypass\n",
> -		 __clk_get_name(clk->hw.clk));
> +		 clk_hw_get_name(&clk->hw));
>
>   	ai = omap3_dpll_autoidle_read(clk);
>
> @@ -223,7 +223,7 @@ static int _omap3_noncore_dpll_stop(struct clk_hw_omap *clk)
>   	if (!(clk->dpll_data->modes & (1 << DPLL_LOW_POWER_STOP)))
>   		return -EINVAL;
>
> -	pr_debug("clock: stopping DPLL %s\n", __clk_get_name(clk->hw.clk));
> +	pr_debug("clock: stopping DPLL %s\n", clk_hw_get_name(&clk->hw));
>
>   	ai = omap3_dpll_autoidle_read(clk);
>
> @@ -251,7 +251,7 @@ static void _lookup_dco(struct clk_hw_omap *clk, u8 *dco, u16 m, u8 n)
>   {
>   	unsigned long fint, clkinp; /* watch out for overflow */
>
> -	clkinp = __clk_get_rate(__clk_get_parent(clk->hw.clk));
> +	clkinp = clk_hw_get_rate(clk_hw_get_parent(&clk->hw));
>   	fint = (clkinp / n) * m;
>
>   	if (fint < 1000000000)
> @@ -277,7 +277,7 @@ static void _lookup_sddiv(struct clk_hw_omap *clk, u8 *sd_div, u16 m, u8 n)
>   	unsigned long clkinp, sd; /* watch out for overflow */
>   	int mod1, mod2;
>
> -	clkinp = __clk_get_rate(__clk_get_parent(clk->hw.clk));
> +	clkinp = clk_hw_get_rate(clk_hw_get_parent(&clk->hw));
>
>   	/*
>   	 * target sigma-delta to near 250MHz
> @@ -429,15 +429,15 @@ int omap3_noncore_dpll_enable(struct clk_hw *hw)
>   		if (r) {
>   			WARN(1,
>   			     "%s: could not enable %s's clockdomain %s: %d\n",
> -			     __func__, __clk_get_name(hw->clk),
> +			     __func__, clk_hw_get_name(hw),
>   			     clk->clkdm_name, r);
>   			return r;
>   		}
>   	}
>
> -	parent = __clk_get_hw(__clk_get_parent(hw->clk));
> +	parent = clk_hw_get_parent(hw);
>
> -	if (__clk_get_rate(hw->clk) == __clk_get_rate(dd->clk_bypass)) {
> +	if (clk_hw_get_rate(hw) == clk_get_rate(dd->clk_bypass)) {
>   		WARN_ON(parent != __clk_get_hw(dd->clk_bypass));
>   		r = _omap3_noncore_dpll_bypass(clk);
>   	} else {
> @@ -489,7 +489,7 @@ int omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
>   	if (!dd)
>   		return -EINVAL;
>
> -	if (__clk_get_rate(dd->clk_bypass) == req->rate &&
> +	if (clk_get_rate(dd->clk_bypass) == req->rate &&
>   	    (dd->modes & (1 << DPLL_LOW_POWER_BYPASS))) {
>   		req->best_parent_hw = __clk_get_hw(dd->clk_bypass);
>   	} else {
> @@ -553,8 +553,7 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
>   	if (!dd)
>   		return -EINVAL;
>
> -	if (__clk_get_hw(__clk_get_parent(hw->clk)) !=
> -	    __clk_get_hw(dd->clk_ref))
> +	if (clk_hw_get_parent(hw) != __clk_get_hw(dd->clk_ref))
>   		return -EINVAL;
>
>   	if (dd->last_rounded_rate == 0)
> @@ -567,7 +566,7 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
>   	}
>
>   	pr_debug("%s: %s: set rate: locking rate to %lu.\n", __func__,
> -		 __clk_get_name(hw->clk), rate);
> +		 clk_hw_get_name(hw), rate);
>
>   	ret = omap3_noncore_dpll_program(clk, freqsel);
>
> @@ -704,13 +703,11 @@ static void omap3_dpll_deny_idle(struct clk_hw_omap *clk)
>   static struct clk_hw_omap *omap3_find_clkoutx2_dpll(struct clk_hw *hw)
>   {
>   	struct clk_hw_omap *pclk = NULL;
> -	struct clk *parent;
>
>   	/* Walk up the parents of clk, looking for a DPLL */
>   	do {
>   		do {
> -			parent = __clk_get_parent(hw->clk);
> -			hw = __clk_get_hw(parent);
> +			hw = clk_hw_get_parent(hw);
>   		} while (hw && (clk_hw_get_flags(hw) & CLK_IS_BASIC));
>   		if (!hw)
>   			break;
> diff --git a/drivers/clk/ti/dpll44xx.c b/drivers/clk/ti/dpll44xx.c
> index 73af77a90586..660d7436ac24 100644
> --- a/drivers/clk/ti/dpll44xx.c
> +++ b/drivers/clk/ti/dpll44xx.c
> @@ -94,7 +94,7 @@ static void omap4_dpll_lpmode_recalc(struct dpll_data *dd)
>   {
>   	long fint, fout;
>
> -	fint = __clk_get_rate(dd->clk_ref) / (dd->last_rounded_n + 1);
> +	fint = clk_get_rate(dd->clk_ref) / (dd->last_rounded_n + 1);
>   	fout = fint * dd->last_rounded_m;
>
>   	if ((fint < OMAP4_DPLL_LP_FINT_MAX) && (fout < OMAP4_DPLL_LP_FOUT_MAX))
> @@ -212,7 +212,7 @@ int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
>   	if (!dd)
>   		return -EINVAL;
>
> -	if (__clk_get_rate(dd->clk_bypass) == req->rate &&
> +	if (clk_get_rate(dd->clk_bypass) == req->rate &&
>   	    (dd->modes & (1 << DPLL_LOW_POWER_BYPASS))) {
>   		req->best_parent_hw = __clk_get_hw(dd->clk_bypass);
>   	} else {
> diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
> index 0c6fdfcd5f93..5429d3534363 100644
> --- a/drivers/clk/ti/gate.c
> +++ b/drivers/clk/ti/gate.c
> @@ -62,7 +62,7 @@ static const struct clk_ops omap_gate_clk_hsdiv_restore_ops = {
>    * (Any other value different from the Read value) to the
>    * corresponding CM_CLKSEL register will refresh the dividers.
>    */
> -static int omap36xx_gate_clk_enable_with_hsdiv_restore(struct clk_hw *clk)
> +static int omap36xx_gate_clk_enable_with_hsdiv_restore(struct clk_hw *hw)
>   {
>   	struct clk_divider *parent;
>   	struct clk_hw *parent_hw;
> @@ -70,10 +70,10 @@ static int omap36xx_gate_clk_enable_with_hsdiv_restore(struct clk_hw *clk)
>   	int ret;
>
>   	/* Clear PWRDN bit of HSDIVIDER */
> -	ret = omap2_dflt_clk_enable(clk);
> +	ret = omap2_dflt_clk_enable(hw);
>
>   	/* Parent is the x2 node, get parent of parent for the m2 div */
> -	parent_hw = __clk_get_hw(__clk_get_parent(__clk_get_parent(clk->clk)));
> +	parent_hw = clk_hw_get_parent(clk_hw_get_parent(hw));
>   	parent = to_clk_divider(parent_hw);
>
>   	/* Restore the dividers */
>

