Return-Path: <sboyd@codeaurora.org>
Date: Fri, 6 May 2016 15:55:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/7] clk: rockchip: abstract pll get-params and
 set-params operations
Message-ID: <20160506225543.GF3492@codeaurora.org>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
 <1461849075-8310-5-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461849075-8310-5-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 04/28, Heiko Stuebner wrote:
> This moves the pll-specific get_params and set_params functions into a
> per-pll struct that gets associated at init time and will help us reign
> in some code duplication we're faced with right now.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/clk/rockchip/clk-pll.c | 54 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
> index e56637d..2c30f52 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -30,6 +30,14 @@
>  #define PLL_MODE_NORM		0x1
>  #define PLL_MODE_DEEP		0x2
>  
> +struct rockchip_clk_pll;
> +struct rockchip_pll_data {
> +	void (*get_params)(struct rockchip_clk_pll *pll,
> +			   struct rockchip_pll_rate_table *rate);
> +	int (*set_params)(struct rockchip_clk_pll *pll,
> +			  const struct rockchip_pll_rate_table *rate);
> +};

I'm not a huge fan of function pointer indirection on top of
function pointer indirection (clk_ops). It would be nice if this
was more flat design and different clk_ops existed for different
PLL types that all used the same rockchip_clk_pll structure. But
I don't care too much because I'm not looking at this code all
the time, so if you like this approach then I'm fine.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
