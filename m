Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, huangtao@rock-chips.com, elaine.zhang@rock-chips.com, jay.xu@rock-chips.com, dianders@chromium.org
Subject: Re: [PATCH 6/6] clk: rockchip: rk3399: fix the gate bit for i2c4 and i2c8
Date: Mon, 25 Apr 2016 23:03:02 +0200
Message-ID: <33993376.YljBNjpY9Q@diego>
In-Reply-To: <1461150730-29787-1-git-send-email-zhengxing@rock-chips.com>
References: <1461150414-29638-1-git-send-email-zhengxing@rock-chips.com> <1461150730-29787-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 20. April 2016, 19:12:10 schrieb Xing Zheng:
> The gate bits of the i2c4 and i2c8 are incorrect due to the manual
> error, we need to fix them.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied to my clk-branch for v4.7

Thanks
Heiko
