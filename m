Return-Path: <dan.carpenter@oracle.com>
Date: Wed, 27 May 2015 11:26:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Mike Turquette <mturquette@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [patch] clk: socfpga: remove a stray tab
Message-ID: <20150527082627.GD19423@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

This line was indented too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index be3e998..83c6780 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -39,7 +39,7 @@ static unsigned long socfpga_gate_clk_recalc_rate(struct clk_hw *hwclk,
 	else if (socfpgaclk->div_reg) {
 		val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
 		val &= div_mask(socfpgaclk->width);
-			div = (1 << val);
+		div = (1 << val);
 	}
 
 	return parent_rate / div;
