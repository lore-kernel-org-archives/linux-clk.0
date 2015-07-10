Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 25/45] clk: socfpga: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:23 -0700
Message-Id: <1436571223-10959-26-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/spear/spear1310_clock.c | 1 -
 drivers/clk/spear/spear1340_clock.c | 1 -
 drivers/clk/spear/spear3xx_clock.c  | 1 -
 drivers/clk/spear/spear6xx_clock.c  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/clk/spear/spear1310_clock.c b/drivers/clk/spear/spear1310_clock.c
index 4daa5977793a..7cd010f6e12d 100644
--- a/drivers/clk/spear/spear1310_clock.c
+++ b/drivers/clk/spear/spear1310_clock.c
@@ -11,7 +11,6 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/io.h>
diff --git a/drivers/clk/spear/spear1340_clock.c b/drivers/clk/spear/spear1340_clock.c
index 5a5c6648308d..eef57a2e39ee 100644
--- a/drivers/clk/spear/spear1340_clock.c
+++ b/drivers/clk/spear/spear1340_clock.c
@@ -11,7 +11,6 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/io.h>
diff --git a/drivers/clk/spear/spear3xx_clock.c b/drivers/clk/spear/spear3xx_clock.c
index bb5f387774e2..ce2a94c64049 100644
--- a/drivers/clk/spear/spear3xx_clock.c
+++ b/drivers/clk/spear/spear3xx_clock.c
@@ -9,7 +9,6 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/io.h>
diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
index 4f649c9cb094..46a4dafe46a7 100644
--- a/drivers/clk/spear/spear6xx_clock.c
+++ b/drivers/clk/spear/spear6xx_clock.c
@@ -9,7 +9,6 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/spinlock_types.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
