Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, dianders@chromium.org, briannorris@chromium.org, huangtao@rock-chips.com, zhangqing@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: rockchip: rk3399: fix incorrect aclk_emmc source gate bits
Date: Fri, 12 Aug 2016 10:05:37 +0200
Message-ID: <2820412.n3i6OJSAzs@diego>
In-Reply-To: <1470122401-31934-5-git-send-email-zhengxing@rock-chips.com>
References: <1470122401-31934-1-git-send-email-zhengxing@rock-chips.com> <1470122401-31934-5-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 2. August 2016, 15:19:58 schrieb Xing Zheng:
> Dues to incorrect diagram, we need to fix incorrect bits for
> (c/g)pll_aclk_emmc_src:
> cpll_aclk_emmc_src --> G6[13]
> gpll_aclk_emmc_src --> G6[12]
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk-fixes branch for 4.8


Thanks
Heiko
