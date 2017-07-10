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
Subject: [PATCH] clk: x86: Do not gate clocks enabled by the firmware
Date: Mon, 10 Jul 2017 22:38:01 +0200
Message-Id: <20170710203801.17496-1-carlo@caione.org>
List-ID: <linux-clk.vger.kernel.org>

From: Carlo Caione <carlo@endlessm.com>

Read the enable register to determine if the clock is already in use by
the firmware. In this case avoid gating the clock.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 drivers/clk/x86/clk-pmc-atom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
index 2b60577703ef..46a8b6216fca 100644
--- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -185,6 +185,9 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
 	pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
 	spin_lock_init(&pclk->lock);
 
+	if (plt_clk_is_enabled(&pclk->hw))
+		init.flags |= CLK_IGNORE_UNUSED;
+
 	ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
 	if (ret) {
 		pclk = ERR_PTR(ret);
-- 
2.13.2
