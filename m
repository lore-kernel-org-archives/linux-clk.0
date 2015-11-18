Return-Path: <sboyd@codeaurora.org>
Date: Wed, 18 Nov 2015 12:28:13 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: qcom: Add MSM8996 Multimedia Clock Controller
 (MMCC) driver
Message-ID: <20151118202813.GD32672@codeaurora.org>
References: <1447808844-27049-1-git-send-email-sboyd@codeaurora.org>
 <1447808844-27049-6-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447808844-27049-6-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/17, Stephen Boyd wrote:
> +static struct clk_alpha_pll mmpll0_early = {
> +	.offset = 0x0,
> +	.vco_table = mmpll_p_vco,
> +	.num_vco = ARRAY_SIZE(mmpll_p_vco),
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll0_early",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_ops,
> +	},
> +};
> +
> +static struct clk_alpha_pll_postdiv mmpll0 = {
> +	.offset = 0x0,
> +	.width = 4,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll0",
> +		.parent_names = (const char *[]){ "mmpll0_early" },
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_postdiv_ops,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_alpha_pll mmpll1_early = {
> +	.offset = 0x30,
> +	.vco_table = mmpll_p_vco,
> +	.num_vco = ARRAY_SIZE(mmpll_p_vco),
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll1_early",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_ops,
> +	},
> +};
> +
> +static struct clk_alpha_pll_postdiv mmpll1 = {
> +	.offset = 0x30,
> +	.width = 4,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll1",
> +		.parent_names = (const char *[]){ "mmpll1_early" },
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_postdiv_ops,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};

These are missing the .enable_reg and .enable_mask members to do
the proper FSM voting. I'll add that in v2.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
