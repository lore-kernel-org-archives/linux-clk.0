Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FB4C10F00
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 07:09:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EA2E20700
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 07:09:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfDBHJC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 03:09:02 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:33858 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfDBHJC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Apr 2019 03:09:02 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id vK8x1z00F3XaVaC01K8xtl; Tue, 02 Apr 2019 09:08:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBDXV-000065-8b; Tue, 02 Apr 2019 09:08:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBDXV-0007JP-6A; Tue, 02 Apr 2019 09:08:57 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Simon Horman <horms@verge.net.au>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate() return value
Date:   Tue,  2 Apr 2019 09:08:56 +0200
Message-Id: <20190402070856.28066-1-geert+renesas@glider.be>
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
v2:
  - Use "<" instead of "<=" to use first match (doesn't matter, though,
    but is more aligned with the behavior of cpg_sd_clock_calc_div()),
  - Keep best_div instead of best_rate, to avoid extra
    DIV_ROUND_CLOSEST().
---
To be queued in clk-renesas-for-v5.2.

 drivers/clk/renesas/rcar-gen3-cpg.c | 30 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d5fb768b089ff1c1..dc62ed0dadc2b871 100644
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
-
-	div = DIV_ROUND_CLOSEST(parent_rate, rate);
+	unsigned long calc_rate, diff, diff_min = ULONG_MAX;
+	unsigned int i, best_div = 0;
+
+	for (i = 0; i < clock->div_num; i++) {
+		calc_rate = DIV_ROUND_CLOSEST(parent_rate,
+					      clock->div_table[i].div);
+		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
+		if (diff < diff_min) {
+			best_div = clock->div_table[i].div;
+			diff_min = diff;
+		}
+	}
 
-	return clamp_t(unsigned int, div, clock->div_min, clock->div_max);
+	return best_div;
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

