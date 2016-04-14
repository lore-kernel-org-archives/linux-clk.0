Return-Path: <sboyd@codeaurora.org>
Date: Wed, 13 Apr 2016 17:43:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Finlye Xiao <finley.xiao@rock-chips.com>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com,
	wxt@rock-chips.com, zyw@rock-chips.com, jay.xu@rock-chips.com,
	zhangqing@rock-chips.com, xxx@rock-chips.com,
	huangtao@rock-chips.com
Subject: Re: [PATCH v1] clk: Add clk_composite_set_rate_and_parent
Message-ID: <20160414004331.GK14441@codeaurora.org>
References: <1460339652-63498-1-git-send-email-finley.xiao@rock-chips.com>
 <3986787.PS6VzOpSAJ@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3986787.PS6VzOpSAJ@phil>
List-ID: <linux-clk.vger.kernel.org>

On 04/12, Heiko Stuebner wrote:
> 
> I remember having clocks not overflow their target rate came up in some ELC 
> talk last week (probably in Stephens Qualcomm-kernel-talk) and a general 
> solution might need some changes closer to the core.

Yep. It's on the list. Hopefully coordinated clk rate changes
will help here. Composite clks are sort of already coordinated
rates in a minor form though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
