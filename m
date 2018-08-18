Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
Message-ID: <153455835372.28926.7641705907931269497@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 0/2] clk: qcom: Add support for RCG to register for DFS
Date: Fri, 17 Aug 2018 19:12:33 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-08-10 18:53:54)
>  [v4]
>   * Add recalc_clk_ops to calculate the clock frequency reading the curre=
nt
>     perf state, also add CLK_GET_RATE_NOCACHE flag.
>   * Cleanup 'goto' during mode check in 'clk_rcg2_calculate_freq'.
>   * cleanup return from function 'com_cc_register_rcg_dfs'.

I want to squash this in. I have only compile tested it. Let me know
what you think.

----8<---
diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e6300e05d5df..e5eca8a1abe4 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -163,6 +163,15 @@ extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
 =

+struct clk_rcg_dfs_data {
+	struct clk_rcg2 *rcg;
+	struct clk_init_data *init;
+};
+
+#define DEFINE_RCG_DFS(r) \
+	{ .rcg =3D &r##_src, .init =3D &r##_init }
+
 extern int qcom_cc_register_rcg_dfs(struct regmap *regmap,
-			     struct clk_rcg2 **rcgs, int num_clks);
+				    const struct clk_rcg_dfs_data *rcgs,
+				    size_t len);
 #endif
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 55a5b58cbb15..bbe2a1916296 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1051,48 +1051,24 @@ static unsigned long
 clk_rcg2_dfs_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
-	u32 cfg, hid_div, m =3D 0, n =3D 0, mode =3D 0, mask, level;
-	int num_parents, i;
-	unsigned long prate;
-
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
-				SE_CMD_DFSR_OFFSET, &cfg);
-	level =3D (GENMASK(4, 1) & cfg) >> 1;
-
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
-				SE_PERF_DFSR(level), &cfg);
-	if (rcg->mnd_width) {
-		mask =3D BIT(rcg->mnd_width) - 1;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
-				SE_PERF_M_DFSR(level), &m);
-		m &=3D mask;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
-				SE_PERF_N_DFSR(level), &n);
-		n =3D  ~n;
-		n &=3D mask;
-		n +=3D m;
-		mode =3D cfg & CFG_MODE_MASK;
-		mode >>=3D CFG_MODE_SHIFT;
-	}
+	int ret;
+	u32 level;
 =

-	mask =3D BIT(rcg->hid_width) - 1;
-	hid_div =3D cfg >> CFG_SRC_DIV_SHIFT;
-	hid_div &=3D mask;
-	cfg &=3D CFG_SRC_SEL_MASK;
-	cfg >>=3D CFG_SRC_SEL_SHIFT;
+	regmap_read(rcg->clkr.regmap,
+		    rcg->cmd_rcgr + SE_CMD_DFSR_OFFSET, &level);
+	level &=3D GENMASK(4, 1);
+	level >>=3D 1;
 =

