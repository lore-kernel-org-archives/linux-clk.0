Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chao Xie <chao.xie@marvell.com>
Subject: [PATCH 17/45] clk: mmp: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:15 -0700
Message-Id: <1436571223-10959-18-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver. The clkdev.h include isn't used either, so drop
it and add in slab.h to keep things compiling.

Cc: Chao Xie <chao.xie@marvell.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mmp/clk-apbc.c | 1 -
 drivers/clk/mmp/clk-apmu.c | 1 -
 drivers/clk/mmp/clk.c      | 3 +--
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/mmp/clk-apbc.c b/drivers/clk/mmp/clk-apbc.c
index 09d41c717c52..4c717db05f2d 100644
--- a/drivers/clk/mmp/clk-apbc.c
+++ b/drivers/clk/mmp/clk-apbc.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/delay.h>
diff --git a/drivers/clk/mmp/clk-apmu.c b/drivers/clk/mmp/clk-apmu.c
index cdcf2d7f321e..47b5542ce50f 100644
--- a/drivers/clk/mmp/clk-apmu.c
+++ b/drivers/clk/mmp/clk-apmu.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/delay.h>
diff --git a/drivers/clk/mmp/clk.c b/drivers/clk/mmp/clk.c
index cf038ef54c59..61893fe73251 100644
--- a/drivers/clk/mmp/clk.c
+++ b/drivers/clk/mmp/clk.c
@@ -1,7 +1,6 @@
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

