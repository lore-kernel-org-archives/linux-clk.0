Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 4/7] clk: meson: Copy meson8b CLKID defines to private header file
Date: Wed, 13 Jul 2016 19:49:38 +0200
Message-Id: <1468432181-9550-5-git-send-email-serveralex@gmail.com>
In-Reply-To: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Only expose future CLKID constants if necessary. This patch
removes CLK_NR_CLKS from the DT bindings but leaves all previously
defined CLKIDs there to keep backward compatibility.

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/meson8b.c              |  1 -
 drivers/clk/meson/meson8b.h              | 27 +++++++++++++++++++++++++++
 include/dt-bindings/clock/meson8b-clkc.h |  2 --
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 0c6e26f..9a656d9 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
-#include <dt-bindings/clock/meson8b-clkc.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index b2f29f7..f8c6942 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -36,4 +36,31 @@
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
 #define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
 
+/*
+ * CLKID index values
+ *
+ * These indices are entirely contrived and do not map onto the hardware.
+ * Migrate them out of this header and into the DT header file when they need
+ * to be exposed to client nodes in DT: include/dt-bindings/clock/meson8b-clkc.h
+ */
+
+#define CLKID_UNUSED		0
+#define CLKID_XTAL		1
+#define CLKID_PLL_FIXED		2
+#define CLKID_PLL_VID		3
+#define CLKID_PLL_SYS		4
+#define CLKID_FCLK_DIV2		5
+#define CLKID_FCLK_DIV3		6
+#define CLKID_FCLK_DIV4		7
+#define CLKID_FCLK_DIV5		8
+#define CLKID_FCLK_DIV7		9
+#define CLKID_CLK81		10
+#define CLKID_MALI		11
+#define CLKID_CPUCLK		12
+#define CLKID_ZERO		13
+#define CLKID_MPEG_SEL		14
+#define CLKID_MPEG_DIV		15
+
+#define CLK_NR_CLKS		(CLKID_MPEG_DIV + 1)
+
 #endif /* __MESON8B_H */
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 595a58d..a55ff8c 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -22,6 +22,4 @@
 #define CLKID_MPEG_SEL		14
 #define CLKID_MPEG_DIV		15
 
-#define CLK_NR_CLKS		(CLKID_MPEG_DIV + 1)
-
 #endif /* __MESON8B_CLKC_H */
-- 
2.5.0
