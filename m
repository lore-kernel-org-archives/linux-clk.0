Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Dong Aisheng <aisheng.dong@freescale.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/6] clk: Squash __clk_{enable,disable}() into callers
Date: Thu, 30 Apr 2015 17:14:17 -0700
Message-Id: <1430439261-10291-3-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
References: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

From: Dong Aisheng <aisheng.dong@freescale.com>

These functions are only used in one place. Let's squash them
into their respective callers to save some lines.

Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
[sboyd@codeaurora.org: Redo commit text, add NULL check in
clk_enable()]
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0b3c914db1ca..88439af5d032 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1023,14 +1023,6 @@ static void clk_core_disable(struct clk_core *core)
 	clk_core_disable(core->parent);
 }
 
-static void __clk_disable(struct clk *clk)
-{
-	if (!clk)
-		return;
-
-	clk_core_disable(clk->core);
-}
-
 /**
  * clk_disable - gate a clock
  * @clk: the clk being gated
@@ -1051,7 +1043,7 @@ void clk_disable(struct clk *clk)
 		return;
 
 	flags = clk_enable_lock();
-	__clk_disable(clk);
+	clk_core_disable(clk->core);
 	clk_enable_unlock(flags);
 }
 EXPORT_SYMBOL_GPL(clk_disable);
@@ -1089,14 +1081,6 @@ static int clk_core_enable(struct clk_core *core)
 	return 0;
 }
 
-static int __clk_enable(struct clk *clk)
-{
-	if (!clk)
-		return 0;
-
-	return clk_core_enable(clk->core);
-}
-
 /**
  * clk_enable - ungate a clock
  * @clk: the clk being ungated
@@ -1115,8 +1099,11 @@ int clk_enable(struct clk *clk)
 	unsigned long flags;
 	int ret;
 
+	if (!clk)
+		return 0;
+
 	flags = clk_enable_lock();
-	ret = __clk_enable(clk);
+	ret = clk_core_enable(clk->core);
 	clk_enable_unlock(flags);
 
 	return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
