Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 17:06:01 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: axi-clkgen: Add multi-parent support
Message-ID: <20160130010601.GC4848@codeaurora.org>
References: <1448902496-21218-1-git-send-email-lars@metafoo.de>
 <1448902496-21218-2-git-send-email-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448902496-21218-2-git-send-email-lars@metafoo.de>
List-ID: <linux-clk.vger.kernel.org>

On 11/30, Lars-Peter Clausen wrote:
> The clock generator has two clock inputs that can be used as the reference
> clock. Add support for switching between them at runtime.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next

>  .../devicetree/bindings/clock/axi-clkgen.txt       |  5 ++-
>  drivers/clk/clk-axi-clkgen.c                       | 40 ++++++++++++++++++----
>  2 files changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
> index 8dedc60..9a0744c 100644
> --- a/drivers/clk/clk-axi-clkgen.c
> +++ b/drivers/clk/clk-axi-clkgen.c
> @@ -349,12 +350,33 @@ static void axi_clkgen_disable(struct clk_hw *clk_hw)
> @@ -370,10 +392,11 @@ static int axi_clkgen_probe(struct platform_device *pdev)
>  	const struct of_device_id *id;
>  	struct axi_clkgen *axi_clkgen;
>  	struct clk_init_data init;
> -	const char *parent_name;
> +	const char *parent_names[2];
>  	const char *clk_name;
>  	struct resource *mem;
>  	struct clk *clk;
> +	unsigned int i;
>  
>  	if (!pdev->dev.of_node)
>  		return -ENODEV;
> @@ -391,19 +414,24 @@ static int axi_clkgen_probe(struct platform_device *pdev)
>  	if (IS_ERR(axi_clkgen->base))
>  		return PTR_ERR(axi_clkgen->base);
>  
> -	parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
> -	if (!parent_name)
> +	init.num_parents = of_clk_get_parent_count(pdev->dev.of_node);
> +	if (init.num_parents < 1 || init.num_parents > 2)
>  		return -EINVAL;
>  
> +	for (i = 0; i < init.num_parents; i++) {
> +		parent_names[i] = of_clk_get_parent_name(pdev->dev.of_node, i);
> +		if (!parent_names[i])
> +			return -EINVAL;
> +	}

This can be of_clk_parent_fill(). Feel free to send a cleanup. I
would have asked for one, but you've been waiting two months.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
