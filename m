Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: pure.logic@nexus-software.ie
Subject: [PATCH 02/33] clk: core: update divider_round_rate functions to return unsigned long
Date: Sat, 30 Dec 2017 01:12:41 +0000
Message-Id: <1514596392-22270-3-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

Returning a long from round_rate() class functions is rooted in the notion
that we will propagate a negative number on some class of failure to round
a clock rate; however this approach does not scale to 32 bit systems which
legitimately round a clock over LONG_MAX as the returned clock rate is
indistinguishable from an error number.

A better approach is to return zero when we cannot round a clock and
non-zero when we can - thus supporting the full range of the unsigned long
rate input value to round_rate() functions.

Update the signature of divider_round_rate functions to do this now.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-divider.c    | 10 ++++++----
 include/linux/clk-provider.h | 19 +++++++++++--------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index a26ec7c..e827304 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -332,10 +332,12 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 	return bestdiv;
 }
 
-long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-			       unsigned long rate, unsigned long *prate,
-			       const struct clk_div_table *table,
-			       u8 width, unsigned long flags)
+unsigned long divider_round_rate_parent(struct clk_hw *hw,
+					struct clk_hw *parent,
+					unsigned long rate,
+					unsigned long *prate,
+					const struct clk_div_table *table,
+					u8 width, unsigned long flags)
 {
 	int div;
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 79b1d6e..e763d94 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -413,10 +413,12 @@ extern const struct clk_ops clk_divider_ro_ops;
 unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
 		unsigned int val, const struct clk_div_table *table,
 		unsigned long flags);
-long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-			       unsigned long rate, unsigned long *prate,
-			       const struct clk_div_table *table,
-			       u8 width, unsigned long flags);
+unsigned long divider_round_rate_parent(struct clk_hw *hw,
+					struct clk_hw *parent,
+					unsigned long rate,
+					unsigned long *prate,
+					const struct clk_div_table *table,
+					u8 width, unsigned long flags);
 int divider_get_val(unsigned long rate, unsigned long parent_rate,
 		const struct clk_div_table *table, u8 width,
 		unsigned long flags);
@@ -762,10 +764,11 @@ static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 	dst->core = src->core;
 }
 
-static inline long divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate,
-				      const struct clk_div_table *table,
-				      u8 width, unsigned long flags)
+static inline unsigned long divider_round_rate(struct clk_hw *hw,
+					       unsigned long rate,
+					       unsigned long *prate,
+					       const struct clk_div_table *table,
+					       u8 width, unsigned long flags)
 {
 	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
 					 rate, prate, table, width, flags);
-- 
2.7.4
