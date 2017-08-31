Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:41843 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750783AbdHaI40 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2017 04:56:26 -0400
Date: Thu, 31 Aug 2017 10:56:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ingo van Lil <inguin@gmx.de>
Cc: linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Nicolas Ferre <nicolas.ferre@atmel.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: at91: utmi: Support configurable multipliers
Message-ID: <20170831105607.6144abf1@bbrezillon>
In-Reply-To: <20170710122409.3017-1-inguin@gmx.de>
References: <20170710122409.3017-1-inguin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Ingo,

Sorry for the delay.

On Mon, 10 Jul 2017 14:24:09 +0200
Ingo van Lil <inguin@gmx.de> wrote:

> The AT91 UTMI clock is a PLL generating the 480 MHz USB clock.
> Originally, this PLL always had a fixed x40 multiplier, thus requiring
> a 12 MHz input clock. Recent SOCs (sama5d2 and sama5d3) have a special
> function register for configuring this multiplier, allowing to use
> different main clock frequencies.

Looks good to me, just a few nitpicks below. Once addressed you can add

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> Signed-off-by: Ingo van Lil <inguin@gmx.de>
> ---
>  drivers/clk/at91/clk-utmi.c  | 105 +++++++++++++++++++++++++++++++++++++++++--
>  include/soc/at91/atmel-sfr.h |   2 +
>  2 files changed, 104 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
> index aadabd9..d41c38b 100644
> --- a/drivers/clk/at91/clk-utmi.c
> +++ b/drivers/clk/at91/clk-utmi.c
> @@ -14,14 +14,29 @@
>  #include <linux/of.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <soc/at91/atmel-sfr.h>
>  
>  #include "pmc.h"
>  
> +/* default multiplier for SOCs that do not allow configuration via SFR */
>  #define UTMI_FIXED_MUL		40
>  
> +/* supported multiplier settings for SOCs that allow configuration via SFR */
> +struct utmi_multipliers {
> +	const char *sfr_compatible_name;

	const char *sfr_compat;

so that you don't end with formatting issues because of the 80 chars
per line rule.

> +	u8 multipliers[4];
> +};
> +
> +static const struct utmi_multipliers utmi_multipliers[] = {
> +	{ "atmel,sama5d2-sfr", { 40, 30, 20, 40 } },
> +	{ "atmel,sama5d3-sfr", { 40, 30, 20, 10 } },
> +};
> +
>  struct clk_utmi {
>  	struct clk_hw hw;
>  	struct regmap *regmap;
> +	struct regmap *sfr_regmap;
> +	const u8 *multipliers;
>  };
>  
>  #define to_clk_utmi(hw) container_of(hw, struct clk_utmi, hw)
> @@ -66,8 +81,67 @@ static void clk_utmi_unprepare(struct clk_hw *hw)
>  static unsigned long clk_utmi_recalc_rate(struct clk_hw *hw,
>  					  unsigned long parent_rate)
>  {
> -	/* UTMI clk is a fixed clk multiplier */
> -	return parent_rate * UTMI_FIXED_MUL;
> +	struct clk_utmi *utmi = to_clk_utmi(hw);
> +	u8 mul = UTMI_FIXED_MUL;
> +
> +	if (utmi->sfr_regmap && utmi->multipliers) {
> +		u32 regval;

Add an empty line here.

> +		regmap_read(utmi->sfr_regmap, AT91_SFR_UTMICKTRIM, &regval);
> +		mul = utmi->multipliers[regval & AT91_UTMICKTRIM_FREQ_MASK];
> +	}
> +
> +	return parent_rate * mul;
> +}
> +
> +static long clk_utmi_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	struct clk_utmi *utmi = to_clk_utmi(hw);
> +	unsigned long bestrate = 0;
> +	int bestdiff = -1;
> +	int i;
> +
> +	if (!utmi->sfr_regmap || !utmi->multipliers)
> +		return *parent_rate * UTMI_FIXED_MUL;
> +
> +	for (i = 0; i < ARRAY_SIZE(utmi_multipliers); i++) {
> +		unsigned long tmprate = *parent_rate * utmi->multipliers[i];
> +		int tmpdiff;
> +
> +		if (tmprate < rate)
> +			continue;
> +
> +		tmpdiff = tmprate - rate;
> +		if (bestdiff < 0 || bestdiff > tmpdiff) {
> +			bestrate = tmprate;
> +			bestdiff = tmpdiff;
> +		}
> +
> +		if (!bestdiff)
> +			break;
> +	}
> +
> +	return bestrate;
> +}
> +
> +static int clk_utmi_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct clk_utmi *utmi = to_clk_utmi(hw);
> +	int i;
> +
> +	if (!utmi->sfr_regmap || !utmi->multipliers)
> +		return rate == parent_rate * UTMI_FIXED_MUL ? 0 : -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(utmi_multipliers); i++) {
> +		if (rate == parent_rate * utmi->multipliers[i]) {
> +			regmap_update_bits(utmi->sfr_regmap, AT91_SFR_UTMICKTRIM,
> +					   AT91_UTMICKTRIM_FREQ_MASK, i);
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  static const struct clk_ops utmi_ops = {
> @@ -75,10 +149,13 @@ static const struct clk_ops utmi_ops = {
>  	.unprepare = clk_utmi_unprepare,
>  	.is_prepared = clk_utmi_is_prepared,
>  	.recalc_rate = clk_utmi_recalc_rate,
> +	.round_rate = clk_utmi_round_rate,
> +	.set_rate = clk_utmi_set_rate,
>  };
>  
>  static struct clk_hw * __init
>  at91_clk_register_utmi(struct regmap *regmap,
> +		       struct regmap *sfr_regmap, const u8 *multipliers,
>  		       const char *name, const char *parent_name)
>  {
>  	struct clk_utmi *utmi;
> @@ -98,6 +175,8 @@ at91_clk_register_utmi(struct regmap *regmap,
>  
>  	utmi->hw.init = &init;
>  	utmi->regmap = regmap;
> +	utmi->sfr_regmap = sfr_regmap;
> +	utmi->multipliers = multipliers;
>  
>  	hw = &utmi->hw;
>  	ret = clk_hw_register(NULL, &utmi->hw);
> @@ -115,6 +194,9 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
>  	const char *parent_name;
>  	const char *name = np->name;
>  	struct regmap *regmap;
> +	struct regmap *sfr_regmap;
> +	const u8 *multipliers = NULL;
> +	size_t i;
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> @@ -124,7 +206,24 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
>  	if (IS_ERR(regmap))
>  		return;
>  
> -	hw = at91_clk_register_utmi(regmap, name, parent_name);
> +	for (i = 0; i < ARRAY_SIZE(utmi_multipliers); i++) {
> +		sfr_regmap = syscon_regmap_lookup_by_compatible(
> +			utmi_multipliers[i].sfr_compatible_name);

		const char *compat = utmi_multipliers[i].sfr_compat;

		sfr_regmap = syscon_regmap_lookup_by_compatible(compat);

This way you avoid this weird formatting.

> +		if (!IS_ERR(sfr_regmap)) {
> +			pr_debug("clk-utmi: found sfr node: %s\n",
> +				 utmi_multipliers[i].sfr_compatible_name);
> +			multipliers = utmi_multipliers[i].multipliers;
> +			break;
> +		}
> +	}
> +
> +	if (IS_ERR(sfr_regmap)) {
> +		pr_debug("clk-utmi: failed to find sfr node\n");
> +		sfr_regmap = NULL;
> +	}
> +
> +	hw = at91_clk_register_utmi(regmap, sfr_regmap, multipliers,
> +				    name, parent_name);
>  	if (IS_ERR(hw))
>  		return;
>  
> diff --git a/include/soc/at91/atmel-sfr.h b/include/soc/at91/atmel-sfr.h
> index 506ea8f..763948e 100644
> --- a/include/soc/at91/atmel-sfr.h
> +++ b/include/soc/at91/atmel-sfr.h
> @@ -17,6 +17,7 @@
>  /* 0x08 ~ 0x0c: Reserved */
>  #define AT91_SFR_OHCIICR	0x10	/* OHCI INT Configuration Register */
>  #define AT91_SFR_OHCIISR	0x14	/* OHCI INT Status Register */
> +#define AT91_SFR_UTMICKTRIM	0x30	/* UTMI Clock Trimming Register */
>  #define AT91_SFR_I2SCLKSEL	0x90	/* I2SC Register */
>  
>  /* Field definitions */
> @@ -28,5 +29,6 @@
>  					 AT91_OHCIICR_SUSPEND_B | \
>  					 AT91_OHCIICR_SUSPEND_C)
>  
> +#define AT91_UTMICKTRIM_FREQ_MASK	0x03
>  
>  #endif /* _LINUX_MFD_SYSCON_ATMEL_SFR_H */

