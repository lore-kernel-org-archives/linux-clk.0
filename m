Return-Path: <aisheng.dong@nxp.com>
From: Dong Aisheng <aisheng.dong@nxp.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@baylibre.com>, <shawnguo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <aisheng.dong@nxp.com>,
	<anson.huang@nxp.com>
Subject: [PATCH 01/11] clk: imx: clk-pllv3: fix incorrect handle of enet powerdown bit
Date: Wed, 8 Jun 2016 22:33:30 +0800
Message-ID: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
Return-Path: aisheng.dong@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

After commit f53947456f98 ("ARM: clk: imx: update pllv3 to support imx7"),
the former used BM_PLL_POWER bit is not correct anymore for IMX7 ENET.
Instead, pll->powerdown holds the correct bit, so using powerdown bit
in clk_pllv3_{prepare | unprepare} functions.

Fixes: f53947456f98 ("ARM: clk: imx: update pllv3 to support imx7")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-pllv3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index 4826b3c9e19e..44d294a336f0 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -77,9 +77,9 @@ static int clk_pllv3_prepare(struct clk_hw *hw)
 
 	val = readl_relaxed(pll->base);
 	if (pll->powerup_set)
-		val |= BM_PLL_POWER;
+		val |= pll->powerdown;
 	else
-		val &= ~BM_PLL_POWER;
+		val &= ~pll->powerdown;
 	writel_relaxed(val, pll->base);
 
 	return clk_pllv3_wait_lock(pll);
@@ -92,9 +92,9 @@ static void clk_pllv3_unprepare(struct clk_hw *hw)
 
 	val = readl_relaxed(pll->base);
 	if (pll->powerup_set)
-		val &= ~BM_PLL_POWER;
+		val &= ~pll->powerdown;
 	else
-		val |= BM_PLL_POWER;
+		val |= pll->powerdown;
 	writel_relaxed(val, pll->base);
 }
 
-- 
1.9.1
