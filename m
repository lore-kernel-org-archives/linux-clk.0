Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 33/45] clk: sunxi: Include clk.h
Date: Fri, 10 Jul 2015 16:33:31 -0700
Message-Id: <1436571223-10959-34-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sunxi/clk-mod0.c       | 3 ++-
 drivers/clk/sunxi/clk-sun8i-mbus.c | 2 +-
 drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c  | 3 ++-
 drivers/clk/sunxi/clk-sunxi.c      | 2 ++
 drivers/clk/sunxi/clk-usb.c        | 3 ++-
 6 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index 9d028aec58e5..39ba5c3d5d3a 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -14,8 +14,9 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/sunxi/clk-sun8i-mbus.c b/drivers/clk/sunxi/clk-sun8i-mbus.c
index 14cd026064bf..bf117a636d23 100644
--- a/drivers/clk/sunxi/clk-sun8i-mbus.c
+++ b/drivers/clk/sunxi/clk-sun8i-mbus.c
@@ -14,8 +14,8 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/of_address.h>
 
 #include "clk-factors.h"
diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
index 887f4ea161bb..6c4c98324d3c 100644
--- a/drivers/clk/sunxi/clk-sun9i-core.c
+++ b/drivers/clk/sunxi/clk-sun9i-core.c
@@ -14,8 +14,8 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/log2.h>
diff --git a/drivers/clk/sunxi/clk-sun9i-mmc.c b/drivers/clk/sunxi/clk-sun9i-mmc.c
index 710c273648d7..abc9a216b36c 100644
--- a/drivers/clk/sunxi/clk-sun9i-mmc.c
+++ b/drivers/clk/sunxi/clk-sun9i-mmc.c
@@ -14,8 +14,9 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 9a82f17d2d73..3be234138d1d 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -14,6 +14,8 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
index 3a25f9588e67..ecaf9dadcf6b 100644
--- a/drivers/clk/sunxi/clk-usb.c
+++ b/drivers/clk/sunxi/clk-usb.c
@@ -14,8 +14,9 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/reset-controller.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
