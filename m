Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Thu, 13 Apr 2017 22:25:27 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	broonie@kernel.org, yibin.gong@nxp.com, rjw@rjwysocki.net,
	viresh.kumar@linaro.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, shawnguo@kernel.org, fabio.estevam@nxp.com,
	anson.huang@nxp.com, ping.bai@nxp.com, leonard.crestez@nxp.com,
	octavian.purdila@nxp.com
Subject: Re: [RFC PATCH 1/3] clk: add clk_bulk_get accessories
Message-ID: <20170413142527.GD24254@b29396-OptiPlex-7040>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
 <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 12, 2017 at 12:03:27PM +0800, Dong Aisheng wrote:
...
> @@ -445,6 +543,12 @@ static inline struct clk *clk_get(struct device *dev, const char *id)
>  	return NULL;
>  }
>  
> +static inline int clk_bulk_get(struct device *dev, int num_clks,
> +			       struct clk_bulk_data *clks)
> +{
> +	return NULL;

Here needs to be changed to 'return 0'.

It's catched by 0day robot.

include/linux/clk.h: In function 'clk_bulk_get':
include/linux/stddef.h:7:14: warning: return makes integer from pointer without a cast [-Wint-conversion]
#define NULL ((void *)0)

Good job! Robot!

Regards
Dong Aisheng
