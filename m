Return-Path: <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20170422104333.tcdpvessre3pvafk@mwanda>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Irina Tirdea
 <irina.tirdea@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-clk@vger.kernel.org,
 kernel-janitors@vger.kernel.org
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0ee5fc92-9189-8628-c872-4488d0e3d525@linux.intel.com>
Date: Mon, 24 Apr 2017 08:45:19 -0500
MIME-Version: 1.0
In-Reply-To: <20170422104333.tcdpvessre3pvafk@mwanda>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 4/22/17 5:43 AM, Dan Carpenter wrote:
> clkdev_hw_create() returns NULLs on error, it doesn't return error
> pointers.

Yes indeed. Thanks for the fix.
FWIW
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

>
> Fixes: 41ee7caf59e1 ("clk: x86: add "mclk" alias for Baytrail/Cherrytrail")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
> index fafc99120dc2..f99abc1106f0 100644
> --- a/drivers/clk/x86/clk-pmc-atom.c
> +++ b/drivers/clk/x86/clk-pmc-atom.c
> @@ -339,8 +339,8 @@ static int plt_clk_probe(struct platform_device *pdev)
>  		}
>  	}
>  	data->mclk_lookup = clkdev_hw_create(&data->clks[3]->hw, "mclk", NULL);
> -	if (IS_ERR(data->mclk_lookup)) {
> -		err = PTR_ERR(data->mclk_lookup);
> +	if (!data->mclk_lookup) {
> +		err = -ENOMEM;
>  		goto err_unreg_clk_plt;
>  	}
>
>
