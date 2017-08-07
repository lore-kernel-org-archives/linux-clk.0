Return-Path: <sboyd@codeaurora.org>
Date: Mon, 7 Aug 2017 16:02:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, huangtao@rock-chips.com,
	cl@rock-chips.com, xxx@rock-chips.com, xf@rock-chips.com
Subject: Re: [PATCH 1/2] clk: fractional-divider: allow overriding of
 approximation
Message-ID: <20170807230230.GY2146@codeaurora.org>
References: <1500624187-12165-1-git-send-email-zhangqing@rock-chips.com>
 <5990882.df1suBpf8V@phil>
 <5453089.AIzWDZk3ey@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5453089.AIzWDZk3ey@phil>
List-ID: <linux-clk.vger.kernel.org>

On 08/01, Heiko Stuebner wrote:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> Fractional dividers may have special requirements concerning numerator
> and denominator selection that differ from just getting the best
> approximation.
> 
> For example on Rockchip socs the denominator must be at least 20 times
> larger than the numerator to generate precise clock frequencies.
> 
> Therefore add the ability to provide custom approximation functions.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
