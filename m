Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49593 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752641AbdGMVHH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Jul 2017 17:07:07 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] clk: renesas: rcar-gen3: Fix error return code in cpg_sd_clock_recalc_rate
Date: Thu, 13 Jul 2017 23:06:56 +0200
Message-Id: <20170713210656.31911-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

In .recalc_rate of struct clk_ops, it is desirable to return 0 if an
error occurs, but -EINVAL is returned. This patch fixes it.

Fixes: 5b1defde7054 ("clk: renesas: cpg-mssr: Extract common R-Car Gen3 support code")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Totally valid patch forwarded from BSP.

 drivers/clk/renesas/rcar-gen3-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 3dee900522b703..e7371a8c4eb701 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -147,7 +147,7 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 			break;
 
 	if (i >= clock->div_num)
-		return -EINVAL;
+		return 0;
 
 	return DIV_ROUND_CLOSEST(rate, clock->div_table[i].div);
 }
-- 
2.11.0

