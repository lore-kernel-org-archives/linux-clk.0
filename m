Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Thu, 17 Sep 2015 22:49:36 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Remove unneeded semicolons
Message-ID: <20150917144936.GA29113@leoy-linaro>
References: <1442497769-7721-1-git-send-email-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442497769-7721-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 17, 2015 at 03:49:29PM +0200, Javier Martinez Canillas wrote:
> There are cleary typo errors so can be removed.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  drivers/clk/clk.c                       | 2 +-
>  drivers/clk/hisilicon/clk-hi6220-stub.c | 2 +-
>  drivers/clk/mvebu/common.c              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 43e2c3ad6c31..a66a6d433b1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1685,7 +1685,7 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
>  			"%s: multi-parent clocks must implement .get_parent\n",
>  			__func__);
>  		goto out;
> -	};
> +	}
>  
>  	/*
>  	 * Do our best to cache parent clocks in core->parents.  This prevents
> diff --git a/drivers/clk/hisilicon/clk-hi6220-stub.c b/drivers/clk/hisilicon/clk-hi6220-stub.c
> index 2c4add11c1ca..8afb40ef40ce 100644
> --- a/drivers/clk/hisilicon/clk-hi6220-stub.c
> +++ b/drivers/clk/hisilicon/clk-hi6220-stub.c
> @@ -230,7 +230,7 @@ static int hi6220_stub_clk_probe(struct platform_device *pdev)
>  	if (IS_ERR(stub_clk->mbox)) {
>  		dev_err(dev, "failed get mailbox channel\n");
>  		return PTR_ERR(stub_clk->mbox);
> -	};
> +	}

Acked-by: Leo Yan <leo.yan@linaro.org>

Thanks,
Leo Yan

>  
>  	init.name = "acpu0";
>  	init.ops = &hi6220_stub_clk_ops;
> diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
> index 4a22429cd7a2..28aac67e7b92 100644
> --- a/drivers/clk/mvebu/common.c
> +++ b/drivers/clk/mvebu/common.c
> @@ -165,7 +165,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
>  		clk_data.clks[2+n] = clk_register_fixed_factor(NULL, rclk_name,
>  				       cpuclk_name, 0, mult, div);
>  		WARN_ON(IS_ERR(clk_data.clks[2+n]));
> -	};
> +	}
>  
>  	/* Register optional refclk */
>  	if (desc->get_refclk_freq) {
> -- 
> 2.4.3
> 
