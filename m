Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 17/19] clk: xgene: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:54 -0700
Message-Id: <1430897996-11597-18-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/clk-xgene.c:77:43: warning: incorrect type in argument 1 (different address spaces)
drivers/clk/clk-xgene.c:77:43:    expected void *csr
drivers/clk/clk-xgene.c:77:43:    got void [noderef] <asn:2>*
...
drivers/clk/clk-xgene.c: In function ‘xgene_clk_enable’:
drivers/clk/clk-xgene.c:237:3: warning: format ‘%LX’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘phys_addr_t’ [-Wformat]
drivers/clk/clk-xgene.c:248:3: warning: format ‘%LX’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘phys_addr_t’ [-Wformat]

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-xgene.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index dd8a62d8f11f..f26b3ac36b27 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -42,12 +42,12 @@
 
 static DEFINE_SPINLOCK(clk_lock);
 
-static inline u32 xgene_clk_read(void *csr)
+static inline u32 xgene_clk_read(void __iomem *csr)
 {
 	return readl_relaxed(csr);
 }
 
-static inline void xgene_clk_write(u32 data, void *csr)
+static inline void xgene_clk_write(u32 data, void __iomem *csr)
 {
 	return writel_relaxed(data, csr);
 }
@@ -119,7 +119,7 @@ static unsigned long xgene_clk_pll_recalc_rate(struct clk_hw *hw,
 	return fvco / nout;
 }
 
-const struct clk_ops xgene_clk_pll_ops = {
+static const struct clk_ops xgene_clk_pll_ops = {
 	.is_enabled = xgene_clk_pll_is_enabled,
 	.recalc_rate = xgene_clk_pll_recalc_rate,
 };
@@ -167,7 +167,7 @@ static void xgene_pllclk_init(struct device_node *np, enum xgene_pll_type pll_ty
 {
         const char *clk_name = np->full_name;
         struct clk *clk;
-        void *reg;
+        void __iomem *reg;
 
         reg = of_iomap(np, 0);
         if (reg == NULL) {
@@ -222,20 +222,22 @@ static int xgene_clk_enable(struct clk_hw *hw)
 	struct xgene_clk *pclk = to_xgene_clk(hw);
 	unsigned long flags = 0;
 	u32 data;
+	phys_addr_t reg;
 
 	if (pclk->lock)
 		spin_lock_irqsave(pclk->lock, flags);
 
 	if (pclk->param.csr_reg != NULL) {
 		pr_debug("%s clock enabled\n", pclk->name);
+		reg = __pa(pclk->param.csr_reg);
 		/* First enable the clock */
 		data = xgene_clk_read(pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
 		data |= pclk->param.reg_clk_mask;
 		xgene_clk_write(data, pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
-		pr_debug("%s clock PADDR base 0x%016LX clk offset 0x%08X mask 0x%08X value 0x%08X\n",
-			pclk->name, __pa(pclk->param.csr_reg),
+		pr_debug("%s clock PADDR base %pa clk offset 0x%08X mask 0x%08X value 0x%08X\n",
+			pclk->name, &reg,
 			pclk->param.reg_clk_offset, pclk->param.reg_clk_mask,
 			data);
 
@@ -245,8 +247,8 @@ static int xgene_clk_enable(struct clk_hw *hw)
 		data &= ~pclk->param.reg_csr_mask;
 		xgene_clk_write(data, pclk->param.csr_reg +
 					pclk->param.reg_csr_offset);
-		pr_debug("%s CSR RESET PADDR base 0x%016LX csr offset 0x%08X mask 0x%08X value 0x%08X\n",
-			pclk->name, __pa(pclk->param.csr_reg),
+		pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X mask 0x%08X value 0x%08X\n",
+			pclk->name, &reg,
 			pclk->param.reg_csr_offset, pclk->param.reg_csr_mask,
 			data);
 	}
@@ -386,7 +388,7 @@ static long xgene_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	return parent_rate / divider;
 }
 
-const struct clk_ops xgene_clk_ops = {
+static const struct clk_ops xgene_clk_ops = {
 	.enable = xgene_clk_enable,
 	.disable = xgene_clk_disable,
 	.is_enabled = xgene_clk_is_enabled,
@@ -456,7 +458,7 @@ static void __init xgene_devclk_init(struct device_node *np)
 	parameters.csr_reg = NULL;
 	parameters.divider_reg = NULL;
 	for (i = 0; i < 2; i++) {
-		void *map_res;
+		void __iomem *map_res;
 		rc = of_address_to_resource(np, i, &res);
 		if (rc != 0) {
 			if (i == 0) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

