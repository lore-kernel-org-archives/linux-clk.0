Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:9509 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752398AbdEKHRa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2017 03:17:30 -0400
Subject: Re: [PATCH v3] clk: at91: Add sama5d2 suspend/resume
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <20170510170941.8027-1-alexandre.belloni@free-electrons.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <caa76c98-98aa-c0fb-b7b9-77c53864e152@microchip.com>
Date: Thu, 11 May 2017 09:17:41 +0200
MIME-Version: 1.0
In-Reply-To: <20170510170941.8027-1-alexandre.belloni@free-electrons.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Le 10/05/2017 à 19:09, Alexandre Belloni a écrit :
> On sama5d2, VDD core maybe be cut while in suspend. This means registers
> will be lost. Ensure they are saved and restored properly.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Very good, thanks!

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> Changes in v3:
>  - use regmap_read_poll_timeout to handle the USB PLL
>  - fix typo
> 
> 
>  drivers/clk/at91/pmc.c | 104 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
> index 526df5ba042d..7fe1dc8d1829 100644
> --- a/drivers/clk/at91/pmc.c
> +++ b/drivers/clk/at91/pmc.c
> @@ -13,7 +13,9 @@
>  #include <linux/clk/at91_pmc.h>
>  #include <linux/of.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/syscore_ops.h>
>  
>  #include <asm/proc-fns.h>
>  
> @@ -41,3 +43,105 @@ int of_at91_get_clk_range(struct device_node *np, const char *propname,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_at91_get_clk_range);
> +
> +#ifdef CONFIG_PM
> +static struct regmap *pmcreg;
> +
> +static struct
> +{
> +	u32 scsr;
> +	u32 pcsr0;
> +	u32 uckr;
> +	u32 mor;
> +	u32 mcfr;
> +	u32 pllar;
> +	u32 mckr;
> +	u32 usb;
> +	u32 imr;
> +	u32 pcsr1;
> +	u32 pcr[64];
> +} pmc_cache;
> +
> +static int pmc_suspend(void)
> +{
> +	int i;
> +
> +	regmap_read(pmcreg, AT91_PMC_IMR, &pmc_cache.scsr);
> +	regmap_read(pmcreg, AT91_PMC_PCSR, &pmc_cache.pcsr0);
> +	regmap_read(pmcreg, AT91_CKGR_UCKR, &pmc_cache.uckr);
> +	regmap_read(pmcreg, AT91_CKGR_MOR, &pmc_cache.mor);
> +	regmap_read(pmcreg, AT91_CKGR_MCFR, &pmc_cache.mcfr);
> +	regmap_read(pmcreg, AT91_CKGR_PLLAR, &pmc_cache.pllar);
> +	regmap_read(pmcreg, AT91_PMC_MCKR, &pmc_cache.mckr);
> +	regmap_read(pmcreg, AT91_PMC_USB, &pmc_cache.usb);
> +	regmap_read(pmcreg, AT91_PMC_IMR, &pmc_cache.imr);
> +	regmap_read(pmcreg, AT91_PMC_PCSR1, &pmc_cache.pcsr1);
> +
> +	for (i = 2; i < 64; i++) {
> +		regmap_write(pmcreg, AT91_PMC_PCR, (i & AT91_PMC_PCR_PID_MASK));
> +		regmap_read(pmcreg, AT91_PMC_PCR, &pmc_cache.pcr[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static void pmc_resume(void)
> +{
> +	int i, ret = 0;
> +	u32 tmp;
> +
> +	regmap_read(pmcreg, AT91_PMC_MCKR, &tmp);
> +	if (pmc_cache.mckr != tmp)
> +		pr_warn("MCKR was not configured properly by the firmware\n");
> +	regmap_read(pmcreg, AT91_CKGR_PLLAR, &tmp);
> +	if (pmc_cache.pllar != tmp)
> +		pr_warn("PLLAR was not configured properly by the firmware\n");
> +
> +	regmap_write(pmcreg, AT91_PMC_IMR, pmc_cache.scsr);
> +	regmap_write(pmcreg, AT91_PMC_PCER, pmc_cache.pcsr0);
> +	regmap_write(pmcreg, AT91_CKGR_UCKR, pmc_cache.uckr);
> +	regmap_write(pmcreg, AT91_CKGR_MOR, pmc_cache.mor);
> +	regmap_write(pmcreg, AT91_CKGR_MCFR, pmc_cache.mcfr);
> +	regmap_write(pmcreg, AT91_PMC_USB, pmc_cache.usb);
> +	regmap_write(pmcreg, AT91_PMC_IMR, pmc_cache.imr);
> +	regmap_write(pmcreg, AT91_PMC_PCER1, pmc_cache.pcsr1);
> +
> +	for (i = 2; i < 64; i++) {
> +		regmap_write(pmcreg, AT91_PMC_PCR, (i & AT91_PMC_PCR_PID_MASK));
> +		regmap_write(pmcreg, AT91_PMC_PCR, pmc_cache.pcr[i]);
> +	}
> +
> +	if (pmc_cache.uckr & AT91_PMC_UPLLEN) {
> +		ret = regmap_read_poll_timeout(pmcreg, AT91_PMC_SR, tmp, !(tmp & AT91_PMC_LOCKU), 10, 5000);
> +		if (ret)
> +			pr_crit("USB PLL didn't lock when resuming\n");
> +	}
> +}
> +
> +static struct syscore_ops pmc_syscore_ops = {
> +	.suspend = pmc_suspend,
> +	.resume = pmc_resume,
> +};
> +
> +static const struct of_device_id sama5d2_pmc_dt_ids[] = {
> +	{ .compatible = "atmel,sama5d2-pmc" },
> +	{ /* sentinel */ }
> +};
> +
> +static int __init pmc_register_ops(void)
> +{
> +	struct device_node *np;
> +
> +	np = of_find_matching_node(NULL, sama5d2_pmc_dt_ids);
> +
> +	pmcreg = syscon_node_to_regmap(np);
> +	if (IS_ERR(pmcreg))
> +		return PTR_ERR(pmcreg);
> +
> +	register_syscore_ops(&pmc_syscore_ops);
> +
> +	return 0;
> +}
> +/* This has to happen before arch_initcall because of the tcb_clksrc driver */
> +postcore_initcall(pmc_register_ops);
> +#endif
> 


-- 
Nicolas Ferre