-	num_parents =3D clk_hw_get_num_parents(hw);
-	for (i =3D 0; i < num_parents; i++) {
-		if (cfg =3D=3D rcg->parent_map[i].cfg) {
-			prate =3D clk_hw_get_rate(
-				clk_hw_get_parent_by_index(&rcg->clkr.hw, i));
-			if (parent_rate !=3D prate)
-				parent_rate =3D prate;
+	if (!rcg->freq_tbl) {
+		ret =3D clk_rcg2_dfs_populate_freq_table(rcg);
+		if (ret) {
+			pr_err("Failed to update DFS tables for %s\n",
+					clk_hw_get_name(hw));
+			return ret;
 		}
 	}
 =

-
-	return calc_rate(parent_rate, m, n, mode, hid_div);
+	return rcg->freq_tbl[level].freq;
 }
 =

 static const struct clk_ops clk_rcg2_dfs_ops =3D {
@@ -1102,9 +1078,11 @@ static const struct clk_ops clk_rcg2_dfs_ops =3D {
 	.recalc_rate =3D clk_rcg2_dfs_recalc_rate,
 };
 =

-static int clk_rcg2_enable_dfs(struct clk_rcg2 *rcg, struct regmap *regmap)
+static int clk_rcg2_enable_dfs(const struct clk_rcg_dfs_data *data,
+			       struct regmap *regmap)
 {
-	struct clk_init_data *init;
+	struct clk_rcg2 *rcg =3D data->rcg;
+	struct clk_init_data *init =3D data->init;
 	u32 val;
 	int ret;
 =

@@ -1116,18 +1094,13 @@ static int clk_rcg2_enable_dfs(struct clk_rcg2 *rcg=
, struct regmap *regmap)
 	if (!(val & SE_CMD_DFS_EN))
 		return 0;
 =

-	init =3D kzalloc(sizeof(*init), GFP_KERNEL);
-	if (!init)
-		return -ENOMEM;
-
-	init->name =3D rcg->clkr.hw.init->name;
-	init->flags =3D rcg->clkr.hw.init->flags;
-	init->parent_names =3D rcg->clkr.hw.init->parent_names;
-	init->num_parents =3D rcg->clkr.hw.init->num_parents;
-	init->flags =3D CLK_GET_RATE_NOCACHE;
+	/*
+	 * Rate changes with consumer writing a register in
+	 * their own I/O region
+	 */
+	init->flags |=3D CLK_GET_RATE_NOCACHE;
 	init->ops =3D &clk_rcg2_dfs_ops;
 =

-	rcg->clkr.hw.init =3D init;
 	rcg->freq_tbl =3D NULL;
 =

 	pr_debug("DFS registered for clk %s\n", init->name);
@@ -1136,14 +1109,14 @@ static int clk_rcg2_enable_dfs(struct clk_rcg2 *rcg=
, struct regmap *regmap)
 }
 =

 int qcom_cc_register_rcg_dfs(struct regmap *regmap,
-			    struct clk_rcg2 **rcgs, int num_clks)
+			     const struct clk_rcg_dfs_data *rcgs, size_t len)
 {
 	int i, ret;
 =

-	for (i =3D 0; i < num_clks; i++) {
-		ret =3D clk_rcg2_enable_dfs(rcgs[i], regmap);
+	for (i =3D 0; i < len; i++) {
+		ret =3D clk_rcg2_enable_dfs(&rcgs[i], regmap);
 		if (ret) {
-			const char *name =3D rcgs[i]->clkr.hw.init->name;
+			const char *name =3D rcgs[i].init->name;
 =

 			pr_err("DFS register failed for clk %s\n", name);
 			return ret;
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index fef6732bd7d8..42ab01d33b52 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -396,18 +396,27 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_=
clk_src[] =3D {
 	{ }
 };
 =

+static struct clk_init_data gcc_qupv3_wrap0_s0_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s0_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
+};
+
 static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src =3D {
 	.cmd_rcgr =3D 0x17034,
 	.mnd_width =3D 16,
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s0_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s0_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s1_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s1_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src =3D {
@@ -416,12 +425,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s1_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s1_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s2_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s2_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src =3D {
@@ -430,12 +441,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s2_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s2_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s3_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s3_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src =3D {
@@ -444,12 +457,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s3_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s3_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s4_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s4_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src =3D {
@@ -458,12 +473,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s4_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s4_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s5_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s5_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src =3D {
@@ -472,12 +489,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s5_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s5_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s6_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s6_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src =3D {
@@ -486,12 +505,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s6_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s6_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap0_s7_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap0_s7_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src =3D {
@@ -500,12 +521,14 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap0_s7_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap0_s7_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s0_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s0_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src =3D {
@@ -514,12 +537,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s0_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s0_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s1_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s1_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src =3D {
@@ -528,12 +553,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s1_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s1_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s2_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s2_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src =3D {
@@ -542,12 +569,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s2_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s2_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s3_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s3_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src =3D {
@@ -556,12 +585,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s3_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s3_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s4_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s4_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src =3D {
@@ -570,12 +601,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s4_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s4_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s5_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s5_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src =3D {
@@ -584,12 +617,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s5_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s5_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s6_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s6_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src =3D {
@@ -598,12 +633,14 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src =3D=
 {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s6_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s6_clk_init,
+};
+
+static struct clk_init_data gcc_qupv3_wrap1_s7_clk_init =3D {
+	.name =3D "gcc_qupv3_wrap1_s7_clk_src",
+	.parent_names =3D gcc_parent_names_0,
+	.num_parents =3D 4,
+	.ops =3D &clk_rcg2_shared_ops,
 };
 =

 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src =3D {
@@ -612,12 +649,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src =3D {
 	.hid_width =3D 5,
 	.parent_map =3D gcc_parent_map_0,
 	.freq_tbl =3D ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init =3D &(struct clk_init_data){
-		.name =3D "gcc_qupv3_wrap1_s7_clk_src",
-		.parent_names =3D gcc_parent_names_0,
-		.num_parents =3D 4,
-		.ops =3D &clk_rcg2_shared_ops,
-	},
+	.clkr.hw.init =3D &gcc_qupv3_wrap1_s7_clk_init,
 };
 =

 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] =3D {
@@ -3458,23 +3490,23 @@ static const struct of_device_id gcc_sdm845_match_t=
able[] =3D {
 };
 MODULE_DEVICE_TABLE(of, gcc_sdm845_match_table);
 =

-static struct clk_rcg2 *gcc_dfs_clocks[] =3D {
-	&gcc_qupv3_wrap0_s0_clk_src,
-	&gcc_qupv3_wrap0_s1_clk_src,
-	&gcc_qupv3_wrap0_s2_clk_src,
-	&gcc_qupv3_wrap0_s3_clk_src,
-	&gcc_qupv3_wrap0_s4_clk_src,
-	&gcc_qupv3_wrap0_s5_clk_src,
-	&gcc_qupv3_wrap0_s6_clk_src,
-	&gcc_qupv3_wrap0_s7_clk_src,
-	&gcc_qupv3_wrap1_s0_clk_src,
-	&gcc_qupv3_wrap1_s1_clk_src,
-	&gcc_qupv3_wrap1_s2_clk_src,
-	&gcc_qupv3_wrap1_s3_clk_src,
-	&gcc_qupv3_wrap1_s4_clk_src,
-	&gcc_qupv3_wrap1_s5_clk_src,
-	&gcc_qupv3_wrap1_s6_clk_src,
-	&gcc_qupv3_wrap1_s7_clk_src,
+static const struct clk_rcg_dfs_data gcc_dfs_clocks[] =3D {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk),
 };
 =

 static int gcc_sdm845_probe(struct platform_device *pdev)
