Return-Path: <sboyd@codeaurora.org>
Date: Tue, 30 Aug 2016 17:15:42 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: "Ying-Chun Liu (PaulLiu)" <paulliu@debian.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	yliu@ucrobotics.com
Subject: Re: [PATCH] clk: owl: add initial Actions s900 clock driver
Message-ID: <20160831001542.GG12510@codeaurora.org>
References: <1470064839-3449-1-git-send-email-paulliu@debian.org>
 <1470064839-3449-2-git-send-email-paulliu@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470064839-3449-2-git-send-email-paulliu@debian.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/01, Ying-Chun Liu (PaulLiu) wrote:
> diff --git a/Documentation/devicetree/bindings/clock/actions,s900-clock.txt b/Documentation/devicetree/bindings/clock/actions,s900-clock.txt
> new file mode 100644
> index 0000000..ff6f511
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/actions,s900-clock.txt
> @@ -0,0 +1,45 @@
> +* Actions s900 Clock Controller
> +
> +The Actions s900 clock controller generates and supplies clock to various
> +controllers within the SoC. The clock binding described here is applicable to
> +s900 SoC.
> +
> +Required Properties:
> +
> +- compatible: should be one of the following.
> +  - "actions,s900-clock" - controller compatible with Actions s900 SoC.

Is there a patch to add "actions" to vendor prefixes?

> +
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +- #clock-cells: should be 1.
> +
> +Each clock is assigned an identifier and client nodes can use this identifier
> +to specify the clock which they consume.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/actions,s900-clock.h header and can be used in device
> +tree sources.
> +
> +External clocks:
> +
> +Example: Clock controller node:
> +
> +        clock: clock-controller@e0160000 {
> +		compatible = "actions,s900-clock";
> +		reg = <0 0xe0160000 0 0x1000>;
> +		#clock-cells = <1>;
> +	};

Weird mix of tabs and spaces here.

> +
> diff --git a/drivers/clk/owl/clk-factor.c b/drivers/clk/owl/clk-factor.c
> new file mode 100644
> index 0000000..f0b77ac
> --- /dev/null
> +++ b/drivers/clk/owl/clk-factor.c
> @@ -0,0 +1,284 @@
> +/*
> + * Actions SOC facter divider table clock driver

factor?

> + *
> + * Copyright (C) 2014 Actions Semi Inc.
> + * Authors: David Liu <liuwei@actions-semi.com>
> + *          Haitao Zhang <hzhang@ucrobotics.com>
> + *          Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
> + *          Yixun Lan <yixun.lan@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License v2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include "clk.h"
> +
> +#define to_owl_factor(_hw)	container_of(_hw, struct owl_factor, hw)
> +#define div_mask(d)		((1 << ((d)->width)) - 1)
> +
> +static unsigned int _get_table_maxval(const struct clk_factor_table *table)
> +{
> +	unsigned int maxval = 0;
> +	const struct clk_factor_table *clkt;
> +
> +	for (clkt = table; clkt->div; clkt++)
> +		if (clkt->val > maxval)
> +			maxval = clkt->val;
> +	return maxval;
> +}
> +
> +static int _get_table_div_mul(const struct clk_factor_table *table,
> +			unsigned int val, unsigned int *mul, unsigned int *div)
> +{
> +	const struct clk_factor_table *clkt;
> +
> +	for (clkt = table; clkt->div; clkt++) {
> +		if (clkt->val == val) {
> +			*mul = clkt->mul;
> +			*div = clkt->div;
> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static unsigned int _get_table_val(const struct clk_factor_table *table,
> +			unsigned long rate, unsigned long parent_rate)
> +{
> +	const struct clk_factor_table *clkt;
> +	int val = -1;
> +	u64 calc_rate;
> +
> +	for (clkt = table; clkt->div; clkt++) {
> +		calc_rate = parent_rate * clkt->mul;
> +		do_div(calc_rate, clkt->div);
> +
> +		if ((unsigned long)calc_rate <= rate) {
> +			val = clkt->val;
> +			break;
> +		}
> +	}
> +
> +	if (val == -1)
> +		val = _get_table_maxval(table);
> +
> +	return val;
> +}
> +
> +static int clk_val_best(struct clk_hw *hw, unsigned long rate,
> +		unsigned long *best_parent_rate)
> +{
> +	struct owl_factor *factor = to_owl_factor(hw);
> +	const struct clk_factor_table *clkt = factor->table;
> +	unsigned long parent_rate, try_parent_rate, best = 0, now;
> +	unsigned long parent_rate_saved = *best_parent_rate;
> +	unsigned int maxval;
> +	int bestval = 0;
> +
> +	if (!rate)
> +		rate = 1;
> +
> +	maxval = _get_table_maxval(clkt);

Is this used?

> +
> +	if (!(__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT)) {

Please use clk_hw_get_flags().

> +		parent_rate = *best_parent_rate;
> +		bestval = _get_table_val(clkt, rate, parent_rate);
> +		return bestval;
> +	}
> +
> +	while (1) {
> +		if (!(clkt->div))
> +			break;

Just:

	while (clkt->div) {

or
	for (clkt = factor->table; clkt->div; clkt++)

?

> +
> +		try_parent_rate = rate * clkt->div / clkt->mul;
> +
> +		if (try_parent_rate == parent_rate_saved) {
> +			pr_debug("%s: [%d %d %d] found try_parent_rate %ld\n",
> +				__func__, clkt->val, clkt->mul, clkt->div,
> +				try_parent_rate);
> +			/*
> +			 * It's the most ideal case if the requested rate can be
> +			 * divided from parent clock without needing to change
> +			 * parent rate, so return the divider immediately.
> +			 */
> +			*best_parent_rate = parent_rate_saved;
> +			return clkt->val;
> +		}
> +
> +		parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
> +				try_parent_rate);
> +		now = DIV_ROUND_UP(parent_rate, clkt->div) * clkt->mul;
> +		if (now <= rate && now > best) {
> +			bestval = clkt->val;
> +			best = now;
> +			*best_parent_rate = parent_rate;
> +		}
> +
> +		clkt++;
> +	}
> +
> +	if (!bestval) {
> +		bestval = _get_table_maxval(clkt);
> +		*best_parent_rate = clk_hw_round_rate(
> +				clk_hw_get_parent(hw), 1);
> +	}
> +
> +	pr_debug("%s: return bestval %d\n", __func__, bestval);
> +
> +	return bestval;
> +}
> +
> +/**
> + * owl_factor_round_rate() - Round a clock frequency
> + * @hw:		Handle between common and hardware-specific interfaces
> + * @rate:	Desired clock frequency
> + * @praent_rate: Clock frequency of parent clock
> + * Returns frequency closest to @rate the hardware can generate.
> + */
> +static long owl_factor_round_rate(struct clk_hw *hw, unsigned long rate,
> +			unsigned long *parent_rate)
> +{
> +	struct owl_factor *factor = to_owl_factor(hw);
> +	const struct clk_factor_table *clkt = factor->table;
> +	unsigned int val, mul = 0, div = 1;
> +
> +	val = clk_val_best(hw, rate, parent_rate);
> +	_get_table_div_mul(clkt, val, &mul, &div);
> +
> +	return *parent_rate * mul / div;
> +}
> +
> +/**
> + * owl_factor_recalc_rate() - Recalculate clock frequency
> + * @hw:			Handle between common and hardware-specific interfaces
> + * @parent_rate:	Clock frequency of parent clock
> + * Returns current clock frequency.
> + */
> +static unsigned long owl_factor_recalc_rate(struct clk_hw *hw,
> +			unsigned long parent_rate)
> +{
> +	struct owl_factor *factor = to_owl_factor(hw);
> +	const struct clk_factor_table *clkt = factor->table;
> +	u64 rate;
> +	u32 val, mul, div;
> +
> +	div = 0;
> +	mul = 0;
> +
> +	val = readl(factor->reg) >> factor->shift;
> +	val &= div_mask(factor);
> +
> +	_get_table_div_mul(clkt, val, &mul, &div);
> +	if (!div) {
> +		WARN(!(factor->flags & CLK_DIVIDER_ALLOW_ZERO),
> +			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
> +			__clk_get_name(hw->clk));
> +		return parent_rate;
> +	}
> +
> +	rate = (u64)parent_rate * mul;
> +	do_div(rate, div);
> +
> +	return (unsigned long)rate;

Unnecessary cast.

> +}
> +
> +static int owl_factor_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct owl_factor *factor = to_owl_factor(hw);
> +	unsigned long flags = 0;
> +	u32 val, v;
> +
> +	val = _get_table_val(factor->table, rate, parent_rate);
> +
> +	pr_debug("%s: get_table_val %d\n", __func__, val);
> +
> +	if (val > div_mask(factor))
> +		val = div_mask(factor);
> +
> +	if (factor->lock)
> +		spin_lock_irqsave(factor->lock, flags);
> +
> +	v = readl(factor->reg);
> +	v &= ~(div_mask(factor) << factor->shift);
> +	v |= val << factor->shift;
> +	writel(v, factor->reg);
> +
> +	if (factor->lock)
> +		spin_unlock_irqrestore(factor->lock, flags);
> +
> +	return 0;
> +}
> +
> +struct clk_ops owl_factor_ops = {
> +	.round_rate	= owl_factor_round_rate,
> +	.recalc_rate	= owl_factor_recalc_rate,
> +	.set_rate	= owl_factor_set_rate,
> +};
> +
> +/**
> + * owl_factor_clk_register() - Register PLL with the clock framework
> + * @dev		the device
> + * @name	PLL name
> + * @parent_name	Parent clock name
> + * @flags	Clock flags
> + * @reg		Pointer to PLL control register
> + * @shift	Shift to the divider bit field
> + * @width	Width of the divider bit field
> + * @clk_factor_flags	the flags for the clock factor
> + * @table	Pointer of array of value/multiplier/divider pairs
> + * @lock	Register lock
> + * Returns handle to the registered clock.
> + */
> +struct clk *owl_factor_clk_register(struct device *dev, const char *name,
> +		const char *parent_name, unsigned long flags,
> +		void __iomem *reg, u8 shift, u8 width,
> +		u8 clk_factor_flags, const struct clk_factor_table *table,
> +		spinlock_t *lock)
> +
> +{
> +	struct owl_factor *factor;
> +	struct clk *clk;
> +	struct clk_init_data initd;
> +
> +	/* allocate the factor */
> +	factor = kzalloc(sizeof(*factor), GFP_KERNEL);
> +	if (!factor)
> +		return ERR_PTR(-ENOMEM);
> +
> +	initd.name = name;
> +	initd.ops = &owl_factor_ops;
> +	initd.flags = flags | CLK_IS_BASIC;

Please don't use CLK_IS_BASIC.

> +	initd.parent_names = (parent_name ? &parent_name : NULL);
> +	initd.num_parents = (parent_name ? 1 : 0);
> +
> +	/* struct owl_factor assignments */
> +	factor->reg = reg;
> +	factor->shift = shift;
> +	factor->width = width;
> +	factor->flags = clk_factor_flags;
> +	factor->lock = lock;
> +	factor->hw.init = &initd;
> +	factor->table = table;
> +
> +	/* register the clock */
> +	clk = clk_register(dev, &factor->hw);

Please use clk_hw_register() instead.

> +
> +	if (IS_ERR(clk))
> +		kfree(factor);
> +
> +	return clk;
> +}
> diff --git a/drivers/clk/owl/clk-pll.c b/drivers/clk/owl/clk-pll.c
> new file mode 100644
> index 0000000..4f24007
> --- /dev/null
> +++ b/drivers/clk/owl/clk-pll.c
> @@ -0,0 +1,371 @@
> +/*
> + * Actions SOC PLL driver
> + *
> + * Copyright (C) 2014 Actions Semi Inc.
> + * Authors: David Liu <liuwei@actions-semi.com>
> + *          Haitao Zhang <hzhang@ucrobotics.com>
> + *          Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
> + *          Yixun Lan <yixun.lan@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License v2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include "clk.h"
> +
> +/**
> + * struct owl_pll
> + * @hw:      Handle between common and hardware-specific interfaces
> + * @reg:     PLL control register
> + * @lock:    Register lock
> + * @bfreq:   the base frequence of the PLL. PLL frequence = bfreq * mul
> + * @enable_bit: the enable bit for PLL
> + * @shift:   shift to the muliplier bit field
> + * @width:   width of the muliplier bit field
> + * @min_mul: the minimum muliple for the PLL
> + * @max_mul: the maximum muliple for the PLL
> + */
> +struct owl_pll {
> +	struct clk_hw		hw;
> +	void __iomem		*reg;
> +	spinlock_t		*lock;
> +	unsigned long		bfreq;
> +	u8			enable_bit;
> +	u8			shift;
> +	u8			width;
> +	u8			min_mul;
> +	u8			max_mul;
> +	u8			pll_flags;
> +	const struct clk_pll_table *table;
> +};
> +
> +#define to_owl_pll(_hw)		container_of(_hw, struct owl_pll, hw)
> +#define mul_mask(m)		((1 << ((m)->width)) - 1)
> +#define PLL_STABILITY_WAIT_US	(50)
> +
> +/**
> + * owl_pll_calculate_mul() - cacluate muliple for specific rate

s/cacluate/calculate/

> + * @pll:	owl pll
> + * @rate:	Desired clock frequency
> + * Returns appropriate muliple closest to @rate the hardware can generate.

s/muliple/multiple/

> + */
> +static u32 owl_pll_calculate_mul(struct owl_pll *pll, unsigned long rate)
> +{
> +	u32 mul;
> +
> +	mul = DIV_ROUND_CLOSEST(rate, pll->bfreq);
> +	if (mul < pll->min_mul)
> +		mul = pll->min_mul;
> +	else if (mul > pll->max_mul)
> +		mul = pll->max_mul;
> +
> +	mul &= mul_mask(pll);
> +
> +	return mul;

Simplify to:

	return mul & mul_mask(pll);

> +}
> +
> +static unsigned int _get_table_rate(const struct clk_pll_table *table,
> +		unsigned int val)
> +{
> +	const struct clk_pll_table *clkt;
> +
> +	for (clkt = table; clkt->rate; clkt++) {
> +		if (clkt->val == val)
> +			return clkt->rate;
> +	}

The braces are unnecessary.

> +
> +	return 0;
> +}
> +
> +static unsigned int _get_table_val(const struct clk_pll_table *table,
> +		unsigned long rate)
> +{
> +	const struct clk_pll_table *clkt;
> +	unsigned int val = 0;
> +
> +	for (clkt = table; clkt->rate; clkt++) {
> +		if (clkt->rate == rate) {
> +			val = clkt->val;
> +			break;
> +		} else if (clkt->rate < rate)
> +			val = clkt->val;
> +	}
> +
> +	return val;
> +}
> +
> +
> +static unsigned long _get_table_round_rate(const struct clk_pll_table *table,
> +		unsigned long rate)
> +{
> +	const struct clk_pll_table *clkt;
> +	unsigned long round_rate = 0;
> +
> +	for (clkt = table; clkt->rate; clkt++) {
> +		if (clkt->rate == rate) {
> +			round_rate = clkt->rate;
> +			break;
> +		} else if (clkt->rate < rate)
> +			round_rate = clkt->rate;
> +	}
> +
> +	return round_rate;
> +}

