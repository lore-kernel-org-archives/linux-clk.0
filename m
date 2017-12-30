Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: pure.logic@nexus-software.ie,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH 15/33] clk: vt8500: change vtwm_pll_round_rate() return logic
Date: Sat, 30 Dec 2017 01:12:54 +0000
Message-Id: <1514596392-22270-16-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
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
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Tony Prisk <linux@prisktech.co.nz>
---
 drivers/clk/clk-vt8500.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index 43c88f6..750c087 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -610,7 +610,7 @@ static unsigned long vtwm_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_pll *pll = to_clk_pll(hw);
 	u32 filter, mul, div1, div2;
 	long round_rate;
-	int ret;
+	int ret = 1;
 
 	switch (pll->type) {
 	case PLL_TYPE_VT8500:
@@ -634,11 +634,11 @@ static unsigned long vtwm_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 			round_rate = WM8850_BITS_TO_FREQ(*prate, mul, div1, div2);
 		break;
 	default:
-		ret = -EINVAL;
+		break;
 	}
 
 	if (ret)
-		return ret;
+		return 0;
 
 	return round_rate;
 }
-- 
2.7.4
