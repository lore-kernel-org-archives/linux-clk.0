Return-Path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH][clk-next] ARC: clk: fix spelling mistake: "configurarion" -> "configuration"
Date: Mon,  4 Sep 2017 10:37:50 +0100
Message-Id: <20170904093750.21755-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/clk-hsdk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
index bbf237173b37..c4ee280f454d 100644
--- a/drivers/clk/clk-hsdk-pll.c
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -139,7 +139,7 @@ static inline void hsdk_pll_set_cfg(struct hsdk_pll_clk *clk,
 	val |= cfg->odiv << CGU_PLL_CTRL_ODIV_SHIFT;
 	val |= cfg->band << CGU_PLL_CTRL_BAND_SHIFT;
 
-	dev_dbg(clk->dev, "write configurarion: %#x\n", val);
+	dev_dbg(clk->dev, "write configuration: %#x\n", val);
 
 	hsdk_pll_write(clk, CGU_PLL_CTRL, val);
 }
@@ -169,7 +169,7 @@ static unsigned long hsdk_pll_recalc_rate(struct clk_hw *hw,
 
 	val = hsdk_pll_read(clk, CGU_PLL_CTRL);
 
-	dev_dbg(clk->dev, "current configurarion: %#x\n", val);
+	dev_dbg(clk->dev, "current configuration: %#x\n", val);
 
 	/* Check if PLL is disabled */
 	if (val & CGU_PLL_CTRL_PD)
-- 
2.14.1
