Return-Path: <andi.shyti@samsung.com>
Date: Wed, 02 Mar 2016 11:25:09 +0900
From: Andi Shyti <andi.shyti@samsung.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 36/41] clk: s2mps11: Remove CLK_IS_ROOT
Message-id: <20160302022509.GG31199@samsunx.samsung>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-37-git-send-email-sboyd@codeaurora.org>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
In-reply-to: <1456858826-28541-37-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Tue, Mar 01, 2016 at 11:00:21AM -0800, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Andi Shyti <andi.shyti@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Andi Shyti <andi.shyti@samsung.com>

Thanks,
Andi

> ---
>  drivers/clk/clk-s2mps11.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index 371150aabd15..f8c83977c7fa 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -99,17 +99,14 @@ static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
>  	[S2MPS11_CLK_AP] = {
>  		.name = "s2mps11_ap",
>  		.ops = &s2mps11_clk_ops,
> -		.flags = CLK_IS_ROOT,
>  	},
>  	[S2MPS11_CLK_CP] = {
>  		.name = "s2mps11_cp",
>  		.ops = &s2mps11_clk_ops,
> -		.flags = CLK_IS_ROOT,
>  	},
>  	[S2MPS11_CLK_BT] = {
>  		.name = "s2mps11_bt",
>  		.ops = &s2mps11_clk_ops,
> -		.flags = CLK_IS_ROOT,
>  	},
>  };
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
