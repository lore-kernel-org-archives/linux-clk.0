Return-Path: <sboyd@codeaurora.org>
Date: Mon, 27 Feb 2017 23:32:40 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: Re: [PATCH 0/4] rockchip: fix serial output on rk3036
Message-ID: <20170228073240.GJ25384@codeaurora.org>
References: <20170228051420.7214-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170228051420.7214-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 02/28, Heiko Stuebner wrote:
> Recent changes to the 8250-dw variant revealed issues concerning
> how the clock rates are handled on the rk3036 uart.
> 
> For one, there was an error in the clock declaration, but also the
> shared uart-pll-select-mux also as default got supplied from the apll
> that also supplies the cpu and thus gets frequency scaled.
> 
> The patches in this series remedy this and make the debug uart
> function again on 4.10 + current merge window.
> 

What's the merge path? The last patch is sort of questionable
because it fixes a regression by changing assigned clocks in DT,
which doesn't really make sense from a DT perspective (it should
have been right already or can be configured from the clk driver
itself in software).

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
