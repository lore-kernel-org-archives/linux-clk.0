Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] clk-xgene: Adjust six checks for null pointers
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Loc Ho <lho@apm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
Message-ID: <c7cfc7bc-8457-1e6b-421d-6c4f0b5149a6@users.sourceforge.net>
Date: Tue, 26 Sep 2017 21:42:22 +0200
MIME-Version: 1.0
In-Reply-To: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 21:27:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-xgene.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 3cc84a65f686..531b030d4d4e 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -189,7 +189,7 @@ static void xgene_pllclk_init(struct device_node *np, enum xgene_pll_type pll_ty
 	int version = xgene_pllclk_version(np);
 
 	reg = of_iomap(np, 0);
-	if (reg == NULL) {
+	if (!reg) {
 		pr_err("Unable to map CSR register for %pOF\n", np);
 		return;
 	}
@@ -465,7 +465,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
 	if (pclk->lock)
 		spin_lock_irqsave(pclk->lock, flags);
 
-	if (pclk->param.csr_reg != NULL) {
+	if (pclk->param.csr_reg) {
 		pr_debug("%s clock enabled\n", clk_hw_get_name(hw));
 		/* First enable the clock */
 		data = xgene_clk_read(pclk->param.csr_reg +
@@ -505,7 +505,7 @@ static void xgene_clk_disable(struct clk_hw *hw)
 	if (pclk->lock)
 		spin_lock_irqsave(pclk->lock, flags);
 
-	if (pclk->param.csr_reg != NULL) {
+	if (pclk->param.csr_reg) {
 		pr_debug("%s clock disabled\n", clk_hw_get_name(hw));
 		/* First put the CSR in reset */
 		data = xgene_clk_read(pclk->param.csr_reg +
@@ -531,7 +531,7 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)
 	struct xgene_clk *pclk = to_xgene_clk(hw);
 	u32 data = 0;
 
-	if (pclk->param.csr_reg != NULL) {
+	if (pclk->param.csr_reg) {
 		pr_debug("%s clock checking\n", clk_hw_get_name(hw));
 		data = xgene_clk_read(pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
@@ -540,7 +540,7 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)
 							"disabled");
 	}
 
-	if (pclk->param.csr_reg == NULL)
+	if (!pclk->param.csr_reg)
 		return 1;
 	return data & pclk->param.reg_clk_mask ? 1 : 0;
 }
@@ -705,7 +705,7 @@ static void __init xgene_devclk_init(struct device_node *np)
 			break;
 		}
 		map_res = of_iomap(np, i);
-		if (map_res == NULL) {
+		if (!map_res) {
 			pr_err("Unable to map resource %d for %pOF\n", i, np);
 			goto err;
 		}
-- 
2.14.1
