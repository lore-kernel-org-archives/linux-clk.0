Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Jul 2017 11:33:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
	rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 02/12] clk: qcom: flag for 64 bit CONFIG_CTL
Message-ID: <20170728183321.GG2146@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-3-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1501153825-5181-3-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/27, Abhishek Sahu wrote:
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 47a1da3..e6cde2d 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -118,7 +118,10 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  	regmap_write(regmap, off + PLL_L_VAL, config->l);
>  	regmap_write(regmap, off + PLL_ALPHA_VAL, config->alpha);
>  	regmap_write(regmap, off + PLL_CONFIG_CTL, config->config_ctl_val);
> -	regmap_write(regmap, off + PLL_CONFIG_CTL_U, config->config_ctl_hi_val);
> +
> +	if (pll->flags & SUPPORTS_64BIT_CONFIG_CTL)
> +		regmap_write(regmap, off + PLL_CONFIG_CTL_U,
> +			     config->config_ctl_hi_val);

Is there a hole there? I mean a RAZ/WI register so we can just
keep writing it and not care?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
