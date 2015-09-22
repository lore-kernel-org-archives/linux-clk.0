Return-Path: <sboyd@codeaurora.org>
Date: Tue, 22 Sep 2015 15:41:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] clk: rockchip: add new clock type and controller
 for rk3036
Message-ID: <20150922224125.GK23081@codeaurora.org>
References: <1442478540-15068-1-git-send-email-zhengxing@rock-chips.com>
 <1442478540-15068-5-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442478540-15068-5-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/17, Xing Zheng wrote:
> +
> +static void rockchip_rk3036_pll_init(struct clk_hw *hw)

init ops are "discouraged". Could we do this through assigned
rates instead?

> +{
> +	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
> +	const struct rockchip_pll_rate_table *rate;
> +	unsigned int fbdiv, postdiv1, refdiv, postdiv2, dsmpd, frac;
> +	unsigned long drate;
> +	u32 pllcon;
> +
> +	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
> +		return;

I don't understand what this one does though. This check isn't in
the set rate ops.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
