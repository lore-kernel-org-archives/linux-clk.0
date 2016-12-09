Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 16:20:41 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2] clk:mmp:clk-of-mmp2: Free memory and Unmap region obtained
 by kzalloc and of_iomap
Message-ID: <20161209002041.GB5423@codeaurora.org>
References: <1474369738-16140-1-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474369738-16140-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/20, Arvind Yadav wrote:
> From: Arvind Yadav <arvind.yadav.cs@gmail.com>
> 
> Free memory and memory mapping , if mmp2_clk_init is not successful.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/clk/mmp/clk-of-mmp2.c |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mmp/clk-of-mmp2.c b/drivers/clk/mmp/clk-of-mmp2.c
> index 3a51fff..2376d28 100644
> --- a/drivers/clk/mmp/clk-of-mmp2.c
> +++ b/drivers/clk/mmp/clk-of-mmp2.c
> @@ -309,21 +309,23 @@ static void __init mmp2_clk_init(struct device_node *np)
>  	pxa_unit->mpmu_base = of_iomap(np, 0);
>  	if (!pxa_unit->mpmu_base) {
>  		pr_err("failed to map mpmu registers\n");
> -		return;
> +		goto free_memory;
>  	}
>  
>  	pxa_unit->apmu_base = of_iomap(np, 1);
>  	if (!pxa_unit->mpmu_base) {
>  		pr_err("failed to map apmu registers\n");
> -		return;
> +		goto unmap_mpmu_region;
>  	}
>  
>  	pxa_unit->apbc_base = of_iomap(np, 2);
>  	if (!pxa_unit->apbc_base) {
>  		pr_err("failed to map apbc registers\n");
> -		return;
> +		goto unmap_apmu_region;
>  	}
>  
> +	return;

That doesn't seem right. I moved the return...

> +
>  	mmp_clk_init(np, &pxa_unit->unit, MMP2_NR_CLKS);
>  
>  	mmp2_pll_init(pxa_unit);
> @@ -333,6 +335,13 @@ static void __init mmp2_clk_init(struct device_node *np)
>  	mmp2_axi_periph_clk_init(pxa_unit);
>  
>  	mmp2_clk_reset_init(np, pxa_unit);

To here.

> +
> +unmap_apmu_region:
> +	iounmap(pxa_unit->apmu_base);
> +unmap_mpmu_region:
> +	iounmap(pxa_unit->mpmu_base);
> +free_memory:
> +	kfree(pxa_unit);
>  }
>  
>  CLK_OF_DECLARE(mmp2_clk, "marvell,mmp2-clock", mmp2_clk_init);
> -- 
> 1.7.9.5
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
