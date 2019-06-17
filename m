Return-Path: <SRS0=KwYV=UQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B146DC31E57
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 12:52:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8649A204EC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 12:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfFQMwm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jun 2019 08:52:42 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:56314 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQMwm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 08:52:42 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id Rosf2000f3XaVaC01osfCC; Mon, 17 Jun 2019 14:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0001rx-Il; Mon, 17 Jun 2019 14:52:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0003at-Hw; Mon, 17 Jun 2019 14:52:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] clk: renesas: rcar-gen3: Switch Z clocks to .determine_rate()
Date:   Mon, 17 Jun 2019 14:52:36 +0200
Message-Id: <20190617125238.13761-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125238.13761-1-geert+renesas@glider.be>
References: <20190617125238.13761-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  Hence switch the Z clocks on R-Car Gen3 from the old
.round_rate() callback to the newer .determine_rate() callback, which
does not suffer from this limitation.

This includes implementing range checking.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d25c8ba00a656841..2268f44ccb8fe9bc 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -114,18 +114,24 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 				     32 * zclk->fixed_div);
 }
 
-static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int cpg_z_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int min_mult, max_mult, mult;
 	unsigned long prate;
-	unsigned int mult;
 
-	prate = *parent_rate / zclk->fixed_div;
-	mult = div_u64(rate * 32ULL, prate);
-	mult = clamp(mult, 1U, 32U);
+	prate = req->best_parent_rate / zclk->fixed_div;
+	min_mult = max(div_u64(req->min_rate * 32ULL, prate), 1ULL);
+	max_mult = min(div_u64(req->max_rate * 32ULL, prate), 32ULL);
+	if (max_mult < min_mult)
+		return -EINVAL;
 
-	return (u64)prate * mult / 32;
+	mult = div_u64(req->rate * 32ULL, prate);
+	mult = clamp(mult, min_mult, max_mult);
+
+	req->rate = (u64)prate * mult / 32;
+	return 0;
 }
 
 static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -172,7 +178,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops cpg_z_clk_ops = {
 	.recalc_rate = cpg_z_clk_recalc_rate,
-	.round_rate = cpg_z_clk_round_rate,
+	.determine_rate = cpg_z_clk_determine_rate,
 	.set_rate = cpg_z_clk_set_rate,
 };
 
-- 
2.17.1

