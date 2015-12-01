Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] clk: qcom: common: check for failure
Date: Tue,  1 Dec 2015 14:36:10 +0530
Message-Id: <1448960770-10815-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

We were not checking the return from devm_add_action() which can fail.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/clk/qcom/common.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index c112eba..3541a9a 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -213,7 +213,10 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	devm_add_action(dev, qcom_cc_del_clk_provider, pdev->dev.of_node);
+	ret = devm_add_action(dev, qcom_cc_del_clk_provider,
+			      pdev->dev.of_node);
+	if (ret)
+		return ret;
 
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
@@ -236,8 +239,12 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 			return ret;
 	}
 
-	devm_add_action(dev, qcom_cc_gdsc_unregister, dev);
-
+	ret = devm_add_action(dev, qcom_cc_gdsc_unregister, dev);
+	if (ret) {
+		if (desc->gdscs && desc->num_gdscs)
+			gdsc_unregister(dev);
+		return ret;
+	}
 
 	return 0;
 }
-- 
1.9.1
