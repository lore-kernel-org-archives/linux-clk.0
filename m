Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 12:22:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Jun Nie <jun.nie@linaro.org>,
	Baoyou Xie <xie.baoyou@zte.com.cn>, Xin Zhou <zhou.xin8@zte.com.cn>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 2/3] zte: clk: pd_bit is not 0 on zx296718
Message-ID: <20170407192213.GZ7065@codeaurora.org>
References: <1490085503-15713-1-git-send-email-shawnguo@kernel.org>
 <1490085503-15713-3-git-send-email-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490085503-15713-3-git-send-email-shawnguo@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/21, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> The bit 0 of PLL_CFG0 register is not powerdown on zx296718, but part of
> of postdiv2 field.  The consequence is that functions like hw_to_idx()
> and zx_pll_enable() will end up tampering the postdiv2 of the PLL.
> 
> Let's fix it by defining pd_bit 0xff which is obviously invalid for a
> bit position and having PLL driver check the validity before operating
> on the bit.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
