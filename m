Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Sep 2017 14:19:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip clock Fixes for 4.14
Message-ID: <20170929211926.GL457@codeaurora.org>
References: <2374267.IN5p8oW94K@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2374267.IN5p8oW94K@phil>
List-ID: <linux-clk.vger.kernel.org>

On 09/25, Heiko Stuebner wrote:
> Hi Mike, Stephen,
> 
> please find below some fixes for the rk3128 clock controller that should
> hopefully be suitable for 4.14. The normal stuff some wrong register bits
> and some clocks that need to be critical for safe operation.
> 
> Otherwise from the main boards I test on, it looks like everything
> survived the merge window, so with a bit of luck this might be the only
> fixes for 4.14.
> 

Pulled for clk-fixes. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
