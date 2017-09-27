Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Wed, 27 Sep 2017 14:52:17 +0800
From: Leo Yan <leo.yan@linaro.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: hisilicon: Delete an error message for a failed
 memory allocation in hisi_register_clkgate_sep()
Message-ID: <20170927065217.GC8173@leoy-ThinkPad-T440>
References: <920f1461-2c2a-430f-28ef-18af18788889@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <920f1461-2c2a-430f-28ef-18af18788889@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

Hi Markus,

On Tue, Sep 26, 2017 at 10:05:59PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 22:00:05 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This patch is good for me, it's true that below error log senstence is
redundant with its caller hisi_clk_register_gate_sep().

Reviewed-by: Leo Yan <leo.yan@linaro.org>

> ---
>  drivers/clk/hisilicon/clkgate-separated.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/hisilicon/clkgate-separated.c b/drivers/clk/hisilicon/clkgate-separated.c
> index 7908bc3c9ec7..f028bcffe12c 100644
> --- a/drivers/clk/hisilicon/clkgate-separated.c
> +++ b/drivers/clk/hisilicon/clkgate-separated.c
> @@ -105,10 +105,8 @@ struct clk *hisi_register_clkgate_sep(struct device *dev, const char *name,
>  	struct clk_init_data init;
>  
>  	sclk = kzalloc(sizeof(*sclk), GFP_KERNEL);
> -	if (!sclk) {
> -		pr_err("%s: fail to allocate separated gated clk\n", __func__);
> +	if (!sclk)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	init.name = name;
>  	init.ops = &clkgate_separated_ops;
> -- 
> 2.14.1
> 
