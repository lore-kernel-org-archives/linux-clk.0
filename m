Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] clk: disable unused clk if enable_count == 0
Date: Thu,  7 Apr 2016 17:15:58 +0800
Message-Id: <1460020558-5152-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

If .is_enabled callback is not implemented, clk_core_is_enabled
will take software enable_count as enable status. If enable_count
is zero, .disable will not be called as software assume clock
is not enabled though clock may be booted with  free running state.
Disable the clock in this situation.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b4db67a..49c5934 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -220,7 +220,7 @@ static void clk_disable_unused_subtree(struct clk_core *core)
 	 * sequence.  call .disable_unused if available, otherwise fall
 	 * back to .disable
 	 */
-	if (clk_core_is_enabled(core)) {
+	if (clk_core_is_enabled(core) || !clk->enable_count) {
 		trace_clk_disable(core);
 		if (core->ops->disable_unused)
 			core->ops->disable_unused(core->hw);
-- 
1.9.1
