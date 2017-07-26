Return-Path: <sboyd@codeaurora.org>
Date: Tue, 25 Jul 2017 18:11:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <sergej@taudac.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, ce3a@gmx.de,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] clk: si5351: Apply PLL soft reset before enabling the
 outputs
Message-ID: <20170726011112.GK2146@codeaurora.org>
References: <1501010261-7130-1-git-send-email-sergej@taudac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1501010261-7130-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/25, Sergej Sawazki wrote:
> The "Si5351A/B/C Data Sheet" states to apply a PLLA and PLLB soft reset
> before enabling the outputs [1]. This is required to get a deterministic
> phase relationship between the output clocks.
> 
> Without the PLL reset, the phase offset beween the clocks is unpredictable.
> 
> References:
> [1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
>     Figure 12 ("I2C Programming Procedure")
> 
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Signed-off-by: Sergej Sawazki <sergej@taudac.com>
> ---

This is similar to commit 6dc669a22c77 (clk: si5351: Add PLL soft
reset, 2015-11-20)? But I think that commit was causing some
problem for Russell King and there was going to be a patch to
change it but nothing has materialized on the list. Unless this
is that patch?

Does the other reset in this driver need to be removed? At the
least, it may be a good idea to combine the two places where
CLK_POWERDOWN is cleared to also have this reset part.

>  drivers/clk/clk-si5351.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 255d0fe..6cca425 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -905,6 +905,15 @@ static int si5351_clkout_prepare(struct clk_hw *hw)
>  
>  	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
>  			SI5351_CLK_POWERDOWN, 0);
> +
> +	/*
> +	 * Reset the PLLs before enabling the outputs to get a deterministic
> +	 * phase relationship between the output clocks. Otherwise, the phase
> +	 * offset beween the clocks is unpredictable.
> +	 */
> +	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
> +			 SI5351_PLL_RESET_A | SI5351_PLL_RESET_B);
> +
>  	si5351_set_bits(hwdata->drvdata, SI5351_OUTPUT_ENABLE_CTRL,
>  			(1 << hwdata->num), 0);
>  	return 0;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
