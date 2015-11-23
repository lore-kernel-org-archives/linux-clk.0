Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] clk: qoriq: fix memory leak
Date: Mon, 23 Nov 2015 15:36:50 +0530
Message-Id: <1448273210-8200-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

If get_pll_div() fails we exited by returning NULL but we missed
releasing hwc.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/clk/clk-qoriq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 1ab0fb8..7bc1c45 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -778,8 +778,10 @@ static struct clk * __init create_one_cmux(struct clockgen *cg, int idx)
 	 */
 	clksel = (cg_in(cg, hwc->reg) & CLKSEL_MASK) >> CLKSEL_SHIFT;
 	div = get_pll_div(cg, hwc, clksel);
-	if (!div)
+	if (!div) {
+		kfree(hwc);
 		return NULL;
+	}
 
 	pct80_rate = clk_get_rate(div->clk);
 	pct80_rate *= 8;
-- 
1.9.1
