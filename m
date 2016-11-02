Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:56:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: pxa: transfer CPU clock setting from
 pxa2xx-cpufreq
Message-ID: <20161102005637.GV16026@codeaurora.org>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
 <1477225170-19019-6-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477225170-19019-6-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/23, Robert Jarzmik wrote:
> diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
> index 29cee9e8d4d9..7184819b7415 100644
> --- a/drivers/clk/pxa/clk-pxa.c
> +++ b/drivers/clk/pxa/clk-pxa.c
> @@ -15,9 +15,18 @@
>  #include <linux/clkdev.h>
>  #include <linux/of.h>
>  
> +#include <mach/pxa2xx-regs.h>
> +#include <mach/smemc.h>

This is unfortunate. It makes compile testing the drivers
harder. Can this be fixed in the future?

> +
>  #include <dt-bindings/clock/pxa-clock.h>
>  #include "clk-pxa.h"
>  
> +#define KHz 1000
> +#define MHz (1000 * 1000)
> +
> +#define MDREFR_DB2_MASK		(MDREFR_K2DB2 | MDREFR_K1DB2)
> +#define MDREFR_DRI_MASK		0xFFF
> +
>  DEFINE_SPINLOCK(lock);
>  
>  static struct clk *pxa_clocks[CLK_MAX];
> @@ -106,3 +115,122 @@ void __init clk_pxa_dt_common_init(struct device_node *np)
>  {
>  	of_clk_add_provider(np, of_clk_src_onecell_get, &onecell_data);
>  }
> +
> +void pxa2xx_core_turbo_switch(bool on)
> +{
> +	unsigned long flags;
> +	unsigned int unused, clkcfg;
> +
> +	local_irq_save(flags);
> +
> +	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));

\t is odd style, but I guess this is copied from somewhere?
Should it be volatile? Or is it ok for the clkcfg value to be
cached here?

> +	clkcfg &= ~CLKCFG_TURBO & ~CLKCFG_HALFTURBO;
> +	if (on)
> +		clkcfg |= CLKCFG_TURBO;
> +	clkcfg |= CLKCFG_FCS;
> +
> +	asm volatile(
> +	"	b	2f\n"
> +	"	.align	5\n"
> +	"1:	mcr	p14, 0, %1, c6, c0, 0\n"
> +	"	b	3f\n"
> +	"2:	b	1b\n"
> +	"3:	nop\n"
> +		: "=&r" (unused)
> +		: "r" (clkcfg)
> +		: );
> +
> +	local_irq_restore(flags);
> +}
> +
> +void pxa2xx_cpll_change(struct pxa2xx_freq *freq,
> +			u32 (*mdrefr_dri)(unsigned int))
> +{
> +	unsigned int clkcfg = freq->clkcfg;
> +	unsigned int unused, preset_mdrefr, postset_mdrefr;
> +	unsigned long flags;
> +
> +	local_irq_save(flags);
> +
> +	/* Calculate the next MDREFR.  If we're slowing down the SDRAM clock
> +	 * we need to preset the smaller DRI before the change.	 If we're
> +	 * speeding up we need to set the larger DRI value after the change.
> +	 */
> +	preset_mdrefr = postset_mdrefr = __raw_readl(MDREFR);
> +	if ((preset_mdrefr & MDREFR_DRI_MASK) > mdrefr_dri(freq->membus_khz)) {
> +		preset_mdrefr = (preset_mdrefr & ~MDREFR_DRI_MASK);
> +		preset_mdrefr |= mdrefr_dri(freq->membus_khz);
> +	}
> +	postset_mdrefr =
> +		(postset_mdrefr & ~MDREFR_DRI_MASK) |
> +		mdrefr_dri(freq->membus_khz);
> +
> +	/* If we're dividing the memory clock by two for the SDRAM clock, this
> +	 * must be set prior to the change.  Clearing the divide must be done
> +	 * after the change.
> +	 */
> +	if (freq->div2) {
> +		preset_mdrefr  |= MDREFR_DB2_MASK;
> +		postset_mdrefr |= MDREFR_DB2_MASK;
> +	} else {
> +		postset_mdrefr &= ~MDREFR_DB2_MASK;
> +	}
> +
> +	/* Set new the CCCR and prepare CLKCFG */
> +	writel(freq->cccr, CCCR);
> +
> +	asm volatile(
> +	"	ldr	r4, [%1]\n"
> +	"	b	2f\n"
> +	"	.align	5\n"
> +	"1:	str	%3, [%1]		/* preset the MDREFR */\n"
> +	"	mcr	p14, 0, %2, c6, c0, 0	/* set CLKCFG[FCS] */\n"
> +	"	str	%4, [%1]		/* postset the MDREFR */\n"
> +	"	b	3f\n"
> +	"2:	b	1b\n"
> +	"3:	nop\n"
> +	     : "=&r" (unused)
> +	     : "r" (MDREFR), "r" (clkcfg), "r" (preset_mdrefr),
> +	       "r" (postset_mdrefr)
> +	     : "r4", "r5");
> +
> +	local_irq_restore(flags);
> +}
> +
> diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
> index 6a3009eec830..20fd87b36560 100644
> --- a/drivers/clk/pxa/clk-pxa25x.c
> +++ b/drivers/clk/pxa/clk-pxa25x.c
> @@ -18,6 +18,7 @@
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <mach/pxa2xx-regs.h>
> +#include <mach/smemc.h>

I guess things aren't getting any worse here for mach includes...

> @@ -48,6 +60,34 @@ static const char * const get_freq_khz[] = {
>  	"core", "run", "cpll", "memory"
>  };
>  
> +static int get_sdram_rows(void)
> +{
> +	static int sdram_rows;
> +	unsigned int drac2 = 0, drac0 = 0;
> +	u32 mdcnfg;
> +
> +	if (sdram_rows)
> +		return sdram_rows;
> +
> +	mdcnfg = __raw_readl(MDCNFG);

Perhaps it should be readl_relaxed() instead? __raw_readl()
doesn't byte-swap for endianess so it's usually wrong.

> @@ -217,25 +321,6 @@ static void __init pxa27x_register_plls(void)
>  	clk_register_fixed_factor(NULL, "ppll_312mhz", "osc_13mhz", 0, 24, 1);
>  }
>  
> -static unsigned long clk_pxa27x_core_get_rate(struct clk_hw *hw,
> -					      unsigned long parent_rate)
> -{
> -	unsigned long clkcfg;
> -	unsigned int ht, osc_forced;
> -	unsigned long ccsr = readl(CCSR);
> -
> -	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
> -	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));

Aha, found it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
