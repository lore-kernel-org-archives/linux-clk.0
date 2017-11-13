Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47818 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753121AbdKMP2C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Nov 2017 10:28:02 -0500
From: Brian Starkey <brian.starkey@arm.com>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, sudeep.holla@arm.com
Subject: [PATCH] clk: versatile: Remove WARNs in ->round_rate()
Date: Mon, 13 Nov 2017 15:27:51 +0000
Message-Id: <1510586871-27478-1-git-send-email-brian.starkey@arm.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

clk_round_rate() is intended to be used to round a given clock rate to
the closest one achievable by the actual clock. This implies that the
input to clk_round_rate() is expected to be unachievable - and such
cases shouldn't be treated as exceptional.

To reflect this, remove the WARN_ONs which trigger when an unachievable
clock rate is passed to vexpress_osc_round_rate().

Reported-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Brian Starkey <brian.starkey@arm.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/clk/versatile/clk-vexpress-osc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
index e7a868b83fe5..59703d569d49 100644
--- a/drivers/clk/versatile/clk-vexpress-osc.c
+++ b/drivers/clk/versatile/clk-vexpress-osc.c
@@ -44,10 +44,10 @@ static long vexpress_osc_round_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct vexpress_osc *osc = to_vexpress_osc(hw);
 
-	if (WARN_ON(osc->rate_min && rate < osc->rate_min))
+	if (osc->rate_min && rate < osc->rate_min)
 		rate = osc->rate_min;
 
-	if (WARN_ON(osc->rate_max && rate > osc->rate_max))
+	if (osc->rate_max && rate > osc->rate_max)
 		rate = osc->rate_max;
 
 	return rate;
-- 
1.9.1

