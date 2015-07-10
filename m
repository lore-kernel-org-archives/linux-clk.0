Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33959 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753046AbbGJXds (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jul 2015 19:33:48 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Bintian Wang <bintian.wang@huawei.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: [PATCH 13/45] clk: hisilicon: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:11 -0700
Message-Id: <1436571223-10959-14-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver. Also drop the clkdev.h include in files that
aren't using it.

Cc: Bintian Wang <bintian.wang@huawei.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/hisilicon/clk-hi3620.c        | 2 --
 drivers/clk/hisilicon/clk-hip04.c         | 2 --
 drivers/clk/hisilicon/clk.c               | 3 +--
 drivers/clk/hisilicon/clkgate-separated.c | 2 --
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index 715d34a5ef9b..5502803a391e 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -25,13 +25,11 @@
 
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/hi3620-clock.h>
 
diff --git a/drivers/clk/hisilicon/clk-hip04.c b/drivers/clk/hisilicon/clk-hip04.c
index 132b57a0ce09..8ca967308343 100644
--- a/drivers/clk/hisilicon/clk-hip04.c
+++ b/drivers/clk/hisilicon/clk-hip04.c
@@ -24,13 +24,11 @@
 
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/hip04-clock.h>
 
diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index c90a89739b03..155e2e6c8316 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -24,15 +24,14 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
-#include <linux/clk.h>
 
 #include "clk.h"
 
diff --git a/drivers/clk/hisilicon/clkgate-separated.c b/drivers/clk/hisilicon/clkgate-separated.c
index b03d5a7246f9..a47812f56a17 100644
--- a/drivers/clk/hisilicon/clkgate-separated.c
+++ b/drivers/clk/hisilicon/clkgate-separated.c
@@ -25,10 +25,8 @@
 
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/slab.h>
-#include <linux/clk.h>
 
 #include "clk.h"
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

