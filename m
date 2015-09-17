Return-Path: <sboyd@codeaurora.org>
Date: Thu, 17 Sep 2015 12:31:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 2/4] clk: qcom: Add support for RCGs with shared
 branches
Message-ID: <20150917193137.GU23081@codeaurora.org>
References: <1442507969-18062-1-git-send-email-georgi.djakov@linaro.org>
 <1442507969-18062-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442507969-18062-3-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/17, Georgi Djakov wrote:
> +
> +static unsigned long
> +clk_rcg2_shared_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	unsigned long rate;
> +	u32 cfg, hid_div, mask;
> +
> +	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> +
> +	mask = BIT(rcg->hid_width) - 1;
> +	hid_div = cfg >> CFG_SRC_DIV_SHIFT;
> +	hid_div &= mask;
> +
> +	rate = (parent_rate * 2) / (hid_div + 1);
> +
> +	rcg->current_freq = rate;
> +

We didn't need to copy/paste/hack the clk_rcg2_recalc_rate()
code. I squashed this in.

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index c7b9b32742e5..b544bb302f79 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -350,20 +350,8 @@ static unsigned long
 clk_rcg2_shared_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-	unsigned long rate;
-	u32 cfg, hid_div, mask;
 
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
-
-	mask = BIT(rcg->hid_width) - 1;
-	hid_div = cfg >> CFG_SRC_DIV_SHIFT;
-	hid_div &= mask;
-
-	rate = (parent_rate * 2) / (hid_div + 1);
-
-	rcg->current_freq = rate;
-
-	return rate;
+	return rcg->current_freq = clk_rcg2_recalc_rate(hw, parent_rate);
 }
 
 static int clk_rcg2_shared_enable(struct clk_hw *hw)
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
