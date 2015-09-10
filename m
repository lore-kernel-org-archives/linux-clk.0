Return-Path: <sboyd@codeaurora.org>
Date: Thu, 10 Sep 2015 13:56:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org
Subject: Re: [PATCH] clk: rockchip: handle critical clocks after registrering
 all clocks
Message-ID: <20150910205616.GD15099@codeaurora.org>
References: <7786473.0oe27txQFN@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <7786473.0oe27txQFN@phil>
List-ID: <linux-clk.vger.kernel.org>

On 08/21, Heiko Stuebner wrote:
> Currently the registration of critical clocks is done in the function
> shared between rk3066 and rk3188 clock trees. That results in them
> getting handled maybe before all of them are registered.
> 
> Therefore move the critical clock handling down to the end of the soc-
> specific clock registration function, so that all clocks are registered
> before they're maybe handled as critical clock.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
