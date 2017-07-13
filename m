Return-Path: <carlo.caione@gmail.com>
Return-Path: <carlo.caione@gmail.com>
Sender: Carlo Caione <carlo.caione@gmail.com>
From: Carlo Caione <carlo@caione.org>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	dvhart@infradead.org,
	pierre-louis.bossart@linux.intel.com,
	sboyd@codeaurora.org,
	linux@endlessm.com,
	eballetbo@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: Carlo Caione <carlo@endlessm.com>
Subject: [PATCH v2] clk: x86: Do not gate clocks enabled by the firmware
Date: Thu, 13 Jul 2017 11:42:13 +0200
Message-Id: <20170713094213.2775-1-carlo@caione.org>
List-ID: <linux-clk.vger.kernel.org>

From: Carlo Caione <carlo@endlessm.com>

Read the enable register to determine if the clock is already in use by
the firmware. In this case avoid gating the clock.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 drivers/clk/x86/clk-pmc-atom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
index 2b60577703ef..3c73d2e564ca 100644
--- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -185,6 +185,13 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
 	pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
 	spin_lock_init(&pclk->lock);
 
+	/*
+	 * If the clock was already enabled by the firmware mark is a critical
+	 * to avoid it being gated by the clock framework if no driver owns it
+	 */
+	if (plt_clk_is_enabled(&pclk->hw))
+		init.flags |= CLK_IS_CRITICAL;
+
 	ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
 	if (ret) {
 		pclk = ERR_PTR(ret);
-- 
2.13.2
