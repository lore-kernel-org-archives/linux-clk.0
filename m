Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>, Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: fix wrong mmc phase shift for rk3228
Date: Thu, 28 Jan 2016 18:04:01 +0100
Message-ID: <2854115.dRPO4ABWrL@diego>
In-Reply-To: <1453779018-30666-1-git-send-email-shawn.lin@rock-chips.com>
References: <1453779018-30666-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 26. Januar 2016, 11:30:18 schrieb Shawn Lin:
> mmc sample shift is 0 for rk3228 refer to user manaul.
> So it's broken if we enable mmc tuning for rk3228.
> 
> Fixes: 307a2e9ac ("clk: rockchip: add clock controller for rk3228")
> Cc: Xing Zheng <zhengxing@rock-chips.com>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk branch for 4.6 with Xing's review


Thanks
Heiko
