Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/4] clk: Fix debugfs_create_*() usage
Date: Wed,  3 Jan 2018 12:06:17 +0100
Message-Id: <1514977577-11854-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

When exposing data access through debugfs, the correct
debugfs_create_*() functions must be used, matching the data types.

Remove all casts from data pointers passed to debugfs_create_*()
functions, as such casts prevent the compiler from flagging bugs.

clk_core.rate and .accuracy are "unsigned long", hence casting their
addresses to "u32 *" exposed the wrong halves on big-endian 64-bit
systems.  Fix this by using debugfs_create_ulong() instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix .flags differently in a separate patch,
  - Split off of_clk_detect_critical() comment update into a separate
    patch.
---
 drivers/clk/clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7cb5143c654cd78f..972dd05dbf5558b5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2650,18 +2650,16 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 
 	core->dentry = d;
 
-	d = debugfs_create_u32("clk_rate", 0444, core->dentry,
-			(u32 *)&core->rate);
+	d = debugfs_create_ulong("clk_rate", 0444, core->dentry, &core->rate);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_accuracy", 0444, core->dentry,
-			(u32 *)&core->accuracy);
+	d = debugfs_create_ulong("clk_accuracy", 0444, core->dentry,
+				 &core->accuracy);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_phase", 0444, core->dentry,
-			(u32 *)&core->phase);
+	d = debugfs_create_u32("clk_phase", 0444, core->dentry, &core->phase);
 	if (!d)
 		goto err_out;
 
@@ -2671,22 +2669,22 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_prepare_count", 0444, core->dentry,
-			(u32 *)&core->prepare_count);
+			       &core->prepare_count);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_enable_count", 0444, core->dentry,
-			(u32 *)&core->enable_count);
+			       &core->enable_count);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_protect_count", 0444, core->dentry,
-			(u32 *)&core->protect_count);
+			       &core->protect_count);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_notifier_count", 0444, core->dentry,
-			(u32 *)&core->notifier_count);
+			       &core->notifier_count);
 	if (!d)
 		goto err_out;
 
-- 
2.7.4
