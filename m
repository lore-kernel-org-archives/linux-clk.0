Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55E027D8.4030406@codeaurora.org>
Date: Fri, 28 Aug 2015 14:50:24 +0530
From: Archit Taneja <architt@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Hai Li <hali@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: Allow clk_set_parent() to work on display
 clocks
References: <1440722536-11197-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1440722536-11197-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 08/28/2015 06:12 AM, Stephen Boyd wrote:
> Sometimes the display driver may want to change the parent PLL of
> the display clocks (byte and pixel clocks) depending on the
> use-case. Currently the parent is fixed by means of having a
> frequency table with one entry that chooses a particular parent.
> Remove this restriction and use the parent the clock is
> configured for in the hardware during clk_set_rate(). This
> requires consumers to rely on the default parent or to configure
> the parent with clk_set_parent()/assigned-clock-parents on the
> clocks before calling clk_set_rate().

Tested-by: Archit Taneja <architt@codeaurora.org>

>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Hai Li <hali@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>   drivers/clk/qcom/clk-rcg.h      |  1 +
>   drivers/clk/qcom/clk-rcg2.c     | 91 +++++++++++++++++++++++++++++++++++++----
>   drivers/clk/qcom/gcc-msm8916.c  | 14 +------
>   drivers/clk/qcom/mmcc-apq8084.c | 18 +-------
>   drivers/clk/qcom/mmcc-msm8974.c | 11 +----
>   5 files changed, 89 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 56028bb31d87..31f92d70e8e0 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -171,6 +171,7 @@ struct clk_rcg2 {
>   extern const struct clk_ops clk_rcg2_ops;
>   extern const struct clk_ops clk_edp_pixel_ops;
>   extern const struct clk_ops clk_byte_ops;
> +extern const struct clk_ops clk_byte2_ops;
>   extern const struct clk_ops clk_pixel_ops;
>
>   #endif
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 9aec1761fd29..d941dea6f7c7 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -485,6 +485,76 @@ const struct clk_ops clk_byte_ops = {
>   };
>   EXPORT_SYMBOL_GPL(clk_byte_ops);
>
> +static int clk_byte2_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	unsigned long parent_rate, div;
> +	u32 mask = BIT(rcg->hid_width) - 1;
> +	struct clk_hw *p;
> +	unsigned long rate = req->rate;
> +
> +	if (rate == 0)
> +		return -EINVAL;
> +
> +	p = req->best_parent_hw;
> +	req->best_parent_rate = parent_rate = clk_hw_round_rate(p, rate);
> +
> +	div = DIV_ROUND_UP((2 * parent_rate), rate) - 1;
> +	div = min_t(u32, div, mask);
> +
> +	req->rate = calc_rate(parent_rate, 0, 0, 0, div);
> +
> +	return 0;
> +}
> +
> +static int clk_byte2_set_rate(struct clk_hw *hw, unsigned long rate,
> +			 unsigned long parent_rate)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	struct freq_tbl f = { 0 };
> +	unsigned long div;
> +	int i, num_parents = clk_hw_get_num_parents(hw);
> +	u32 mask = BIT(rcg->hid_width) - 1;
> +	u32 cfg;
> +
> +	div = DIV_ROUND_UP((2 * parent_rate), rate) - 1;
> +	div = min_t(u32, div, mask);
> +
> +	f.pre_div = div;
> +
> +	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> +	cfg &= CFG_SRC_SEL_MASK;
> +	cfg >>= CFG_SRC_SEL_SHIFT;
> +
> +	for (i = 0; i < num_parents; i++) {
> +		if (cfg == rcg->parent_map[i].cfg) {
> +			f.src = rcg->parent_map[i].src;
> +			return clk_rcg2_configure(rcg, &f);
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int clk_byte2_set_rate_and_parent(struct clk_hw *hw,
> +		unsigned long rate, unsigned long parent_rate, u8 index)
> +{
> +	/* Read the hardware to determine parent during set_rate */
> +	return clk_byte2_set_rate(hw, rate, parent_rate);
> +}
> +
> +const struct clk_ops clk_byte2_ops = {
> +	.is_enabled = clk_rcg2_is_enabled,
> +	.get_parent = clk_rcg2_get_parent,
> +	.set_parent = clk_rcg2_set_parent,
> +	.recalc_rate = clk_rcg2_recalc_rate,
> +	.set_rate = clk_byte2_set_rate,
> +	.set_rate_and_parent = clk_byte2_set_rate_and_parent,
> +	.determine_rate = clk_byte2_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_byte2_ops);
> +
>   static const struct frac_entry frac_table_pixel[] = {
>   	{ 3, 8 },
>   	{ 2, 9 },
> @@ -496,14 +566,9 @@ static const struct frac_entry frac_table_pixel[] = {
>   static int clk_pixel_determine_rate(struct clk_hw *hw,
>   				    struct clk_rate_request *req)
>   {
> -	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>   	unsigned long request, src_rate;
>   	int delta = 100000;
> -	const struct freq_tbl *f = rcg->freq_tbl;
>   	const struct frac_entry *frac = frac_table_pixel;
> -	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
> -
> -	req->best_parent_hw = clk_hw_get_parent_by_index(hw, index);
>
>   	for (; frac->num; frac++) {
>   		request = (req->rate * frac->den) / frac->num;
> @@ -525,12 +590,23 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
>   		unsigned long parent_rate)
>   {
>   	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> -	struct freq_tbl f = *rcg->freq_tbl;
> +	struct freq_tbl f = { 0 };
>   	const struct frac_entry *frac = frac_table_pixel;
>   	unsigned long request;
>   	int delta = 100000;
>   	u32 mask = BIT(rcg->hid_width) - 1;
> -	u32 hid_div;
> +	u32 hid_div, cfg;
> +	int i, num_parents = clk_hw_get_num_parents(hw);
> +
> +	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> +	cfg &= CFG_SRC_SEL_MASK;
> +	cfg >>= CFG_SRC_SEL_SHIFT;
> +
> +	for (i = 0; i < num_parents; i++)
> +		if (cfg == rcg->parent_map[i].cfg) {
> +			f.src = rcg->parent_map[i].src;
> +			break;
> +		}
>
>   	for (; frac->num; frac++) {
>   		request = (rate * frac->den) / frac->num;
> @@ -555,7 +631,6 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
>   static int clk_pixel_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
>   		unsigned long parent_rate, u8 index)
>   {
> -	/* Parent index is set statically in frequency table */
>   	return clk_pixel_set_rate(hw, rate, parent_rate);
>   }
>
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 22a4e1e732c0..3de282365d8d 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -906,21 +906,15 @@ static struct clk_rcg2 gp3_clk_src = {
>   	},
>   };
>
> -static struct freq_tbl ftbl_gcc_mdss_byte0_clk[] = {
> -	{ .src = P_DSI0_PHYPLL_BYTE },
> -	{ }
> -};
> -
>   static struct clk_rcg2 byte0_clk_src = {
>   	.cmd_rcgr = 0x4d044,
>   	.hid_width = 5,
>   	.parent_map = gcc_xo_gpll0a_dsibyte_map,
> -	.freq_tbl = ftbl_gcc_mdss_byte0_clk,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "byte0_clk_src",
>   		.parent_names = gcc_xo_gpll0a_dsibyte,
>   		.num_parents = 3,
> -		.ops = &clk_byte_ops,
> +		.ops = &clk_byte2_ops,
>   		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
> @@ -968,17 +962,11 @@ static struct clk_rcg2 mdp_clk_src = {
>   	},
>   };
>
> -static struct freq_tbl ftbl_gcc_mdss_pclk[] = {
> -	{ .src = P_DSI0_PHYPLL_DSI },
> -	{ }
> -};
> -
>   static struct clk_rcg2 pclk0_clk_src = {
>   	.cmd_rcgr = 0x4d000,
>   	.mnd_width = 8,
>   	.hid_width = 5,
>   	.parent_map = gcc_xo_gpll0a_dsiphy_map,
> -	.freq_tbl = ftbl_gcc_mdss_pclk,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pclk0_clk_src",
>   		.parent_names = gcc_xo_gpll0a_dsiphy,
> diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
> index f0ee6bde11af..5d2aab7663f0 100644
> --- a/drivers/clk/qcom/mmcc-apq8084.c
> +++ b/drivers/clk/qcom/mmcc-apq8084.c
> @@ -571,17 +571,11 @@ static struct clk_rcg2 jpeg2_clk_src = {
>   	},
>   };
>
> -static struct freq_tbl pixel_freq_tbl[] = {
> -	{ .src = P_DSI0PLL },
> -	{ }
> -};
> -
>   static struct clk_rcg2 pclk0_clk_src = {
>   	.cmd_rcgr = 0x2000,
>   	.mnd_width = 8,
>   	.hid_width = 5,
>   	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
> -	.freq_tbl = pixel_freq_tbl,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pclk0_clk_src",
>   		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> @@ -596,7 +590,6 @@ static struct clk_rcg2 pclk1_clk_src = {
>   	.mnd_width = 8,
>   	.hid_width = 5,
>   	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
> -	.freq_tbl = pixel_freq_tbl,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pclk1_clk_src",
>   		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> @@ -844,21 +837,15 @@ static struct clk_rcg2 cpp_clk_src = {
>   	},
>   };
>
> -static struct freq_tbl byte_freq_tbl[] = {
> -	{ .src = P_DSI0PLL_BYTE },
> -	{ }
> -};
> -
>   static struct clk_rcg2 byte0_clk_src = {
>   	.cmd_rcgr = 0x2120,
>   	.hid_width = 5,
>   	.parent_map = mmcc_xo_dsibyte_hdmi_edp_gpll0_map,
> -	.freq_tbl = byte_freq_tbl,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "byte0_clk_src",
>   		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
>   		.num_parents = 6,
> -		.ops = &clk_byte_ops,
> +		.ops = &clk_byte2_ops,
>   		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
> @@ -867,12 +854,11 @@ static struct clk_rcg2 byte1_clk_src = {
>   	.cmd_rcgr = 0x2140,
>   	.hid_width = 5,
>   	.parent_map = mmcc_xo_dsibyte_hdmi_edp_gpll0_map,
> -	.freq_tbl = byte_freq_tbl,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "byte1_clk_src",
>   		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
>   		.num_parents = 6,
> -		.ops = &clk_byte_ops,
> +		.ops = &clk_byte2_ops,
>   		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index 0987bf443e1f..197700e3b2c9 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -522,17 +522,11 @@ static struct clk_rcg2 jpeg2_clk_src = {
>   	},
>   };
>
> -static struct freq_tbl pixel_freq_tbl[] = {
> -	{ .src = P_DSI0PLL },
> -	{ }
> -};
> -
>   static struct clk_rcg2 pclk0_clk_src = {
>   	.cmd_rcgr = 0x2000,
>   	.mnd_width = 8,
>   	.hid_width = 5,
>   	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
> -	.freq_tbl = pixel_freq_tbl,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pclk0_clk_src",
>   		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> @@ -547,7 +541,6 @@ static struct clk_rcg2 pclk1_clk_src = {
>   	.mnd_width = 8,
>   	.hid_width = 5,
>   	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
> -	.freq_tbl = pixel_freq_tbl,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pclk1_clk_src",
>   		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> @@ -785,7 +778,7 @@ static struct clk_rcg2 byte0_clk_src = {
>   		.name = "byte0_clk_src",
>   		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
>   		.num_parents = 6,
> -		.ops = &clk_byte_ops,
> +		.ops = &clk_byte2_ops,
>   		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
> @@ -799,7 +792,7 @@ static struct clk_rcg2 byte1_clk_src = {
>   		.name = "byte1_clk_src",
>   		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
>   		.num_parents = 6,
> -		.ops = &clk_byte_ops,
> +		.ops = &clk_byte2_ops,
>   		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
