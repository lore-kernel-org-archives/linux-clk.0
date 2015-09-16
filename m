Return-Path: <sboyd@codeaurora.org>
Date: Wed, 16 Sep 2015 15:07:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] clk: qcom: Add support for RCGs with shared
 branches
Message-ID: <20150916220722.GM23081@codeaurora.org>
References: <1442409888-19917-1-git-send-email-georgi.djakov@linaro.org>
 <1442409888-19917-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442409888-19917-3-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Georgi Djakov wrote:
> +static int clk_rcg2_shared_enable(struct clk_hw *hw)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +
> +	if (!rcg->current_freq) {
> +		struct clk_hw *parent = clk_hw_get_parent(hw);
> +		unsigned long parent_rate = clk_hw_get_rate(parent);
> +
> +		rcg->current_freq = clk_rcg2_recalc_rate(hw, parent_rate);

Hmm no. I meant adding a recal_rate implementation for this
specific type of clk_ops that assigns the current_freq value when
it's called. I assume we're not calling enable on this clock
before we register it with the framework.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
