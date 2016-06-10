Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 01/10] clk: meson8b: rectify reg offsets with datasheet
Date: Thu,  9 Jun 2016 17:27:38 -0700
Message-Id: <1465518467-23939-2-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The register offsets in the data sheet are confusing. Document them more
thoroughly.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/meson8b-clkc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index 4d057b3..444ef94 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -24,10 +24,19 @@
 
 #include "clkc.h"
 
+/*
+ * Clock controller register offsets
+ *
+ * Register offsets from the HardKernel[0] data sheet are listed in comment
+ * blocks below. Those offsets must be multiplied by 4 before adding them to
+ * the base address to get the right value
+ *
+ * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
+ */
 #define MESON8B_REG_CTL0_ADDR		0x0000
-#define MESON8B_REG_SYS_CPU_CNTL1	0x015c
-#define MESON8B_REG_HHI_MPEG		0x0174
-#define MESON8B_REG_MALI		0x01b0
+#define MESON8B_REG_SYS_CPU_CNTL1	0x015c /* 0x57 offset in data sheet */
+#define MESON8B_REG_HHI_MPEG		0x0174 /* 0x5d offset in data sheet */
+#define MESON8B_REG_MALI		0x01b0 /* 0x6c offset in data sheet */
 #define MESON8B_REG_PLL_FIXED		0x0280
 #define MESON8B_REG_PLL_SYS		0x0300
 #define MESON8B_REG_PLL_VID		0x0320
-- 
2.1.4
