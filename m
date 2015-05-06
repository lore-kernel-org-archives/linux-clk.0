Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 12/19] clk: st: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:49 -0700
Message-Id: <1430897996-11597-13-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/st/clkgen-mux.c:134:4: warning: symbol 'clkgena_divmux_get_parent' was not declared. Should it be static?
drivers/clk/st/clkgen-mux.c:171:15: warning: symbol 'clkgena_divmux_recalc_rate' was not declared. Should it be static?
drivers/clk/st/clkgen-mux.c:218:12: warning: symbol 'clk_register_genamux' was not declared. Should it be static?
drivers/clk/st/clkgen-mux.c:388:13: warning: symbol 'st_of_clkgena_divmux_setup' was not declared. Should it be static?
drivers/clk/st/clkgen-mux.c:488:13: warning: symbol 'st_of_clkgena_prediv_setup' was not declared. Should it be static?
drivers/clk/st/clkgen-mux.c:625:13: warning: symbol 'st_of_clkgen_mux_setup' was not declared. Should it be static?
drivers/clk/st/clkgen-mux.c:702:13: warning: symbol 'st_of_clkgen_vcc_setup' was not declared. Should it be static?
drivers/clk/st/clkgen-pll.c:273:15: warning: symbol 'recalc_stm_pll800c65' was not declared. Should it be static?
drivers/clk/st/clkgen-pll.c:300:15: warning: symbol 'recalc_stm_pll1600c65' was not declared. Should it be static?
drivers/clk/st/clkgen-pll.c:324:15: warning: symbol 'recalc_stm_pll3200c32' was not declared. Should it be static?
drivers/clk/st/clkgen-pll.c:346:15: warning: symbol 'recalc_stm_pll1200c32' was not declared. Should it be static?
drivers/clk/st/clkgen-pll.c:565:19: warning: incorrect type in assignment (different address spaces)
drivers/clk/st/clkgen-pll.c:565:19:    expected void [noderef] <asn:2>*reg
drivers/clk/st/clkgen-pll.c:565:19:    got void *
drivers/clk/st/clkgen-pll.c:576:18: warning: incorrect type in assignment (different address spaces)
drivers/clk/st/clkgen-pll.c:576:18:    expected void [noderef] <asn:2>*reg
drivers/clk/st/clkgen-pll.c:576:18:    got void *
drivers/clk/st/clkgen-pll.c:693:53: warning: incorrect type in argument 2 (different address spaces)
drivers/clk/st/clkgen-pll.c:693:53:    expected void *[noderef] <asn:2>reg
drivers/clk/st/clkgen-pll.c:693:53:    got void [noderef] <asn:2>*[assigned] pll_base
drivers/clk/st/clkgen-fsyn.c:495:5: warning: symbol 'clk_fs660c32_vco_get_rate' was not declared. Should it be static?
drivers/clk/st/clkgen-fsyn.c:522:5: warning: symbol 'clk_fs660c32_vco_get_params' was not declared. Should it be static?
drivers/clk/st/clk-flexgen.c:119:15: warning: symbol 'flexgen_recalc_rate' was not declared. Should it be static?
drivers/clk/st/clk-flexgen.c:177:12: warning: symbol 'clk_register_flexgen' was not declared. Should it be static?
drivers/clk/st/clk-flexgen.c:263:13: warning: symbol 'st_of_flexgen_setup' was not declared. Should it be static?

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/st/clk-flexgen.c |  6 +++---
 drivers/clk/st/clkgen-fsyn.c |  4 ++--
 drivers/clk/st/clkgen-mux.c  | 14 +++++++-------
 drivers/clk/st/clkgen-pll.c  | 10 +++++-----
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index bf12a25eb3a2..409ed4b0b569 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -116,7 +116,7 @@ static long flexgen_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *prate / div;
 }
 
