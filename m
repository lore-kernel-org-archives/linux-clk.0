Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Mar 2017 11:08:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: rockchip: Make uartpll a child of the gpll
 on rk3036
Message-ID: <20170301190853.GQ25384@codeaurora.org>
References: <20170228181214.6413-1-heiko@sntech.de>
 <20170228181214.6413-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170228181214.6413-3-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 02/28, Heiko Stuebner wrote:
> @@ -480,6 +481,19 @@ static void __init rk3036_clk_init(struct device_node *np)
>  
>  	rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL);
>  
> +	clk = __clk_lookup("uart_pll_clk");
> +	clk2 = __clk_lookup("gpll");

Can we do the register writes directly? Or call the appropriate
function to twiddle some bits to change the parent before
registering the clks? It's nice to avoid using clk API in
provider drivers when we're getting clks from the provider
itself, plus I'd like to get rid of __clk_lookup() one day.

> +	if (clk && clk2) {
> +		int ret = clk_set_parent(clk, clk2);
> +
> +		if (ret < 0)
> +			pr_warn("%s: could not reparent uart_pll_clk to gpll\n",
> +				__func__);
> +	} else {
> +		pr_warn("%s: missing clocks to reparent uart_pll_clk to gpll\n",
> +			__func__);
> +	}
> +
>  	rockchip_clk_of_add_provider(np, ctx);
>  }

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
