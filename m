Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 19/34] clk: mxs: change clk_frac_round_rate() return logic
Date: Mon,  1 Jan 2018 19:34:45 +0000
Message-Id: <1514835300-381-5-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
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
Cc: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/mxs/clk-frac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mxs/clk-frac.c b/drivers/clk/mxs/clk-frac.c
index f57281f..9debf86 100644
--- a/drivers/clk/mxs/clk-frac.c
+++ b/drivers/clk/mxs/clk-frac.c
@@ -59,7 +59,7 @@ static unsigned long clk_frac_round_rate(struct clk_hw *hw, unsigned long rate,
 	u64 tmp, tmp_rate, result;
 
 	if (rate > parent_rate)
-		return -EINVAL;
+		return 0;
 
 	tmp = rate;
 	tmp <<= frac->width;
@@ -67,7 +67,7 @@ static unsigned long clk_frac_round_rate(struct clk_hw *hw, unsigned long rate,
 	div = tmp;
 
 	if (!div)
-		return -EINVAL;
+		return 0;
 
 	tmp_rate = (u64)parent_rate * div;
 	result = tmp_rate >> frac->width;
-- 
2.7.4
