Return-Path: <andriy.shevchenko@linux.intel.com>
Message-ID: <1499940374.22624.370.camel@linux.intel.com>
Subject: Re: [PATCH v2] clk: x86: Do not gate clocks enabled by the firmware
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Carlo Caione <carlo@caione.org>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, dvhart@infradead.org,
 pierre-louis.bossart@linux.intel.com, sboyd@codeaurora.org,
 linux@endlessm.com,  eballetbo@gmail.com
Cc: Carlo Caione <carlo@endlessm.com>
Date: Thu, 13 Jul 2017 13:06:14 +0300
In-Reply-To: <20170713094213.2775-1-carlo@caione.org>
References: <20170713094213.2775-1-carlo@caione.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-07-13 at 11:42 +0200, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> Read the enable register to determine if the clock is already in use
> by
> the firmware. In this case avoid gating the clock.
> 

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I suppose it should go via clock tree.

> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  drivers/clk/x86/clk-pmc-atom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-
> atom.c
> index 2b60577703ef..3c73d2e564ca 100644
> --- a/drivers/clk/x86/clk-pmc-atom.c
> +++ b/drivers/clk/x86/clk-pmc-atom.c
> @@ -185,6 +185,13 @@ static struct clk_plt *plt_clk_register(struct
> platform_device *pdev, int id,
>  	pclk->reg = base + PMC_CLK_CTL_OFFSET + id *
> PMC_CLK_CTL_SIZE;
>  	spin_lock_init(&pclk->lock);
>  
> +	/*
> +	 * If the clock was already enabled by the firmware mark is a
> critical
> +	 * to avoid it being gated by the clock framework if no
> driver owns it
> +	 */
> +	if (plt_clk_is_enabled(&pclk->hw))
> +		init.flags |= CLK_IS_CRITICAL;
> +
>  	ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
>  	if (ret) {
>  		pclk = ERR_PTR(ret);

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
