Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v4 0/2] clk: qcom: Add support for RCG to register for DFS
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
 <153455835372.28926.7641705907931269497@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <693d9cf4-4a6f-feb5-0c3f-ded842bbdf0a@codeaurora.org>
Date: Sat, 18 Aug 2018 23:31:02 +0530
MIME-Version: 1.0
In-Reply-To: <153455835372.28926.7641705907931269497@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

I will test these changes and get back.

On 8/18/2018 7:42 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-08-10 18:53:54)
>>   [v4]
>>    * Add recalc_clk_ops to calculate the clock frequency reading the current
>>      perf state, also add CLK_GET_RATE_NOCACHE flag.
>>    * Cleanup 'goto' during mode check in 'clk_rcg2_calculate_freq'.
>>    * cleanup return from function 'com_cc_register_rcg_dfs'.
> 
> I want to squash this in. I have only compile tested it. Let me know
> what you think.
> 
> ----8<---
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index e6300e05d5df..e5eca8a1abe4 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -163,6 +163,15 @@ extern const struct clk_ops clk_pixel_ops;
>   extern const struct clk_ops clk_gfx3d_ops;
>   extern const struct clk_ops clk_rcg2_shared_ops;
>   
> +struct clk_rcg_dfs_data {
> +	struct clk_rcg2 *rcg;
> +	struct clk_init_data *init;
> +};
> +
> +#define DEFINE_RCG_DFS(r) \
> +	{ .rcg = &r##_src, .init = &r##_init }
> +
>   extern int qcom_cc_register_rcg_dfs(struct regmap *regmap,
> -			     struct clk_rcg2 **rcgs, int num_clks);
> +				    const struct clk_rcg_dfs_data *rcgs,
> +				    size_t len);
>   #endif
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 55a5b58cbb15..bbe2a1916296 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1051,48 +1051,24 @@ static unsigned long
>   clk_rcg2_dfs_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>   {
>   	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> -	u32 cfg, hid_div, m = 0, n = 0, mode = 0, mask, level;
> -	int num_parents, i;
> -	unsigned long prate;
> -
> -	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
> -				SE_CMD_DFSR_OFFSET, &cfg);
> -	level = (GENMASK(4, 1) & cfg) >> 1;
> -
> -	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
> -				SE_PERF_DFSR(level), &cfg);
> -	if (rcg->mnd_width) {
> -		mask = BIT(rcg->mnd_width) - 1;
> -		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
> -				SE_PERF_M_DFSR(level), &m);
> -		m &= mask;
> -		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
> -				SE_PERF_N_DFSR(level), &n);
> -		n =  ~n;
> -		n &= mask;
> -		n += m;
> -		mode = cfg & CFG_MODE_MASK;
> -		mode >>= CFG_MODE_SHIFT;
> -	}
> +	int ret;
> +	u32 level;
>   
> -	mask = BIT(rcg->hid_width) - 1;
> -	hid_div = cfg >> CFG_SRC_DIV_SHIFT;
> -	hid_div &= mask;
> -	cfg &= CFG_SRC_SEL_MASK;
> -	cfg >>= CFG_SRC_SEL_SHIFT;
> +	regmap_read(rcg->clkr.regmap,
> +		    rcg->cmd_rcgr + SE_CMD_DFSR_OFFSET, &level);
> +	level &= GENMASK(4, 1);
> +	level >>= 1;
>   
> -	num_parents = clk_hw_get_num_parents(hw);
> -	for (i = 0; i < num_parents; i++) {
> -		if (cfg == rcg->parent_map[i].cfg) {
> -			prate = clk_hw_get_rate(
> -				clk_hw_get_parent_by_index(&rcg->clkr.hw, i));
> -			if (parent_rate != prate)
> -				parent_rate = prate;
> +	if (!rcg->freq_tbl) {
> +		ret = clk_rcg2_dfs_populate_freq_table(rcg);
> +		if (ret) {
> +			pr_err("Failed to update DFS tables for %s\n",
> +					clk_hw_get_name(hw));
> +			return ret;
>   		}
>   	}
>   
> -
> -	return calc_rate(parent_rate, m, n, mode, hid_div);
> +	return rcg->freq_tbl[level].freq;
>   }
>   
>   static const struct clk_ops clk_rcg2_dfs_ops = {
> @@ -1102,9 +1078,11 @@ static const struct clk_ops clk_rcg2_dfs_ops = {
>   	.recalc_rate = clk_rcg2_dfs_recalc_rate,
>   };
>   
> -static int clk_rcg2_enable_dfs(struct clk_rcg2 *rcg, struct regmap *regmap)
> +static int clk_rcg2_enable_dfs(const struct clk_rcg_dfs_data *data,
> +			       struct regmap *regmap)
>   {
> -	struct clk_init_data *init;
> +	struct clk_rcg2 *rcg = data->rcg;
> +	struct clk_init_data *init = data->init;
>   	u32 val;
>   	int ret;
>   
> @@ -1116,18 +1094,13 @@ static int clk_rcg2_enable_dfs(struct clk_rcg2 *rcg, struct regmap *regmap)
>   	if (!(val & SE_CMD_DFS_EN))
>   		return 0;
>   
> -	init = kzalloc(sizeof(*init), GFP_KERNEL);
> -	if (!init)
> -		return -ENOMEM;
> -
> -	init->name = rcg->clkr.hw.init->name;
> -	init->flags = rcg->clkr.hw.init->flags;
> -	init->parent_names = rcg->clkr.hw.init->parent_names;
> -	init->num_parents = rcg->clkr.hw.init->num_parents;
> -	init->flags = CLK_GET_RATE_NOCACHE;
> +	/*
> +	 * Rate changes with consumer writing a register in
> +	 * their own I/O region
> +	 */
> +	init->flags |= CLK_GET_RATE_NOCACHE;
>   	init->ops = &clk_rcg2_dfs_ops;
>   
> -	rcg->clkr.hw.init = init;
>   	rcg->freq_tbl = NULL;
>   
>   	pr_debug("DFS registered for clk %s\n", init->name);
> @@ -1136,14 +1109,14 @@ static int clk_rcg2_enable_dfs(struct clk_rcg2 *rcg, struct regmap *regmap)
>   }
>   
>   int qcom_cc_register_rcg_dfs(struct regmap *regmap,
> -			    struct clk_rcg2 **rcgs, int num_clks)
> +			     const struct clk_rcg_dfs_data *rcgs, size_t len)
>   {
>   	int i, ret;
>   
> -	for (i = 0; i < num_clks; i++) {
> -		ret = clk_rcg2_enable_dfs(rcgs[i], regmap);
> +	for (i = 0; i < len; i++) {
> +		ret = clk_rcg2_enable_dfs(&rcgs[i], regmap);
>   		if (ret) {
> -			const char *name = rcgs[i]->clkr.hw.init->name;
> +			const char *name = rcgs[i].init->name;
>   
>   			pr_err("DFS register failed for clk %s\n", name);
>   			return ret;
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index fef6732bd7d8..42ab01d33b52 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -396,18 +396,27 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
>   	{ }
>   };
>   
> +static struct clk_init_data gcc_qupv3_wrap0_s0_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s0_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
> +};
> +
>   static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
>   	.cmd_rcgr = 0x17034,
>   	.mnd_width = 16,
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s0_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s1_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s1_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
> @@ -416,12 +425,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s1_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s2_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s2_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
> @@ -430,12 +441,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s2_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s3_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s3_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
> @@ -444,12 +457,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s3_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s4_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s4_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
> @@ -458,12 +473,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s4_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s5_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s5_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
> @@ -472,12 +489,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s5_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s6_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s6_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
> @@ -486,12 +505,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s6_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap0_s7_clk_init = {
> +	.name = "gcc_qupv3_wrap0_s7_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
> @@ -500,12 +521,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap0_s7_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s0_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s0_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
> @@ -514,12 +537,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s0_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s1_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s1_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
> @@ -528,12 +553,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s1_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s2_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s2_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
> @@ -542,12 +569,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s2_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s3_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s3_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
> @@ -556,12 +585,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s3_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s4_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s4_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
> @@ -570,12 +601,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s4_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s5_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s5_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
> @@ -584,12 +617,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s5_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s6_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s6_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
> @@ -598,12 +633,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s6_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_init,
> +};
> +
> +static struct clk_init_data gcc_qupv3_wrap1_s7_clk_init = {
> +	.name = "gcc_qupv3_wrap1_s7_clk_src",
> +	.parent_names = gcc_parent_names_0,
> +	.num_parents = 4,
> +	.ops = &clk_rcg2_shared_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
> @@ -612,12 +649,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
>   	.hid_width = 5,
>   	.parent_map = gcc_parent_map_0,
>   	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gcc_qupv3_wrap1_s7_clk_src",
> -		.parent_names = gcc_parent_names_0,
> -		.num_parents = 4,
> -		.ops = &clk_rcg2_shared_ops,
> -	},
> +	.clkr.hw.init = &gcc_qupv3_wrap1_s7_clk_init,
>   };
>   
>   static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
> @@ -3458,23 +3490,23 @@ static const struct of_device_id gcc_sdm845_match_table[] = {
>   };
>   MODULE_DEVICE_TABLE(of, gcc_sdm845_match_table);
>   
> -static struct clk_rcg2 *gcc_dfs_clocks[] = {
> -	&gcc_qupv3_wrap0_s0_clk_src,
> -	&gcc_qupv3_wrap0_s1_clk_src,
> -	&gcc_qupv3_wrap0_s2_clk_src,
> -	&gcc_qupv3_wrap0_s3_clk_src,
> -	&gcc_qupv3_wrap0_s4_clk_src,
> -	&gcc_qupv3_wrap0_s5_clk_src,
> -	&gcc_qupv3_wrap0_s6_clk_src,
> -	&gcc_qupv3_wrap0_s7_clk_src,
> -	&gcc_qupv3_wrap1_s0_clk_src,
> -	&gcc_qupv3_wrap1_s1_clk_src,
> -	&gcc_qupv3_wrap1_s2_clk_src,
> -	&gcc_qupv3_wrap1_s3_clk_src,
> -	&gcc_qupv3_wrap1_s4_clk_src,
> -	&gcc_qupv3_wrap1_s5_clk_src,
> -	&gcc_qupv3_wrap1_s6_clk_src,
> -	&gcc_qupv3_wrap1_s7_clk_src,
> +static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk),
> +	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk),
>   };
>   
>   static int gcc_sdm845_probe(struct platform_device *pdev)
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
