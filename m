Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:33225 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932256AbbHFKkF (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 6 Aug 2015 06:40:05 -0400
Received: by pabyb7 with SMTP id yb7so28013788pab.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2015 03:40:04 -0700 (PDT)
From: Rajan Vaja <rajan.vaja@gmail.com>
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com,
	ulrich.hecht+renesas@gmail.com, wsa+renesas@sang-engineering.com
Cc: linux-clk@vger.kernel.org
Subject: [PATCH] clk: shmobile: div6: Fix memory leaks in cpg_div6_clock_init()
Date: Thu,  6 Aug 2015 16:09:50 +0530
Message-Id: <1438857590-9605-1-git-send-email-rajan.vaja@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Found memory leak while doing static analysis with cppcheck:
[drivers/clk/shmobile/clk-div6.c:194]: (error) Memory leak: clock

This patch fixes this memory leak as well other memory leaks found
in same function.

Signed-off-by: Rajan Vaja <rajan.vaja@gmail.com>
---
 drivers/clk/shmobile/clk-div6.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/shmobile/clk-div6.c b/drivers/clk/shmobile/clk-div6.c
index 036a692..9affdfa 100644
--- a/drivers/clk/shmobile/clk-div6.c
+++ b/drivers/clk/shmobile/clk-div6.c
@@ -191,6 +191,7 @@ static void __init cpg_div6_clock_init(struct device_node *np)
 	if (num_parents < 1) {
 		pr_err("%s: no parent found for %s DIV6 clock\n",
 		       __func__, np->name);
+		kfree(clock);
 		return;
 	}
 
@@ -198,8 +199,12 @@ static void __init cpg_div6_clock_init(struct device_node *np)
 		GFP_KERNEL);
 	parent_names = kmalloc_array(num_parents, sizeof(*parent_names),
 				GFP_KERNEL);
-	if (!parent_names)
+	if (!clock->parents || !parent_names) {
+		kfree(clock->parents);
+		kfree(parent_names);
+		kfree(clock);
 		return;
+	}
 
 	/* Remap the clock register and read the divisor. Disabling the
 	 * clock overwrites the divisor, so we need to cache its value for the
@@ -278,6 +283,7 @@ static void __init cpg_div6_clock_init(struct device_node *np)
 error:
 	if (clock->reg)
 		iounmap(clock->reg);
+	kfree(clock->parents);
 	kfree(parent_names);
 	kfree(clock);
 }
-- 
1.7.9.5

