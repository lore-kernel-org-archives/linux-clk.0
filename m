Return-Path: <Aisheng.Dong@freescale.com>
From: Dong Aisheng <aisheng.dong@freescale.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@linaro.org>, <shawn.guo@linaro.org>, <b29396@freescale.com>,
	<linux-arm-kernel@lists.infradead.org>, <Ranjani.Vaidyanathan@freescale.com>,
	<b20596@freescale.com>, <r64343@freescale.com>, <b20788@freescale.com>
Subject: [PATCH RFC v1 3/5] clk: remove unneeded __clk_enable and __clk_disable
Date: Wed, 15 Apr 2015 22:26:37 +0800
Message-ID: <1429107999-24413-4-git-send-email-aisheng.dong@freescale.com>
In-Reply-To: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com>
References: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com>
Return-Path: aisheng.dong@freescale.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The only thing __clk_enable/__clk_disable does is NULL pointer checking
of clk except calling clk_core_{enable|disable} which is already handled
by clk_core_{enable|disable}.
So remove this unneeded function.

Cc: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
---
 drivers/clk/clk.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 492644f..7af553d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1023,14 +1023,6 @@ static void clk_core_disable(struct clk_core *clk)
 	clk_core_disable(clk->parent);
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
@@ -1089,14 +1081,6 @@ static int clk_core_enable(struct clk_core *clk)
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
@@ -1116,7 +1100,7 @@ int clk_enable(struct clk *clk)
 	int ret;
 
 	flags = clk_enable_lock();
-	ret = __clk_enable(clk);
+	ret = clk_core_enable(clk->core);
 	clk_enable_unlock(flags);
 
 	return ret;
-- 
1.9.1
