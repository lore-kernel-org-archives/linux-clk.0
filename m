Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, dianders@chromium.org, huangtao@rock-chips.com, elaine.zhang@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: add a dummy clock for the watchdog pclk on rk3399
Date: Fri, 27 May 2016 01:17:27 +0200
Message-ID: <7878987.CKGkxk3Y7s@phil>
In-Reply-To: <1464166316-22480-1-git-send-email-zhengxing@rock-chips.com>
References: <1464166316-22480-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 25. Mai 2016, 16:51:56 schrieb Xing Zheng:
> Like rk3288, the pclk supplying the watchdog is controlled via the
> SGRF register area. Additionally the SGRF isn't even writable in
> every boot mode.
> 
> But still the clock control is available and in the future someone
> might want to use it. Therefore define a simple clock for the time
> being so that the watchdog driver can read its rate.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied for 4.8

Thanks
Heiko
