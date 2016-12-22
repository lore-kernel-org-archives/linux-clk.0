Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	varada@codeaurora.org,
	snlakshm@codeaurora.org,
	pradeepb@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5] clk: qcom: ipq4019: Add the cpu clock frequency change notifier
Date: Thu, 22 Dec 2016 20:10:54 +0530
Message-Id: <1482417654-2998-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1482417654-2998-1-git-send-email-absahu@codeaurora.org>
References: <1482417654-2998-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The current driver code gives the crash or gets hang while switching
the CPU frequency some time. The APSS CPU Clock divider is not glitch
free so it the APPS clock need to be switched for stable clock during
the change.

This patch adds the frequency change notifier for APSS CPU clock. It
changes the parent of this clock to stable PLL FEPLL500 for
PRE_RATE_CHANGE event. This event will be generated before actual
clock set operations. The clock set operation will again change its
corresponding parent by getting the same from frequency table.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index eeafca2..9771fd2 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -22,6 +22,7 @@
 #include <linux/reset-controller.h>
 #include <linux/math64.h>
 #include <linux/delay.h>
+#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
 
@@ -165,6 +166,12 @@ struct clk_fepll {
 	{  P_DDRPLLAPSS, 1 },
 };
 
+/*
+ * Contains index for safe clock during APSS freq change.
+ * fepll500 is being used as safe clock so initialize it
+ * with its index in parents list gcc_xo_ddr_500_200.
+ */
+static const int gcc_ipq4019_cpu_safe_parent = 2;
 static const char * const gcc_xo_ddr_500_200[] = {
 	"xo",
 	"fepll200",
@@ -1736,13 +1743,44 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 };
 MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
 
+static int
+gcc_ipq4019_cpu_clk_notifier_fn(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	int err = 0;
+
+	if (action == PRE_RATE_CHANGE)
+		err = clk_rcg2_ops.set_parent(&apps_clk_src.clkr.hw,
+					      gcc_ipq4019_cpu_safe_parent);
+
+	return notifier_from_errno(err);
+}
+
+static struct notifier_block gcc_ipq4019_cpu_clk_notifier = {
+	.notifier_call = gcc_ipq4019_cpu_clk_notifier_fn,
+};
+
 static int gcc_ipq4019_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
+	int err;
+
+	err = qcom_cc_probe(pdev, &gcc_ipq4019_desc);
+	if (!err)
+		err = clk_notifier_register(apps_clk_src.clkr.hw.clk,
+					    &gcc_ipq4019_cpu_clk_notifier);
+
+	return err;
+}
+
+static int gcc_ipq4019_remove(struct platform_device *pdev)
+{
+	return clk_notifier_unregister(apps_clk_src.clkr.hw.clk,
+				       &gcc_ipq4019_cpu_clk_notifier);
 }
 
 static struct platform_driver gcc_ipq4019_driver = {
 	.probe		= gcc_ipq4019_probe,
+	.remove		= gcc_ipq4019_remove,
 	.driver		= {
 		.name	= "qcom,gcc-ipq4019",
 		.of_match_table = gcc_ipq4019_match_table,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
