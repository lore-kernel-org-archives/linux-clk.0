Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: pure.logic@nexus-software.ie
Subject: [PATCH 03/33] clk: composite: allow round_rate to scale past LONG_MAX on 32 bit systems
Date: Sat, 30 Dec 2017 01:12:42 +0000
Message-Id: <1514596392-22270-4-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

Defining the return value of round_rate as a long and returning error codes
as well as the rounded-clock value in the return value of a
clk_ops->round_rate callback means that its not possible to return a clock
greater than LONG_MAX Hz on a 32 bit system.

This patch changes the handling of the return value from round_rate() such
that zero indicates an unusable clock and non-zero indicates a successfully
rounded clock giving us a full range of 1 Hz to ULONG_MAX Hz on 32 bit
systems.

Implementations of round_rate() must either return a rounded-clock or zero
to indicate error.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-composite.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index f3707c3..2090b74 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -66,7 +66,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	long tmp_rate, best_rate = 0;
 	unsigned long rate_diff;
 	unsigned long best_rate_diff = ULONG_MAX;
-	long rate;
+	unsigned long rate;
 	int i;
 
 	if (rate_hw && rate_ops && rate_ops->determine_rate) {
@@ -83,8 +83,8 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 
 			rate = rate_ops->round_rate(rate_hw, req->rate,
 						    &req->best_parent_rate);
-			if (rate < 0)
-				return rate;
+			if (!rate)
+				return -EINVAL;
 
 			req->rate = rate;
 			return 0;
@@ -99,7 +99,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 
 			tmp_rate = rate_ops->round_rate(rate_hw, req->rate,
 							&parent_rate);
-			if (tmp_rate < 0)
+			if (tmp_rate == 0)
 				continue;
 
 			rate_diff = abs(req->rate - tmp_rate);
-- 
2.7.4
