Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2 2/2] clk: qcom: common: check for failure
Date: Wed, 23 Dec 2015 17:57:20 +0530
Message-Id: <1450873640-12489-2-git-send-email-sudipm.mukherjee@gmail.com>
In-Reply-To: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
References: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

We were not checking the return from devm_add_action() which can fail.
Start using the helper and devm_add_action_or_reset() and return
directly as we know that the cleanup has been done by this helper.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

v2: added the helper in patch 1/2 and used that helper here.

 drivers/clk/qcom/common.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index c112eba..65809f1 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -213,7 +213,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	devm_add_action(dev, qcom_cc_del_clk_provider, pdev->dev.of_node);
+	ret = devm_add_action_or_reset(dev, qcom_cc_del_clk_provider,
+				       pdev->dev.of_node);
+
+	if (ret)
+		return ret;
 
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
@@ -227,7 +231,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	devm_add_action(dev, qcom_cc_reset_unregister, &reset->rcdev);
+	ret = devm_add_action_or_reset(dev, qcom_cc_reset_unregister,
+				       &reset->rcdev);
+
+	if (ret)
+		return ret;
 
 	if (desc->gdscs && desc->num_gdscs) {
 		ret = gdsc_register(dev, desc->gdscs, desc->num_gdscs,
@@ -236,10 +244,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 			return ret;
 	}
 
-	devm_add_action(dev, qcom_cc_gdsc_unregister, dev);
-
-
-	return 0;
+	return devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister, dev);
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
-- 
1.9.1
