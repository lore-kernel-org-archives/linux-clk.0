Return-Path: <van.freenix@gmail.com>
Return-Path: <van.freenix@gmail.com>
From: Peng Fan <van.freenix@gmail.com>
To: sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	van.freenix@gmail.com,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH] clk: correct comments for __clk_determine_rate
Date: Mon, 13 Jun 2016 19:34:21 +0800
Message-Id: <1465817661-19128-1-git-send-email-van.freenix@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Correct comments for __clk_determine_rate.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d584004..4224a2e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -828,9 +828,7 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 /**
  * __clk_determine_rate - get the closest rate actually supported by a clock
  * @hw: determine the rate of this clock
- * @rate: target rate
- * @min_rate: returned rate must be greater than this rate
- * @max_rate: returned rate must be less than this rate
+ * @req: target rate request
  *
  * Useful for clk_ops such as .set_rate and .determine_rate.
  */
-- 
2.6.2
