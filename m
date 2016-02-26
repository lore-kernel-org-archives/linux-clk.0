Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:41809 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752807AbcBZBcC (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2016 20:32:02 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: skip unnecessary set_phase if nothing to do
Date: Fri, 26 Feb 2016 09:25:52 +0800
Message-Id: <1456449952-27551-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Let's compare the degrees from clk_set_rate with
clk->core->phase. If the requested drgrees is already
there, skip the following steps.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/clk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b4db67a..549fdb8 100644
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
@@ -1912,6 +1916,7 @@ int clk_set_phase(struct clk *clk, int degrees)
 	if (!ret)
 		clk->core->phase = degrees;
 
+out:
 	clk_prepare_unlock();
 
 	return ret;
-- 
2.3.7


