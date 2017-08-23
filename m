Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Aug 2017 16:08:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] clk: rockchip: Mark rockchip_fractional_approximation
 static
Message-ID: <20170823230819.GM21656@codeaurora.org>
References: <20170823223932.27881-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170823223932.27881-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/23, Stephen Boyd wrote:
> Silence the sparse warning
> 
> clk/rockchip/clk.c:172:6: warning: symbol 'rockchip_fractional_approximation' was not declared. Should it be static?
> 
> Cc: Elaine Zhang <zhangqing@rock-chips.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
