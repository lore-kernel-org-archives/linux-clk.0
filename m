Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 31 Aug 2017 12:02:59 +0200
From: Ludovic Desroches <ludovic.desroches@microchip.com>
To: Ingo van Lil <inguin@gmx.de>
Subject: Re: [PATCH] clk: at91: utmi: Support configurable multipliers
Message-ID: <20170831100259.qj4cisnu2il6mo5y@rfolt0960.corp.atmel.com>
References: <20170710122409.3017-1-inguin@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qsoczu47mcxkeksl"
In-Reply-To: <20170710122409.3017-1-inguin@gmx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

--qsoczu47mcxkeksl
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Ingo,

I did a similar patch, and I was told that you sent something similar.
I missed your patch since I have not subscribed to the linux-clk mailing
list. If it's related to at91, you should send it to linux-arm mailing list
too.

On Mon, Jul 10, 2017 at 02:24:09PM +0200, Ingo van Lil wrote:
> The AT91 UTMI clock is a PLL generating the 480 MHz USB clock.
> Originally, this PLL always had a fixed x40 multiplier, thus requiring
> a 12 MHz input clock. Recent SOCs (sama5d2 and sama5d3) have a special
> function register for configuring this multiplier, allowing to use
> different main clock frequencies.
> 
> Signed-off-by: Ingo van Lil <inguin@gmx.de>

Unfortunately, replacing my patch by yours, it no longer works. More
precisely, USB stuff is broken: utmi rate is weird.

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
> +	u8 multipliers[4];
> +};
> +
> +static const struct utmi_multipliers utmi_multipliers[] = {
> +	{ "atmel,sama5d2-sfr", { 40, 30, 20, 40 } },
> +	{ "atmel,sama5d3-sfr", { 40, 30, 20, 10 } },
> +};
> +

I will see if there is no mistake in the datasheet. On my side, I deal
only with '40, 30, 20, 10' case, I am not sure we have to take care of
'40, 30, 20, 40' even if it's not a mistake in the datasheet.

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

What's the purpose of this addition? Who should set the rate of the utmi
clock? I mean you have no choice, the rate is 480 MHz.

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

You can use GENMASK here.

>  
>  #endif /* _LINUX_MFD_SYSCON_ATMEL_SFR_H */

I have attached the patch I did.

Regards

Ludovic

--qsoczu47mcxkeksl
Content-Type: text/x-diff; charset="us-ascii"
Content-Disposition: attachment; filename="utmi.patch"

diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index aadabd9d1e2b..0b88147c4ec6 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -14,14 +14,15 @@
 #include <linux/of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+#include <soc/at91/atmel-sfr.h>
 
 #include "pmc.h"
 
-#define UTMI_FIXED_MUL		40
-
 struct clk_utmi {
 	struct clk_hw hw;
-	struct regmap *regmap;
+	unsigned int mul;
+	struct regmap *regmap_pmc;
+	struct regmap *regmap_sfr;
 };
 
 #define to_clk_utmi(hw) container_of(hw, struct clk_utmi, hw)
