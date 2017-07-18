Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37585 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751363AbdGRQoL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Jul 2017 12:44:11 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/2] clk: renesas: rcar-gen3-cpg: drop superfluous variable
Date: Tue, 18 Jul 2017 18:44:06 +0200
Message-Id: <20170718164407.22998-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
References: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

'rate' is not used, so we can use 'parent_rate' directly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 3dee900522b703..71b8a986bd4889 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -135,7 +135,6 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned long rate = parent_rate;
 	u32 val, sd_fc;
 	unsigned int i;
 
@@ -149,7 +148,7 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 	if (i >= clock->div_num)
 		return -EINVAL;
 
-	return DIV_ROUND_CLOSEST(rate, clock->div_table[i].div);
+	return DIV_ROUND_CLOSEST(parent_rate, clock->div_table[i].div);
 }
 
 static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
-- 
2.11.0

