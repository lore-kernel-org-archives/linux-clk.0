Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: dianders@chromium.org, zhangqing@rock-chips.com, huangtao@rock-chips.com, briannorris@chromium.org, zyw@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: fix the rk3399 spdif incorrect bit for DPTX
Date: Fri, 01 Jul 2016 10:31:54 +0200
Message-ID: <2167990.nRjYb2NtK4@phil>
In-Reply-To: <1467253139-21112-1-git-send-email-zhengxing@rock-chips.com>
References: <1467253139-21112-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 30. Juni 2016, 10:18:59 schrieb Xing Zheng:
> The CLKSEL_CON32 bit_0 is controlled for spdif_8ch, not spdif_rec_dptx,
> it should be bit_8, let's fix it.
> 
> Reported-by: Chris Zhong <zyw@rock-chips.com>
> Tested-by: Chris Zhong <zyw@rock-chips.com>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied to my clk branch for 4.8
