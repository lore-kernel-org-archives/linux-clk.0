Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:4821 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751639AbdFSPoo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2017 11:44:44 -0400
Subject: Re: [PATCH v5] clk: at91: Add sama5d2 suspend/resume
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20170608003647.15721-1-alexandre.belloni@free-electrons.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <3e8f6251-a1d0-a342-d02a-2df249e0b220@microchip.com>
Date: Mon, 19 Jun 2017 17:45:11 +0200
MIME-Version: 1.0
In-Reply-To: <20170608003647.15721-1-alexandre.belloni@free-electrons.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Le 08/06/2017 à 02:36, Alexandre Belloni a écrit :
> On sama5d2, VDD core maybe be cut while in suspend. This means registers
> will be lost. Ensure they are saved and restored properly.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> Changes in v5:
>  - rebased on clk-next
>  - moved pmc_register_id under CONFIG_PM
> 
> 
>  drivers/clk/at91/clk-generated.c  |   2 +
>  drivers/clk/at91/clk-peripheral.c |   4 +-
>  drivers/clk/at91/pmc.c            | 129 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/at91/pmc.h            |   6 ++
>  4 files changed, 140 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
> index 07c8f701e51c..f0b7ae904ce2 100644
> --- a/drivers/clk/at91/clk-generated.c
> +++ b/drivers/clk/at91/clk-generated.c
> @@ -266,6 +266,8 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>  	if (ret) {
>  		kfree(gck);
>  		hw = ERR_PTR(ret);
> +	} else {
> +		pmc_register_id(id);
>  	}
>  
>  	return hw;
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
> index dc29fd979d3f..770118369230 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -367,8 +367,10 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
>  	if (ret) {
>  		kfree(periph);
>  		hw = ERR_PTR(ret);
> -	} else
> +	} else {
>  		clk_sam9x5_peripheral_autodiv(periph);
> +		pmc_register_id(id);
> +	}
>  
>  	return hw;
>  }
> diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
> index 526df5ba042d..775af473fe11 100644
> --- a/drivers/clk/at91/pmc.c
> +++ b/drivers/clk/at91/pmc.c
> @@ -13,12 +13,16 @@
>  #include <linux/clk/at91_pmc.h>
>  #include <linux/of.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/syscore_ops.h>
>  
>  #include <asm/proc-fns.h>
>  
>  #include "pmc.h"
>  
> +#define PMC_MAX_IDS 128
> +
>  int of_at91_get_clk_range(struct device_node *np, const char *propname,
>  			  struct clk_range *range)
>  {
> @@ -41,3 +45,128 @@ int of_at91_get_clk_range(struct device_node *np, const char *propname,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_at91_get_clk_range);
> +
> +#ifdef CONFIG_PM
> +static struct regmap *pmcreg;
> +
> +static u8 registered_ids[PMC_MAX_IDS];
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
> +	u32 pcr[PMC_MAX_IDS];
> +	u32 audio_pll0;
> +	u32 audio_pll1;
> +} pmc_cache;
> +
> +void pmc_register_id(u8 id)
> +{
> +	int i;
> +
> +	for (i = 0; i < PMC_MAX_IDS; i++) {
> +		if (registered_ids[i] == 0) {
> +			registered_ids[i] = id;
> +			break;
> +		}
> +		if (registered_ids[i] == id)
> +			break;
> +	}
> +}
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
> +	for (i = 0; registered_ids[i]; i++) {
> +		regmap_write(pmcreg, AT91_PMC_PCR,
> +			     (registered_ids[i] & AT91_PMC_PCR_PID_MASK));
> +		regmap_read(pmcreg, AT91_PMC_PCR,
> +			    &pmc_cache.pcr[registered_ids[i]]);
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
> +	for (i = 0; registered_ids[i]; i++) {
> +		regmap_write(pmcreg, AT91_PMC_PCR,
> +			     pmc_cache.pcr[registered_ids[i]] |
> +			     AT91_PMC_PCR_CMD);
> +	}
> +
> +	if (pmc_cache.uckr & AT91_PMC_UPLLEN) {
> +		ret = regmap_read_poll_timeout(pmcreg, AT91_PMC_SR, tmp,
> +					       !(tmp & AT91_PMC_LOCKU),
> +					       10, 5000);
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
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 5771fff0ee3f..858e8ef7e8db 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -29,4 +29,10 @@ struct clk_range {
>  int of_at91_get_clk_range(struct device_node *np, const char *propname,
>  			  struct clk_range *range);
>  
> +#ifdef CONFIG_PM
> +void pmc_register_id(u8 id);
> +#else
> +static inline void pmc_register_id(u8 id) {}
> +#endif
> +
>  #endif /* __PMC_H_ */
> 


-- 
Nicolas Ferre
