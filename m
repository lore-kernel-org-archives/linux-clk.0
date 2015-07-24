Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: Give clk-qcom.ko module a GPLv2 license
Date: Fri, 24 Jul 2015 11:59:49 -0700
Message-Id: <1437764389-30846-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The missing license causes the clk-qcom.ko module to taint the
kernel. Add the appropriate license to avoid taint.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index f7101e330b1d..34e60c552cea 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
@@ -144,3 +145,5 @@ void qcom_cc_remove(struct platform_device *pdev)
 	reset_controller_unregister(platform_get_drvdata(pdev));
 }
 EXPORT_SYMBOL_GPL(qcom_cc_remove);
+
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
