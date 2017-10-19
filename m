Return-Path: <romain.izard.pro@gmail.com>
Return-Path: <romain.izard.pro@gmail.com>
From: Romain Izard <romain.izard.pro@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v5 1/3] clk: at91: pmc: Wait for clocks when resuming
Date: Thu, 19 Oct 2017 18:42:05 +0200
Message-Id: <20171019164207.32717-2-romain.izard.pro@gmail.com>
In-Reply-To: <20171019164207.32717-1-romain.izard.pro@gmail.com>
References: <20171019164207.32717-1-romain.izard.pro@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Wait for the syncronization of all clocks when resuming, not only the
UPLL clock. Do not use regmap_read_poll_timeout, as it will call BUG()
when interrupts are masked, which is the case in here.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 drivers/clk/at91/pmc.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index 775af473fe11..5c2b26de303e 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -107,10 +107,20 @@ static int pmc_suspend(void)
 	return 0;
 }
 
+static bool pmc_ready(unsigned int mask)
+{
+	unsigned int status;
+
+	regmap_read(pmcreg, AT91_PMC_SR, &status);
+
+	return ((status & mask) == mask) ? 1 : 0;
+}
+
 static void pmc_resume(void)
 {
-	int i, ret = 0;
+	int i;
 	u32 tmp;
+	u32 mask = AT91_PMC_MCKRDY | AT91_PMC_LOCKA;
 
 	regmap_read(pmcreg, AT91_PMC_MCKR, &tmp);
 	if (pmc_cache.mckr != tmp)
@@ -134,13 +144,11 @@ static void pmc_resume(void)
 			     AT91_PMC_PCR_CMD);
 	}
 
-	if (pmc_cache.uckr & AT91_PMC_UPLLEN) {
-		ret = regmap_read_poll_timeout(pmcreg, AT91_PMC_SR, tmp,
-					       !(tmp & AT91_PMC_LOCKU),
-					       10, 5000);
-		if (ret)
-			pr_crit("USB PLL didn't lock when resuming\n");
-	}
+	if (pmc_cache.uckr & AT91_PMC_UPLLEN)
+		mask |= AT91_PMC_LOCKU;
+
+	while (!pmc_ready(mask))
+		cpu_relax();
 }
 
 static struct syscore_ops pmc_syscore_ops = {
-- 
2.11.0
