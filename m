Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 May 2015 11:37:07 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricky Liang <jcliang@chromium.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Henry Chen <henryc.chen@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] clk: mediatek: Initialize clk flags
Message-ID: <20150515183707.GM31753@codeaurora.org>
References: <1431670969-1996-1-git-send-email-jcliang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431670969-1996-1-git-send-email-jcliang@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/15, Ricky Liang wrote:
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 66154ca..72fe307 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -289,6 +289,7 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
>  	init.ops = &mtk_pll_ops;
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;
> +	init.flags = data->flags;

Wrong? It looks like plls[] in drivers/clk/mediatek/clk-mt8135.c
is putting mtk specific clock flags in this structure member.

How about initializing the structure to { } instead? That way if
we ever add more structure members we don't have to detect the
landmine laid here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
