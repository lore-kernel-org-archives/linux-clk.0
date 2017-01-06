Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Douglas Anderson <dianders@chromium.org>
Cc: linux-rockchip@lists.infradead.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Remove useless init of "grf" to -EPROBE_DEFER
Date: Fri, 06 Jan 2017 20:32:02 +0100
Message-ID: <3165407.VSLAtN8Q2L@phil>
In-Reply-To: <20170106163101.32048-1-dianders@chromium.org>
References: <20170106163101.32048-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 6. Januar 2017, 08:31:01 CET schrieb Douglas Anderson:
> When we used to defer setting the "grf" member to
> rockchip_clk_get_grf() it was important to init the "grf" member to an
> error value in rockchip_clk_init().  With recent changes, we now set
> "grf" right in rockchip_clk_init() (two lines below the place where we
> initted it).  That makes the old init useless.  Get rid of it.
> 
> Fixes: 6f339dc2719e ("clk: rockchip: lookup General Register Files in
> rockchip_clk_init") Signed-off-by: Douglas Anderson <dianders@chromium.org>

thanks for the catch, applied for 4.11


Thanks
Heiko
