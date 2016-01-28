Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Jan 2016 00:33:47 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 07/13] ARM: at91: pm: find and remap the pmc
Message-ID: <20160128083347.GL12841@codeaurora.org>
References: <1453911072-23608-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1453911072-23608-8-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1453911072-23608-8-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/27, Alexandre Belloni wrote:
> @@ -399,13 +400,33 @@ static void __init at91_pm_sram_init(void)
>  			&at91_pm_suspend_in_sram, at91_pm_suspend_in_sram_sz);
>  }
>  
> +static __initconst struct of_device_id atmel_pmc_ids[] = {

The kbuild error is weird, but __initconst should come right
before the equals sign (=). Plus it should actually be const.

> +	{ .compatible = "atmel,at91rm9200-pmc"  },
> +	{ .compatible = "atmel,at91sam9260-pmc" },
> +	{ .compatible = "atmel,at91sam9g45-pmc" },
> +	{ .compatible = "atmel,at91sam9n12-pmc" },
> +	{ .compatible = "atmel,at91sam9x5-pmc" },
> +	{ .compatible = "atmel,sama5d3-pmc" },
> +	{ .compatible = "atmel,sama5d2-pmc" },
> +	{ /* sentinel */ },
> +};
> +
>  static void __init at91_pm_init(void)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
