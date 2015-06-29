Return-Path: <rjui@broadcom.com>
Message-ID: <5591B999.7070400@broadcom.com>
Date: Mon, 29 Jun 2015 14:33:13 -0700
From: Ray Jui <rjui@broadcom.com>
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Dan Carpenter <dan.carpenter@oracle.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Scott
 Branden <sbranden@broadcom.com>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH 1/2] clk: iproc: fix memory leak from clock name
References: <1435613410-18698-1-git-send-email-rjui@broadcom.com> <1435613410-18698-2-git-send-email-rjui@broadcom.com>
In-Reply-To: <1435613410-18698-2-git-send-email-rjui@broadcom.com>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

+ Michael's new email

On 6/29/2015 2:30 PM, Ray Jui wrote:
> of_property_read_string_index takes array of pointers and assign them to
> strings read from device tree property. No additional memory allocation
> is needed prior to calling of_property_read_string_index. In fact, since
> the array of pointers will be re-assigned to other strings, any memory
> that it points to prior to calling of_property_read_string_index will be
> leaked
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> ---
>  drivers/clk/bcm/clk-iproc-asiu.c |    6 +-----
>  drivers/clk/bcm/clk-iproc-pll.c  |    8 +-------
>  2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-iproc-asiu.c b/drivers/clk/bcm/clk-iproc-asiu.c
> index e19c09c..f630e1b 100644
> --- a/drivers/clk/bcm/clk-iproc-asiu.c
> +++ b/drivers/clk/bcm/clk-iproc-asiu.c
> @@ -222,10 +222,6 @@ void __init iproc_asiu_setup(struct device_node *node,
>  		struct iproc_asiu_clk *asiu_clk;
>  		const char *clk_name;
>  
> -		clk_name = kzalloc(IPROC_CLK_NAME_LEN, GFP_KERNEL);
> -		if (WARN_ON(!clk_name))
> -			goto err_clk_register;
> -
>  		ret = of_property_read_string_index(node, "clock-output-names",
>  						    i, &clk_name);
>  		if (WARN_ON(ret))
> @@ -259,7 +255,7 @@ void __init iproc_asiu_setup(struct device_node *node,
>  
>  err_clk_register:
>  	for (i = 0; i < num_clks; i++)
> -		kfree(asiu->clks[i].name);
> +		clk_unregister(asiu->clk_data.clks[i]);
>  	iounmap(asiu->gate_base);
>  
>  err_iomap_gate:
> diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
> index 46fb84b..a8d971b 100644
> --- a/drivers/clk/bcm/clk-iproc-pll.c
> +++ b/drivers/clk/bcm/clk-iproc-pll.c
> @@ -655,10 +655,6 @@ void __init iproc_pll_clk_setup(struct device_node *node,
>  		memset(&init, 0, sizeof(init));
>  		parent_name = node->name;
>  
> -		clk_name = kzalloc(IPROC_CLK_NAME_LEN, GFP_KERNEL);
> -		if (WARN_ON(!clk_name))
> -			goto err_clk_register;
> -
>  		ret = of_property_read_string_index(node, "clock-output-names",
>  						    i, &clk_name);
>  		if (WARN_ON(ret))
> @@ -690,10 +686,8 @@ void __init iproc_pll_clk_setup(struct device_node *node,
>  	return;
>  
>  err_clk_register:
> -	for (i = 0; i < num_clks; i++) {
> -		kfree(pll->clks[i].name);
> +	for (i = 0; i < num_clks; i++)
>  		clk_unregister(pll->clk_data.clks[i]);
> -	}
>  
>  err_pll_register:
>  	if (pll->asiu_base)
> 
