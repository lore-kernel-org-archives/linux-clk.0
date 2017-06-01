Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44014 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbdFAHqq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2017 03:46:46 -0400
Date: Thu, 1 Jun 2017 00:46:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: at91: Add sama5d2 suspend/resume
Message-ID: <20170601074644.GW20170@codeaurora.org>
References: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
 <20170512142531.11274-2-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170512142531.11274-2-alexandre.belloni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/12, Alexandre Belloni wrote:
> On sama5d2, VDD core maybe be cut while in suspend. This means registers
> will be lost. Ensure they are saved and restored properly.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
> Changes in v4:
>  - only save and restore PCR for used ids
> 
>  drivers/clk/at91/clk-generated.c  |   3 +
>  drivers/clk/at91/clk-peripheral.c |   4 +-
>  drivers/clk/at91/pmc.c            | 129 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/at91/pmc.h            |   2 +
>  4 files changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
> index 70474bd97a10..f0b7ae904ce2 100644
> --- a/drivers/clk/at91/clk-generated.c
> +++ b/drivers/clk/at91/clk-generated.c
> @@ -266,6 +266,9 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>  	if (ret) {
>  		kfree(gck);
>  		hw = ERR_PTR(ret);
> +	} else {
> +		pmc_register_id(id);
> +	}
>  
>  	return hw;
>  }
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
> index 526df5ba042d..a4cd9f35160e 100644
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
> +static u8 registered_ids[PMC_MAX_IDS];
> +
> +void pmc_register_id(u8 id)
> +{

Shouldn't this also be inside CONFIG_PM? And then
pmc_register_id() is a nop function when CONFIG_PM=n?

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

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
