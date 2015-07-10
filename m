Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 28/45] clk: versatile: Remove clk.h and clkdev.h includes
Date: Fri, 10 Jul 2015 16:33:26 -0700
Message-Id: <1436571223-10959-29-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver. Also remove clkdev.h in files that aren't using
it and replace them with slab.h in files that were relying on the
implicit include of slab.h in clkdev.h.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/versatile/clk-icst.c      | 5 +++--
 drivers/clk/versatile/clk-impd1.c     | 1 -
 drivers/clk/versatile/clk-realview.c  | 1 -
 drivers/clk/versatile/clk-sp810.c     | 3 ++-
 drivers/clk/versatile/clk-versatile.c | 2 --
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index bc96f103bd7c..a3893ea2199d 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -13,8 +13,9 @@
  * ICST clock code from the ARM tree should probably be merged into this
  * file.
  */
-#include <linux/clk.h>
-#include <linux/clkdev.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index 1cc1330dc570..65c842a21c62 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -7,7 +7,6 @@
  * published by the Free Software Foundation.
  */
 #include <linux/clk-provider.h>
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/io.h>
diff --git a/drivers/clk/versatile/clk-realview.c b/drivers/clk/versatile/clk-realview.c
index c8b523117fb7..940cc6f14578 100644
--- a/drivers/clk/versatile/clk-realview.c
+++ b/drivers/clk/versatile/clk-realview.c
@@ -6,7 +6,6 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/io.h>
diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index a96dd8e53fdb..64b0129a0216 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -12,7 +12,8 @@
  */
 
 #include <linux/amba/sp810.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/of.h>
diff --git a/drivers/clk/versatile/clk-versatile.c b/drivers/clk/versatile/clk-versatile.c
index 7a4f8635bd1e..71fa5da89afd 100644
--- a/drivers/clk/versatile/clk-versatile.c
+++ b/drivers/clk/versatile/clk-versatile.c
@@ -8,8 +8,6 @@
  * published by the Free Software Foundation.
  */
 #include <linux/clk-provider.h>
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
