Return-Path: <sboyd@codeaurora.org>
Date: Mon, 27 Feb 2017 23:33:06 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: Re: [PATCH 1/4] clk: rockchip: add "," to
 mux_pll_src_apll_dpll_gpll_usb480m_p on rk3036
Message-ID: <20170228073306.GK25384@codeaurora.org>
References: <20170228051420.7214-1-heiko@sntech.de>
 <20170228051420.7214-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170228051420.7214-2-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 02/28, Heiko Stuebner wrote:
> The mux_pll_src_apll_dpll_gpll_usb480m_p parent list was missing a ","
> between the 3rd and 4th parent names, making them fall together and thus
> lookups fail. Fix that.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Subtle. Fixes tag?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
