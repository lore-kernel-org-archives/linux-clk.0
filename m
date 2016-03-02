Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1456911446.4175.10.camel@pengutronix.de>
Subject: Re: [PATCH 33/41] clk: pwm: Remove CLK_IS_ROOT
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org
Date: Wed, 02 Mar 2016 10:37:26 +0100
In-Reply-To: <1456858826-28541-34-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
	 <1456858826-28541-34-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, den 01.03.2016, 11:00 -0800 schrieb Stephen Boyd:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/clk-pwm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
> index 328fcfcefd8c..883045814dac 100644
> --- a/drivers/clk/clk-pwm.c
> +++ b/drivers/clk/clk-pwm.c
> @@ -95,7 +95,7 @@ static int clk_pwm_probe(struct platform_device *pdev)
>  
>  	init.name = clk_name;
>  	init.ops = &clk_pwm_ops;
> -	init.flags = CLK_IS_BASIC | CLK_IS_ROOT;
> +	init.flags = CLK_IS_BASIC;
>  	init.num_parents = 0;
>  
>  	clk_pwm->pwm = pwm;

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

thanks
Philipp
