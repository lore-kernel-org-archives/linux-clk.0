Return-Path: <sebastian.hesselbarth@gmail.com>
Return-Path: <sebastian.hesselbarth@gmail.com>
Subject: Re: [RESEND PATCH 3/3] clk: si5351: Add a debug message for PLL reset
To: Sergej Sawazki <sergej@taudac.com>, sboyd@codeaurora.org,
 mturquette@baylibre.com, linux@armlinux.org.uk
Cc: rabeeh@solid-run.com, linux-clk@vger.kernel.org
References: <1504346246-4730-1-git-send-email-sergej@taudac.com>
 <1504346246-4730-4-git-send-email-sergej@taudac.com>
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Message-ID: <60cbc3ee-541c-10cd-5fb3-810607252109@gmail.com>
Date: Thu, 14 Sep 2017 08:47:40 +0200
In-Reply-To: <1504346246-4730-4-git-send-email-sergej@taudac.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 02.09.2017 11:57, Sergej Sawazki wrote:
> Print a debug message when resetting a PLL. It is useful to figure out
> what PLL is resetted and when.

I am fine with the debug message but please squash it into the patch
adding _si5351_clkout_reset_pll.

Sebastian

> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Signed-off-by: Sergej Sawazki <sergej@taudac.com>
> ---
>  drivers/clk/clk-si5351.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index aa8d8d9..7a122c7 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -917,6 +917,10 @@ void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
>  	si5351_reg_write(drvdata, SI5351_PLL_RESET,
>  			 (val & SI5351_CLK_PLL_SELECT) ? SI5351_PLL_RESET_B :
>  			 SI5351_PLL_RESET_A);
> +
> +	dev_dbg(&drvdata->client->dev, "%s - %s: pll = %d\n",
> +		__func__, clk_hw_get_name(&drvdata->clkout[num].hw),
> +		(val & SI5351_CLK_PLL_SELECT) ? 1 : 0);
>  }
>  
>  static int si5351_clkout_prepare(struct clk_hw *hw)
> 
