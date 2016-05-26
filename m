Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: fix cclk error handing
Date: Thu, 26 May 2016 23:47:39 +0200
Message-ID: <1509769.ko7YVcsoMN@phil>
In-Reply-To: <1464270549-12713-1-git-send-email-zhengxing@rock-chips.com>
References: <1464270549-12713-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 26. Mai 2016, 21:49:08 schrieb Xing Zheng:
> It maybe due to a copy-paste error the error handing should be
> cclk not clk.
> 
> Reported-by: Lin Huang <lin.huang@rock-chips.com>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied to my clk-fixes branch after adapting the commit message a bit.


Thanks for catching that
Heiko
