Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] clk: qcom: Move gdsc config outside COMMON_CLK_QCOM config
Date: Thu,  8 Oct 2015 14:47:12 -0700
Message-Id: <1444340832-19777-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Having this hidden config below the COMMON_CLK_QCOM config causes
menuconfig to stop indenting config items after it.

        <*> Support for Qualcomm's clock controllers
        {M}   APQ8084 Global Clock Controller
        <M>   APQ8084 Multimedia Clock Controller
        {M}   IPQ806x Global Clock Controller
        <M>   IPQ806x LPASS Clock Controller
        <M> MSM8660 Global Clock Controller
        <M> MSM8916 Global Clock Controller
        {M} APQ8064/MSM8960 Global Clock Controller
        <M> APQ8064/MSM8960 LPASS Clock Controller
        <M> MSM8960 Multimedia Clock Controller
        {M} MSM8974 Global Clock Controller
        <M> MSM8974 Multimedia Clock Controller

Move it up above anything else so that we don't get odd
indenting.

Cc: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 47b988f567e8..ee4c83aab4f4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1,3 +1,7 @@
+config QCOM_GDSC
+	bool
+	select PM_GENERIC_DOMAINS if PM
+
 config COMMON_CLK_QCOM
 	tristate "Support for Qualcomm's clock controllers"
 	depends on OF
@@ -41,10 +45,6 @@ config IPQ_LCC_806X
 	  Say Y if you want to use audio devices such as i2s, pcm,
 	  S/PDIF, etc.
 
-config QCOM_GDSC
-	bool
-	select PM_GENERIC_DOMAINS if PM
-
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	depends on COMMON_CLK_QCOM
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
