Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:43464 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965572AbcBRBnL (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 17 Feb 2016 20:43:11 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2] clk: check the actual phase if get_phase is provided
Date: Thu, 18 Feb 2016 09:38:19 +0800
Message-Id: <1455759499-9622-1-git-send-email-shawn.lin@rock-chips.com>
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
if get_phase is provided. Another improvemnt by this patch is that
we can avoid to do unnecessary set_phase if the request defrees is
already there.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v2:
- remove actual_degree to simplify the changes
- bail early if nothing to to

 drivers/clk/clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b4db67a..275e70f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1902,6 +1902,10 @@ int clk_set_phase(struct clk *clk, int degrees)
 
 	clk_prepare_lock();
 
+	/* bail early if nothing to do */
+	if (degrees == clk->core->phase)
+		goto out;
+
 	trace_clk_set_phase(clk->core, degrees);
 
 	if (clk->core->ops->set_phase)
@@ -1909,9 +1913,13 @@ int clk_set_phase(struct clk *clk, int degrees)
 
 	trace_clk_set_phase_complete(clk->core, degrees);
 
-	if (!ret)
-		clk->core->phase = degrees;
+	if (!ret) {
+		if (clk->core->ops->get_phase)
+			degrees = clk->core->ops->get_phase(clk->core->hw);
 
+		clk->core->phase = degrees;
+	}
+out:
 	clk_prepare_unlock();
 
 	return ret;
-- 
2.3.7


