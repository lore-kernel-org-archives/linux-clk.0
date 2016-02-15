Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] clk: rockchip: fix coding style for clk-cpu.c
Date: Mon, 15 Feb 2016 23:42:24 +0100
Message-ID: <1551462.HZJRzxyFeP@phil>
In-Reply-To: <1455507230-13120-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com> <1455507230-13120-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 15. Februar 2016, 11:33:50 schrieb Shawn Lin:
> Fix the issue reported by checkpatch:
> ERROR: space prohibited before that ',' (ctx:WxW)
> +               writel(clksel->val , cpuclk->reg_base + clksel->reg);
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk-branch for 4.6
