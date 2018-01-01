Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 07/34] clk: axs10x: change i2s_pll_round_rate return logic
Date: Mon,  1 Jan 2018 19:07:34 +0000
Message-Id: <1514833681-30737-8-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514833681-30737-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514833681-30737-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/axs10x/i2s_pll_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_pll_clock.c
index 061260c..20f7ebf 100644
--- a/drivers/clk/axs10x/i2s_pll_clock.c
+++ b/drivers/clk/axs10x/i2s_pll_clock.c
@@ -119,14 +119,14 @@ static unsigned long i2s_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (!pll_cfg) {
 		dev_err(clk->dev, "invalid parent rate=%ld\n", *prate);
-		return -EINVAL;
+		return 0;
 	}
 
 	for (i = 0; pll_cfg[i].rate != 0; i++)
 		if (pll_cfg[i].rate == rate)
 			return rate;
 
-	return -EINVAL;
+	return 0;
 }
 
 static int i2s_pll_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.7.4
