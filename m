Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH v3 18/34] clk: mvebu: change dove_round_rate() return logic
Date: Mon,  1 Jan 2018 19:42:57 +0000
Message-Id: <1514835793-1104-19-git-send-email-pure.logic@nexus-software.ie>
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
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/clk/mvebu/dove-divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/dove-divider.c b/drivers/clk/mvebu/dove-divider.c
index 234ba0a..7704b5e 100644
--- a/drivers/clk/mvebu/dove-divider.c
+++ b/drivers/clk/mvebu/dove-divider.c
@@ -117,7 +117,7 @@ static unsigned long dove_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	divider = dove_calc_divider(dc, rate, parent_rate, false);
 	if (divider < 0)
-		return divider;
+		return 0;
 
 	rate = DIV_ROUND_CLOSEST(parent_rate, divider);
 
-- 
2.7.4
