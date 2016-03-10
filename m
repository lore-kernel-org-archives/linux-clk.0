Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: renesas: cpg-mssr: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
Date: Thu, 10 Mar 2016 04:21:17 +0200
Message-ID: <2046402.lcuHf8E64j@avalon>
In-Reply-To: <1457551114-21764-3-git-send-email-geert+renesas@glider.be>
References: <1457551114-21764-1-git-send-email-geert+renesas@glider.be> <1457551114-21764-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Wednesday 09 March 2016 20:18:32 Geert Uytterhoeven wrote:
> As of commit 71d076ceb245f0d9 ("ARM: shmobile: Enable PM and
> PM_GENERIC_DOMAINS for SoCs with PM Domains"),
> CONFIG_PM_GENERIC_DOMAINS_OF is always enabled for SoCs with a CPG/MSSR
> block.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c
> b/drivers/clk/renesas/renesas-cpg-mssr.c index
> 58e24b326a48bb81..7482e7f6d37fbe22 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -376,7 +376,6 @@ fail:
>  }
> 
> 

While at it you can remove one of the blank lines here...

> -#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
>  struct cpg_mssr_clk_domain {
>  	struct generic_pm_domain genpd;
>  	struct device_node *np;
> @@ -491,14 +490,6 @@ static int __init cpg_mssr_add_clk_domain(struct device
> *dev, of_genpd_add_provider_simple(np, genpd);
>  	return 0;
>  }
> -#else
> -static inline int cpg_mssr_add_clk_domain(struct device *dev,
> -					  const unsigned int *core_pm_clks,
> -					  unsigned int num_core_pm_clks)
> -{
> -	return 0;
> -}
> -#endif /* !CONFIG_PM_GENERIC_DOMAINS_OF */
> 
> 

... and here too.

(Same comment applies to patch 1/4)

Apart from that,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

for 1/4 and 2/4.

>  static const struct of_device_id cpg_mssr_match[] = {

-- 
Regards,

Laurent Pinchart
-- 
Regards,

Laurent Pinchart
