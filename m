Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Aug 2017 14:17:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
	rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 02/12] clk: qcom: flag for 64 bit CONFIG_CTL
Message-ID: <20170801211712.GN2146@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-3-git-send-email-absahu@codeaurora.org>
 <20170728183321.GG2146@codeaurora.org>
 <e976eedc7c835f92c1f5d19f6a2911a1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e976eedc7c835f92c1f5d19f6a2911a1@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/30, Abhishek Sahu wrote:
> On 2017-07-29 00:03, Stephen Boyd wrote:
> >On 07/27, Abhishek Sahu wrote:
> >>diff --git a/drivers/clk/qcom/clk-alpha-pll.c
> >>b/drivers/clk/qcom/clk-alpha-pll.c
> >>index 47a1da3..e6cde2d 100644
> >>--- a/drivers/clk/qcom/clk-alpha-pll.c
> >>+++ b/drivers/clk/qcom/clk-alpha-pll.c
> >>@@ -118,7 +118,10 @@ void clk_alpha_pll_configure(struct
> >>clk_alpha_pll *pll, struct regmap *regmap,
> >> 	regmap_write(regmap, off + PLL_L_VAL, config->l);
> >> 	regmap_write(regmap, off + PLL_ALPHA_VAL, config->alpha);
> >> 	regmap_write(regmap, off + PLL_CONFIG_CTL, config->config_ctl_val);
> >>-	regmap_write(regmap, off + PLL_CONFIG_CTL_U,
> >>config->config_ctl_hi_val);
> >>+
> >>+	if (pll->flags & SUPPORTS_64BIT_CONFIG_CTL)
> >>+		regmap_write(regmap, off + PLL_CONFIG_CTL_U,
> >>+			     config->config_ctl_hi_val);
> >
> >Is there a hole there? I mean a RAZ/WI register so we can just
> >keep writing it and not care?
> 
>  We don't have hole for most of the alpha PLL. The offset for
>  CONFIG_CTL itself is not same for all types of Alpha PLL
>  and the same is being handled in patch 4 of this patch
>  series.
> 
>  Spark PLL
>  CONFIG_CTL	0x18
>  TEST_CTL	0x1C
>  TEST_CTL_U	0x20
> 
>  Brammo PLL
>  CONFIG_CTL	0x18
>  TEST_CTL	0x1C
>  PLL_STATUS     0x24
> 
>  Hyuara PLL
>  CONFIG_CTL	0x14
>  CONFIG_CTL_U	0x18
>  TEST_CTL       0x1c

Ok. Thanks for checking.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
