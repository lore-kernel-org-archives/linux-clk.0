Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/5] clk: qcom: Add support for read-only rcg2 ops
Date: Fri,  5 Jun 2015 15:40:32 +0300
Message-Id: <1433508036-28644-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
References: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Some root clock generators can be controlled by other processors. In this
case modifying them is not recommended. By using the read-only operations,
the child clocks will be able to get information about their parent - like
rate etc.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |    1 +
 drivers/clk/qcom/clk-rcg2.c |    7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 56028bb31d87..706a55b34b81 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -169,6 +169,7 @@ struct clk_rcg2 {
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
 
 extern const struct clk_ops clk_rcg2_ops;
+extern const struct clk_ops clk_rcg2_ro_ops;
 extern const struct clk_ops clk_edp_pixel_ops;
 extern const struct clk_ops clk_byte_ops;
 extern const struct clk_ops clk_pixel_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index b95d17fbb8d7..cb17fd4b193f 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -301,6 +301,13 @@ const struct clk_ops clk_rcg2_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);
 
+const struct clk_ops clk_rcg2_ro_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_ro_ops);
+
 struct frac_entry {
 	int num;
 	int den;
