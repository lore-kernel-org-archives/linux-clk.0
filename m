Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 15:12:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: don't use clk_ APIs in the pll
 init-callback
Message-ID: <20151001221217.GM19319@codeaurora.org>
References: <2341478.8ucNaho7mA@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <2341478.8ucNaho7mA@diego>
List-ID: <linux-clk.vger.kernel.org>

On 10/01, Heiko Stübner wrote:
> Separate the update of pll registers from the actual set_rate function
> so that the init callback does not need to access clk-API functions.
> 
> As we now have separated the getting and setting of the pll parameters
> we can also directly use these new functions in other places too.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
