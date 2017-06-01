Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Jun 2017 00:58:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5 v2] clk: qcom: Implement RPM clocks for
 MSM8660/APQ8060
Message-ID: <20170601075838.GZ20170@codeaurora.org>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170419091326.11226-3-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 04/19, Linus Walleij wrote:
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> index df3e5fe8442a..61c67e93bea3 100644
> --- a/drivers/clk/qcom/clk-rpm.c
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -56,6 +56,30 @@
>  		},							      \
>  	}
>  
> +#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \
> +	static struct clk_rpm _platform##_##_name = {			      \
> +		.rpm_clk_id = (r_id),					      \
> +		.rate = (r),						      \
> +		.hw.init = &(struct clk_init_data){			      \
> +			.ops = &clk_rpm_fixed_ops,			      \
> +			.name = #_name,					      \
> +			.parent_names = (const char *[]){ "pxo_board" },      \

Parent should be pxo, not pxo_board.

> +			.num_parents = 1,				      \
> +		},							      \
> +	};								      \
> +	static struct clk_rpm _platform##_##_active = {			      \
> +		.rpm_clk_id = (r_id),					      \
> +		.peer = &_platform##_##_name,				      \
> +		.active_only = true,					      \
> +		.rate = (r),						      \
> +		.hw.init = &(struct clk_init_data){			      \
> +			.ops = &clk_rpm_fixed_ops,			      \
> +			.name = #_active,				      \
> +			.parent_names = (const char *[]){ "pxo_board" },      \

ditto.

> +			.num_parents = 1,				      \
> +		},							      \
> +	}
> +
>  #define DEFINE_CLK_RPM_PXO_BRANCH(_platform, _name, _active, r_id, r)	      \
>  	static struct clk_rpm _platform##_##_active;			      \
>  	static struct clk_rpm _platform##_##_name = {			      \
> @@ -143,6 +167,13 @@ static int clk_rpm_handoff(struct clk_rpm *r)
>  	int ret;
>  	u32 value = INT_MAX;
>  
> +	/*
> +	 * The vendor tree simply reads the status for this
> +	 * RPM clock.
> +	 */
> +	if (r->rpm_clk_id == QCOM_RPM_PLL_4)
> +		return 0;
> +

I can't recall what that was all about. Handoff code came later
than when this PLL was supported, so perhaps we just missed
handoff here. Really it probably doesn't matter because sounds
aren't being played in the bootloader and/or the PLL isn't
enabled that early.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
