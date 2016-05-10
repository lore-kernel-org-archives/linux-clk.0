Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1462878590.3050.5.camel@pengutronix.de>
Subject: Re: [PATCH 1/5] reset: hisilicon: change the definition of
 hisi_reset_init
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
 linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
 yanhaifeng@hisilicon.com,  haojian.zhuang@linaro.org,
 zhangfei.gao@linaro.org, xuwei5@hisilicon.com,  yanghongwei@hisilicon.com
Date: Tue, 10 May 2016 13:09:50 +0200
In-Reply-To: <1462871953-26606-2-git-send-email-xuejiancheng@hisilicon.com>
References: <1462871953-26606-1-git-send-email-xuejiancheng@hisilicon.com>
	 <1462871953-26606-2-git-send-email-xuejiancheng@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Jiancheng,

Am Dienstag, den 10.05.2016, 17:19 +0800 schrieb Jiancheng Xue:
> Change the input arguments type to struct platform_device pointer.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
[...]
> diff --git a/drivers/clk/hisilicon/reset.h b/drivers/clk/hisilicon/reset.h
> index 677d773..9a69374 100644
> --- a/drivers/clk/hisilicon/reset.h
> +++ b/drivers/clk/hisilicon/reset.h
> @@ -22,10 +22,11 @@ struct device_node;
>  struct hisi_reset_controller;
>  
>  #ifdef CONFIG_RESET_CONTROLLER
> -struct hisi_reset_controller *hisi_reset_init(struct device_node *np);
> +struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev);

Changing this without changing the call to hisi_reset_init() in 
hi3519_clk_probe at the same time will break compilation until
patch 5 is applied.

regards
Philipp
