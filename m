Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: rcar-gen3: Fix error return code in cpg_sd_clock_recalc_rate
Date: Thu, 20 Apr 2017 02:46:33 +0900
Message-Id: <1492624001-3758-13-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

In .recalc_rate of struct clk_ops, it is desirable to return 0 if an
error occurs, but -EINVAL is returned. This patch fixes it.

Fixes: 5b1defde7054 ("clk: renesas: cpg-mssr: Extract common R-Car Gen3 support code")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/rcar-gen3-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 4ab76b1..48c6e98 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -287,7 +287,7 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 			break;
 
 	if (i >= clock->div_num)
-		return -EINVAL;
+		return 0;
 
 	return DIV_ROUND_CLOSEST(rate, clock->div_table[i].div);
 }
-- 
1.9.1
