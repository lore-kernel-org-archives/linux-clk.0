Return-Path: <labbott@redhat.com>
Return-Path: <labbott@redhat.com>
From: Laura Abbott <labbott@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Loc Ho <lho@apm.com>
Cc: Laura Abbott <labbott@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2] clk: xgene: Don't call __pa on ioremaped address
Date: Fri, 28 Oct 2016 09:59:38 -0700
Message-Id: <1477673978-15424-1-git-send-email-labbott@redhat.com>
List-ID: <linux-clk.vger.kernel.org>

ioremaped addresses are not linearly mapped so the physical
address can not be figured out via __pa. More generally, there
is no guarantee that backing value of an ioremapped address
is a physical address at all. The value here is only used
for debugging so just drop the call to __pa on the ioremapped
address.

Fixes: 6ae5fd381251 ("clk: xgene: Silence sparse warnings")
Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Fix up one more format string

I put the fixes tag to match with the cleanup that was done.
If there is interest in this fix for pre-4.2 kernels for
stable, I can submit a patch for that as well.
---
 drivers/clk/clk-xgene.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 3433132..1e67655 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -243,22 +243,20 @@ static int xgene_clk_enable(struct clk_hw *hw)
 	struct xgene_clk *pclk = to_xgene_clk(hw);
 	unsigned long flags = 0;
 	u32 data;
-	phys_addr_t reg;
 
 	if (pclk->lock)
 		spin_lock_irqsave(pclk->lock, flags);
 
 	if (pclk->param.csr_reg != NULL) {
 		pr_debug("%s clock enabled\n", clk_hw_get_name(hw));
-		reg = __pa(pclk->param.csr_reg);
 		/* First enable the clock */
 		data = xgene_clk_read(pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
 		data |= pclk->param.reg_clk_mask;
 		xgene_clk_write(data, pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
-		pr_debug("%s clock PADDR base %pa clk offset 0x%08X mask 0x%08X value 0x%08X\n",
-			clk_hw_get_name(hw), &reg,
+		pr_debug("%s clk offset 0x%08X mask 0x%08X value 0x%08X\n",
+			clk_hw_get_name(hw),
 			pclk->param.reg_clk_offset, pclk->param.reg_clk_mask,
 			data);
 
@@ -268,8 +266,8 @@ static int xgene_clk_enable(struct clk_hw *hw)
 		data &= ~pclk->param.reg_csr_mask;
 		xgene_clk_write(data, pclk->param.csr_reg +
 					pclk->param.reg_csr_offset);
-		pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X mask 0x%08X value 0x%08X\n",
-			clk_hw_get_name(hw), &reg,
+		pr_debug("%s csr offset 0x%08X mask 0x%08X value 0x%08X\n",
+			clk_hw_get_name(hw),
 			pclk->param.reg_csr_offset, pclk->param.reg_csr_mask,
 			data);
 	}
-- 
2.7.4
