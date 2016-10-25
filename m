Return-Path: <wharms@bfs.de>
Message-ID: <580F04D9.108@bfs.de>
Date: Tue, 25 Oct 2016 09:08:09 +0200
From: walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
MIME-Version: 1.0
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: lars@metafoo.de, dan.carpenter@oracle.com, ssantosh@kernel.org,
 mturquette@baylibre.com, sboyd@codeaurora.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: keystone: Fix missing iounmap calls in an error
 handling path
References: <cover.1477339880.git.christophe.jaillet@wanadoo.fr> <7ed7c1abf1666f1e6eda240bb705940bc14bd186.1477339880.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <7ed7c1abf1666f1e6eda240bb705940bc14bd186.1477339880.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>



Am 24.10.2016 22:43, schrieb Christophe JAILLET:
> Factorize 'iounmap()' calls in the error handling path.
> The main goal is to add these calls if 'clk_register_pll()' fails.
> 
> Add an error message if an 'of_iomap' call fails to be consistent.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Un-compiled & un-tested
> ---
>  drivers/clk/keystone/pll.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
> index 35c0e2b011d1..73a2558b29c0 100644
> --- a/drivers/clk/keystone/pll.c
> +++ b/drivers/clk/keystone/pll.c
> @@ -191,7 +191,6 @@ static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
>  	pll_data->pll_ctl0 = of_iomap(node, i);
>  	if (!pll_data->pll_ctl0) {
>  		pr_err("%s: ioremap failed\n", __func__);
> -		iounmap(pll_data->pllod);
>  		goto out;
>  	}
>  
> @@ -206,8 +205,7 @@ static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
>  		i = of_property_match_string(node, "reg-names", "multiplier");
>  		pll_data->pllm = of_iomap(node, i);
>  		if (!pll_data->pllm) {
> -			iounmap(pll_data->pll_ctl0);
> -			iounmap(pll_data->pllod);
> +			pr_err("%s: ioremap failed\n", __func__);
>  			goto out;
>  		}
>  	}
> @@ -220,6 +218,12 @@ static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
>  
>  out:
>  	pr_err("%s: error initializing pll %s\n", __func__, node->name);
> +	if (pll_data->pllm)
> +		iounmap(pll_data->pllm);
> +	if (pll_data->pll_ctl0)
> +		iounmap(pll_data->pll_ctl0);
> +	if (pll_data->pllod)
> +		iounmap(pll_data->pllod);
>  	kfree(pll_data);
>  }
>  

IMHO calles the iounmap() need no check for NULL.

re,
 wh
