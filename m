Return-Path: <Govindraj.Raja@imgtec.com>
From: Govindraj Raja <govindraj.raja@imgtec.com>
To: <linux-mips@linux-mips.org>, <linux-clk@vger.kernel.org>, Mike Turquette
	<mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "Michael
 Turquette" <mturquette@baylibre.com>
CC: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee
	<cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, "Andrew
 Bresticker" <abrestic@chromium.org>, James Hartley
	<James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan
	<James.Hogan@imgtec.com>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
	Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH 2/6] clk: pistachio: Fix override of clk-pll settings from boot loader
Date: Thu, 6 Aug 2015 14:43:30 +0100
Message-ID: <1438868614-7672-3-git-send-email-govindraj.raja@imgtec.com>
In-Reply-To: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
References: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>

Pll enable callbacks are overriding PLL mode (int/frac) and
Noise reduction (on/off) settings set by the boot loader which
results in the incorrect clock rate.

PLL mode and noise reduction are defined by the DSMPD and DACPD bits
of the pll control register. Pll .enable() callbacks enable pll
by deasserting all power-down bits of the pll control register,
including DSMPD and DACPD bits, which is not necessary since
these bits don't actually enable/disable pll.

This commit fixes the problem by removing DSMPD and DACPD bits
from the "pll enable" mask.

Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
---
 drivers/clk/pistachio/clk-pll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pll.c b/drivers/clk/pistachio/clk-pll.c
index 68066ef..9a38a2b 100644
--- a/drivers/clk/pistachio/clk-pll.c
+++ b/drivers/clk/pistachio/clk-pll.c
@@ -134,8 +134,7 @@ static int pll_gf40lp_frac_enable(struct clk_hw *hw)
 	u32 val;
 
 	val = pll_readl(pll, PLL_CTRL3);
-	val &= ~(PLL_FRAC_CTRL3_PD | PLL_FRAC_CTRL3_DACPD |
-		 PLL_FRAC_CTRL3_DSMPD | PLL_FRAC_CTRL3_FOUTPOSTDIVPD |
+	val &= ~(PLL_FRAC_CTRL3_PD | PLL_FRAC_CTRL3_FOUTPOSTDIVPD |
 		 PLL_FRAC_CTRL3_FOUT4PHASEPD | PLL_FRAC_CTRL3_FOUTVCOPD);
 	pll_writel(pll, val, PLL_CTRL3);
 
@@ -277,7 +276,7 @@ static int pll_gf40lp_laint_enable(struct clk_hw *hw)
 	u32 val;
 
 	val = pll_readl(pll, PLL_CTRL1);
-	val &= ~(PLL_INT_CTRL1_PD | PLL_INT_CTRL1_DSMPD |
+	val &= ~(PLL_INT_CTRL1_PD |
 		 PLL_INT_CTRL1_FOUTPOSTDIVPD | PLL_INT_CTRL1_FOUTVCOPD);
 	pll_writel(pll, val, PLL_CTRL1);
 
-- 
1.9.1
