Return-Path: <labbott@redhat.com>
Return-Path: <labbott@redhat.com>
From: Laura Abbott <labbott@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Loc Ho <lho@apm.com>
Cc: Laura Abbott <labbott@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: xgene: Don't call __pa on ioremaped address
Date: Thu, 27 Oct 2016 16:21:48 -0700
Message-Id: <1477610508-7449-1-git-send-email-labbott@redhat.com>
List-ID: <linux-clk.vger.kernel.org>


ioremaped addresses are not linearly mapped so the physical
address can not be figured out via __pa. More generally, there
is no guarantee that backing value of an ioremapped address
is a physical address at all. The value here is only used
for debugging so just drop the call to __pa on the ioremapped
address.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
Found while working on virt_to_phys debugging for arm64
---
 drivers/clk/clk-xgene.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 3433132..4697bf9 100644
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
 
@@ -269,7 +267,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
 		xgene_clk_write(data, pclk->param.csr_reg +
 					pclk->param.reg_csr_offset);
 		pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X mask 0x%08X value 0x%08X\n",
-			clk_hw_get_name(hw), &reg,
+			clk_hw_get_name(hw),
 			pclk->param.reg_csr_offset, pclk->param.reg_csr_mask,
 			data);
 	}
-- 
2.7.4
