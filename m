Return-Path: <shawnguo@kernel.org>
Date: Mon, 23 Nov 2015 13:57:12 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] imx/clk-pllv2: fix wrong do_div() usage
Message-ID: <20151123055712.GJ13744@tiger>
References: <alpine.LFD.2.20.1511031958530.630@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.LFD.2.20.1511031958530.630@knanqh.ubzr>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Nov 03, 2015 at 08:01:40PM -0500, Nicolas Pitre wrote:
> do_div() is meant to be used with an unsigned dividend.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>

Mike, Stephen,

Can you please apply it for v4.4-rc?  Or I will queue it for v4.5-rc1.

Shawn

> 
> diff --git a/drivers/clk/imx/clk-pllv2.c b/drivers/clk/imx/clk-pllv2.c
> index 20889d59b4..5fa6d1deac 100644
> --- a/drivers/clk/imx/clk-pllv2.c
> +++ b/drivers/clk/imx/clk-pllv2.c
> @@ -79,7 +79,7 @@ static unsigned long __clk_pllv2_recalc_rate(unsigned long parent_rate,
>  {
>  	long mfi, mfn, mfd, pdf, ref_clk, mfn_abs;
>  	unsigned long dbl;
> -	s64 temp;
> +	u64 temp;
>  
>  	dbl = dp_ctl & MXC_PLL_DP_CTL_DPDCK0_2_EN;
>  
> @@ -102,8 +102,9 @@ static unsigned long __clk_pllv2_recalc_rate(unsigned long parent_rate,
>  	temp = (u64) ref_clk * mfn_abs;
>  	do_div(temp, mfd + 1);
>  	if (mfn < 0)
> -		temp = -temp;
> -	temp = (ref_clk * mfi) + temp;
> +		temp = (ref_clk * mfi) - temp;
> +	else
> +		temp = (ref_clk * mfi) + temp;
>  
>  	return temp;
>  }
> @@ -130,7 +131,7 @@ static int __clk_pllv2_set_rate(unsigned long rate, unsigned long parent_rate,
>  {
>  	u32 reg;
>  	long mfi, pdf, mfn, mfd = 999999;
> -	s64 temp64;
> +	u64 temp64;
>  	unsigned long quad_parent_rate;
>  
>  	quad_parent_rate = 4 * parent_rate;
> 
