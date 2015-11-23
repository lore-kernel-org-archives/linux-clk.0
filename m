Return-Path: <shawnguo@kernel.org>
Date: Mon, 23 Nov 2015 13:56:25 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] imx/clk-pllv1: fix wrong do_div() usage
Message-ID: <20151123055625.GI13744@tiger>
References: <alpine.LFD.2.20.1511031941300.630@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.LFD.2.20.1511031941300.630@knanqh.ubzr>
List-ID: <linux-clk.vger.kernel.org>

Added Stephen.

On Tue, Nov 03, 2015 at 07:46:23PM -0500, Nicolas Pitre wrote:
> do_div() is meant to be used with an unsigned dividend.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>

Mike, Stephen,

Can you please apply it for v4.4-rc?  Or I will queue it for v4.5-rc1.

Shawn

> 
> diff --git a/drivers/clk/imx/clk-pllv1.c b/drivers/clk/imx/clk-pllv1.c
> index 8564e4342c..82fe3662b5 100644
> --- a/drivers/clk/imx/clk-pllv1.c
> +++ b/drivers/clk/imx/clk-pllv1.c
> @@ -52,7 +52,7 @@ static unsigned long clk_pllv1_recalc_rate(struct clk_hw *hw,
>  		unsigned long parent_rate)
>  {
>  	struct clk_pllv1 *pll = to_clk_pllv1(hw);
> -	long long ll;
> +	unsigned long long ull;
>  	int mfn_abs;
>  	unsigned int mfi, mfn, mfd, pd;
>  	u32 reg;
> @@ -94,16 +94,16 @@ static unsigned long clk_pllv1_recalc_rate(struct clk_hw *hw,
>  	rate = parent_rate * 2;
>  	rate /= pd + 1;
>  
> -	ll = (unsigned long long)rate * mfn_abs;
> +	ull = (unsigned long long)rate * mfn_abs;
>  
> -	do_div(ll, mfd + 1);
> +	do_div(ull, mfd + 1);
>  
>  	if (mfn_is_negative(pll, mfn))
> -		ll = -ll;
> +		ull = (rate * mfi) - ull;
> +	else
> +		ull = (rate * mfi) + ull;
>  
> -	ll = (rate * mfi) + ll;
> -
> -	return ll;
> +	return ull;
>  }
>  
>  static struct clk_ops clk_pllv1_ops = {
> 
> 
