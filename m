Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5950C43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DE182087C
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbfC0Mbh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:31:37 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:49534 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbfC0Mbg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 08:31:36 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id t0Xa1z00T3XaVaC010Xaud; Wed, 27 Mar 2019 13:31:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97iQ-0000vC-Ml; Wed, 27 Mar 2019 13:31:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97iQ-00024y-Kh; Wed, 27 Mar 2019 13:31:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate() return value
Date:   Wed, 27 Mar 2019 13:31:33 +0100
Message-Id: <20190327123133.7949-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

cpg_sd_clock_round_rate() may return an unsupported clock rate for the
requested clock rate. Therefore, when cpg_sd_clock_set_rate() sets the
clock rate acquired by cpg_sd_clock_round_rate(), an error may occur.

This is not conform the clk API design.

This patch fixes that by making sure cpg_sd_clock_calc_div() considers
only the division values defined in cpg_sd_div_table[].
With this fix, the cpg_sd_clock_round_rate() always return a support
clock rate.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Fixes: 90c073e53909da85 ("clk: shmobile: r8a7795: Add SD divider support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.2.

 drivers/clk/renesas/rcar-gen3-cpg.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d5fb768b089ff1c1..d2745c57207efc01 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -3,6 +3,7 @@
  * R-Car Gen3 Clock Pulse Generator
  *
  * Copyright (C) 2015-2018 Glider bvba
+ * Copyright (C) 2019 Renesas Electronics Corp.
  *
  * Based on clk-rcar-gen3.c
  *
@@ -236,8 +237,6 @@ struct sd_clock {
 	const struct sd_div_table *div_table;
 	struct cpg_simple_notifier csn;
 	unsigned int div_num;
-	unsigned int div_min;
-	unsigned int div_max;
 	unsigned int cur_div_idx;
 };
 
@@ -314,14 +313,20 @@ static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
 					  unsigned long rate,
 					  unsigned long parent_rate)
 {
-	unsigned int div;
-
-	if (!rate)
-		rate = 1;
+	unsigned long calc_rate, best_rate = 0, diff, diff_min = ULONG_MAX;
+	unsigned int i;
 
-	div = DIV_ROUND_CLOSEST(parent_rate, rate);
+	for (i = 0; i < clock->div_num; i++) {
+		calc_rate = DIV_ROUND_CLOSEST(parent_rate,
+					      clock->div_table[i].div);
+		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
+		if (diff <= diff_min) {
+			best_rate = calc_rate;
+			diff_min = diff;
+		}
+	}
 
-	return clamp_t(unsigned int, div, clock->div_min, clock->div_max);
+	return DIV_ROUND_CLOSEST(parent_rate, best_rate);
 }
 
 static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -405,13 +410,6 @@ static struct clk * __init cpg_sd_clk_register(const char *name,
 	val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
 	writel(val, clock->csn.reg);
 
-	clock->div_max = clock->div_table[0].div;
-	clock->div_min = clock->div_max;
-	for (i = 1; i < clock->div_num; i++) {
-		clock->div_max = max(clock->div_max, clock->div_table[i].div);
-		clock->div_min = min(clock->div_min, clock->div_table[i].div);
-	}
-
 	clk = clk_register(NULL, &clock->hw);
 	if (IS_ERR(clk))
 		goto free_clock;
-- 
2.17.1

