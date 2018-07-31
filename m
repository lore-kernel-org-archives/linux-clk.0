Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:48048 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbeGaHem (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 31 Jul 2018 03:34:42 -0400
From: Amit Daniel Kachhap <amit.kachhap@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Amit Daniel Kachhap <amit.kachhap@arm.com>
Subject: [PATCH] clk: scmi: Fix the rounding of clock rate
Date: Tue, 31 Jul 2018 11:25:55 +0530
Message-Id: <1533016555-3731-1-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <153296797329.17365.14490424418553594815@swboyd.mtv.corp.google.com>
References: <153296797329.17365.14490424418553594815@swboyd.mtv.corp.google.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This fix rounds the clock rate properly by using quotient and not
remainder in the calculation. This issue was found while testing HDMI
in the Juno platform.

Fixes: 6d6a1d82eaef7 ("clk: add support for clocks provided by SCMI")
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
---
 drivers/clk/clk-scmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index bb2a6f2..a985bf5 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -38,7 +38,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *parent_rate)
 {
-	int step;
 	u64 fmin, fmax, ftmp;
 	struct scmi_clk *clk = to_scmi_clk(hw);
 
@@ -60,9 +59,9 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	ftmp = rate - fmin;
 	ftmp += clk->info->range.step_size - 1; /* to round up */
-	step = do_div(ftmp, clk->info->range.step_size);
+	do_div(ftmp, clk->info->range.step_size);
 
-	return step * clk->info->range.step_size + fmin;
+	return ftmp * clk->info->range.step_size + fmin;
 }
 
 static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.7.4

