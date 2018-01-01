Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v3 12/34] clk: cdce925: remove unnecessary long casts on return
Date: Mon,  1 Jan 2018 19:42:51 +0000
Message-Id: <1514835793-1104-13-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

Due to the old function signature of clk_ops->round_rate the cdce925
round_rate functions end up doing a cast of an internal unsigned long to a
long. After updating clk_ops->round_rate() to be an unsigned long though
the cast isn't necessary.

Remove the extraneous cast from:

- cdce925_pll_round_rate
- cdce925_clk_round_rate
- cdce925_clk_y1_round_rate

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-cdce925.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 341e744..eecc262 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -149,7 +149,7 @@ static unsigned long cdce925_pll_round_rate(struct clk_hw *hw,
 	u16 n, m;
 
 	cdce925_pll_find_rate(rate, *parent_rate, &n, &m);
-	return (long)cdce925_pll_calculate_rate(*parent_rate, n, m);
+	return cdce925_pll_calculate_rate(*parent_rate, n, m);
 }
 
 static int cdce925_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -449,7 +449,7 @@ static unsigned long cdce925_clk_round_rate(struct clk_hw *hw,
 	}
 
 	if (divider)
-		return (long)(l_parent_rate / divider);
+		return l_parent_rate / divider;
 	return 0;
 }
 
@@ -497,7 +497,7 @@ static unsigned long cdce925_clk_y1_round_rate(struct clk_hw *hw,
 	u16 divider = cdce925_y1_calc_divider(rate, l_parent_rate);
 
 	if (divider)
-		return (long)(l_parent_rate / divider);
+		return l_parent_rate / divider;
 	return 0;
 }
 
-- 
2.7.4
