Return-Path: <davidcdueck@googlemail.com>
Return-Path: <davidcdueck@googlemail.com>
From: David Dueck <davidcdueck@googlemail.com>
To: boris.brezillon@free-electrons.com
Cc: mturquette@linaro.org,
	nicolas.ferre@atmel.com,
	sboyd@codeaurora.org,
	alexandre.belloni@free-electrons.com,
	plagnioj@jcrosoft.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2] clk: at91: do not leak resources
Date: Fri, 26 Jun 2015 15:30:22 +0200
Message-Id: <1435325422-8137-1-git-send-email-davidcdueck@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Do not leak memory and free irqs in case of an error.

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: David Dueck <davidcdueck@googlemail.com>
---
Changes since v1:
- squash into one commit

 drivers/clk/at91/clk-h32mx.c  | 4 +++-
 drivers/clk/at91/clk-main.c   | 4 +++-
 drivers/clk/at91/clk-master.c | 8 ++++++--
 drivers/clk/at91/clk-pll.c    | 8 ++++++--
 drivers/clk/at91/clk-system.c | 8 ++++++--
 drivers/clk/at91/clk-utmi.c   | 8 ++++++--
 6 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index 152dcb3..61566bc 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -116,8 +116,10 @@ void __init of_sama5d4_clk_h32mx_setup(struct device_node *np,
 	h32mxclk->pmc = pmc;
 
 	clk = clk_register(NULL, &h32mxclk->hw);
-	if (!clk)
+	if (!clk) {
+		kfree(h32mxclk);
 		return;
+	}
 
 	of_clk_add_provider(np, of_clk_src_simple_get, clk);
 }
diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 59fa3cc..696719e 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -171,8 +171,10 @@ at91_clk_register_main_osc(struct at91_pmc *pmc,
 	irq_set_status_flags(osc->irq, IRQ_NOAUTOEN);
 	ret = request_irq(osc->irq, clk_main_osc_irq_handler,
 			  IRQF_TRIGGER_HIGH, name, osc);
-	if (ret)
+	if (ret) {
+		kfree(osc);
 		return ERR_PTR(ret);
+	}
 
 	if (bypass)
 		pmc_write(pmc, AT91_CKGR_MOR,
diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index c1af80b..d7d6c59 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -165,12 +165,16 @@ at91_clk_register_master(struct at91_pmc *pmc, unsigned int irq,
 	irq_set_status_flags(master->irq, IRQ_NOAUTOEN);
 	ret = request_irq(master->irq, clk_master_irq_handler,
 			  IRQF_TRIGGER_HIGH, "clk-master", master);
-	if (ret)
+	if (ret) {
+		kfree(master);
 		return ERR_PTR(ret);
+	}
 
 	clk = clk_register(NULL, &master->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(master->irq, master);
 		kfree(master);
+	}
 
 	return clk;
 }
diff --git a/drivers/clk/at91/clk-pll.c b/drivers/clk/at91/clk-pll.c
index cbbe403..18b60f4 100644
--- a/drivers/clk/at91/clk-pll.c
+++ b/drivers/clk/at91/clk-pll.c
@@ -346,12 +346,16 @@ at91_clk_register_pll(struct at91_pmc *pmc, unsigned int irq, const char *name,
 	irq_set_status_flags(pll->irq, IRQ_NOAUTOEN);
 	ret = request_irq(pll->irq, clk_pll_irq_handler, IRQF_TRIGGER_HIGH,
 			  id ? "clk-pllb" : "clk-plla", pll);
-	if (ret)
+	if (ret) {
+		kfree(pll);
 		return ERR_PTR(ret);
+	}
 
 	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(pll->irq, pll);
 		kfree(pll);
+	}
 
 	return clk;
 }
diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
index a76d03f..58008b3 100644
--- a/drivers/clk/at91/clk-system.c
+++ b/drivers/clk/at91/clk-system.c
@@ -130,13 +130,17 @@ at91_clk_register_system(struct at91_pmc *pmc, const char *name,
 		irq_set_status_flags(sys->irq, IRQ_NOAUTOEN);
 		ret = request_irq(sys->irq, clk_system_irq_handler,
 				IRQF_TRIGGER_HIGH, name, sys);
-		if (ret)
+		if (ret) {
+			kfree(sys);
 			return ERR_PTR(ret);
+		}
 	}
 
 	clk = clk_register(NULL, &sys->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(sys->irq, sys);
 		kfree(sys);
+	}
 
 	return clk;
 }
diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index ae3263b..30dd697 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -118,12 +118,16 @@ at91_clk_register_utmi(struct at91_pmc *pmc, unsigned int irq,
 	irq_set_status_flags(utmi->irq, IRQ_NOAUTOEN);
 	ret = request_irq(utmi->irq, clk_utmi_irq_handler,
 			  IRQF_TRIGGER_HIGH, "clk-utmi", utmi);
-	if (ret)
+	if (ret) {
+		kfree(utmi);
 		return ERR_PTR(ret);
+	}
 
 	clk = clk_register(NULL, &utmi->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(utmi->irq, utmi);
 		kfree(utmi);
+	}
 
 	return clk;
 }
-- 
2.4.4
