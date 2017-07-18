Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37586 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751392AbdGRQoL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Jul 2017 12:44:11 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/2] clk: renesas: rcar-gen3-cpg.c: refactor checks for accessing the div table
Date: Tue, 18 Jul 2017 18:44:07 +0200
Message-Id: <20170718164407.22998-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
References: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Do the checks for accessing the SD divider table only when the rate gets
updated, namely on init and set_rate. In all other cases, reuse the last
value. This simplifies code, runtime load, and error reporting.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 46 ++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 71b8a986bd4889..d4d27cf6110d38 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -60,6 +60,7 @@ struct sd_clock {
 	unsigned int div_num;
 	unsigned int div_min;
 	unsigned int div_max;
+	unsigned int cur_div_idx;
 };
 
 /* SDn divider
@@ -96,21 +97,10 @@ static const struct sd_div_table cpg_sd_div_table[] = {
 static int cpg_sd_clock_enable(struct clk_hw *hw)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
-	u32 val, sd_fc;
-	unsigned int i;
-
-	val = readl(clock->reg);
-
-	sd_fc = val & CPG_SD_FC_MASK;
-	for (i = 0; i < clock->div_num; i++)
-		if (sd_fc == (clock->div_table[i].val & CPG_SD_FC_MASK))
-			break;
-
-	if (i >= clock->div_num)
-		return -EINVAL;
+	u32 val = readl(clock->reg);
 
 	val &= ~(CPG_SD_STP_MASK);
-	val |= clock->div_table[i].val & CPG_SD_STP_MASK;
+	val |= clock->div_table[clock->cur_div_idx].val & CPG_SD_STP_MASK;
 
 	writel(val, clock->reg);
 
@@ -135,20 +125,9 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
-	u32 val, sd_fc;
-	unsigned int i;
-
-	val = readl(clock->reg);
-
-	sd_fc = val & CPG_SD_FC_MASK;
-	for (i = 0; i < clock->div_num; i++)
-		if (sd_fc == (clock->div_table[i].val & CPG_SD_FC_MASK))
-			break;
-
-	if (i >= clock->div_num)
-		return -EINVAL;
 
-	return DIV_ROUND_CLOSEST(parent_rate, clock->div_table[i].div);
+	return DIV_ROUND_CLOSEST(parent_rate,
+				 clock->div_table[clock->cur_div_idx].div);
 }
 
 static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
@@ -189,6 +168,8 @@ static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (i >= clock->div_num)
 		return -EINVAL;
 
+	clock->cur_div_idx = i;
+
 	val = readl(clock->reg);
 	val &= ~(CPG_SD_STP_MASK | CPG_SD_FC_MASK);
 	val |= clock->div_table[i].val & (CPG_SD_STP_MASK | CPG_SD_FC_MASK);
@@ -214,6 +195,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	struct sd_clock *clock;
 	struct clk *clk;
 	unsigned int i;
+	u32 sd_fc;
 
 	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
 	if (!clock)
@@ -230,6 +212,18 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	clock->div_table = cpg_sd_div_table;
 	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
 
+	sd_fc = readl(clock->reg) & CPG_SD_FC_MASK;
+	for (i = 0; i < clock->div_num; i++)
+		if (sd_fc == (clock->div_table[i].val & CPG_SD_FC_MASK))
+			break;
+
+	if (WARN_ON(i >= clock->div_num)) {
+		kfree(clock);
+		return ERR_PTR(-EINVAL);
+	}
+
+	clock->cur_div_idx = i;
+
 	clock->div_max = clock->div_table[0].div;
 	clock->div_min = clock->div_max;
 	for (i = 1; i < clock->div_num; i++) {
-- 
2.11.0

