Return-Path: <ludovic.desroches@atmel.com>
Date: Thu, 1 Oct 2015 10:24:38 +0200
From: Ludovic Desroches <ludovic.desroches@atmel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
CC: Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon
	<boris.brezillon@free-electrons.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-kernel@vger.kernel.org>, Jean-Christophe Plagniol-Villard
	<plagnioj@jcrosoft.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 08/16] clk: at91: only enable available IRQs
Message-ID: <20151001082438.GJ31199@odux.rfo.atmel.com>
References: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1443629469-15086-9-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1443629469-15086-9-git-send-email-alexandre.belloni@free-electrons.com>
Return-Path: ludovic.desroches@atmel.com
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 30, 2015 at 06:11:01PM +0200, Alexandre Belloni wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Only enable available IRQs in case writing to a reserved bit has an armful
> effect.

You probably mean disable instead of enable and s/armful/harmful.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  drivers/clk/at91/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
> index 6c1f08a73373..45dd32bf2531 100644
> --- a/drivers/clk/at91/pmc.c
> +++ b/drivers/clk/at91/pmc.c
> @@ -287,7 +287,7 @@ static int __init atmel_pmc_probe(struct platform_device *pdev)
>  	if (!pmc->irqdomain)
>  		return 0;
>  
> -	regmap_write(pmc->regmap, AT91_PMC_IDR, 0xffffffff);
> +	regmap_write(pmc->regmap, AT91_PMC_IDR, pmc->caps->available_irqs);
>  	ret = request_irq(pmc->virq, pmc_irq_handler,
>  			  IRQF_SHARED | IRQF_COND_SUSPEND, "pmc", pmc);
>  	if (ret)
> -- 
> 2.1.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
