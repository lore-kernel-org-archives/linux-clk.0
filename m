Return-Path: <fabio.estevam@nxp.com>
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <geert@linux-m68k.org>, <festevam@gmail.com>,
	<linux-clk@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2] clk: Print the clock name and warning cause
Date: Tue, 16 Jan 2018 10:50:34 -0200
Message-ID: <1516107034-6600-1-git-send-email-fabio.estevam@nxp.com>
Return-Path: fabio.estevam@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

When getting the clock related warnings, it is useful to know what
is the clock name that is causing the problem and the cause of the
problem.

Add the clock name and the the warning cause to the log, so that the
output becomes clearer like this:

[    2.383969] ------------[ cut here ]------------
[    2.388720] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:814 clk_core_disable+0xd4/0xf8
[    2.396658] uart4_ipg_gate already disabled

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Also add the warning cause (Geert)

 drivers/clk/clk.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0f686a9..c95dc09 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -548,7 +548,8 @@ static void clk_core_rate_unprotect(struct clk_core *core)
 	if (!core)
 		return;
 
-	if (WARN_ON(core->protect_count == 0))
+	if (WARN(core->protect_count == 0,
+	    "%s already unprotected\n", core->name))
 		return;
 
 	if (--core->protect_count > 0)
@@ -681,16 +682,18 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (!core)
 		return;
 
-	if (WARN_ON(core->prepare_count == 0))
+	if (WARN(core->prepare_count == 0,
+	    "%s already unprepared\n", core->name))
 		return;
 
-	if (WARN_ON(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL))
+	if (WARN(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL,
+	    "Unpreparing critical %s\n", core->name))
 		return;
 
 	if (--core->prepare_count > 0)
 		return;
 
-	WARN_ON(core->enable_count > 0);
+	WARN(core->enable_count > 0, "Unpreparing enabled %s\n", core->name);
 
 	trace_clk_unprepare(core);
 
@@ -808,10 +811,11 @@ static void clk_core_disable(struct clk_core *core)
 	if (!core)
 		return;
 
-	if (WARN_ON(core->enable_count == 0))
+	if (WARN(core->enable_count == 0, "%s already disabled\n", core->name))
 		return;
 
-	if (WARN_ON(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL))
+	if (WARN(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL,
+	    "Disabling critical %s\n", core->name))
 		return;
 
 	if (--core->enable_count > 0)
@@ -866,7 +870,8 @@ static int clk_core_enable(struct clk_core *core)
 	if (!core)
 		return 0;
 
-	if (WARN_ON(core->prepare_count == 0))
+	if (WARN(core->prepare_count == 0,
+	    "Enabling unprepared %s\n", core->name))
 		return -ESHUTDOWN;
 
 	if (core->enable_count == 0) {
-- 
2.7.4
