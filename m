Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Jun 2015 15:44:07 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@linaro.org, haojian.zhuang@gmail.com,
	james.hogan@imgtec.com
Subject: Re: [PATCH 1/2] clk: divider: don't set_rate with
 CLK_DIVIDER_READ_ONLY flag
Message-ID: <20150604224407.GC8099@codeaurora.org>
References: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/07, Joonyoung Shim wrote:
> Even if use CLK_DIVIDER_READ_ONLY flag, divider setting can be changed
> by set_rate callback. Don't change divider setting from set_rate
> callback of divider with CLK_DIVIDER_READ_ONLY flag.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/clk/clk-divider.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 25006a8..ce34d29a 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -384,6 +384,9 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
>  	unsigned long flags = 0;
>  	u32 val;
>  
> +	if (divider->flags & CLK_DIVIDER_READ_ONLY)
> +		return 0;
> +
>  	value = divider_get_val(rate, parent_rate, divider->table,
>  				divider->width, divider->flags);
>  

I wonder if it would make more sense to have different ops for
read only dividers. We would need to have an empty clk_set_rate
op in the case where the CCF tries to set the rate to what it
already is and then the proper recalc_rate and round_rate ops for
read only devices. At the least, this patch looks correct.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
