Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 12:22:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Jun Nie <jun.nie@linaro.org>,
	Baoyou Xie <xie.baoyou@zte.com.cn>, Xin Zhou <zhou.xin8@zte.com.cn>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/3] clk: zte: set CLK_SET_RATE_PARENT for a few zx296718
 clocks
Message-ID: <20170407192208.GY7065@codeaurora.org>
References: <1490085503-15713-1-git-send-email-shawnguo@kernel.org>
 <1490085503-15713-2-git-send-email-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490085503-15713-2-git-send-email-shawnguo@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/21, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> To support VOU VGA display driver with different modes, we need to set
> flag for a few clocks, so that clk_set_rate() call in VOU driver can get
> VGA device desired pixel rate.
> 
> While at it, the divider between pll_vga and clk_vga gets corrected, as
> it's 1:1 instead of 1:2.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
