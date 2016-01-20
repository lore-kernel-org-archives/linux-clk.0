Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/4] clk: rockchip: fix cpuclk mux bit of big cpu-cluster
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
References: <1453326560-20475-1-git-send-email-heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 xf@rock-chips.com, zhangqing@rock-chips.com
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <56A004E3.5000309@codeaurora.org>
Date: Wed, 20 Jan 2016 14:06:27 -0800
MIME-Version: 1.0
In-Reply-To: <1453326560-20475-1-git-send-email-heiko@sntech.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 01/20/2016 01:49 PM, Heiko Stuebner wrote:
> Both clusters have their mux bit in bit 7 of their respective register.
> For whatever reason the big cluster currently lists bit 15 which is
> definitly wrong.
>
> Fixes: 3536c97a52db ("clk: rockchip: add rk3368 clock controller")
> Reported-by: Zhang Qing <zhangqing@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> I plan to include them into my clk-fixes branch, so posted for reference
> and possible objections ;-)

None of these patches are fixes to regressions introduced in the merge
window for v4.5, so we wouldn't be considering them for clk-fixes. We
can certainly queue them up in clk-next for v4.6 and let stable process
funnel them to the right stable trees though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
