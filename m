Return-Path: <andriy.shevchenko@linux.intel.com>
Message-ID: <1517240807.7000.1303.camel@linux.intel.com>
Subject: Re: [PATCH v1 1/1] clk: Remove redundant selection of RATIONAL
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Date: Mon, 29 Jan 2018 17:46:47 +0200
In-Reply-To: <20180119174401.23051-1-andriy.shevchenko@linux.intel.com>
References: <20180119174401.23051-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-01-19 at 19:44 +0200, Andy Shevchenko wrote:
> Since the commit
> 
>   0777591e715a ("clk: fractional-divider: switch to rational best
> approximation")
> 
> enables rational best approximation to all common based clocks, there
> is
> no need to repeat the selection in each of them.
> 
> No functional changes intended.

Any comment on this?

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/clk/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 98ce9fc6e6c0..2e65cf731b00 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -76,7 +76,6 @@ config COMMON_CLK_SI5351
>  	tristate "Clock driver for SiLabs 5351A/B/C"
>  	depends on I2C
>  	select REGMAP_I2C
> -	select RATIONAL
>  	---help---
>  	  This driver supports Silicon Labs 5351A/B/C programmable
> clock
>  	  generators.
> @@ -105,7 +104,6 @@ config COMMON_CLK_CDCE706
>  	tristate "Clock driver for TI CDCE706 clock synthesizer"
>  	depends on I2C
>  	select REGMAP_I2C
> -	select RATIONAL
>  	---help---
>  	  This driver supports TI CDCE706 programmable 3-PLL clock
> synthesizer.
>  

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
