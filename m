Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 11/41] clk: pxa: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:56 -0800
Message-Id: <1456858826-28541-12-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/pxa/clk-pxa25x.c | 8 +++-----
 drivers/clk/pxa/clk-pxa27x.c | 6 +++---
 drivers/clk/pxa/clk-pxa3xx.c | 8 ++++----
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index b7747229db9a..48b8b64fd28f 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -200,12 +200,10 @@ static void __init pxa25x_register_core(void)
 static void __init pxa25x_register_plls(void)
 {
 	clk_register_fixed_rate(NULL, "osc_3_6864mhz", NULL,
-				CLK_GET_RATE_NOCACHE | CLK_IS_ROOT,
-				3686400);
+				CLK_GET_RATE_NOCACHE, 3686400);
 	clk_register_fixed_rate(NULL, "osc_32_768khz", NULL,
-				CLK_GET_RATE_NOCACHE | CLK_IS_ROOT,
-				32768);
-	clk_register_fixed_rate(NULL, "clk_dummy", NULL, CLK_IS_ROOT, 0);
+				CLK_GET_RATE_NOCACHE, 32768);
+	clk_register_fixed_rate(NULL, "clk_dummy", NULL, 0, 0);
 	clk_register_fixed_factor(NULL, "ppll_95_85mhz", "osc_3_6864mhz",
 				  0, 26, 1);
 	clk_register_fixed_factor(NULL, "ppll_147_46mhz", "osc_3_6864mhz",
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 5b82d30baf9f..e86cd5fa2eb4 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -208,12 +208,12 @@ MUX_RO_RATE_RO_OPS(clk_pxa27x_lcd_base, "lcd_base");
 static void __init pxa27x_register_plls(void)
 {
 	clk_register_fixed_rate(NULL, "osc_13mhz", NULL,
-				CLK_GET_RATE_NOCACHE | CLK_IS_ROOT,
+				CLK_GET_RATE_NOCACHE,
 				13 * MHz);
 	clk_register_fixed_rate(NULL, "osc_32_768khz", NULL,
-				CLK_GET_RATE_NOCACHE | CLK_IS_ROOT,
+				CLK_GET_RATE_NOCACHE,
 				32768 * KHz);
-	clk_register_fixed_rate(NULL, "clk_dummy", NULL, CLK_IS_ROOT, 0);
+	clk_register_fixed_rate(NULL, "clk_dummy", NULL, 0, 0);
 	clk_register_fixed_factor(NULL, "ppll_312mhz", "osc_13mhz", 0, 24, 1);
 }
 
diff --git a/drivers/clk/pxa/clk-pxa3xx.c b/drivers/clk/pxa/clk-pxa3xx.c
index 4af4eed5f89f..9238d5f5a7fd 100644
--- a/drivers/clk/pxa/clk-pxa3xx.c
+++ b/drivers/clk/pxa/clk-pxa3xx.c
@@ -284,15 +284,15 @@ static void __init pxa3xx_register_core(void)
 static void __init pxa3xx_register_plls(void)
 {
 	clk_register_fixed_rate(NULL, "osc_13mhz", NULL,
-				CLK_GET_RATE_NOCACHE | CLK_IS_ROOT,
+				CLK_GET_RATE_NOCACHE,
 				13 * MHz);
 	clk_register_fixed_rate(NULL, "osc_32_768khz", NULL,
-				CLK_GET_RATE_NOCACHE | CLK_IS_ROOT,
+				CLK_GET_RATE_NOCACHE,
 				32768);
 	clk_register_fixed_rate(NULL, "ring_osc_120mhz", NULL,
-				CLK_GET_RATE_NOCACHE | CLK_IS_ROOT,
+				CLK_GET_RATE_NOCACHE,
 				120 * MHz);
-	clk_register_fixed_rate(NULL, "clk_dummy", NULL, CLK_IS_ROOT, 0);
+	clk_register_fixed_rate(NULL, "clk_dummy", NULL, 0, 0);
 	clk_register_fixed_factor(NULL, "spll_624mhz", "osc_13mhz", 0, 48, 1);
 	clk_register_fixed_factor(NULL, "ring_osc_60mhz", "ring_osc_120mhz",
 				  0, 1, 2);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