@@ -37,13 +38,54 @@ static inline bool clk_utmi_ready(struct regmap *regmap)
 
 static int clk_utmi_prepare(struct clk_hw *hw)
 {
+	struct clk_hw *hw_parent;
 	struct clk_utmi *utmi = to_clk_utmi(hw);
 	unsigned int uckr = AT91_PMC_UPLLEN | AT91_PMC_UPLLCOUNT |
 			    AT91_PMC_BIASEN;
+	unsigned int utmi_ref_clk_freq;
+	unsigned long parent_rate;
+
+	/*
+	 * If mainck rate is different from 12 MHz, we have to configure the
+	 * FREQ field of the SFR_UTMICKTRIM register to generate properly
+	 * the utmi clock.
+	 */
+	hw_parent = clk_hw_get_parent(hw);
+	parent_rate = clk_hw_get_rate(hw_parent);
+
+	switch (parent_rate) {
+	case 12000000:
+		utmi_ref_clk_freq = 0;
+		utmi->mul = 40;
+		break;
+	case 16000000:
+		utmi_ref_clk_freq = 1;
+		utmi->mul = 30;
+		break;
+	case 24000000:
+		utmi_ref_clk_freq = 2;
+		utmi->mul = 20;
+		break;
+	case 48000000:
+		utmi_ref_clk_freq = 3;
+		utmi->mul = 10;
+		break;
+	default:
+		pr_err("Unsupported mainck rate to generate the utmi clock\n");
+		return -EINVAL;
+	}
+
+	if (utmi_ref_clk_freq & !utmi->regmap_sfr) {
+		pr_err("If mainck rate is different from 12 MHz, the sfr node is required to generate the utmi clock\n");
+		return -EINVAL;
+	}
 
-	regmap_update_bits(utmi->regmap, AT91_CKGR_UCKR, uckr, uckr);
+	regmap_update_bits(utmi->regmap_sfr, AT91_SFR_UTMICKTRIM,
+			   AT91_UTMICKTRIM_FREQ, utmi_ref_clk_freq);
 
-	while (!clk_utmi_ready(utmi->regmap))
+	regmap_update_bits(utmi->regmap_pmc, AT91_CKGR_UCKR, uckr, uckr);
+
+	while (!clk_utmi_ready(utmi->regmap_pmc))
 		cpu_relax();
 
 	return 0;
@@ -53,21 +95,22 @@ static int clk_utmi_is_prepared(struct clk_hw *hw)
 {
 	struct clk_utmi *utmi = to_clk_utmi(hw);
 
-	return clk_utmi_ready(utmi->regmap);
+	return clk_utmi_ready(utmi->regmap_pmc);
 }
 
 static void clk_utmi_unprepare(struct clk_hw *hw)
 {
 	struct clk_utmi *utmi = to_clk_utmi(hw);
 
-	regmap_update_bits(utmi->regmap, AT91_CKGR_UCKR, AT91_PMC_UPLLEN, 0);
+	regmap_update_bits(utmi->regmap_pmc, AT91_CKGR_UCKR, AT91_PMC_UPLLEN, 0);
 }
 
 static unsigned long clk_utmi_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
 {
-	/* UTMI clk is a fixed clk multiplier */
-	return parent_rate * UTMI_FIXED_MUL;
+	struct clk_utmi *utmi = to_clk_utmi(hw);
+
+	return parent_rate * utmi->mul;
 }
 
 static const struct clk_ops utmi_ops = {
@@ -78,7 +121,7 @@ static const struct clk_ops utmi_ops = {
 };
 
 static struct clk_hw * __init
-at91_clk_register_utmi(struct regmap *regmap,
+at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
 		       const char *name, const char *parent_name)
 {
 	struct clk_utmi *utmi;
@@ -97,7 +140,8 @@ at91_clk_register_utmi(struct regmap *regmap,
 	init.flags = CLK_SET_RATE_GATE;
 
 	utmi->hw.init = &init;
-	utmi->regmap = regmap;
+	utmi->regmap_pmc = regmap_pmc;
+	utmi->regmap_sfr = regmap_sfr;
 
 	hw = &utmi->hw;
 	ret = clk_hw_register(NULL, &utmi->hw);
@@ -114,17 +158,20 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
 	struct clk_hw *hw;
 	const char *parent_name;
 	const char *name = np->name;
-	struct regmap *regmap;
+	struct regmap *regmap_pmc, *regmap_sfr;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
-	if (IS_ERR(regmap))
+	regmap_pmc = syscon_node_to_regmap(of_get_parent(np));
+	if (IS_ERR(regmap_pmc))
 		return;
 
-	hw = at91_clk_register_utmi(regmap, name, parent_name);
+	/* SFR node missing is not necessarily an issue, we'll check it later. */
+	regmap_sfr = syscon_regmap_lookup_by_compatible("atmel,sama5d2-sfr");
+
+	hw = at91_clk_register_utmi(regmap_pmc, regmap_sfr, name, parent_name);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/include/soc/at91/atmel-sfr.h b/include/soc/at91/atmel-sfr.h
index 506ea8ffda19..ad97856f8964 100644
--- a/include/soc/at91/atmel-sfr.h
+++ b/include/soc/at91/atmel-sfr.h
@@ -17,6 +17,7 @@
 /* 0x08 ~ 0x0c: Reserved */
 #define AT91_SFR_OHCIICR	0x10	/* OHCI INT Configuration Register */
 #define AT91_SFR_OHCIISR	0x14	/* OHCI INT Status Register */
+#define AT91_SFR_UTMICKTRIM	0x30
 #define AT91_SFR_I2SCLKSEL	0x90	/* I2SC Register */
 
 /* Field definitions */
@@ -28,5 +29,6 @@
 					 AT91_OHCIICR_SUSPEND_B | \
 					 AT91_OHCIICR_SUSPEND_C)
 
+#define AT91_UTMICKTRIM_FREQ	GENMASK(1,0)
 
 #endif /* _LINUX_MFD_SYSCON_ATMEL_SFR_H */

--qsoczu47mcxkeksl
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--qsoczu47mcxkeksl--
