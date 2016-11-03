Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Jianqun Xu <jay.xu@rock-chips.com>, mturquette@baylibre.com, sboyd@codeaurora.org, huangtao@rock-chips.com, zhangqing@rock-chips.com, zhengxing@rock-chips.com, linux-kernel@vger.kernel.org, lintao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: fix some clocks' name to be more standard style
Date: Thu, 03 Nov 2016 15:32:13 +0100
Message-ID: <44798035.VNVnDcOLnj@diego>
In-Reply-To: <763cad68-a068-9a4b-e26d-2c459c2d4808@rock-chips.com>
References: <1478070296-23080-1-git-send-email-jay.xu@rock-chips.com> <763cad68-a068-9a4b-e26d-2c459c2d4808@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 3. November 2016, 16:52:48 schrieb Shawn Lin:
> On 2016/11/2 15:04, Jianqun Xu wrote:
> > Fix aclk_emmcgrf to aclk_emmc_grf, and fix aclk_emmccore to be
> > aclk_emmc_core.
> 
> What is the standard style should be?
> 
> TRM uses aclk_emmccore but not aclk_emmc_core, so should it be more
> standrad to keep it as-is?

I tend to agree with Shawn. While it looks like the missing "_" is some sort 
of mistake, we should strive to follow TRM naming, so grepping so it becomes 
easier to look for informations in these things in the TRM.

Same reason for naming our regulators and pinctrl after the names used in 
device schematics, if available.


Heiko
