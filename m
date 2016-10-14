Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, Lin Huang <hl@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: don't return NULL when failing to register ddrclk branch
Date: Fri, 14 Oct 2016 19:06:00 +0200
Message-ID: <6436195.q1mHK715BP@phil>
In-Reply-To: <1476275501-2653-1-git-send-email-shawn.lin@rock-chips.com>
References: <1476275501-2653-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 12. Oktober 2016, 20:31:41 CEST schrieb Shawn Lin:
> rockchip_clk_register_ddrclk should not return NULL when faling
> to call clk_register, otherwise rockchip_clk_register_branches
> prints "unknown clock type". The acutal case is that it's a known
> clock type but we fail to regiser it, which may makes user confuse
> the reason of failure. And the pr_err here is pointless as
> rockchip_clk_register_branches will also print the similar message.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

thanks for catching this ... applied to a clk-fixes branch for 4.9
