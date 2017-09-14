Return-Path: <sebastian.hesselbarth@gmail.com>
Return-Path: <sebastian.hesselbarth@gmail.com>
Subject: Re: [RESEND PATCH 1/3] clk: si5351: Apply PLL soft reset before
 enabling the outputs
To: Sergej Sawazki <sergej@taudac.com>, sboyd@codeaurora.org,
 mturquette@baylibre.com, linux@armlinux.org.uk
Cc: rabeeh@solid-run.com, linux-clk@vger.kernel.org
References: <1504346246-4730-1-git-send-email-sergej@taudac.com>
 <1504346246-4730-2-git-send-email-sergej@taudac.com>
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Message-ID: <4dab2351-8a9f-b6df-3b7a-a42c2f5752a7@gmail.com>
Date: Thu, 14 Sep 2017 08:44:42 +0200
In-Reply-To: <1504346246-4730-2-git-send-email-sergej@taudac.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 02.09.2017 11:57, Sergej Sawazki wrote:
> The "Si5351A/B/C Data Sheet" states to apply a PLL soft reset before
> enabling the output clocks [1]. This is required to get a deterministic
> phase relationship between the output clocks.
> 
> Without resetting the PLL, the phase relationship between the clocks is
> unpredictable. Fix this by resetting the PLL in si5351_clkout_prepare().
> 
> It also fixes a regression introduced in commit 6dc669a22c77 ("clk: si5351:
> Add PLL soft reset") that causes a disruption on platforms where clocks
> derived from different PLLs do different things by resetting only the PLL
> which the output clock is derived from.
> 
> References:
> [1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
>     Figure 12 ("I2C Programming Procedure")
> 
> Fixes: 6dc669a22c77 ("clk: si5351: Add PLL soft reset")
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Sergej Sawazki <sergej@taudac.com>
> ---
>  drivers/clk/clk-si5351.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 2492442..46bbc95 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -898,6 +898,21 @@ static int _si5351_clkout_set_disable_state(
>  	return 0;
>  }
>  
> +void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
> +{
> +	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
> +
> +	switch (val & SI5351_CLK_INPUT_MASK) {
> +	case SI5351_CLK_INPUT_XTAL:
> +	case SI5351_CLK_INPUT_CLKIN:
> +		return;  /* PLL not used, no need to reset */
> +	}
> +
> +	si5351_reg_write(drvdata, SI5351_PLL_RESET,
> +			 (val & SI5351_CLK_PLL_SELECT) ? SI5351_PLL_RESET_B :
> +			 SI5351_PLL_RESET_A);
> +}
> +
>  static int si5351_clkout_prepare(struct clk_hw *hw)
>  {
>  	struct si5351_hw_data *hwdata =
> @@ -905,6 +920,14 @@ static int si5351_clkout_prepare(struct clk_hw *hw)
>  
>  	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
>  			SI5351_CLK_POWERDOWN, 0);
> +
> +	/*
> +	 * Reset the PLLs before enabling the outputs to get a deterministic
> +	 * phase relationship between the output clocks. Otherwise, the phase
> +	 * offset beween the clocks is unpredictable.
> +	 */
> +	_si5351_clkout_reset_pll(hwdata->drvdata, hwdata->num);

Sergej,

sorry for the late reply. In general, I am fine with refactoring the PLL
reset into it's own function. But instead of adding the function here
unconditionally and changing driver behavior for all users, please first
add the property to conditionally reset the PLLs on clkout changes and
use it to conditionally call above reset function.

> +
>  	si5351_set_bits(hwdata->drvdata, SI5351_OUTPUT_ENABLE_CTRL,
>  			(1 << hwdata->num), 0);
>  	return 0;
> @@ -1095,8 +1118,7 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
>  	 * Do a pll soft reset on both plls, needed in some cases to get
>  	 * all outputs running.
>  	 */
> -	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
> -			 SI5351_PLL_RESET_A | SI5351_PLL_RESET_B);
> +	_si5351_clkout_reset_pll(hwdata->drvdata, hwdata->num);

Above reset (a) has been removed by Russell's fix for the PLL reset
issue on different clock outputs and (b) does not match the original
behavior. Original behavior was to reset both PLLs but the function
does only reset one PLL.

In any way, the patch should not mess with this line at all.

Sebastian

>  
>  	dev_dbg(&hwdata->drvdata->client->dev,
>  		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
> 