-unsigned long flexgen_recalc_rate(struct clk_hw *hw,
+static unsigned long flexgen_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct flexgen *flexgen = to_flexgen(hw);
@@ -174,7 +174,7 @@ static const struct clk_ops flexgen_ops = {
 	.set_rate = flexgen_set_rate,
 };
 
-struct clk *clk_register_flexgen(const char *name,
+static struct clk *clk_register_flexgen(const char *name,
 				const char **parent_names, u8 num_parents,
 				void __iomem *reg, spinlock_t *lock, u32 idx,
 				unsigned long flexgen_flags) {
@@ -260,7 +260,7 @@ static const char ** __init flexgen_get_parents(struct device_node *np,
 	return parents;
 }
 
-void __init st_of_flexgen_setup(struct device_node *np)
+static void __init st_of_flexgen_setup(struct device_node *np)
 {
 	struct device_node *pnode;
 	void __iomem *reg;
diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index a917c4c7eaa9..e94197f04b0b 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -492,7 +492,7 @@ static int quadfs_pll_is_enabled(struct clk_hw *hw)
 	return !!npda;
 }
 
-int clk_fs660c32_vco_get_rate(unsigned long input, struct stm_fs *fs,
+static int clk_fs660c32_vco_get_rate(unsigned long input, struct stm_fs *fs,
 			   unsigned long *rate)
 {
 	unsigned long nd = fs->ndiv + 16; /* ndiv value */
@@ -519,7 +519,7 @@ static unsigned long quadfs_pll_fs660c32_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-int clk_fs660c32_vco_get_params(unsigned long input,
+static int clk_fs660c32_vco_get_params(unsigned long input,
 				unsigned long output, struct stm_fs *fs)
 {
 /* Formula
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index fdcff10f6d30..80aa77dbf660 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -131,7 +131,7 @@ static int clkgena_divmux_is_enabled(struct clk_hw *hw)
 	return (s8)clk_mux_ops.get_parent(mux_hw) > 0;
 }
 
-u8 clkgena_divmux_get_parent(struct clk_hw *hw)
+static u8 clkgena_divmux_get_parent(struct clk_hw *hw)
 {
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
 	struct clk_hw *mux_hw = &genamux->mux.hw;
@@ -168,7 +168,7 @@ static int clkgena_divmux_set_parent(struct clk_hw *hw, u8 index)
 	return 0;
 }
 
-unsigned long clkgena_divmux_recalc_rate(struct clk_hw *hw,
+static unsigned long clkgena_divmux_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct clkgena_divmux *genamux = to_clkgena_divmux(hw);
@@ -215,7 +215,7 @@ static const struct clk_ops clkgena_divmux_ops = {
 /**
  * clk_register_genamux - register a genamux clock with the clock framework
  */
-struct clk *clk_register_genamux(const char *name,
+static struct clk *clk_register_genamux(const char *name,
 				const char **parent_names, u8 num_parents,
 				void __iomem *reg,
 				const struct clkgena_divmux_data *muxdata,
@@ -385,7 +385,7 @@ static void __iomem * __init clkgen_get_register_base(
 	return reg;
 }
 
-void __init st_of_clkgena_divmux_setup(struct device_node *np)
+static void __init st_of_clkgena_divmux_setup(struct device_node *np)
 {
 	const struct of_device_id *match;
 	const struct clkgena_divmux_data *data;
@@ -485,7 +485,7 @@ static const struct of_device_id clkgena_prediv_of_match[] = {
 	{}
 };
 
-void __init st_of_clkgena_prediv_setup(struct device_node *np)
+static void __init st_of_clkgena_prediv_setup(struct device_node *np)
 {
 	const struct of_device_id *match;
 	void __iomem *reg;
@@ -622,7 +622,7 @@ static const struct of_device_id mux_of_match[] = {
 	{}
 };
 
-void __init st_of_clkgen_mux_setup(struct device_node *np)
+static void __init st_of_clkgen_mux_setup(struct device_node *np)
 {
 	const struct of_device_id *match;
 	struct clk *clk;
@@ -699,7 +699,7 @@ static const struct of_device_id vcc_of_match[] = {
 	{}
 };
 
-void __init st_of_clkgen_vcc_setup(struct device_node *np)
+static void __init st_of_clkgen_vcc_setup(struct device_node *np)
 {
 	const struct of_device_id *match;
 	void __iomem *reg;
diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index d204ba85db3a..106532207213 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -270,7 +270,7 @@ static int clkgen_pll_is_enabled(struct clk_hw *hw)
 	return !poweroff;
 }
 
-unsigned long recalc_stm_pll800c65(struct clk_hw *hw,
+static unsigned long recalc_stm_pll800c65(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct clkgen_pll *pll = to_clkgen_pll(hw);
@@ -297,7 +297,7 @@ unsigned long recalc_stm_pll800c65(struct clk_hw *hw,
 
 }
 
-unsigned long recalc_stm_pll1600c65(struct clk_hw *hw,
+static unsigned long recalc_stm_pll1600c65(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct clkgen_pll *pll = to_clkgen_pll(hw);
@@ -321,7 +321,7 @@ unsigned long recalc_stm_pll1600c65(struct clk_hw *hw,
 	return rate;
 }
 
-unsigned long recalc_stm_pll3200c32(struct clk_hw *hw,
+static unsigned long recalc_stm_pll3200c32(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct clkgen_pll *pll = to_clkgen_pll(hw);
@@ -343,7 +343,7 @@ unsigned long recalc_stm_pll3200c32(struct clk_hw *hw,
 	return rate;
 }
 
-unsigned long recalc_stm_pll1200c32(struct clk_hw *hw,
+static unsigned long recalc_stm_pll1200c32(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct clkgen_pll *pll = to_clkgen_pll(hw);
@@ -544,7 +544,7 @@ CLK_OF_DECLARE(clkgena_c65_plls,
 	       "st,clkgena-plls-c65", clkgena_c65_pll_setup);
 
 static struct clk * __init clkgen_odf_register(const char *parent_name,
-					       void * __iomem reg,
+					       void __iomem *reg,
 					       struct clkgen_pll_data *pll_data,
 					       int odf,
 					       spinlock_t *odf_lock,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

