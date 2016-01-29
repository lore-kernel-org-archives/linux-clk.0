Return-Path: <stefan@agner.ch>
From: Stefan Agner <stefan@agner.ch>
To: shawnguo@kernel.org,
	kernel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/2] clk: imx: do not sleep if IRQ's are still disabled
Date: Fri, 29 Jan 2016 14:49:23 -0800
Message-Id: <1454107764-19876-1-git-send-email-stefan@agner.ch>
List-ID: <linux-clk.vger.kernel.org>

If a clock gets enabled early during boot time, it can lead to a PLL
startup. The wait_lock function makes sure that the PLL is really
stareted up before it gets used. However, the function sleeps which
leads to scheduling and an error:
bad: scheduling from the idle thread!
...

Use udelay in case IRQ's are still disabled.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/clk/imx/clk-pllv3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index c05c43d..b5ff561 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -63,7 +63,10 @@ static int clk_pllv3_wait_lock(struct clk_pllv3 *pll)
 			break;
 		if (time_after(jiffies, timeout))
 			break;
-		usleep_range(50, 500);
+		if (unlikely(irqs_disabled()))
+			udelay(50);
+		else
+			usleep_range(50, 500);
 	} while (1);
 
 	return readl_relaxed(pll->base) & BM_PLL_LOCK ? 0 : -ETIMEDOUT;
-- 
2.7.0
