Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.com>
Subject: [PATCH 1/5] clk: divider: Cap table divider values to 'width' member
Date: Tue, 17 Nov 2015 17:07:20 -0800
Message-Id: <1447808844-27049-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1447808844-27049-1-git-send-email-sboyd@codeaurora.org>
References: <1447808844-27049-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

When we use a clk divider with a divider table, we limit the
maximum divider value in divider_get_val() to the
div_mask(width), but when we calculate the divider in
divider_round_rate() we don't consider that the maximum divider
may be limited by the width. Pass the width along to
_get_table_maxdiv() so that we only return the maximum divider
that is valid. This is useful for clocks that want to share the
same divider table while limiting the available dividers to some
subset of the table depending on the width of the bitfield.

Cc: Rajendra Nayak <rnayak@codeaurora.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-divider.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 3ace102a2a0a..ded3ff4b91b9 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -32,13 +32,14 @@
 
 #define div_mask(width)	((1 << (width)) - 1)
 
-static unsigned int _get_table_maxdiv(const struct clk_div_table *table)
+static unsigned int _get_table_maxdiv(const struct clk_div_table *table,
+				      u8 width)
 {
-	unsigned int maxdiv = 0;
+	unsigned int maxdiv = 0, mask = div_mask(width);
 	const struct clk_div_table *clkt;
 
 	for (clkt = table; clkt->div; clkt++)
-		if (clkt->div > maxdiv)
+		if (clkt->div > maxdiv && clkt->val <= mask)
 			maxdiv = clkt->div;
 	return maxdiv;
 }
@@ -62,7 +63,7 @@ static unsigned int _get_maxdiv(const struct clk_div_table *table, u8 width,
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		return 1 << div_mask(width);
 	if (table)
-		return _get_table_maxdiv(table);
+		return _get_table_maxdiv(table, width);
 	return div_mask(width) + 1;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
