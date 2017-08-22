Return-Path: <bhumirks@gmail.com>
Return-Path: <bhumirks@gmail.com>
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] clk: mxs: make clk_ops const
Date: Tue, 22 Aug 2017 19:22:47 +0530
Message-Id: <1503409967-21357-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Make these const as they are only stored in the const field of a
clk_init_data structure.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/clk/mxs/clk-div.c  | 2 +-
 drivers/clk/mxs/clk-frac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mxs/clk-div.c b/drivers/clk/mxs/clk-div.c
index f75e989..ccebd01 100644
--- a/drivers/clk/mxs/clk-div.c
+++ b/drivers/clk/mxs/clk-div.c
@@ -67,7 +67,7 @@ static int clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static struct clk_ops clk_div_ops = {
+static const struct clk_ops clk_div_ops = {
 	.recalc_rate = clk_div_recalc_rate,
 	.round_rate = clk_div_round_rate,
 	.set_rate = clk_div_set_rate,
diff --git a/drivers/clk/mxs/clk-frac.c b/drivers/clk/mxs/clk-frac.c
index f8dd10f..27b3372 100644
--- a/drivers/clk/mxs/clk-frac.c
+++ b/drivers/clk/mxs/clk-frac.c
@@ -107,7 +107,7 @@ static int clk_frac_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mxs_clk_wait(frac->reg, frac->busy);
 }
 
-static struct clk_ops clk_frac_ops = {
+static const struct clk_ops clk_frac_ops = {
 	.recalc_rate = clk_frac_recalc_rate,
 	.round_rate = clk_frac_round_rate,
 	.set_rate = clk_frac_set_rate,
-- 
1.9.1
