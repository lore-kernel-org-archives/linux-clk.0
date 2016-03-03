Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/41] clk: mvebu: Remove CLK_IS_ROOT
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
	<1456858826-28541-9-git-send-email-sboyd@codeaurora.org>
Date: Thu, 03 Mar 2016 11:27:38 +0100
In-Reply-To: <1456858826-28541-9-git-send-email-sboyd@codeaurora.org> (Stephen
	Boyd's message of "Tue, 1 Mar 2016 10:59:53 -0800")
Message-ID: <87wppjluud.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,
 
 On mar., mars 01 2016, Stephen Boyd <sboyd@codeaurora.org> wrote:

> This flag is a no-op now. Remove usage of the flag.
>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory

> ---
>  drivers/clk/mvebu/common.c       | 11 +++++------
>  drivers/clk/mvebu/dove-divider.c |  3 +--
>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
> index daa6ebdac131..66be2e0c82b4 100644
> --- a/drivers/clk/mvebu/common.c
> +++ b/drivers/clk/mvebu/common.c
> @@ -137,8 +137,8 @@ void __init mvebu_coreclk_setup(struct device_node *np,
>  	of_property_read_string_index(np, "clock-output-names", 0,
>  				      &tclk_name);
>  	rate = desc->get_tclk_freq(base);
> -	clk_data.clks[0] = clk_register_fixed_rate(NULL, tclk_name, NULL,
> -						   CLK_IS_ROOT, rate);
> +	clk_data.clks[0] = clk_register_fixed_rate(NULL, tclk_name, NULL, 0,
> +						   rate);
>  	WARN_ON(IS_ERR(clk_data.clks[0]));
>  
>  	/* Register CPU clock */
> @@ -150,8 +150,8 @@ void __init mvebu_coreclk_setup(struct device_node *np,
>  		&& desc->is_sscg_enabled(base))
>  		rate = desc->fix_sscg_deviation(rate);
>  
> -	clk_data.clks[1] = clk_register_fixed_rate(NULL, cpuclk_name, NULL,
> -						   CLK_IS_ROOT, rate);
> +	clk_data.clks[1] = clk_register_fixed_rate(NULL, cpuclk_name, NULL, 0,
> +						   rate);
>  	WARN_ON(IS_ERR(clk_data.clks[1]));
>  
>  	/* Register fixed-factor clocks derived from CPU clock */
> @@ -174,8 +174,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
>  					      2 + desc->num_ratios, &name);
>  		rate = desc->get_refclk_freq(base);
>  		clk_data.clks[2 + desc->num_ratios] =
> -			clk_register_fixed_rate(NULL, name, NULL,
> -						CLK_IS_ROOT, rate);
> +			clk_register_fixed_rate(NULL, name, NULL, 0, rate);
>  		WARN_ON(IS_ERR(clk_data.clks[2 + desc->num_ratios]));
>  	}
>  
> diff --git a/drivers/clk/mvebu/dove-divider.c b/drivers/clk/mvebu/dove-divider.c
> index 3e0b52daa35f..4091f3cfee19 100644
> --- a/drivers/clk/mvebu/dove-divider.c
> +++ b/drivers/clk/mvebu/dove-divider.c
> @@ -225,8 +225,7 @@ static int dove_divider_init(struct device *dev, void __iomem *base,
>  	 * Create the core PLL clock.  We treat this as a fixed rate
>  	 * clock as we don't know any better, and documentation is sparse.
>  	 */
> -	clk = clk_register_fixed_rate(dev, core_pll[0], NULL, CLK_IS_ROOT,
> -				      2000000000UL);
> +	clk = clk_register_fixed_rate(dev, core_pll[0], NULL, 0, 2000000000UL);
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
