Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] clk: axi-clkgen: Remove sometimes impossible check
Date: Fri, 29 Jan 2016 17:13:28 -0800
Message-Id: <1454116408-28866-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The size of unsigned long on 64-bit architectures is equal to the
size of u64, so this check is impossible there. This throws off
static checkers:

drivers/clk/clk-axi-clkgen.c:331 axi_clkgen_recalc_rate() warn:
impossible condition '(tmp > (~0)) => (0-u64max > u64max)'

Let's change this code to use min_t() instead so that we
get the same effect on architectures where sizeof(unsigned long)
doesn't equal sizeof(u64).

Cc: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-axi-clkgen.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 9a0744c9947c..3294db3b4e4e 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -328,10 +328,7 @@ static unsigned long axi_clkgen_recalc_rate(struct clk_hw *clk_hw,
 	tmp = (unsigned long long)(parent_rate / d) * m;
 	do_div(tmp, dout);
 
-	if (tmp > ULONG_MAX)
-		return ULONG_MAX;
-
-	return tmp;
+	return min_t(unsigned long long, tmp, ULONG_MAX);
 }
 
 static int axi_clkgen_enable(struct clk_hw *clk_hw)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