Instead of two functions to iterate over the clk_pll_table() why
not have one that returns the clkt structure to the caller? Then
the caller can decide to use ->rate or ->val.

> +
> +
> +/**
> + * owl_pll_round_rate() - Round a clock frequency
> + * @hw:		Handle between common and hardware-specific interfaces
> + * @rate:	Desired clock frequency
> + * @prate:	Clock frequency of parent clock
> + * Returns frequency closest to @rate the hardware can generate.
> + */
> +static long owl_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long *parent_rate)
> +{
> +	struct owl_pll *pll = to_owl_pll(hw);
> +	unsigned long round_rate;
> +	u32 mul;
> +
> +	if (pll->table) {
> +		round_rate = _get_table_round_rate(pll->table, rate);
> +		return round_rate;
> +	}
> +
> +	/* fixed frequence */

s/frequence/frequency/

> +	if (pll->width == 0)
> +		return pll->bfreq;
> +
> +	mul = owl_pll_calculate_mul(pll, rate);
> +
> +	return pll->bfreq * mul;
> +}
> +
> +/**
> + * owl_pll_recalc_rate() - Recalculate clock frequency
> + * @hw:			Handle between common and hardware-specific interfaces
> + * @parent_rate:	Clock frequency of parent clock
> + * Returns current clock frequency.
> + */
> +static unsigned long owl_pll_recalc_rate(struct clk_hw *hw,
> +		unsigned long parent_rate)
> +{
> +	struct owl_pll *pll = to_owl_pll(hw);
> +	unsigned long rate;
> +	u32 val, mul;
> +
> +	if (pll->table) {
> +		val = readl(pll->reg) >> pll->shift;
> +		val &= mul_mask(pll);
> +
> +		rate = _get_table_rate(pll->table, val);
> +
> +		return rate;
> +	}
> +
> +	/* fixed frequence */

s/frequence/frequency/

It may be better to have different clk_ops for fixed and
non-fixed frequency plls?

> +	if (pll->width == 0)
> +		return pll->bfreq;
> +
> +	mul = (readl(pll->reg) >> pll->shift) & mul_mask(pll);
> +
> +	return pll->bfreq * mul;
> +}
> +
> +/**
> + * owl_pll_is_enabled - Check if a clock is enabled
> + * @hw:		Handle between common and hardware-specific interfaces
> + * Returns 1 if the clock is enabled, 0 otherwise.
> + *
> + * Not sure this is a good idea, but since disabled means bypassed for
> + * this clock implementation we say we are always enabled.
> + */
> +static int owl_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct owl_pll *pll = to_owl_pll(hw);
> +	unsigned long flags = 0;
> +	u32 v;
> +
> +	if (pll->lock)
> +		spin_lock_irqsave(pll->lock, flags);
> +
> +	v = readl(pll->reg);
> +
> +	if (pll->lock)
> +		spin_unlock_irqrestore(pll->lock, flags);
> +
> +	return !!(v & BIT(pll->enable_bit));
> +}
> +
> +/**
> + * owl_pll_enable - Enable clock
> + * @hw:		Handle between common and hardware-specific interfaces
> + * Returns 0 on success
> + */
> +static int owl_pll_enable(struct clk_hw *hw)
> +{
> +	struct owl_pll *pll = to_owl_pll(hw);
> +	unsigned long flags = 0;
> +	u32 v;
> +
> +	if (owl_pll_is_enabled(hw))
> +		return 0;
> +
> +	if (pll->lock)
> +		spin_lock_irqsave(pll->lock, flags);
> +
> +	v = readl(pll->reg);
> +	v |= BIT(pll->enable_bit);
> +	writel(v, pll->reg);
> +
> +	if (pll->lock)
> +		spin_unlock_irqrestore(pll->lock, flags);
> +
> +	udelay(PLL_STABILITY_WAIT_US);
> +
> +	return 0;
> +}
> +
> +/**
> + * owl_pll_disable - Disable clock
> + * @hw:		Handle between common and hardware-specific interfaces
> + * Returns 0 on success
> + */
> +static void owl_pll_disable(struct clk_hw *hw)
> +{
> +	struct owl_pll *pll = to_owl_pll(hw);
> +	unsigned long flags = 0;
> +	u32 v;
> +
> +	if (owl_pll_is_enabled(hw))
> +		return;

So if it's enabled we just bail out of disable? Why implement
anything here then?

> +
> +	if (pll->lock)
> +		spin_lock_irqsave(pll->lock, flags);
> +
> +	v = readl(pll->reg);
> +	v &= ~BIT(pll->enable_bit);
> +	writel(v, pll->reg);
> +
> +	if (pll->lock)
> +		spin_unlock_irqrestore(pll->lock, flags);
> +}
> +
> +static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long parent_rate)
> +{
> +	struct owl_pll *pll = to_owl_pll(hw);
> +	unsigned long flags = 0;
> +	u32 val, v;
> +
> +	pr_debug("%s: rate %ld, parent_rate %ld, before set rate reg 0x%x\n",
> +		__func__, rate, parent_rate, readl(pll->reg));
> +
> +	/* fixed frequence */

s/frequence/frequency/

> +	if (pll->width == 0)
> +		return 0;
> +
> +	if (pll->table)
> +		val = _get_table_val(pll->table, rate);
> +	else
> +		val = owl_pll_calculate_mul(pll, rate);
> +
> +	if (pll->lock)
> +		spin_lock_irqsave(pll->lock, flags);
> +
> +	v = readl(pll->reg);
> +	v &= ~mul_mask(pll);
> +	v |= val << pll->shift;
> +	writel(v, pll->reg);
> +
> +	udelay(PLL_STABILITY_WAIT_US);
> +
> +	if (pll->lock)
> +		spin_unlock_irqrestore(pll->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops owl_pll_ops = {
> +	.enable = owl_pll_enable,
> +	.disable = owl_pll_disable,
> +	.is_enabled = owl_pll_is_enabled,
> +	.round_rate = owl_pll_round_rate,
> +	.recalc_rate = owl_pll_recalc_rate,
> +	.set_rate = owl_pll_set_rate,
> +};
> +
> +/**
> + * owl_clk_register_pll() - Register PLL with the clock framework
> + * @name	PLL name
> + * @parent_name	Parent clock name
> + * @flags	the flags of the clock
> + * @reg		Pointer to PLL control register
> + * @bfreq	Base frequence
> + * @enable_bit	Enable bit of the PLL
> + * @shift	Shift to the muliplier bit field
> + * @width	Width to the muliplier bit field
> + * @min_mul	the minimum muliple for the PLL
> + * @max_mul	the maximum muliple for the PLL
> + * @pll_flags	PLL flags
> + * @table	Bit index to this PLL's lock status bit in @pll_status
> + * @lock	Register lock

These are all missing colons between variables and descriptions.

> + * Returns handle to the registered clock.
> + */
> +struct clk *owl_pll_clk_register(const char *name, const char *parent_name,
> +		unsigned long flags, void __iomem *reg, unsigned long bfreq,
> +		u8 enable_bit, u8 shift, u8 width, u8 min_mul, u8 max_mul,
> +		u8 pll_flags,
> +		const struct clk_pll_table *table, spinlock_t *lock)
> +{
> +	struct owl_pll *pll;
> +	struct clk *clk;
> +	struct clk_init_data initd;
> +
> +	pll = kmalloc(sizeof(*pll), GFP_KERNEL);
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* Populate the struct */
> +	initd.name = name;
> +	initd.parent_names = (parent_name ? &parent_name : NULL);
> +	initd.num_parents = (parent_name ? 1 : 0);
> +	initd.ops = &owl_pll_ops;
> +	initd.flags = flags;
> +
> +	pll->hw.init = &initd;
> +	pll->bfreq = bfreq;
> +	pll->enable_bit = enable_bit;
> +	pll->shift = shift;
> +	pll->width = width;
> +	pll->min_mul = min_mul;
> +	pll->max_mul = max_mul;
> +	pll->pll_flags = pll_flags;
> +	pll->table = table;
> +	pll->reg = reg;
> +	pll->lock = lock;
> +
> +	clk = clk_register(NULL, &pll->hw);
> +	if (WARN_ON(IS_ERR(clk)))
> +		goto free_pll;
> +
> +	return clk;
> +
> +free_pll:
> +	kfree(pll);
> +
> +	return clk;
> +}
> diff --git a/drivers/clk/owl/clk-s900.c b/drivers/clk/owl/clk-s900.c
> new file mode 100644
> index 0000000..a2622bf
> --- /dev/null
> +++ b/drivers/clk/owl/clk-s900.c
> @@ -0,0 +1,616 @@
> +/*
> + * Actions S900 clock driver
> + *
> + * Copyright (C) 2014 Actions Semi Inc.
> + * Authors: David Liu <liuwei@actions-semi.com>
> + *          Haitao Zhang <hzhang@ucrobotics.com>
> + *          Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
> + *          Yixun Lan <yixun.lan@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License v2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clkdev.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <dt-bindings/clock/actions,s900-clock.h>
> +#include "clk.h"
> +
> +#define CMU_COREPLL		(0x0000)
> +#define CMU_DEVPLL		(0x0004)
> +#define CMU_DDRPLL		(0x0008)
> +#define CMU_NANDPLL		(0x000C)
> +#define CMU_DISPLAYPLL		(0x0010)
> +#define CMU_AUDIOPLL		(0x0014)
> +#define CMU_TVOUTPLL		(0x0018)
> +#define CMU_BUSCLK		(0x001C)
> +#define CMU_SENSORCLK		(0x0020)
> +#define CMU_LCDCLK		(0x0024)
> +#define CMU_DSICLK		(0x0028)
> +#define CMU_CSICLK		(0x002C)
> +#define CMU_DECLK		(0x0030)
> +#define CMU_BISPCLK		(0x0034)
> +#define CMU_IMXCLK		(0x0038)
> +#define CMU_HDECLK		(0x003C)
> +#define CMU_VDECLK		(0x0040)
> +#define CMU_VCECLK		(0x0044)
> +#define CMU_NANDCCLK		(0x004C)
> +#define CMU_SD0CLK		(0x0050)
> +#define CMU_SD1CLK		(0x0054)
> +#define CMU_SD2CLK		(0x0058)
> +#define CMU_UART0CLK		(0x005C)
> +#define CMU_UART1CLK		(0x0060)
> +#define CMU_UART2CLK		(0x0064)
> +#define CMU_PWM0CLK		(0x0070)
> +#define CMU_PWM1CLK		(0x0074)
> +#define CMU_PWM2CLK		(0x0078)
> +#define CMU_PWM3CLK		(0x007C)
> +#define CMU_USBPLL		(0x0080)
> +#define CMU_ASSISTPLL		(0x0084)
> +#define CMU_EDPCLK		(0x0088)
> +#define CMU_GPU3DCLK		(0x0090)
> +#define CMU_CORECTL		(0x009C)
> +#define CMU_DEVCLKEN0		(0x00A0)
> +#define CMU_DEVCLKEN1		(0x00A4)
> +#define CMU_DEVRST0		(0x00A8)
> +#define CMU_DEVRST1		(0x00AC)
> +#define CMU_UART3CLK		(0x00B0)
> +#define CMU_UART4CLK		(0x00B4)
> +#define CMU_UART5CLK		(0x00B8)
> +#define CMU_UART6CLK		(0x00BC)
> +#define CMU_TLSCLK		(0x00C0)
> +#define CMU_SD3CLK		(0x00C4)
> +#define CMU_PWM4CLK		(0x00C8)
> +#define CMU_PWM5CLK		(0x00CC)
> +
> +
> +/* fixed rate clocks */
> +static struct owl_fixed_rate_clock s900_fixed_rate_clks[] __initdata = {
> +	{ CLK_LOSC,     "losc",     NULL, 0, 32768, },
> +	{ CLK_HOSC,     "hosc",     NULL, 0, 24000000, },
> +	{ CLK_24M,      "24M_diff", NULL, 0, 24000000, },

Should these be coming from the board dts files instead of being
populated here? I would guess that losc and hosc are oscillators
that are probably on the board.

> +};
> +
> +static struct clk_pll_table clk_audio_pll_table[] = {
> +	{0, 45158400}, {1, 49152000},
> +	{0, 0},
> +};
> +
> +static struct clk_pll_table clk_edp_pll_table[] = {
> +	{0, 810000000}, {1, 1350000000}, {2, 2700000000},
> +	{0, 0},
> +};
> +
> +/* pll clocks */
> +static struct owl_pll_clock s900_pll_clks[] __initdata = {
> +	{ CLK_CORE_PLL,   "core_pll", NULL, 0, CMU_COREPLL, 24000000,
> +	  9, 0, 8, 5, 107, 0, NULL},
> +	{ CLK_DEV_PLL,    "dev_pll",  NULL, 0, CMU_DEVPLL,  6000000,
> +	  8, 0, 8, 20, 180, 0, NULL},
> +	{ CLK_DDR_PLL,    "ddr_pll",  NULL, 0, CMU_DDRPLL,  24000000,
> +	  8, 0, 8, 5,  45, 0, NULL},
> +	{ CLK_NAND_PLL,   "nand_pll", NULL, 0, CMU_NANDPLL,  6000000,
> +	  8, 0, 8, 4, 100, 0, NULL},
> +	{ CLK_DISPLAY_PLL, "display_pll", NULL, 0, CMU_DISPLAYPLL, 6000000,
> +	  8, 0, 8, 20, 180, 0, NULL},
> +	{ CLK_ASSIST_PLL, "assist_pll", NULL, 0, CMU_ASSISTPLL, 500000000,
> +	  0, 0, 0, 0, 0, CLK_OWL_PLL_FIXED_FREQ, NULL},
> +	{ CLK_AUDIO_PLL,  "audio_pll",  NULL, 0, CMU_AUDIOPLL, 0,
> +	  4, 0, 1, 0, 0, 0, clk_audio_pll_table},
> +	{ CLK_EDP_PLL,  "edp_pll", "24M_edp", 0, CMU_EDPCLK, 0,
> +	  9, 0, 2, 0, 0, 0, clk_edp_pll_table},
> +};
> +
> +static const char *cpu_clk_mux_p[] __initconst = {"losc", "hosc", "core_pll",};
> +static const char *dev_clk_p[] __initconst = {"hosc", "dev_pll", };
> +static const char *noc_clk_mux_p[] __initconst = { "dev_clk", "assist_pll"};
> +static const char *dmm_clk_mux_p[] __initconst = { "dev_clk", "nand_pll",
> +						   "assist_pll",
> +						   "ddr_clk_src"};
> +
> +static const char *bisp_clk_mux_p[] __initconst = { "assist_pll", "dev_clk"};
> +static const char *csi_clk_mux_p[] __initconst = { "display_pll", "dev_clk"};
> +static const char *de_clk_mux_p[] __initconst = { "assist_pll", "dev_clk"};
> +static const char *eth_mac_clk_mux_p[] __initconst = { "assist_pll"};
> +static const char *gpu_clk_mux_p[] __initconst = { "dev_clk", "display_pll",
> +						   "", "ddr_clk_src"};
> +static const char *hde_clk_mux_p[] __initconst = { "dev_clk", "display_pll",
> +						   "", "ddr_clk_src"};
> +static const char *i2c_clk_mux_p[] __initconst = { "assist_pll"};
> +static const char *imx_clk_mux_p[] __initconst = { "assist_pll", "dev_clk"};
> +static const char *lcd_clk_mux_p[] __initconst = { "display_pll",
> +						   "nand_pll", };
> +static const char *nand_clk_mux_p[] __initconst = { "dev_clk", "nand_pll", };
> +static const char *pwm_clk_mux_p[] __initconst = { "hosc"};
> +static const char *sd_clk_mux_p[] __initconst = { "dev_clk", "nand_pll", };
> +static const char *sensor_clk_mux_p[] __initconst = { "hosc", "bisp"};
> +static const char *speed_sensor_clk_mux_p[] __initconst = { "hosc",};
> +static const char *spi_clk_mux_p[] __initconst = { "ahb_clk"};
> +static const char *thermal_sensor_clk_mux_p[] __initconst = { "hosc",};
> +static const char *uart_clk_mux_p[] __initconst = { "hosc", "dev_pll"};
> +static const char *vce_clk_mux_p[] __initconst = { "dev_clk", "display_pll",
> +						   "assist_pll",
> +						   "ddr_clk_src"};
> +static const char *i2s_clk_mux_p[] __initconst = { "audio_pll", };
> +
> +static const char *edp_clk_mux_p[] __initconst = { "assist_pll",
> +						   "display_pll" };
> +
> +/* mux clocks */
> +static struct owl_mux_clock s900_mux_clks[] __initdata = {
> +	{ CLK_CPU,  "cpu_clk", cpu_clk_mux_p, ARRAY_SIZE(cpu_clk_mux_p),
> +	  CLK_SET_RATE_PARENT, CMU_BUSCLK, 0, 2, 0, "cpu_clk" },
> +	{ CLK_DEV,  "dev_clk", dev_clk_p, ARRAY_SIZE(dev_clk_p),
> +	  CLK_SET_RATE_PARENT, CMU_DEVPLL, 12, 1, 0, "dev_clk" },
> +	{ CLK_NOC_CLK_MUX,  "noc_clk_mux", noc_clk_mux_p,
> +	  ARRAY_SIZE(noc_clk_mux_p), CLK_SET_RATE_PARENT, CMU_BUSCLK, 7, 1,
> +	  0, },
> +};
> +
> +static struct clk_div_table nand_div_table[] = {
> +	{0, 1},   {1, 2},   {2, 4},   {3, 6},
> +	{4, 8},   {5, 10},  {6, 12},  {7, 14},
> +	{8, 16},  {9, 18},  {10, 20}, {11, 22},
> +	{12, 24}, {13, 26}, {14, 28}, {15, 30},
> +	{0, 0},
> +};
> +
> +static struct clk_factor_table sd_factor_table[] = {
> +	/* bit0 ~ 4 */
> +	{0, 1, 1}, {1, 1, 2}, {2, 1, 3}, {3, 1, 4},
> +	{4, 1, 5}, {5, 1, 6}, {6, 1, 7}, {7, 1, 8},
> +	{8, 1, 9}, {9, 1, 10}, {10, 1, 11}, {11, 1, 12},
> +	{12, 1, 13}, {13, 1, 14}, {14, 1, 15}, {15, 1, 16},
> +	{16, 1, 17}, {17, 1, 18}, {18, 1, 19}, {19, 1, 20},
> +	{20, 1, 21}, {21, 1, 22}, {22, 1, 23}, {23, 1, 24},
> +	{24, 1, 25}, {25, 1, 26}, {26, 1, 27}, {27, 1, 28},
> +	{28, 1, 29}, {29, 1, 30}, {30, 1, 31}, {31, 1, 32},
> +
> +	/* bit8: /128 */
> +	{256, 1, 1 * 128}, {257, 1, 2 * 128}, {258, 1, 3 * 128},
> +	{259, 1, 4 * 128}, {260, 1, 5 * 128}, {261, 1, 6 * 128},
> +	{262, 1, 7 * 128}, {263, 1, 8 * 128}, {264, 1, 9 * 128},
> +	{265, 1, 10 * 128}, {266, 1, 11 * 128}, {267, 1, 12 * 128},
> +	{268, 1, 13 * 128}, {269, 1, 14 * 128}, {270, 1, 15 * 128},
> +	{271, 1, 16 * 128}, {272, 1, 17 * 128}, {273, 1, 18 * 128},
> +	{274, 1, 19 * 128}, {275, 1, 20 * 128}, {276, 1, 21 * 128},
> +	{277, 1, 22 * 128}, {278, 1, 23 * 128}, {279, 1, 24 * 128},
> +	{280, 1, 25 * 128}, {281, 1, 26 * 128}, {282, 1, 27 * 128},
> +	{283, 1, 28 * 128}, {284, 1, 29 * 128}, {285, 1, 30 * 128},
> +	{286, 1, 31 * 128}, {287, 1, 32 * 128},
> +
> +	{0, 0},
> +};
> +
> +static struct clk_div_table apb_div_table[] = {
> +	{1, 2},   {2, 3},   {3, 4},
> +	{0, 0},
> +};
> +
> +static struct clk_div_table eth_mac_div_table[] = {
> +	{0, 2},   {1, 4},
> +	{0, 0},
> +};
> +
> +static struct clk_div_table rmii_ref_div_table[] = {
> +	{0, 4},   {1, 10},
> +	{0, 0},
> +};
> +
> +static struct clk_div_table usb3_mac_div_table[] = {
> +	{1, 2},   {2, 3},   {3, 4},
> +	{0, 8},
> +};
> +
> +static struct clk_div_table i2s_div_table[] = {
> +	{0, 1},   {1, 2},   {2, 3},   {3, 4},
> +	{4, 6},   {5, 8},   {6, 12},  {7, 16},
> +	{8, 24},
> +	{0, 0},
> +};
> +
> +static struct clk_div_table hdmia_div_table[] = {
> +	{0, 1},   {1, 2},   {2, 3},   {3, 4},
> +	{4, 6},   {5, 8},   {6, 12},  {7, 16},
> +	{8, 24},
> +	{0, 0},
> +};
> +
> +
> +/* divider clocks */
> +static struct owl_divider_clock s900_div_clks[] __initdata = {
> +	{ CLK_NOC_CLK_DIV, "noc_clk_div", "noc_clk", 0, CMU_BUSCLK, 19, 1,
> +	  0, NULL,},
> +	{ CLK_AHB, "ahb_clk", "noc_clk_div", 0, CMU_BUSCLK, 4, 1,
> +	  0, NULL, "ahb_clk"},
> +	{ CLK_APB, "apb_clk", "ahb_clk", 0, CMU_BUSCLK, 8, 2,
> +	  0, apb_div_table, "apb_clk"},
> +	{ CLK_USB3_MAC, "usb3_mac", "assist_pll", 0, CMU_ASSISTPLL, 12, 2,
> +	  0, usb3_mac_div_table, "usb3_mac"},
> +	{ CLK_RMII_REF, "rmii_ref", "assist_pll", 0, CMU_ASSISTPLL, 8, 1,
> +	  0, rmii_ref_div_table, "rmii_ref"},
> +};
> +
> +static struct clk_factor_table dmm_factor_table[] = {
> +	{0, 1, 1}, {1, 2, 3}, {2, 1, 2}, {3, 1, 3},
> +	{4, 1, 4},
> +	{0, 0, 0},
> +};
> +
> +static struct clk_factor_table noc_factor_table[] = {
> +	{0, 1, 1},   {1, 2, 3},   {2, 1, 2}, {3, 1, 3},  {4, 1, 4},
> +	{0, 0, 0},
> +};
> +
> +static struct clk_factor_table bisp_factor_table[] = {
> +	{0, 1, 1}, {1, 2, 3}, {2, 1, 2}, {3, 2, 5},
> +	{4, 1, 3}, {5, 1, 4}, {6, 1, 6}, {7, 1, 8},
> +	{0, 0, 0},
> +};
> +
> +/* divider clocks */
> +static struct owl_factor_clock s900_factor_clks[] __initdata = {
> +	{ CLK_NOC, "noc_clk", "noc_clk_mux", 0, CMU_BUSCLK, 16, 3,
> +	  0, noc_factor_table, "noc_clk"},
> +	{ CLK_DE1, "de_clk1", "de_clk", 0, CMU_DECLK, 0, 3,
> +	  0, bisp_factor_table, "de_clk1"},
> +	{ CLK_DE2, "de_clk2", "de_clk", 0, CMU_DECLK, 4, 3,
> +	  0, bisp_factor_table, "de_clk2"},
> +	{ CLK_DE3, "de_clk3", "de_clk", 0, CMU_DECLK, 8, 3,
> +	  0, bisp_factor_table, "de_clk3"},
> +};
> +
> +/* gate clocks */
> +static struct owl_gate_clock s900_gate_clks[] __initdata = {
> +	{ CLK_GPIO,  "gpio", "apb_clk", 0, CMU_DEVCLKEN0, 18, 0, "gpio"},
> +	{ CLK_GPU,   "gpu", NULL, 0, CMU_DEVCLKEN0, 30, 0, "gpu"},
> +	{ CLK_DMAC,  "dmac", "noc_clk_div", 0, CMU_DEVCLKEN0, 1, 0, "dmac"},
> +	{ CLK_TIMER,  "timer", "hosc", 0, CMU_DEVCLKEN1, 27, 0, "timer"},
> +	{ CLK_DSI,  "dsi_clk", NULL, 0, CMU_DEVCLKEN0, 12, 0, "dsi"},
> +
> +	{ CLK_DDR0,  "ddr0_clk", "ddr_pll", CLK_IGNORE_UNUSED, CMU_DEVCLKEN0,
> +	  31, 0, "ddr0"},
> +	{ CLK_DDR1,  "ddr1_clk", "ddr_pll", CLK_IGNORE_UNUSED, CMU_DEVCLKEN0,
> +	  29, 0, "ddr1"},
> +
> +	{ CLK_USB3_480MPLL0,	"usb3_480mpll0", NULL, 0, CMU_USBPLL,
> +	  3, 0, "usb3_480mpll0"},
> +	{ CLK_USB3_480MPHY0,	"usb3_480mphy0", NULL, 0, CMU_USBPLL,
> +	  2, 0, "usb3_480mphy0"},
> +	{ CLK_USB3_5GPHY,	"usb3_5gphy", NULL, 0, CMU_USBPLL,
> +	  1, 0, "usb3_5gphy"},
> +	{ CLK_USB3_CCE,		"usb3_cce", NULL, 0, CMU_USBPLL,
> +	  0, 0, "usb3_cce"},
> +
> +	{ CLK_24M_EDP,		"24M_edp", "24M_diff", 0, CMU_EDPCLK,
> +	  8, 0, "24M_edp"},
> +	{ CLK_EDP_LINK,		"edp_link", "edp_pll", 0, CMU_DEVCLKEN0,
> +	  10, 0, "edp_link"},
> +
> +	{ CLK_USB2H0_PLLEN,	"usbh0_pllen",	NULL, 0, CMU_USBPLL,
> +	  12, 0, "usbh0_pllen"},
> +	{ CLK_USB2H0_PHY,	"usbh0_phy",	NULL, 0, CMU_USBPLL,
> +	  10, 0, "usbh0_phy"},
> +	{ CLK_USB2H0_CCE,	"usbh0_cce",	NULL, 0, CMU_USBPLL,
> +	  8, 0, "usbh0_cce"},
> +
> +	{ CLK_USB2H1_PLLEN,	"usbh1_pllen",	NULL, 0, CMU_USBPLL,
> +	  13, 0, "usbh1_pllen"},
> +	{ CLK_USB2H1_PHY,	"usbh1_phy",	NULL, 0, CMU_USBPLL,
> +	  11, 0, "usbh1_phy"},
> +	{ CLK_USB2H1_CCE,	"usbh1_cce",	NULL, 0, CMU_USBPLL,
> +	  9, 0, "usbh1_cce"},
> +};
> +
> +static struct owl_composite_clock s900_composite_clks[] __initdata = {
> +	COMP_FACTOR_CLK(CLK_BISP, "bisp", 0,
> +			C_MUX(bisp_clk_mux_p, CMU_BISPCLK, 4, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 14, 0),
> +			C_FACTOR(CMU_BISPCLK, 0, 3, bisp_factor_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_CSI0, "csi0", 0,
> +			C_MUX(csi_clk_mux_p, CMU_CSICLK, 4, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 13, 0),
> +			C_DIVIDER(CMU_CSICLK, 0, 4, NULL, 0)),
> +
> +	COMP_DIV_CLK(CLK_CSI1, "csi1", 0,
> +			C_MUX(csi_clk_mux_p, CMU_CSICLK, 20, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 15, 0),
> +			C_DIVIDER(CMU_CSICLK, 16, 4, NULL, 0)),
> +
> +	COMP_PASS_CLK(CLK_DE, "de_clk", 0,
> +			C_MUX(de_clk_mux_p, CMU_DECLK, 12, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 8, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_DMM, "dmm", CLK_IGNORE_UNUSED,
> +			C_MUX(dmm_clk_mux_p, CMU_BUSCLK, 10, 2, 0),
> +			C_GATE(CMU_DEVCLKEN0, 19, 0),
> +			C_FACTOR(CMU_BUSCLK, 12, 3, dmm_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_EDP, "edp_clk", 0,
> +			C_MUX(edp_clk_mux_p, CMU_EDPCLK, 19, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 10, 0),
> +			C_FACTOR(CMU_EDPCLK, 16, 3, bisp_factor_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_ETH_MAC, "eth_mac", 0,
> +			C_MUX_F(eth_mac_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 22, 0),
> +			C_DIVIDER(CMU_ASSISTPLL, 10, 1, eth_mac_div_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_GPU_CORE, "gpu_core", 0,
> +			C_MUX(gpu_clk_mux_p, CMU_GPU3DCLK, 4, 2, 0),
> +			C_GATE(CMU_GPU3DCLK, 15, 0),
> +			C_FACTOR(CMU_GPU3DCLK, 0, 3, bisp_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_GPU_MEM, "gpu_mem", 0,
> +			C_MUX(gpu_clk_mux_p, CMU_GPU3DCLK, 20, 2, 0),
> +			C_GATE(CMU_GPU3DCLK, 14, 0),
> +			C_FACTOR(CMU_GPU3DCLK, 16, 3, bisp_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_GPU_SYS, "gpu_sys", 0,
> +			C_MUX(gpu_clk_mux_p, CMU_GPU3DCLK, 28, 2, 0),
> +			C_GATE(CMU_GPU3DCLK, 13, 0),
> +			C_FACTOR(CMU_GPU3DCLK, 24, 3, bisp_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_HDE, "hde", 0,
> +			C_MUX(hde_clk_mux_p, CMU_HDECLK, 4, 2, 0),
> +			C_GATE(CMU_DEVCLKEN0, 27, 0),
> +			C_FACTOR(CMU_HDECLK, 0, 3, bisp_factor_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_HDMI_AUDIO, "hdmia", 0,
> +			C_MUX(i2s_clk_mux_p, CMU_AUDIOPLL, 24, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 22, 0),
> +			C_DIVIDER(CMU_AUDIOPLL, 24, 4, hdmia_div_table, 0)),
> +
> +	COMP_FIXED_FACTOR_CLK(CLK_I2C0, "i2c0", 0,
> +			C_MUX_F(i2c_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 14, 0),
> +			C_FIXED_FACTOR(1, 5)),
> +
> +	COMP_FIXED_FACTOR_CLK(CLK_I2C1, "i2c1", 0,
> +			C_MUX_F(i2c_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 15, 0),
> +			C_FIXED_FACTOR(1, 5)),
> +
> +	COMP_FIXED_FACTOR_CLK(CLK_I2C2, "i2c2", 0,
> +			C_MUX_F(i2c_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 30, 0),
> +			C_FIXED_FACTOR(1, 5)),
> +
> +	COMP_FIXED_FACTOR_CLK(CLK_I2C3, "i2c3", 0,
> +			C_MUX_F(i2c_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 31, 0),
> +			C_FIXED_FACTOR(1, 5)),
> +
> +	COMP_FIXED_FACTOR_CLK(CLK_I2C4, "i2c4", 0,
> +			C_MUX_F(i2c_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN0, 17, 0),
> +			C_FIXED_FACTOR(1, 5)),
> +
> +	COMP_FIXED_FACTOR_CLK(CLK_I2C5, "i2c5", 0,
> +			C_MUX_F(i2c_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 1, 0),
> +			C_FIXED_FACTOR(1, 5)),
> +
> +	COMP_DIV_CLK(CLK_I2SRX, "i2srx", 0,
> +			C_MUX(i2s_clk_mux_p, CMU_AUDIOPLL, 24, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 21, 0),
> +			C_DIVIDER(CMU_AUDIOPLL, 20, 4, i2s_div_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_I2STX, "i2stx", 0,
> +			C_MUX(i2s_clk_mux_p, CMU_AUDIOPLL, 24, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 20, 0),
> +			C_DIVIDER(CMU_AUDIOPLL, 16, 4, i2s_div_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_IMX, "imx", 0,
> +			C_MUX(imx_clk_mux_p, CMU_IMXCLK, 4, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 17, 0),
> +			C_FACTOR(CMU_IMXCLK, 0, 3, bisp_factor_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_LCD, "lcd", 0,
> +			C_MUX(lcd_clk_mux_p, CMU_LCDCLK, 12, 2, 0),
> +			C_GATE(CMU_DEVCLKEN0, 9, 0),
> +			C_DIVIDER(CMU_LCDCLK, 0, 5, NULL, 0)),
> +
> +	COMP_DIV_CLK(CLK_NAND0, "nand0", CLK_SET_RATE_PARENT,
> +			C_MUX(nand_clk_mux_p, CMU_NANDCCLK, 8, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 4, 0),
> +			C_DIVIDER(CMU_NANDCCLK, 0, 4, nand_div_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_NAND1, "nand1", CLK_SET_RATE_PARENT,
> +			C_MUX(nand_clk_mux_p, CMU_NANDCCLK, 24, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 11, 0),
> +			C_DIVIDER(CMU_NANDCCLK, 16, 4, nand_div_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_PWM0, "pwm0", 0,
> +			C_MUX_F(pwm_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 23, 0),
> +			C_DIVIDER(CMU_PWM0CLK, 0, 6, NULL, 0)),
> +
> +	COMP_DIV_CLK(CLK_PWM0, "pwm1", 0,
> +			C_MUX_F(pwm_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 24, 0),
> +			C_DIVIDER(CMU_PWM1CLK, 0, 6, NULL, 0)),
> +	/*
> +	 * pwm2 may be for backlight, do not gate it
> +	 * even it is "unused", because it may be
> +	 * enabled at boot stage, and in kernel, driver
> +	 * has no effective method to know the real status,
> +	 * so, the best way is keeping it as what it was.
> +	 */
> +	COMP_DIV_CLK(CLK_PWM0, "pwm2", CLK_IGNORE_UNUSED,
> +			C_MUX_F(pwm_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 25, 0),
> +			C_DIVIDER(CMU_PWM2CLK, 0, 6, NULL, 0)),
> +
> +	COMP_DIV_CLK(CLK_PWM0, "pwm3", 0,
> +			C_MUX_F(pwm_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 26, 0),
> +			C_DIVIDER(CMU_PWM3CLK, 0, 6, NULL, 0)),
> +
> +	COMP_DIV_CLK(CLK_PWM0, "pwm4", 0,
> +			C_MUX_F(pwm_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 4, 0),
> +			C_DIVIDER(CMU_PWM4CLK, 0, 6, NULL, 0)),
> +
> +	COMP_DIV_CLK(CLK_PWM5, "pwm5", 0,
> +			C_MUX_F(pwm_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 5, 0),
> +			C_DIVIDER(CMU_PWM5CLK, 0, 6, NULL, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_SD0, "sd0", 0,
> +			C_MUX(sd_clk_mux_p, CMU_SD0CLK, 9, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 5, 0),
> +			C_FACTOR(CMU_SD0CLK, 0, 9, sd_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_SD1, "sd1", 0,
> +			C_MUX(sd_clk_mux_p, CMU_SD1CLK, 9, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 6, 0),
> +			C_FACTOR(CMU_SD1CLK, 0, 9, sd_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_SD2, "sd2", 0,
> +			C_MUX(sd_clk_mux_p, CMU_SD2CLK, 9, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 7, 0),
> +			C_FACTOR(CMU_SD2CLK, 0, 9, sd_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_SD3, "sd3", 0,
> +			C_MUX(sd_clk_mux_p, CMU_SD3CLK, 9, 1, 0),
> +			C_GATE(CMU_DEVCLKEN0, 16, 0),
> +			C_FACTOR(CMU_SD3CLK, 0, 9, sd_factor_table, 0)),
> +
> +	COMP_DIV_CLK(CLK_SENSOR, "sensor", 0,
> +			C_MUX(sensor_clk_mux_p, CMU_SENSORCLK, 4, 1, 0),
> +			C_NULL,
> +			C_DIVIDER(CMU_SENSORCLK, 0, 4, NULL, 0)),
> +
> +	COMP_DIV_CLK(CLK_SPEED_SENSOR, "speed_sensor", 0,
> +			C_MUX_F(speed_sensor_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 0, 0),
> +			C_DIVIDER(CMU_TLSCLK, 0, 4, NULL,
> +				  CLK_DIVIDER_POWER_OF_TWO)),
> +
> +	COMP_PASS_CLK(CLK_SPI0, "spi0", 0,
> +			C_MUX_F(spi_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 10, 0)),
> +
> +	COMP_PASS_CLK(CLK_SPI1, "spi1", 0,
> +			C_MUX_F(spi_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 11, 0)),
> +
> +	COMP_PASS_CLK(CLK_SPI2, "spi2", 0,
> +			C_MUX_F(spi_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 12, 0)),
> +
> +	COMP_PASS_CLK(CLK_SPI3, "spi3", 0,
> +			C_MUX_F(spi_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 13, 0)),
> +
> +	COMP_DIV_CLK(CLK_THERMAL_SENSOR, "thermal_sensor", 0,
> +			C_MUX_F(thermal_sensor_clk_mux_p, 0),
> +			C_GATE(CMU_DEVCLKEN1, 2, 0),
> +			C_DIVIDER(CMU_TLSCLK, 8, 4, NULL,
> +				  CLK_DIVIDER_POWER_OF_TWO)),
> +
> +	COMP_DIV_CLK(CLK_UART0, "uart0", 0,
> +			C_MUX(uart_clk_mux_p, CMU_UART0CLK, 16, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 6, 0),
> +			C_DIVIDER(CMU_UART0CLK, 0, 8, NULL,
> +				  CLK_DIVIDER_ROUND_CLOSEST)),
> +
> +	COMP_DIV_CLK(CLK_UART1, "uart1", 0,
> +			C_MUX(uart_clk_mux_p, CMU_UART1CLK, 16, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 7, 0),
> +			C_DIVIDER(CMU_UART1CLK, 1, 8, NULL,
> +				  CLK_DIVIDER_ROUND_CLOSEST)),
> +
> +	COMP_DIV_CLK(CLK_UART2, "uart2", 0,
> +			C_MUX(uart_clk_mux_p, CMU_UART2CLK, 16, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 8, 0),
> +			C_DIVIDER(CMU_UART2CLK, 0, 8, NULL,
> +				  CLK_DIVIDER_ROUND_CLOSEST)),
> +
> +	COMP_DIV_CLK(CLK_UART3, "uart3", 0,
> +			C_MUX(uart_clk_mux_p, CMU_UART3CLK, 16, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 19, 0),
> +			C_DIVIDER(CMU_UART3CLK, 0, 8, NULL,
> +				  CLK_DIVIDER_ROUND_CLOSEST)),
> +
> +	COMP_DIV_CLK(CLK_UART4, "uart4", 0,
> +			C_MUX(uart_clk_mux_p, CMU_UART4CLK, 16, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 20, 0),
> +			C_DIVIDER(CMU_UART4CLK, 0, 8, NULL,
> +				  CLK_DIVIDER_ROUND_CLOSEST)),
> +
> +	COMP_DIV_CLK(CLK_UART5, "uart5", 0,
> +			C_MUX(uart_clk_mux_p, CMU_UART5CLK, 16, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 21, 0),
> +			C_DIVIDER(CMU_UART5CLK, 0, 8, NULL,
> +				  CLK_DIVIDER_ROUND_CLOSEST)),
> +
> +	COMP_DIV_CLK(CLK_UART6, "uart6", 0,
> +			C_MUX(uart_clk_mux_p, CMU_UART6CLK, 16, 1, 0),
> +			C_GATE(CMU_DEVCLKEN1, 18, 0),
> +			C_DIVIDER(CMU_UART6CLK, 0, 8, NULL,
> +				  CLK_DIVIDER_ROUND_CLOSEST)),
> +
> +	COMP_FACTOR_CLK(CLK_VCE, "vce", 0,
> +			C_MUX(vce_clk_mux_p, CMU_VCECLK, 4, 2, 0),
> +			C_GATE(CMU_DEVCLKEN0, 26, 0),
> +			C_FACTOR(CMU_VCECLK, 0, 3, bisp_factor_table, 0)),
> +
> +	COMP_FACTOR_CLK(CLK_VDE, "vde", 0,
> +			C_MUX(hde_clk_mux_p, CMU_VDECLK, 4, 2, 0),
> +			C_GATE(CMU_DEVCLKEN0, 25, 0),
> +			C_FACTOR(CMU_VDECLK, 0, 3, bisp_factor_table, 0)),
> +};
> +
> +
> +void __init s900_clk_init(struct device_node *np)

static?

> +{
> +	struct owl_clk_provider *ctx;
> +	void __iomem *base;
> +
> +	pr_info("[OWL] S900 clock initialization");

Please no banners.

> +
> +	base = of_iomap(np, 0);
> +	if (!base)
> +		return;
> +
> +	ctx = owl_clk_init(np, base, CLK_NR_CLKS);
> +	if (!ctx)
> +		panic("%s: unable to allocate context.\n", __func__);
> +
> +	owl_clk_register_fixed_rate(ctx, s900_fixed_rate_clks,
> +			ARRAY_SIZE(s900_fixed_rate_clks));
> +
> +	owl_clk_register_pll(ctx, s900_pll_clks,
> +			ARRAY_SIZE(s900_pll_clks));
> +
> +	owl_clk_register_divider(ctx, s900_div_clks,
> +			ARRAY_SIZE(s900_div_clks));
> +
> +	owl_clk_register_factor(ctx, s900_factor_clks,
> +			ARRAY_SIZE(s900_factor_clks));
> +
> +	owl_clk_register_mux(ctx, s900_mux_clks,
> +			ARRAY_SIZE(s900_mux_clks));
> +
> +	owl_clk_register_gate(ctx, s900_gate_clks,
> +			ARRAY_SIZE(s900_gate_clks));
> +
> +	owl_clk_register_composite(ctx, s900_composite_clks,
> +			ARRAY_SIZE(s900_composite_clks));
> +}
> +CLK_OF_DECLARE(s900_clk, "actions,s900-clock", s900_clk_init);

Please move this to a platform driver design. That would probably
mean getting rid of the panic() calls too and checking for
errors and returning them to the driver probe caller.

> diff --git a/drivers/clk/owl/clk.c b/drivers/clk/owl/clk.c
> new file mode 100644
> index 0000000..2a12d68
> --- /dev/null
> +++ b/drivers/clk/owl/clk.c
> @@ -0,0 +1,461 @@
> +/*
> + * Utility functions to register clocks to common clock framework for
> + * Actions OWL SoC platforms.
> + *
> + * Copyright (C) 2014 Actions Semi Inc.
> + * Authors: David Liu <liuwei@actions-semi.com>
> + *          Haitao Zhang <hzhang@ucrobotics.com>
> + *          Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
> + *          Yixun Lan <yixun.lan@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License v2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
> +#include "clk.h"
> +
> +/* add a clock instance to the clock lookup table used for dt based lookup */
> +void owl_clk_add_lookup(struct owl_clk_provider *ctx, struct clk *clk,
> +				unsigned int id)
> +{
> +	if (ctx->clk_data.clks && id)
> +		ctx->clk_data.clks[id] = clk;
> +}
> +
> +/* register a list of fixed clocks */
> +void __init owl_clk_register_fixed_rate(struct owl_clk_provider *ctx,
> +		struct owl_fixed_rate_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = clk_register_fixed_rate(NULL, clks[i].name,
> +				clks[i].parent_name,
> +				clks[i].flags,
> +				clks[i].fixed_rate);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +				__func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		/*
> +		 * Unconditionally add a clock lookup for the fixed rate clocks.
> +		 * There are not many of these on any of Samsung platforms.
> +		 */
> +		ret = clk_register_clkdev(clk, clks[i].name, NULL);

Is clkdev being used by consumers? I imagine if this is for arm64
the only users are DT based lookups so hopefully clkdev lookups
aren't needed.

> +		if (ret)
> +			pr_err("%s: failed to register clock lookup for %s",
> +				__func__, clks[i].name);
> +	}
> +}
> +
> +/* register a list of fixed factor clocks */
> +void __init owl_clk_register_fixed_factor(struct owl_clk_provider *ctx,
> +		struct owl_fixed_factor_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = clk_register_fixed_factor(NULL, clks[i].name,
> +				clks[i].parent_name,
> +				clks[i].flags,
> +				clks[i].mult,
> +				clks[i].div);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +			       __func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		/*
> +		 * Unconditionally add a clock lookup for the fixed rate clocks.
> +		 * There are not many of these on any of Samsung platforms.
> +		 */
> +		ret = clk_register_clkdev(clk, clks[i].name, NULL);
> +		if (ret)
> +			pr_err("%s: failed to register clock lookup for %s",
> +				__func__, clks[i].name);
> +	}
> +}
> +
> +/* register a list of pll clocks */
> +void __init owl_clk_register_pll(struct owl_clk_provider *ctx,
> +		struct owl_pll_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = owl_pll_clk_register(clks[i].name, clks[i].parent_name,
> +				clks[i].flags, ctx->reg_base + clks[i].offset,
> +				clks[i].bfreq, clks[i].enable_bit,
> +				clks[i].shift, clks[i].width,
> +				clks[i].min_mul, clks[i].max_mul,
> +				clks[i].pll_flags, clks[i].table,
> +				&ctx->lock);
> +
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +				__func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		/*
> +		 * Unconditionally add a clock lookup for the fixed rate clocks.
> +		 * There are not many of these on any of Samsung platforms.
> +		 */
> +		ret = clk_register_clkdev(clk, clks[i].name, NULL);
> +		if (ret)
> +			pr_err("%s: failed to register clock lookup for %s",
> +				__func__, clks[i].name);
> +	}
> +}
> +
> +void __init owl_clk_register_divider(struct owl_clk_provider *ctx,
> +		struct owl_divider_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = clk_register_divider_table(NULL, clks[i].name,
> +				clks[i].parent_name,
> +				clks[i].flags,
> +				ctx->reg_base + clks[i].offset,
> +				clks[i].shift, clks[i].width,
> +				clks[i].div_flags,
> +				clks[i].table,
> +				&ctx->lock);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +				__func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		if (clks[i].alias) {
> +			ret = clk_register_clkdev(clk, clks[i].alias, NULL);
> +			if (ret)
> +				pr_err("%s: failed to register lookup %s\n",
> +					__func__, clks[i].alias);
> +		}
> +	}
> +}
> +
> +void __init owl_clk_register_factor(struct owl_clk_provider *ctx,
> +		struct owl_factor_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = owl_factor_clk_register(NULL, clks[i].name,
> +						 clks[i].parent_name,
> +						 clks[i].flags,
> +						 ctx->reg_base + clks[i].offset,
> +						 clks[i].shift, clks[i].width,
> +						 clks[i].div_flags,
> +						 clks[i].table,
> +						 &ctx->lock);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +				__func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		if (clks[i].alias) {
> +			ret = clk_register_clkdev(clk, clks[i].alias, NULL);
> +			if (ret)
> +				pr_err("%s: failed to register lookup %s\n",
> +						__func__, clks[i].alias);
> +		}
> +	}
> +}
> +
> +void __init owl_clk_register_mux(struct owl_clk_provider *ctx,
> +		struct owl_mux_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = clk_register_mux(NULL, clks[i].name, clks[i].parent_names,
> +				clks[i].num_parents, clks[i].flags,
> +				ctx->reg_base + clks[i].offset, clks[i].shift,
> +				clks[i].width, clks[i].mux_flags,
> +				&ctx->lock);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +				__func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		if (clks[i].alias) {
> +			ret = clk_register_clkdev(clk, clks[i].alias, NULL);
> +			if (ret)
> +				pr_err("%s: failed to register lookup %s\n",
> +					__func__, clks[i].alias);
> +		}
> +	}
> +}
> +
> +void __init owl_clk_register_gate(struct owl_clk_provider *ctx,
> +		struct owl_gate_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = clk_register_gate(NULL, clks[i].name,
> +				clks[i].parent_name,
> +				clks[i].flags,
> +				ctx->reg_base + clks[i].offset,
> +				clks[i].bit_idx,
> +				clks[i].gate_flags,
> +				&ctx->lock);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +			       __func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		if (clks[i].alias) {
> +			ret = clk_register_clkdev(clk, clks[i].alias, NULL);
> +			if (ret)
> +				pr_err("%s: failed to register lookup %s\n",
> +					__func__, clks[i].alias);
> +		}
> +	}
> +}
> +
> +static struct clk * __init _register_composite(struct owl_clk_provider *ctx,
> +			struct owl_composite_clock *cclk)
> +{
> +	struct clk *clk;
> +	struct owl_mux_clock *amux;
> +	struct owl_gate_clock *agate;
> +	union rate_clock *arate;
> +	struct clk_gate *gate = NULL;
> +	struct clk_mux *mux = NULL;
> +	struct clk_fixed_rate *fixed = NULL;
> +	struct clk_fixed_factor *fixed_factor = NULL;
> +	struct clk_divider *div = NULL;
> +	struct owl_factor *factor = NULL;
> +	struct clk_hw *mux_hw = NULL;
> +	struct clk_hw *gate_hw = NULL;
> +	struct clk_hw *rate_hw = NULL;
> +	const struct clk_ops *rate_ops = NULL;
> +	const char *clk_name = cclk->name;
> +	const char **parent_names;
> +	int i, num_parents;
> +
> +	amux = &cclk->mux;
> +	agate = &cclk->gate;
> +	arate = &cclk->rate;
> +
> +	parent_names = NULL;
> +	num_parents = 0;
> +
> +	if (amux->id) {
> +		num_parents = amux->num_parents;
> +		if (num_parents > 0) {
> +			parent_names = kzalloc((sizeof(char *) * num_parents),
> +					GFP_KERNEL);
> +			if (!parent_names)
> +				return ERR_PTR(-ENOMEM);
> +
> +			for (i = 0; i < num_parents; i++)
> +				parent_names[i] = kstrdup(amux->parent_names[i],
> +						GFP_KERNEL);
> +		}
> +
> +		mux = kzalloc(sizeof(struct clk_mux), GFP_KERNEL);
> +		if (!mux)
> +			return NULL;
> +
> +		/* set up gate properties */
> +		mux->reg = ctx->reg_base + amux->offset;
> +		mux->shift = amux->shift;
> +		mux->mask = BIT(amux->width) - 1;
> +		mux->flags = amux->mux_flags;
> +		mux->lock = &ctx->lock;
> +		mux_hw = &mux->hw;
> +	}
> +
> +	if (arate->fixed.id) {
> +		switch (cclk->type) {
> +		case OWL_COMPOSITE_TYPE_FIXED_RATE:
> +			fixed = kzalloc(sizeof(struct clk_fixed_rate),

sizeof(*fixed)

> +					GFP_KERNEL);
> +			if (!fixed)
> +				return NULL;
> +			fixed->fixed_rate = arate->fixed.fixed_rate;
> +			rate_ops = &clk_fixed_rate_ops;
> +			rate_hw = &fixed->hw;
> +			break;
> +
> +		case OWL_COMPOSITE_TYPE_FIXED_FACTOR:
> +			fixed_factor = kzalloc(sizeof(struct clk_fixed_factor),
> +					GFP_KERNEL);
> +			if (!fixed_factor)
> +				return NULL;
> +			fixed_factor->mult = arate->fixed_factor.mult;
> +			fixed_factor->div = arate->fixed_factor.div;
> +
> +			rate_ops = &clk_fixed_factor_ops;
> +			rate_hw = &fixed_factor->hw;
> +			break;
> +
> +		case OWL_COMPOSITE_TYPE_DIVIDER:
> +			div = kzalloc(sizeof(struct clk_divider), GFP_KERNEL);
> +			if (!div)
> +				return NULL;
> +			div->reg = ctx->reg_base + arate->div.offset;
> +			div->shift = arate->div.shift;
> +			div->width = arate->div.width;
> +			div->flags = arate->div.div_flags;
> +			div->table = arate->div.table;
> +			div->lock = &ctx->lock;
> +
> +			rate_ops = &clk_divider_ops;
> +			rate_hw = &div->hw;
> +			break;
> +
> +		case OWL_COMPOSITE_TYPE_FACTOR:
> +			factor = kzalloc(sizeof(struct owl_factor),
> +					GFP_KERNEL);
> +			if (!factor)
> +				return NULL;
> +			factor->reg = ctx->reg_base + arate->factor.offset;
> +			factor->shift = arate->factor.shift;
> +			factor->width = arate->factor.width;
> +			factor->flags = arate->factor.div_flags;
> +			factor->table = arate->factor.table;
> +			factor->lock = &ctx->lock;
> +
> +			rate_ops = &owl_factor_ops;
> +			rate_hw = &factor->hw;
> +			break;
> +
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (agate->id) {
> +		gate = kzalloc(sizeof(struct clk_gate), GFP_KERNEL);
> +		if (!gate)
> +			return ERR_PTR(-ENOMEM);
> +
> +		/* set up gate properties */
> +		gate->reg = ctx->reg_base + agate->offset;
> +		gate->bit_idx = agate->bit_idx;
> +		gate->lock = &ctx->lock;
> +		gate_hw = &gate->hw;
> +	}
> +
> +	clk = clk_register_composite(NULL, clk_name,
> +			parent_names, num_parents,
> +			mux_hw, &clk_mux_ops,
> +			rate_hw, rate_ops,
> +			gate_hw, &clk_gate_ops, cclk->flags);
> +	if (IS_ERR(clk)) {
> +		pr_err("%s: failed to register clock %s\n",
> +			__func__, clk_name);
> +	}
> +
> +	return clk;
> +}
> +
> +void __init owl_clk_register_composite(struct owl_clk_provider *ctx,
> +		struct owl_composite_clock *clks, int nums)
> +{
> +	struct clk *clk;
> +	int i, ret;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk = _register_composite(ctx, &clks[i]);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n",
> +				__func__, clks[i].name);
> +			continue;
> +		}
> +
> +		owl_clk_add_lookup(ctx, clk, clks[i].id);
> +
> +		ret = clk_register_clkdev(clk, clks[i].name, NULL);
> +		if (ret)
> +			pr_err("%s: failed to register lookup %s\n",
> +				__func__, clks[i].name);
> +		}
> +}
> +
> +/* setup the essentials required to support clock lookup using ccf */
> +struct owl_clk_provider * __init owl_clk_init(struct device_node *np,
> +		void __iomem *base, unsigned long nr_clks)
> +{
> +	struct owl_clk_provider *ctx;
> +	struct clk **clk_table;
> +	int ret;
> +	int i;
> +
> +	ctx = kzalloc(sizeof(struct owl_clk_provider), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk_table = kcalloc(nr_clks, sizeof(struct clk *), GFP_KERNEL);
> +	if (!clk_table)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < nr_clks; ++i)
> +		clk_table[i] = ERR_PTR(-ENOENT);
> +
> +	ctx->reg_base = base;
> +	ctx->clk_data.clks = clk_table;
> +	ctx->clk_data.clk_num = nr_clks;
> +	spin_lock_init(&ctx->lock);
> +
> +	if (!np)
> +		return ctx;
> +
> +	ret = of_clk_add_provider(np, of_clk_src_onecell_get,

Please use of_clk_add_hw_provider().

> +			&ctx->clk_data);
> +	if (ret)
> +		panic("could not register clock provide\n");
> +
> +	return ctx;
> +}
> diff --git a/drivers/clk/owl/clk.h b/drivers/clk/owl/clk.h
> new file mode 100644
> index 0000000..591809c0
> --- /dev/null
> +++ b/drivers/clk/owl/clk.h
> @@ -0,0 +1,369 @@
> +/*
> + * Utility functions to register clocks to common clock framework for
> + * Actions platforms.
> + *
> + * Copyright (C) 2014 Actions Semi Inc.
> + * Authors: David Liu <liuwei@actions-semi.com>
> + *          Haitao Zhang <hzhang@ucrobotics.com>
> + *          Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
> + *          Yixun Lan <yixun.lan@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License v2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __OWL_CLK_H
> +#define __OWL_CLK_H
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/io.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

Please forward declare structures instead of including files like
this in another header file. It makes for simpler times to find
which C files (i.e. actual code) is using what headers.

> +
> +/**
> + * struct owl_clk_provider: information about clock provider
> + * @reg_base: virtual address for the register base.
> + * @clk_data: holds clock related data like clk* and number of clocks.
> + * @lock: maintains exclusion bwtween callbacks for a given clock-provider.
> + */
> +struct owl_clk_provider {
> +	void __iomem		*reg_base;
> +	struct clk_onecell_data clk_data;
> +	spinlock_t		lock;
> +};
> +
> +/* fixed rate clock */
> +struct owl_fixed_rate_clock {
> +	unsigned int		id;
> +	char			*name;
> +	const char		*parent_name;

Do fixed rate clks have parents?

> +	unsigned long		flags;
> +	unsigned long		fixed_rate;
> +};
> +
> +/* fixed factor clock */
> +struct owl_fixed_factor_clock {
> +	unsigned int		id;
> +	char			*name;
> +	const char		*parent_name;
> +	unsigned long		flags;
> +	unsigned int		mult;
> +	unsigned int		div;
> +};
> +
> +/* PLL clock */
> +
> +/* last entry should have rate = 0 */
> +struct clk_pll_table {
> +	unsigned int		val;
> +	unsigned long		rate;
> +};
> +
> +struct owl_pll_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char		*parent_name;
> +	unsigned long		flags;
> +	unsigned long		offset;
> +
> +	unsigned long		bfreq;
> +	u8			enable_bit;
> +	u8			shift;
> +	u8			width;
> +	u8			min_mul;
> +	u8			max_mul;
> +	u8			pll_flags;
> +	const struct clk_pll_table *table;
> +};
> +
> +/* pll_flags*/
> +#define CLK_OWL_PLL_FIXED_FREQ		BIT(0)
> +
> +/* divider clock */
> +struct owl_divider_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char		*parent_name;
> +	unsigned long		flags;
> +	unsigned long		offset;
> +	u8			shift;
> +	u8			width;
> +	u8			div_flags;
> +	struct clk_div_table	*table;
> +	const char		*alias;
> +};
> +
> +/* factor divider table clock */
> +
> +struct clk_factor_table {
> +	unsigned int		val;
> +	unsigned int		mul;
> +	unsigned int		div;
> +};
> +
> +struct owl_factor_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char		*parent_name;
> +	unsigned long		flags;
> +	unsigned long		offset;
> +	u8			shift;
> +	u8			width;
> +	u8			div_flags;
> +	struct clk_factor_table	*table;
> +	const char		*alias;
> +};
> +
> +/**
> + * struct owl_factor - factor divider clock
> + *
> + * @hw:		handle between common and hardware-specific interfaces
> + * @reg:	register containing the factor divider
> + * @shift:	shift to the divider bit field
> + * @width:	width of the divider bit field
> + * @table:	array of value/multiplier/divider pairs, last entry should
> + *			have div = 0
> + * @lock:	register lock
> + *
> + * Clock with an factor divider table affecting its output frequency.
> + * Implements .recalc_rate, .set_rate and .round_rate
> + */
> +struct owl_factor {
> +	struct clk_hw		hw;
> +	void __iomem		*reg;
> +	u8			shift;
> +	u8			width;
> +	u8			flags;
> +	const struct clk_factor_table	*table;
> +	spinlock_t		*lock;
> +};
> +
> +extern struct clk_ops owl_factor_ops;
> +
> +/* mux clock */
> +struct owl_mux_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char		**parent_names;
> +	u8			num_parents;
> +	unsigned long		flags;
> +	unsigned long		offset;
> +	u8			shift;
> +	u8			width;
> +	u8			mux_flags;
> +	const char		*alias;
> +};
> +
> +/* gate clock */
> +struct owl_gate_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char		*parent_name;
> +	unsigned long		flags;
> +	unsigned long		offset;
> +	u8			bit_idx;
> +	u8			gate_flags;
> +	const char		*alias;
> +};
> +
> +/* composite clock */
> +
> +union rate_clock {
> +	struct owl_fixed_rate_clock	fixed;
> +	struct owl_fixed_factor_clock	fixed_factor;
> +	struct owl_divider_clock	div;
> +	struct owl_factor_clock		factor;
> +};
> +
> +struct owl_composite_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	unsigned int		type;
> +	unsigned long		flags;
> +
> +	struct owl_mux_clock	mux;
> +	struct owl_gate_clock	gate;
> +	union rate_clock	rate;
> +};

How about using the basic clk type structures as is instead of
having a bunch of SoC specific description structures to call the
registration functions with? That would mean we lose the ability
to throw away the static data at runtime, but things would
probably be more direct and understandable because we don't
indirect through the descriptor structures. I'm not sure we
really care about throwing away the data anyway, because most if
not all of it needs to be copied anyway and if we're compiling
more than one device into the kernel we don't care about size
anyway because we should have customized our kernel at compile
time. It may actually be faster too because structures would
already be setup by the compiler instead of during boot.

> +
> +#define OWL_COMPOSITE_TYPE_FIXED_RATE      1
> +#define OWL_COMPOSITE_TYPE_DIVIDER         2
> +#define OWL_COMPOSITE_TYPE_FACTOR          3
> +#define OWL_COMPOSITE_TYPE_FIXED_FACTOR    4
> +#define OWL_COMPOSITE_TYPE_PASS            10
> +
> +#define COMP_FIXED_CLK(_id, _name, _flags, _mux, _gate, _div)		\
> +	{								\
> +		.id		= _id,					\
> +		.name		= _name,				\
> +		.type		= OWL_COMPOSITE_TYPE_FIXED_RATE,	\
> +		.flags		= _flags,				\
> +		.mux		= _mux,					\
> +		.gate		= _gate,				\
> +		.rate.fixed	= _div,					\
> +	}

These probably all cause checkpatch to complain, please enclose
everything in parentheses.

> +extern struct owl_clk_provider * __init owl_clk_init(struct device_node *np,
> +		void __iomem *base, unsigned long nr_clks);
> +
> +extern void __init owl_clk_register_fixed_rate(struct owl_clk_provider *ctx,
> +		struct owl_fixed_rate_clock *clks, int nums);
> +
> +extern void __init owl_clk_register_pll(struct owl_clk_provider *ctx,
> +		struct owl_pll_clock *clks, int nums);
> +
> +extern void __init owl_clk_register_fixed_factor(
> +		struct owl_clk_provider *ctx,
> +		struct owl_fixed_factor_clock *clks,
> +		int nums);
> +
> +extern void __init owl_clk_register_divider(struct owl_clk_provider *ctx,
> +		struct owl_divider_clock *clks, int nums);
> +
> +extern void __init owl_clk_register_factor(struct owl_clk_provider *ctx,
> +		struct owl_factor_clock *clks, int nums);

__init isn't needed in header files.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
