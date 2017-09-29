Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Sep 2017 15:53:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>, Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 2/2] clk: clk-gpio: Request GPIO descriptor as LOW
Message-ID: <20170929225346.GN457@codeaurora.org>
References: <20170924161919.24832-1-linus.walleij@linaro.org>
 <20170924161919.24832-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170924161919.24832-2-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/24, Linus Walleij wrote:
> Requesting the GPIOD_OUT_LOW low will make sure the GPIO is
> deasserted when requested. The gpiolib core will make sure that
> if the GPIO line is active low, it will be logically driven high
> when deasserted, see drivers/gpiolib.c gpiod_configure_flags().
> 
> Cc: Sergej Sawazki <ce3a@gmx.de>
> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/clk/clk-gpio.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> index 9d057073e110..151513c655c3 100644
> --- a/drivers/clk/clk-gpio.c
> +++ b/drivers/clk/clk-gpio.c
> @@ -109,14 +109,6 @@ static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
>  	if (!clk_gpio)
>  		return ERR_PTR(-ENOMEM);
>  
> -	/*
> -	 * Set to disabled no matter what: NOTE if the GPIO line is active low
> -	 * the GPIO descriptor knows this and will set it high to deassert the
> -	 * line. This assumes the GPIO descriptor has been requested using
> -	 * GPIOD_ASIS by the callers so we need to initialize it as disabled here.
> -	 */
> -	gpiod_set_value(gpiod, 0);
> -

Is there a reason why we split this patch out and then deleted
the comment that was introduced in the previous patch? Why not
combine these two patches into one?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
