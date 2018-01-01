Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v3 13/34] clk: si514: change si514_round_rate() return logic
Date: Mon,  1 Jan 2018 19:42:52 +0000
Message-Id: <1514835793-1104-14-git-send-email-pure.logic@nexus-software.ie>
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
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/clk/clk-si514.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index 8d940d0..042ae39 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -220,7 +220,7 @@ static unsigned long si514_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	err = si514_calc_muldiv(&settings, rate);
 	if (err)
-		return err;
+		return 0;
 
 	return si514_calc_rate(&settings);
 }
-- 
2.7.4
