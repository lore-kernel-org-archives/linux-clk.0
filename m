Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] clk: rockchip: don't return NULL when registering inverter fails
Date: Mon, 15 Feb 2016 23:41:51 +0100
Message-ID: <2500574.XYymApL490@phil>
In-Reply-To: <1455507213-13037-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com> <1455507213-13037-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 15. Februar 2016, 11:33:33 schrieb Shawn Lin:
> Avoid return NULL if rockchip_clk_register_inverter fails, otherwise
> rockchip_clk_register_branches print "unknown clock type". The acutal
> case is that it's a known clock type but we fail to regiser it, which
> may makes user confuse the reason of failure.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk-branch for 4.6
