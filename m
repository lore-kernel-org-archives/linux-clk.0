Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFC 1/2] clk: renesas: r8a7795: Improve the calculated value of Clock.
Date: Mon,  8 Aug 2016 02:58:11 +0900
Message-Id: <1470592692-3486-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1470592692-3486-1-git-send-email-ykaneko0929@gmail.com>
References: <1470592692-3486-1-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Dien Pham <dien.pham.ry@rvc.renesas.com>

This patch improves the calculated value of Z Clock when odd frequency
(as 33.33 MHz) is inputted.

Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/clk/renesas/clk-rcar-gen2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 00e6aba..7519f71 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -65,7 +65,8 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 	    >> CPG_FRQCRC_ZFC_SHIFT;
 	mult = 32 - val;
 
-	return div_u64((u64)parent_rate * mult, 32);
+	/* Add 1/2 to reduce the math error that raises by math rounding */
+	return div_u64((u64)parent_rate * mult + 16, 32);
 }
 
 static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -77,7 +78,7 @@ static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (!prate)
 		prate = 1;
 
-	mult = div_u64((u64)rate * 32, prate);
+	mult = div_u64((u64)rate * 32 + prate / 2, prate);
 	mult = clamp(mult, 1U, 32U);
 
 	return *parent_rate / 32 * mult;
@@ -91,7 +92,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 val, kick;
 	unsigned int i;
 
-	mult = div_u64((u64)rate * 32, parent_rate);
+	mult = div_u64((u64)rate * 32 + parent_rate / 2, parent_rate);
 	mult = clamp(mult, 1U, 32U);
 
 	if (clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
-- 
1.9.1
