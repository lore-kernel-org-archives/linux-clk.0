Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Joachim Eastwood <manabian@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 20/34] clk: nxp: change lpc18xx_pll0_round_rate() return logic
Date: Mon,  1 Jan 2018 19:42:59 +0000
Message-Id: <1514835793-1104-21-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Joachim Eastwood <manabian@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/nxp/clk-lpc18xx-cgu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-cgu.c b/drivers/clk/nxp/clk-lpc18xx-cgu.c
index e08bad9..396d4f7 100644
--- a/drivers/clk/nxp/clk-lpc18xx-cgu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-cgu.c
@@ -381,13 +381,13 @@ static unsigned long lpc18xx_pll0_round_rate(struct clk_hw *hw,
 
 	if (*prate < rate) {
 		pr_warn("%s: pll dividers not supported\n", __func__);
-		return -EINVAL;
+		return 0;
 	}
 
 	m = DIV_ROUND_UP_ULL(*prate, rate * 2);
 	if (m <= 0 && m > LPC18XX_PLL0_MSEL_MAX) {
 		pr_warn("%s: unable to support rate %lu\n", __func__, rate);
-		return -EINVAL;
+		return 0;
 	}
 
 	return 2 * *prate * m;
-- 
2.7.4
