Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/5] clk: qcom: Add support for RCGs with shared branches
Date: Fri,  5 Jun 2015 15:40:34 +0300
Message-Id: <1433508036-28644-4-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
References: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Some root clock generators may have child branches that are controlled
by different CPUs. These RCGs require special operations.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |    1 +
 drivers/clk/qcom/clk-rcg2.c |   64 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 706a55b34b81..c233a8f5e910 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -170,6 +170,7 @@ struct clk_rcg2 {
 
 extern const struct clk_ops clk_rcg2_ops;
 extern const struct clk_ops clk_rcg2_ro_ops;
+extern const struct clk_ops clk_rcg2_shared_ops;
 extern const struct clk_ops clk_edp_pixel_ops;
 extern const struct clk_ops clk_byte_ops;
 extern const struct clk_ops clk_pixel_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index cb17fd4b193f..60563adad21d 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -47,6 +47,8 @@
 #define N_REG			0xc
 #define D_REG			0x10
 
+#define XO_FREQ			19200000
+
 static int clk_rcg2_is_enabled(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
@@ -308,6 +310,68 @@ const struct clk_ops clk_rcg2_ro_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ro_ops);
 
+static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const char *name = __clk_get_name(hw->clk);
+	int ret, count;
+	unsigned int cmd = CMD_ROOT_EN;
+
+	/* force enable RCG */
+	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+				 cmd, cmd);
+	if (ret)
+		return ret;
+
+	/* wait for RCG to turn ON */
+	for (count = 500; count > 0; count--) {
+		ret = clk_rcg2_is_enabled(hw);
+		if (ret)
+			break;
+		udelay(1);
+	}
+	if (!count)
+		pr_err("%s: RCG did not turn on\n", name);
+
+	/* set clock rate */
+	ret = __clk_rcg2_set_rate(hw, rate);
+	if (ret)
+		return ret;
+
+	/* clear force enable RCG */
+	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+				 cmd, ~cmd);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int clk_rcg2_shared_enable(struct clk_hw *hw)
+{
+	unsigned long rate = __clk_get_rate(hw->clk);
+
+	return clk_rcg2_shared_set_rate(hw, rate, 0);
+}
+
+static void clk_rcg2_shared_disable(struct clk_hw *hw)
+{
+	/* switch to XO, which is always-on */
+	clk_rcg2_shared_set_rate(hw, XO_FREQ, 0);
+}
+
+const struct clk_ops clk_rcg2_shared_ops = {
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_get_parent,
+	.is_enabled = clk_rcg2_is_enabled,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
+
 struct frac_entry {
 	int num;
 	int den;
