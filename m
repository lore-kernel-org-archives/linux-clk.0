Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33967 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753332AbbGJXdv (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jul 2015 19:33:51 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Barry Song <Baohua.Song@csr.com>
Subject: [PATCH 23/45] clk: sirf: Properly include clk.h
Date: Fri, 10 Jul 2015 16:33:21 -0700
Message-Id: <1436571223-10959-24-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Move the include of clk.h into
clk-common.c because that's the only file that's really using
clk.h, even if it's included into the atlas6 and prima2 files.

Cc: Barry Song <Baohua.Song@csr.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sirf/clk-atlas6.c | 1 -
 drivers/clk/sirf/clk-common.c | 2 ++
 drivers/clk/sirf/clk-prima2.c | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sirf/clk-atlas6.c b/drivers/clk/sirf/clk-atlas6.c
index d63b76ca60c3..c5eaa9d16247 100644
--- a/drivers/clk/sirf/clk-atlas6.c
+++ b/drivers/clk/sirf/clk-atlas6.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/sirf/clk-common.c b/drivers/clk/sirf/clk-common.c
index 9fc285d784d3..2f64d4beeb52 100644
--- a/drivers/clk/sirf/clk-common.c
+++ b/drivers/clk/sirf/clk-common.c
@@ -7,6 +7,8 @@
  * Licensed under GPLv2 or later.
  */
 
+#include <linux/clk.h>
+
 #define KHZ     1000
 #define MHZ     (KHZ * KHZ)
 
diff --git a/drivers/clk/sirf/clk-prima2.c b/drivers/clk/sirf/clk-prima2.c
index 6968e2ebcd8a..f92c40264342 100644
--- a/drivers/clk/sirf/clk-prima2.c
+++ b/drivers/clk/sirf/clk-prima2.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/io.h>
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

