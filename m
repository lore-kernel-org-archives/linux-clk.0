Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v3 32/34] clk: ARC: change hsdk_pll_round_rate () return logic
Date: Mon,  1 Jan 2018 19:43:11 +0000
Message-Id: <1514835793-1104-33-git-send-email-pure.logic@nexus-software.ie>
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-hsdk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
index 62c8e18..7bff5e3 100644
--- a/drivers/clk/clk-hsdk-pll.c
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -201,7 +201,7 @@ static unsigned long hsdk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	const struct hsdk_pll_cfg *pll_cfg = clk->pll_devdata->pll_cfg;
 
 	if (pll_cfg[0].rate == 0)
-		return -EINVAL;
+		return 0;
 
 	best_rate = pll_cfg[0].rate;
 
-- 
2.7.4
