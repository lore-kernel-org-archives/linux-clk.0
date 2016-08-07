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
Subject: [PATCH/RFC 2/2] clk: renesas: r8a7795: Do rounding for calculated frequency value
Date: Mon,  8 Aug 2016 02:58:12 +0900
Message-Id: <1470592692-3486-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1470592692-3486-1-git-send-email-ykaneko0929@gmail.com>
References: <1470592692-3486-1-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Dien Pham <dien.pham.ry@rvc.renesas.com>

The calculation value has some errors after some calculation,
especially, when one of the input value is odd value.
This patch applies rounding to closest frequency at 100Mhz unit.

Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/clk/renesas/clk-rcar-gen2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 7519f71..5c4dcc7 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -60,13 +60,16 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 	struct cpg_z_clk *zclk = to_z_clk(hw);
 	unsigned int mult;
 	unsigned int val;
+	unsigned long rate;
 
 	val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
 	    >> CPG_FRQCRC_ZFC_SHIFT;
 	mult = 32 - val;
 
-	/* Add 1/2 to reduce the math error that raises by math rounding */
-	return div_u64((u64)parent_rate * mult + 16, 32);
+	rate = div_u64((u64)parent_rate * mult + 16, 32);
+	/* Round to closest value at 100MHz unit */
+	rate = 100000000 * DIV_ROUND_CLOSEST(rate, 100000000);
+	return rate;
 }
 
 static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-- 
1.9.1
