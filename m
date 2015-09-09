Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 9 Sep 2015 15:46:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: qcom: Add support for RCGs with shared
 branches
Message-ID: <20150909224613.GW15099@codeaurora.org>
References: <1439477317-1902-1-git-send-email-georgi.djakov@linaro.org>
 <1439477317-1902-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1439477317-1902-3-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/13, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 56028bb31d87..0693b9e0b15e 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -153,8 +153,8 @@ extern const struct clk_ops clk_dyn_rcg_ops;
>   * @hid_width: number of bits in half integer divider
>   * @parent_map: map from software's parent index to hardware's src_sel field
>   * @freq_tbl: frequency table
> + * @current_freq: last cached frequency when using branches with shared RCGs
>   * @clkr: regmap clock handle
> - * @lock: register lock

Thanks.

>   *
>   */
>  struct clk_rcg2 {
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 9aec1761fd29..681faf2dcdc5 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> +
> +static int clk_rcg2_shared_enable(struct clk_hw *hw)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	const char *name = clk_hw_get_name(hw);
> +
> +	if (!rcg->current_freq) {
> +		pr_err("%s: Please set rate before enabling\n", name);

Why? Can't we find the current freq during recalc_rate?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
