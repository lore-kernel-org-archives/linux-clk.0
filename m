Return-Path: <sboyd@codeaurora.org>
Date: Tue, 26 Dec 2017 17:15:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, jdelvare@suse.de,
	jamesjj.liao@mediatek.com, weiyi.lu@mediatek.com,
	kevin-cw.chen@mediatek.com, shunli.wang@mediatek.com,
	chen.zhong@mediatek.com, arnd@arndb.de,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: remove superfluous line including
 linux/clk-provider.h
Message-ID: <20171227011507.GR7997@codeaurora.org>
References: <96d2fcd536d75dbbfde0aa0ad0797e80da89117b.1514191770.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <96d2fcd536d75dbbfde0aa0ad0797e80da89117b.1514191770.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/25, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> clk-mtk.h has already included linux/clk-provider.h inside, so remove
> the superfluous line including linux/clk-provider.h from these files which
> also included clk-mtk.h.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> ---

Please don't do this. If anything, I would remove as many
includes from clk-mtk.h as possible and forward declare the
structures used in there so there isn't any header dependency.
Then it becomes clear which C files are clk-provider drivers
almost immediately because we have the include in the driver, and
we also avoid any header dependency chains where we must include
some header file if we want to get another header file's
definitions.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
