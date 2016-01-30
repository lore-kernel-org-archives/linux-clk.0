Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 17:29:23 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	James Hogan <james.hogan@imgtec.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v3] clk-divider: make sure read-only dividers do not
 write to their register
Message-ID: <20160130012923.GF4848@codeaurora.org>
References: <4666170.lmsMJxAogk@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4666170.lmsMJxAogk@phil>
List-ID: <linux-clk.vger.kernel.org>

On 01/21, Heiko Stuebner wrote:
> Commit e6d5e7d90be9 ("clk-divider: Fix READ_ONLY when divider > 1") removed
> the special ops struct for read-only clocks and instead opted to handle
> them inside the regular ops.
> 
> On the rk3368 this results in breakage as aclkm now gets set a value.
> While it is the same divider value, the A53 core still doesn't like it,
> which can result in the cpu ending up in a hang.
> The reason being that "ACLKENMasserts one clock cycle before the rising
> edge of ACLKM" and the clock should only be touched when STANDBYWFIL2
> is asserted.
> 
> To fix this, reintroduce the read-only ops but do include the round_rate
> callback. That way no writes that may be unsafe are done to the divider
> register in any case.
> 
> The Rockchip use of the clk_divider_ops is adapted to this split again,
> as is the nxp, lpc18xx-ccu driver that was included since the original
> commit. On lpc18xx-ccu the divider seems to always be read-only
> so only uses the new ops now.
> 
> Fixes: e6d5e7d90be9 ("clk-divider: Fix READ_ONLY when divider > 1")
> Reported-by: Zhang Qing <zhangqing@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
