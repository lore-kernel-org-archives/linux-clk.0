Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:38801 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752682AbcHVMtn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2016 08:49:43 -0400
Received: by mail-wm0-f54.google.com with SMTP id o80so142159039wme.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2016 05:49:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@codeaurora.org, carlo@caione.org, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-gxbb: Export PWM related clocks for DT
Date: Mon, 22 Aug 2016 14:49:37 +0200
Message-Id: <1471870177-10609-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the PWM related clocks in order to be referenced as PWM source
clocks.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/gxbb.h              | 6 +++---
 include/dt-bindings/clock/gxbb-clkc.h | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index a2adf34..523b494 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -170,11 +170,11 @@
  */
 #define CLKID_SYS_PLL		  0
 /* CLKID_CPUCLK */
-#define CLKID_HDMI_PLL		  2
+/* CLKID_HDMI_PLL */
 #define CLKID_FIXED_PLL		  3
 #define CLKID_FCLK_DIV2		  4
-#define CLKID_FCLK_DIV3		  5
-#define CLKID_FCLK_DIV4		  6
+/* CLKID_FCLK_DIV3 */
+/* CLKID_FCLK_DIV4 */
 #define CLKID_FCLK_DIV5		  7
 #define CLKID_FCLK_DIV7		  8
 #define CLKID_GP0_PLL		  9
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index f889d80..a5897f3 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -6,6 +6,9 @@
 #define __GXBB_CLKC_H
 
 #define CLKID_CPUCLK		1
+#define CLKID_HDMI_PLL		2
+#define CLKID_FCLK_DIV3		5
+#define CLKID_FCLK_DIV4		6
 #define CLKID_CLK81		12
 #define CLKID_ETH		36
 
-- 
1.9.1

