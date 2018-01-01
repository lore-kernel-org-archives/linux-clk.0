Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 30/34] clk: axs10x: change axs10x_pll_round_rate return logic
Date: Mon,  1 Jan 2018 19:34:56 +0000
Message-Id: <1514835300-381-16-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
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
 drivers/clk/axs10x/pll_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/axs10x/pll_clock.c b/drivers/clk/axs10x/pll_clock.c
index 27498eb..e90ae9e 100644
--- a/drivers/clk/axs10x/pll_clock.c
+++ b/drivers/clk/axs10x/pll_clock.c
@@ -162,7 +162,7 @@ static unsigned long axs10x_pll_round_rate(struct clk_hw *hw,
 	const struct axs10x_pll_cfg *pll_cfg = clk->pll_cfg;
 
 	if (pll_cfg[0].rate == 0)
-		return -EINVAL;
+		return 0;
 
 	best_rate = pll_cfg[0].rate;
 
-- 
2.7.4
