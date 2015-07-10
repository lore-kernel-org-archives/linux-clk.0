Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33979 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753288AbbGJXdu (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jul 2015 19:33:50 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 19/45] clk: mxs: Include clk.h in C files that use it
Date: Fri, 10 Jul 2015 16:33:17 -0700
Message-Id: <1436571223-10959-20-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. The clk.h include is being included in all
mxs files because it's part of mxs/clk.h even though nothing
actually requires it in that file. Move the clk.h include to the
C files that are actually using it and remove the clk.h include
from the header file. The clkdev.h include isn't used either, so
drop it too.

Cc: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mxs/clk-div.c   | 1 -
 drivers/clk/mxs/clk-frac.c  | 1 -
 drivers/clk/mxs/clk-imx23.c | 3 +--
 drivers/clk/mxs/clk-imx28.c | 2 +-
 drivers/clk/mxs/clk-pll.c   | 1 -
 drivers/clk/mxs/clk-ref.c   | 1 -
 drivers/clk/mxs/clk.h       | 3 ++-
 7 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mxs/clk-div.c b/drivers/clk/mxs/clk-div.c
index 90e1da93877e..049ee27d5a22 100644
--- a/drivers/clk/mxs/clk-div.c
+++ b/drivers/clk/mxs/clk-div.c
@@ -9,7 +9,6 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/mxs/clk-frac.c b/drivers/clk/mxs/clk-frac.c
index e6aa6b567d68..73f0240569ac 100644
--- a/drivers/clk/mxs/clk-frac.c
+++ b/drivers/clk/mxs/clk-frac.c
@@ -9,7 +9,6 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
diff --git a/drivers/clk/mxs/clk-imx23.c b/drivers/clk/mxs/clk-imx23.c
index 32216f9b7f03..f01876af6bb8 100644
--- a/drivers/clk/mxs/clk-imx23.c
+++ b/drivers/clk/mxs/clk-imx23.c
@@ -9,9 +9,8 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-#include <linux/clk.h>
 #include <linux/clk/mxs.h>
-#include <linux/clkdev.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/init.h>
diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index a68670868baa..6b572b759f9a 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -9,9 +9,9 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-#include <linux/clk.h>
 #include <linux/clk/mxs.h>
 #include <linux/clkdev.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/init.h>
diff --git a/drivers/clk/mxs/clk-pll.c b/drivers/clk/mxs/clk-pll.c
index fadae41833ec..d4ca79a868e0 100644
--- a/drivers/clk/mxs/clk-pll.c
+++ b/drivers/clk/mxs/clk-pll.c
@@ -9,7 +9,6 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/err.h>
diff --git a/drivers/clk/mxs/clk-ref.c b/drivers/clk/mxs/clk-ref.c
index 4adeed6c2f94..495f99b7965e 100644
--- a/drivers/clk/mxs/clk-ref.c
+++ b/drivers/clk/mxs/clk-ref.c
@@ -9,7 +9,6 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
diff --git a/drivers/clk/mxs/clk.h b/drivers/clk/mxs/clk.h
index f07d821dd75d..a4590956d2a2 100644
--- a/drivers/clk/mxs/clk.h
+++ b/drivers/clk/mxs/clk.h
@@ -12,7 +12,8 @@
 #ifndef __MXS_CLK_H
 #define __MXS_CLK_H
 
-#include <linux/clk.h>
+struct clk;
+
 #include <linux/clk-provider.h>
 #include <linux/spinlock.h>
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

