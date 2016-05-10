Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1462878595.3050.6.camel@pengutronix.de>
Subject: Re: [PATCH 5/5] clk: hisilicon: hi3519: add driver remove path and
 fix some issues
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
 linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
 yanhaifeng@hisilicon.com,  haojian.zhuang@linaro.org,
 zhangfei.gao@linaro.org, xuwei5@hisilicon.com,  yanghongwei@hisilicon.com
Date: Tue, 10 May 2016 13:09:55 +0200
In-Reply-To: <1462871953-26606-6-git-send-email-xuejiancheng@hisilicon.com>
References: <1462871953-26606-1-git-send-email-xuejiancheng@hisilicon.com>
	 <1462871953-26606-6-git-send-email-xuejiancheng@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, den 10.05.2016, 17:19 +0800 schrieb Jiancheng Xue:
> 1. Add driver remove path.
> 2. Fix some issues.
>    -Fix the ordering issue about clock provider being published.
>    -Add error checking upon registering clocks.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> ---
>  drivers/clk/hisilicon/clk-hi3519.c | 116 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 100 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
> index 715c730..51b173e 100644
> --- a/drivers/clk/hisilicon/clk-hi3519.c
> +++ b/drivers/clk/hisilicon/clk-hi3519.c
[...]
> -	rstc = hisi_reset_init(np);
> -	if (!rstc)
[...]
> +	crg->rstc = hisi_reset_init(pdev);
> +	if (!crg->rstc)
[...]

The hisi_reset_init(np) -> hisi_reset_init(pdev) change should be part
of patch 1.

regards
Philipp
