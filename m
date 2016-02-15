Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: rockchip: handle alt_parent in err cases when registering cpuclk
Date: Mon, 15 Feb 2016 22:39:17 +0100
Message-ID: <7052638.ZSmMH6ScWV@phil>
In-Reply-To: <1455507195-12955-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com> <1455507195-12955-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 15. Februar 2016, 11:33:15 schrieb Shawn Lin:
> Add clk_disable_unprepare to handle cpuclk->alt_parent if
> rockchip_clk_register_cpuclk fails.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk branch for 4.6
