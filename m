Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] clk: iproc: Fix PLL output frequency calculation
Date: Mon, 19 Oct 2015 15:27:19 -0700
Message-ID: <1445293639-5863-2-git-send-email-rjui@broadcom.com>
In-Reply-To: <1445293639-5863-1-git-send-email-rjui@broadcom.com>
References: <1445293639-5863-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

From: Simran Rai <ssimran@broadcom.com>

This patch affects the clocks that use fractional ndivider in their
PLL output frequency calculation. Instead of 2^20 divide factor, the
clock's ndiv integer shift was used. Fixed the bug by replacing ndiv
integer shift with 2^20 factor.

Signed-off-by: Simran Rai <ssimran@broadcom.com>
Signed-off-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
---
 drivers/clk/bcm/clk-iproc-pll.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
index 2dda4e8..d679ab8 100644
--- a/drivers/clk/bcm/clk-iproc-pll.c
+++ b/drivers/clk/bcm/clk-iproc-pll.c
@@ -345,8 +345,8 @@ static unsigned long iproc_pll_recalc_rate(struct clk_hw *hw,
 	struct iproc_pll *pll = clk->pll;
 	const struct iproc_pll_ctrl *ctrl = pll->ctrl;
 	u32 val;
-	u64 ndiv;
-	unsigned int ndiv_int, ndiv_frac, pdiv;
+	u64 ndiv, ndiv_int, ndiv_frac;
+	unsigned int pdiv;
 
 	if (parent_rate == 0)
 		return 0;
@@ -366,22 +366,19 @@ static unsigned long iproc_pll_recalc_rate(struct clk_hw *hw,
 	val = readl(pll->pll_base + ctrl->ndiv_int.offset);
 	ndiv_int = (val >> ctrl->ndiv_int.shift) &
 		bit_mask(ctrl->ndiv_int.width);
-	ndiv = (u64)ndiv_int << ctrl->ndiv_int.shift;
+	ndiv = ndiv_int << 20;
 
 	if (ctrl->flags & IPROC_CLK_PLL_HAS_NDIV_FRAC) {
 		val = readl(pll->pll_base + ctrl->ndiv_frac.offset);
 		ndiv_frac = (val >> ctrl->ndiv_frac.shift) &
 			bit_mask(ctrl->ndiv_frac.width);
-
-		if (ndiv_frac != 0)
-			ndiv = ((u64)ndiv_int << ctrl->ndiv_int.shift) |
-				ndiv_frac;
+		ndiv += ndiv_frac;
 	}
 
 	val = readl(pll->pll_base + ctrl->pdiv.offset);
 	pdiv = (val >> ctrl->pdiv.shift) & bit_mask(ctrl->pdiv.width);
 
-	clk->rate = (ndiv * parent_rate) >> ctrl->ndiv_int.shift;
+	clk->rate = (ndiv * parent_rate) >> 20;
 
 	if (pdiv == 0)
 		clk->rate *= 2;
-- 
1.9.1
