Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Sep 2016 16:04:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] clk: sunxi-ng: sun6i-a31: Fix register offset for
 mipi-csi clk
Message-ID: <20160916230412.GU7243@codeaurora.org>
References: <20160915065740.13664-1-wens@csie.org>
 <20160915065740.13664-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160915065740.13664-4-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/15, Chen-Yu Tsai wrote:
> The register offset for the mipi-csi clk is off by 4, a copy paste
> error from the mipi-dsi clk.
> 
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
