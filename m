Return-Path: <fabio.estevam@nxp.com>
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <geert@linux-m68k.org>, <festevam@gmail.com>,
	<linux-clk@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] clk: Print the clock name in the warnings
Date: Tue, 16 Jan 2018 10:42:09 -0200
Message-ID: <1516106529-19703-1-git-send-email-fabio.estevam@nxp.com>
Return-Path: fabio.estevam@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

When getting the clock related warnings, it is useful to know what
is the clock name that is causing the problem.

Add it to the warning message, so that the output becomes clearer
like this:

[    2.388129] ------------[ cut here ]------------
[    2.392883] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:812 clk_core_disable+0xd4/0xec
[    2.400822] clock name: uart4_ipg_gate
...

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/clk/clk.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0f686a9..42dbb1f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -548,7 +548,7 @@ static void clk_core_rate_unprotect(struct clk_core *core)
 	if (!core)
 		return;
 
-	if (WARN_ON(core->protect_count == 0))
+	if (WARN(core->protect_count == 0, "clock name: %s\n", core->name))
 		return;
 
 	if (--core->protect_count > 0)
@@ -681,16 +681,17 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (!core)
 		return;
 
-	if (WARN_ON(core->prepare_count == 0))
+	if (WARN(core->prepare_count == 0, "clock name: %s\n", core->name))
 		return;
 
-	if (WARN_ON(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL))
+	if (WARN(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL,
+	    "clock name: %s\n", core->name))
 		return;
 
 	if (--core->prepare_count > 0)
 		return;
 
-	WARN_ON(core->enable_count > 0);
+	WARN(core->enable_count > 0, "clock name: %s\n", core->name);
 
 	trace_clk_unprepare(core);
 
@@ -808,10 +809,11 @@ static void clk_core_disable(struct clk_core *core)
 	if (!core)
 		return;
 
-	if (WARN_ON(core->enable_count == 0))
+	if (WARN(core->enable_count == 0, "clock name: %s\n", core->name))
 		return;
 
-	if (WARN_ON(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL))
+	if (WARN(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL,
+	    "clock name: %s\n", core->name))
 		return;
 
 	if (--core->enable_count > 0)
@@ -866,7 +868,7 @@ static int clk_core_enable(struct clk_core *core)
 	if (!core)
 		return 0;
 
-	if (WARN_ON(core->prepare_count == 0))
+	if (WARN(core->prepare_count == 0, "clock name: %s\n", core->name))
 		return -ESHUTDOWN;
 
 	if (core->enable_count == 0) {
-- 
2.7.4
