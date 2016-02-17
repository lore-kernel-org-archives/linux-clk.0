Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:39257 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756479AbcBQGZF (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 17 Feb 2016 01:25:05 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	shawn.lin@kernel-upstream.org, Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: check the actual phase if get_phase is provided
Date: Wed, 17 Feb 2016 14:20:36 +0800
Message-Id: <1455690036-28394-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

set_phase does sanity checking of degree and ask sub-driver
to set the degree. If set_phase is limited to support the
degree what the caller need, sub-driver may select a
approximate value and return success state. In this case, it's
inappropriate to assign the degree directly to clk->core->phase.
We should ask sub-driver to decide the strategy. If sub-driver just
want to support accurate degree, it can fail the set_phase. Otherwise,
store the actual degree provided by sub-driver into clk->core->phase
if get_phase is provided.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/clk.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b4db67a..352bdd2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1891,6 +1891,7 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
 int clk_set_phase(struct clk *clk, int degrees)
 {
 	int ret = -EINVAL;
+	int actual_phase;
 
 	if (!clk)
 		return 0;
@@ -1900,6 +1901,8 @@ int clk_set_phase(struct clk *clk, int degrees)
 	if (degrees < 0)
 		degrees += 360;
 
+	actual_phase = degrees;
+
 	clk_prepare_lock();
 
 	trace_clk_set_phase(clk->core, degrees);
@@ -1909,9 +1912,12 @@ int clk_set_phase(struct clk *clk, int degrees)
 
 	trace_clk_set_phase_complete(clk->core, degrees);
 
-	if (!ret)
-		clk->core->phase = degrees;
+	if (!ret) {
+		if (clk->core->ops->get_phase)
+			actual_phase = clk->core->ops->get_phase(clk->core->hw);
 
+		clk->core->phase = actual_phase;
+	}
 	clk_prepare_unlock();
 
 	return ret;
-- 
2.3.7


