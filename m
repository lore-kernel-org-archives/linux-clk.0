Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: James Hogan <james.hogan@imgtec.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: divider: Fix clk_divider_round_rate() to use clk_readl()
Date: Fri, 12 Aug 2016 14:37:54 +0200
Message-Id: <1471005474-32301-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

clk-divider uses clk_readl()/clk_writel() everywhere, except in
clk_divider_round_rate(), where plain readl() is used. Change this to
clk_readl(), as it makes a difference on powerpc.

Fixes: e6d5e7d90be92cee ("clk-divider: Fix READ_ONLY when divider > 1")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Found by code inspection, untested on powerpc.
---
 drivers/clk/clk-divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index a0f55bc1ad3d277f..96386ffc84835f12 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -352,7 +352,7 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* if read only, just return current value */
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
-		bestdiv = readl(divider->reg) >> divider->shift;
+		bestdiv = clk_readl(divider->reg) >> divider->shift;
 		bestdiv &= div_mask(divider->width);
 		bestdiv = _get_div(divider->table, bestdiv, divider->flags,
 			divider->width);
-- 
1.9.1
