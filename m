Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:57334 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750782AbdIEJcz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Sep 2017 05:32:55 -0400
From: Lars-Peter Clausen <lars@metafoo.de>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/2] clk: axi-clkgen: Round closest in round_rate() and recalc_rate()
Date: Tue,  5 Sep 2017 11:32:41 +0200
Message-Id: <20170905093241.18582-2-lars@metafoo.de>
In-Reply-To: <20170905093241.18582-1-lars@metafoo.de>
References: <20170905093241.18582-1-lars@metafoo.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

To minimize the rounding error round to the closest integer when
calculating the result in the recalc_rate() and set_rate() callbacks.

Also in order to improve precision multiply first and then divide.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-axi-clkgen.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 95a6e9834392..48d11f2598e8 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -302,13 +302,17 @@ static long axi_clkgen_round_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long *parent_rate)
 {
 	unsigned int d, m, dout;
+	unsigned long long tmp;
 
 	axi_clkgen_calc_params(*parent_rate, rate, &d, &m, &dout);
 
 	if (d == 0 || dout == 0 || m == 0)
 		return -EINVAL;
 
-	return *parent_rate / d * m / dout;
+	tmp = (unsigned long long)*parent_rate * m;
+	tmp = DIV_ROUND_CLOSEST_ULL(tmp, dout * d);
+
+	return min_t(unsigned long long, tmp, LONG_MAX);
 }
 
 static unsigned long axi_clkgen_recalc_rate(struct clk_hw *clk_hw,
@@ -344,8 +348,8 @@ static unsigned long axi_clkgen_recalc_rate(struct clk_hw *clk_hw,
 	if (d == 0 || dout == 0)
 		return 0;
 
-	tmp = (unsigned long long)(parent_rate / d) * m;
-	do_div(tmp, dout);
+	tmp = (unsigned long long)parent_rate * m;
+	tmp = DIV_ROUND_CLOSEST_ULL(tmp, dout * d);
 
 	return min_t(unsigned long long, tmp, ULONG_MAX);
 }
-- 
2.11.0

