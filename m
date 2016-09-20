Return-Path: <alexandre.belloni@free-electrons.com>
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH v3 3/5] clk: at91: sckc: optimize boot time
Date: Tue, 20 Sep 2016 22:58:31 +0200
Message-Id: <20160920205833.19638-4-alexandre.belloni@free-electrons.com>
In-Reply-To: <20160920205833.19638-1-alexandre.belloni@free-electrons.com>
References: <20160920205833.19638-1-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Assume that if the oscillator is enabled (OSC32EN bit is present), the
delay has already elapsed as the bootloader probably waited for the
oscillator to settle. This could waste up to 1.2s.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/clk/at91/sckc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 60d8225715a2..b1265f2cdae7 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -69,7 +69,7 @@ static int clk_slow_osc_prepare(struct clk_hw *hw)
 	void __iomem *sckcr = osc->sckcr;
 	u32 tmp = readl(sckcr);
 
-	if (tmp & AT91_SCKC_OSC32BYP)
+	if (tmp & (AT91_SCKC_OSC32BYP | AT91_SCKC_OSC32EN))
 		return 0;
 
 	writel(tmp | AT91_SCKC_OSC32EN, sckcr);
-- 
2.9.3
