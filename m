Return-Path: <sboyd@codeaurora.org>
Message-ID: <5522F353.90705@codeaurora.org>
Date: Mon, 06 Apr 2015 13:57:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Georgi Djakov <georgi.djakov@linaro.org>
CC: mturquette@linaro.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix parent_map translations
References: <1428069603-2641-1-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1428069603-2641-1-git-send-email-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 04/03/15 07:00, Georgi Djakov wrote:
> When we introduced the parent_map tables, we missed to update some
> of the functions where mapping is translated. Fix this.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rcg.c  |   13 ++++++++++---
>  drivers/clk/qcom/clk-rcg2.c |   20 +++++++++++++++-----
>  2 files changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
> index 8f2f48071a7a..e30821a3ba68 100644
> --- a/drivers/clk/qcom/clk-rcg.c
> +++ b/drivers/clk/qcom/clk-rcg.c
> @@ -319,7 +319,7 @@ static int clk_dyn_rcg_set_parent(struct clk_hw *hw, u8 index)
>  	if (banked_p)
>  		f.pre_div = ns_to_pre_div(&rcg->p[bank], ns) + 1;
>  
> -	f.src = index;
> +	f.src = qcom_find_src_index(hw, rcg->s[bank].parent_map, index);
>  	return configure_bank(rcg, &f);
>  }
>  
> @@ -411,13 +411,19 @@ static long _freq_tbl_determine_rate(struct clk_hw *hw,
>  {
>  	unsigned long clk_flags;
>  	struct clk *p;
> +	struct clk_rcg *rcg = to_clk_rcg(hw);

This function is called by both clk_dyn_rcg_determine_rate() and
clk_rcg_determine_rate() which means struct clk_hw is wrapped by
different structs. The to_clk_rcg() is wrong here. How about we pass the
parent map to this function?

> +	int index;
>  
>  	f = qcom_find_freq(f, rate);
>  	if (!f)
>  		return -EINVAL;
>  
> +	index = qcom_find_src_index(hw, rcg->s.parent_map, f->src);
> +	if (index < 0)
> +		return index;
> +
>  	clk_flags = __clk_get_flags(hw->clk);
> -	p = clk_get_parent_by_index(hw->clk, f->src);
> +	p = clk_get_parent_by_index(hw->clk, index);
>  	if (clk_flags & CLK_SET_RATE_PARENT) {
>  		rate = rate * f->pre_div;
>  		if (f->n) {
>
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
