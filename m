Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from condef009-v.nifty.com ([210.131.4.246]:35640 "EHLO
        condef009-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752018AbcJSOKQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Oct 2016 10:10:16 -0400
Received: from conuserg-11.nifty.com ([10.26.8.74])by condef009-v.nifty.com with ESMTP id u9J8JvTB002586
        for <linux-clk@vger.kernel.org>; Wed, 19 Oct 2016 17:19:57 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] clk: uniphier: rename MIO clock to SD clock for Pro5, PXs2, LD20 SoCs
Date: Wed, 19 Oct 2016 17:22:07 +0900
Message-Id: <1476865327-13039-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I made a mistake as for naming for this block.  The MIO block is not
implemented for these 3 SoCs in the first place.  The current naming
will be a trouble if an SoC with both MIO and SD-ctrl blocks appear
in the future.

This driver has just been merged in the previous merge window.
Rename it before the release.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Stephen,

Could you apply this to clk-fixes branch, please?


 .../devicetree/bindings/clock/uniphier-clock.txt         | 16 ++++++++--------
 drivers/clk/uniphier/clk-uniphier-core.c                 | 14 +++++++-------
 drivers/clk/uniphier/clk-uniphier-mio.c                  |  2 +-
 drivers/clk/uniphier/clk-uniphier.h                      |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/uniphier-clock.txt b/Documentation/devicetree/bindings/clock/uniphier-clock.txt
index c7179d3..8121630 100644
--- a/Documentation/devicetree/bindings/clock/uniphier-clock.txt
+++ b/Documentation/devicetree/bindings/clock/uniphier-clock.txt
@@ -24,7 +24,7 @@ Example:
 		reg = <0x61840000 0x4000>;
 
 		clock {
-			compatible = "socionext,uniphier-ld20-clock";
+			compatible = "socionext,uniphier-ld11-clock";
 			#clock-cells = <1>;
 		};
 
@@ -43,8 +43,8 @@ Provided clocks:
 21: USB3 ch1 PHY1
 
 
-Media I/O (MIO) clock
----------------------
+Media I/O (MIO) clock, SD clock
+-------------------------------
 
 Required properties:
 - compatible: should be one of the following:
@@ -52,10 +52,10 @@ Required properties:
     "socionext,uniphier-ld4-mio-clock"  - for LD4 SoC.
     "socionext,uniphier-pro4-mio-clock" - for Pro4 SoC.
     "socionext,uniphier-sld8-mio-clock" - for sLD8 SoC.
-    "socionext,uniphier-pro5-mio-clock" - for Pro5 SoC.
-    "socionext,uniphier-pxs2-mio-clock" - for PXs2/LD6b SoC.
+    "socionext,uniphier-pro5-sd-clock"  - for Pro5 SoC.
+    "socionext,uniphier-pxs2-sd-clock"  - for PXs2/LD6b SoC.
     "socionext,uniphier-ld11-mio-clock" - for LD11 SoC.
-    "socionext,uniphier-ld20-mio-clock" - for LD20 SoC.
+    "socionext,uniphier-ld20-sd-clock"  - for LD20 SoC.
 - #clock-cells: should be 1.
 
 Example:
@@ -66,7 +66,7 @@ Example:
 		reg = <0x59810000 0x800>;
 
 		clock {
-			compatible = "socionext,uniphier-ld20-mio-clock";
+			compatible = "socionext,uniphier-ld11-mio-clock";
 			#clock-cells = <1>;
 		};
 
@@ -112,7 +112,7 @@ Example:
 		reg = <0x59820000 0x200>;
 
 		clock {
-			compatible = "socionext,uniphier-ld20-peri-clock";
+			compatible = "socionext,uniphier-ld11-peri-clock";
 			#clock-cells = <1>;
 		};
 
diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index c81a6fd..ba180ad 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -145,7 +145,7 @@ static int uniphier_clk_remove(struct platform_device *pdev)
 		.compatible = "socionext,uniphier-ld20-clock",
 		.data = uniphier_ld20_sys_clk_data,
 	},
-	/* Media I/O clock */
+	/* Media I/O clock, SD clock */
 	{
 		.compatible = "socionext,uniphier-sld3-mio-clock",
 		.data = uniphier_sld3_mio_clk_data,
@@ -163,20 +163,20 @@ static int uniphier_clk_remove(struct platform_device *pdev)
 		.data = uniphier_sld3_mio_clk_data,
 	},
 	{
-		.compatible = "socionext,uniphier-pro5-mio-clock",
-		.data = uniphier_pro5_mio_clk_data,
+		.compatible = "socionext,uniphier-pro5-sd-clock",
+		.data = uniphier_pro5_sd_clk_data,
 	},
 	{
-		.compatible = "socionext,uniphier-pxs2-mio-clock",
-		.data = uniphier_pro5_mio_clk_data,
+		.compatible = "socionext,uniphier-pxs2-sd-clock",
+		.data = uniphier_pro5_sd_clk_data,
 	},
 	{
 		.compatible = "socionext,uniphier-ld11-mio-clock",
 		.data = uniphier_sld3_mio_clk_data,
 	},
 	{
-		.compatible = "socionext,uniphier-ld20-mio-clock",
-		.data = uniphier_pro5_mio_clk_data,
+		.compatible = "socionext,uniphier-ld20-sd-clock",
+		.data = uniphier_pro5_sd_clk_data,
 	},
 	/* Peripheral clock */
 	{
diff --git a/drivers/clk/uniphier/clk-uniphier-mio.c b/drivers/clk/uniphier/clk-uniphier-mio.c
index 6aa7ec7..218d20f 100644
--- a/drivers/clk/uniphier/clk-uniphier-mio.c
+++ b/drivers/clk/uniphier/clk-uniphier-mio.c
@@ -93,7 +93,7 @@
 	{ /* sentinel */ }
 };
 
-const struct uniphier_clk_data uniphier_pro5_mio_clk_data[] = {
+const struct uniphier_clk_data uniphier_pro5_sd_clk_data[] = {
 	UNIPHIER_MIO_CLK_SD_FIXED,
 	UNIPHIER_MIO_CLK_SD(0, 0),
 	UNIPHIER_MIO_CLK_SD(1, 1),
diff --git a/drivers/clk/uniphier/clk-uniphier.h b/drivers/clk/uniphier/clk-uniphier.h
index 2e4fe5d..8d3c793 100644
--- a/drivers/clk/uniphier/clk-uniphier.h
+++ b/drivers/clk/uniphier/clk-uniphier.h
@@ -161,7 +161,7 @@ struct clk_hw *uniphier_clk_register_mux(struct device *dev,
 extern const struct uniphier_clk_data uniphier_ld11_sys_clk_data[];
 extern const struct uniphier_clk_data uniphier_ld20_sys_clk_data[];
 extern const struct uniphier_clk_data uniphier_sld3_mio_clk_data[];
-extern const struct uniphier_clk_data uniphier_pro5_mio_clk_data[];
+extern const struct uniphier_clk_data uniphier_pro5_sd_clk_data[];
 extern const struct uniphier_clk_data uniphier_ld4_peri_clk_data[];
 extern const struct uniphier_clk_data uniphier_pro4_peri_clk_data[];
 
-- 
1.9.1

