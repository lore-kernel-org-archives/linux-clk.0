Return-Path: <david@lechnology.com>
From: David Lechner <david@lechnology.com>
To: linux-clk@vger.kernel.org
Cc: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: divider: fix clk_round_rate() when CLK_DIVIDER_READ_ONLY && CLK_RATE_SET_PARENT
Date: Sat,  6 Jan 2018 12:19:29 -0600
Message-Id: <1515262769-22665-1-git-send-email-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

clk_round_rate() 'answers the question "if I were to pass @rate to
clk_set_rate(), what clock rate would I end up with?" without changing
the hardware'.

Currently, clk_divider_round_rate() returns the "current value" when
divider->flags & CLK_DIVIDER_READ_ONLY. But, if CLK_SET_RATE_PARENT is
set, then clk_set_rate() is supposed to propagate the rate change to the
parent clock. So, we need to do check for CLK_SET_RATE_PARENT and if it
is set, ask the parent clock what rate it can provide given the current
divider value.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/clk/clk-divider.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 4ed516c..cffe9ef 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -357,6 +357,13 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		bestdiv &= div_mask(divider->width);
 		bestdiv = _get_div(divider->table, bestdiv, divider->flags,
 			divider->width);
+
+		if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+			struct clk_hw *parent = clk_hw_get_parent(hw);
+
+			*prate = clk_hw_round_rate(parent, rate * bestdiv);
+		}
+
 		return DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
 	}
 
-- 
2.7.4
