Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Sep 2016 16:04:07 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] clk: sunxi-ng: sun6i-a31: Set CLK_SET_RATE_PARENT
 for display output clocks
Message-ID: <20160916230407.GS7243@codeaurora.org>
References: <20160915065740.13664-1-wens@csie.org>
 <20160915065740.13664-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160915065740.13664-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/15, Chen-Yu Tsai wrote:
> The LCD controller and HDMI controller use the LCDx-CHy and HDMI clocks
> to generate their dot clocks. To be able to generate a full range of
> possible clock rates, the parent PLL clock rates should also be changed.
> 
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
