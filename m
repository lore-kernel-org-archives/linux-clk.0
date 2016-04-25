Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, elaine.zhang@rock-chips.com, jay.xu@rock-chips.com, dianders@chromium.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] clk: rockchip: rk3399: drop unnecessary CLK_IGNORE_UNUSED flags
Date: Mon, 25 Apr 2016 23:02:37 +0200
Message-ID: <2170828.EVvy8hQbgu@diego>
In-Reply-To: <1461150414-29638-4-git-send-email-zhengxing@rock-chips.com>
References: <1461150414-29638-1-git-send-email-zhengxing@rock-chips.com> <1461150414-29638-4-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 20. April 2016, 19:06:51 schrieb Xing Zheng:
> We don't need to many clocks enable after startup, to reduce some
> power consumption.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied to my clk-branch for v4.7

Thanks
Heiko
