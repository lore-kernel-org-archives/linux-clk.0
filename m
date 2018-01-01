Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: bryan.odonoghue@nexus-software.ie
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Marek Vasut <marek.vasut@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>,
	Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH v2 15/34] clk: vc5: change vc5_dbl_round_rate() return logic
Date: Mon,  1 Jan 2018 19:34:41 +0000
Message-Id: <1514835281-324-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
---
 drivers/clk/clk-versaclock5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 9432122..733b402 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -294,7 +294,7 @@ static unsigned long vc5_dbl_round_rate(struct clk_hw *hw, unsigned long rate,
 	if ((*parent_rate == rate) || ((*parent_rate * 2) == rate))
 		return rate;
 	else
-		return -EINVAL;
+		return 0;
 }
 
 static int vc5_dbl_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.7.4
