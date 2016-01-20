Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, xf@rock-chips.com, zhangqing@rock-chips.com
Subject: Re: [PATCH 1/4] clk: rockchip: fix cpuclk mux bit of big cpu-cluster
Date: Wed, 20 Jan 2016 23:25:57 +0100
Message-ID: <2048998.GeQnePRN87@phil>
In-Reply-To: <56A004E3.5000309@codeaurora.org>
References: <1453326560-20475-1-git-send-email-heiko@sntech.de> <56A004E3.5000309@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 20. Januar 2016, 14:06:27 schrieb Stephen Boyd:
> On 01/20/2016 01:49 PM, Heiko Stuebner wrote:
> > Both clusters have their mux bit in bit 7 of their respective register.
> > For whatever reason the big cluster currently lists bit 15 which is
> > definitly wrong.
> > 
> > Fixes: 3536c97a52db ("clk: rockchip: add rk3368 clock controller")
> > Reported-by: Zhang Qing <zhangqing@rock-chips.com>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > I plan to include them into my clk-fixes branch, so posted for reference
> > and possible objections ;-)
> 
> None of these patches are fixes to regressions introduced in the merge
> window for v4.5, so we wouldn't be considering them for clk-fixes. We
> can certainly queue them up in clk-next for v4.6 and let stable process
> funnel them to the right stable trees though.

ok, I'll move them over to that part then :-)
