Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 22/45] clk: samsung: Properly include clk.h and clkdev.h
Date: Fri, 10 Jul 2015 16:33:20 -0700
Message-Id: <1436571223-10959-23-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Only include clk.h in files that are
using it. The clkdev.h header isn't always used either, so remove
it and add in slab.h where files were relying on it to include
slab for them.

Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/samsung/clk-cpu.c           | 3 +++
 drivers/clk/samsung/clk-exynos-audss.c  | 3 ++-
 drivers/clk/samsung/clk-exynos-clkout.c | 2 +-
 drivers/clk/samsung/clk-exynos3250.c    | 2 --
 drivers/clk/samsung/clk-exynos4.c       | 2 +-
 drivers/clk/samsung/clk-exynos4415.c    | 2 --
 drivers/clk/samsung/clk-exynos5250.c    | 2 --
 drivers/clk/samsung/clk-exynos5260.c    | 2 --
 drivers/clk/samsung/clk-exynos5410.c    | 2 --
 drivers/clk/samsung/clk-exynos5420.c    | 3 +--
 drivers/clk/samsung/clk-exynos5433.c    | 2 --
 drivers/clk/samsung/clk-exynos5440.c    | 2 --
 drivers/clk/samsung/clk-exynos7.c       | 2 --
 drivers/clk/samsung/clk-pll.c           | 2 ++
 drivers/clk/samsung/clk-s3c2410.c       | 2 --
 drivers/clk/samsung/clk-s3c2412.c       | 2 --
 drivers/clk/samsung/clk-s3c2443.c       | 2 --
 drivers/clk/samsung/clk-s3c64xx.c       | 2 --
 drivers/clk/samsung/clk-s5pv210.c       | 2 --
 drivers/clk/samsung/clk.c               | 4 ++++
 drivers/clk/samsung/clk.h               | 3 ++-
 21 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 3a1fe07cfe9e..8e7f36f105c1 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -33,6 +33,9 @@
 */
 
 #include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include "clk-cpu.h"
 
 #define E4210_SRC_CPU		0x0
diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 454b02ae486a..4e9584d79089 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -9,8 +9,9 @@
  * Common Clock Framework support for Audio Subsystem Clock Controller.
 */
 
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 03a52228b6d1..7cd02ff37a1f 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -9,8 +9,8 @@
  * Clock driver for Exynos clock output
  */
 
+#include <linux/slab.h>
 #include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 538de66a759e..c940fddb0847 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -8,8 +8,6 @@
  * Common Clock Framework support for Exynos3250 SoC.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index cae2c048488d..65e20eb6356e 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -11,8 +11,8 @@
 */
 
 #include <dt-bindings/clock/exynos4.h>
+#include <linux/slab.h>
 #include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos4415.c b/drivers/clk/samsung/clk-exynos4415.c
index 6c78b09c829f..92c39f6efec8 100644
--- a/drivers/clk/samsung/clk-exynos4415.c
+++ b/drivers/clk/samsung/clk-exynos4415.c
@@ -9,8 +9,6 @@
  * Common Clock Framework support for Exynos4415 SoC.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 70ec3d2608a1..aa356db587df 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -11,8 +11,6 @@
 */
 
 #include <dt-bindings/clock/exynos5250.h>
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index 06f96eb7cf93..d1a29f6c1084 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -9,8 +9,6 @@
  * Common Clock Framework support for Exynos5260 SoC.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index 231475bc2b99..d5d5dcabc4a9 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -11,8 +11,6 @@
 
 #include <dt-bindings/clock/exynos5410.h>
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index a1d731ca8f48..389af3c15ec4 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -11,8 +11,7 @@
 */
 
 #include <dt-bindings/clock/exynos5420.h>
-#include <linux/clk.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 39c95649d3d0..cee062c588de 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -9,8 +9,6 @@
  * Common Clock Framework support for Exynos5443 SoC.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 
diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
index 979e81389cdd..590813871ffe 100644
--- a/drivers/clk/samsung/clk-exynos5440.c
+++ b/drivers/clk/samsung/clk-exynos5440.c
@@ -10,8 +10,6 @@
 */
 
 #include <dt-bindings/clock/exynos5440.h>
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 03d36e847b78..8524e667097e 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -8,8 +8,6 @@
  *
 */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index bebc61b5fce1..e9394261f80f 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -12,6 +12,8 @@
 #include <linux/errno.h>
 #include <linux/hrtimer.h>
 #include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/clkdev.h>
 #include "clk.h"
 #include "clk-pll.h"
 
diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index 5d2f03461bc5..0945a8852299 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -8,8 +8,6 @@
  * Common Clock Framework support for S3C2410 and following SoCs.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
index 2ceedaf8ce18..44d6a9f4f5b2 100644
--- a/drivers/clk/samsung/clk-s3c2412.c
+++ b/drivers/clk/samsung/clk-s3c2412.c
@@ -8,8 +8,6 @@
  * Common Clock Framework support for S3C2412 and S3C2413.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index 0c3c182b902a..2c0a1ea3c80c 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -8,8 +8,6 @@
  * Common Clock Framework support for S3C2443 and following SoCs.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index 0f590e5550cb..d4bd6997dea2 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -8,8 +8,6 @@
  * Common Clock Framework support for all S3C64xx SoCs.
 */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index cf7e8fa7b624..67bf813809c6 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -11,8 +11,6 @@
  * Common Clock Framework support for all S5PC110/S5PV210 SoCs.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 0117238391d6..f38a6c49f744 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -11,6 +11,10 @@
  * clock framework for Samsung platforms.
 */
 
+#include <linux/slab.h>
+#include <linux/clkdev.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b775fc29caa5..aa872d2c5105 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -13,10 +13,11 @@
 #ifndef __SAMSUNG_CLK_H
 #define __SAMSUNG_CLK_H
 
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include "clk-pll.h"
 
+struct clk;
+
 /**
  * struct samsung_clk_provider: information about clock provider
  * @reg_base: virtual address for the register base.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

