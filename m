Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Jul 2016 17:34:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip clk changes for 4.8
Message-ID: <20160702003457.GI27880@codeaurora.org>
References: <112903792.EQ89smGoay@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <112903792.EQ89smGoay@phil>
List-ID: <linux-clk.vger.kernel.org>

On 07/01, Heiko Stuebner wrote:
> Hi Mike, Stephen,
> 
> please find below clock changes for 4.8.
> 
> Apart from some new clock ids there is the addition of a placeholder clock
> for the rk3399 watchdog pclk - as explained in the code, this gate is not
> controlled through the clock controller but through the general register
> files, yet the watchdog is unhappy if can't see the clock. And finally some
> small fixes for clock mistakes that do not affect any currently support
> board ip blocks like spdif-DPTX clock on the rk3399.
> 
> So if this looks ok, please pull
> 

Pulled into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
