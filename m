Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH 02/41] clk: bcm: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:47 -0800
Message-Id: <1456858826-28541-3-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Lee Jones <lee@kernel.org>
Cc: Eric Anholt <eric@anholt.net>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 5747a9d17c74..c74ed3fd496d 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -324,21 +324,18 @@ void __init bcm2835_init_clocks(void)
 	struct clk *clk;
 	int ret;
 
-	clk = clk_register_fixed_rate(NULL, "apb_pclk", NULL, CLK_IS_ROOT,
-					126000000);
+	clk = clk_register_fixed_rate(NULL, "apb_pclk", NULL, 0, 126000000);
 	if (IS_ERR(clk))
 		pr_err("apb_pclk not registered\n");
 
-	clk = clk_register_fixed_rate(NULL, "uart0_pclk", NULL, CLK_IS_ROOT,
-					3000000);
+	clk = clk_register_fixed_rate(NULL, "uart0_pclk", NULL, 0, 3000000);
 	if (IS_ERR(clk))
 		pr_err("uart0_pclk not registered\n");
 	ret = clk_register_clkdev(clk, NULL, "20201000.uart");
 	if (ret)
 		pr_err("uart0_pclk alias not registered\n");
 
-	clk = clk_register_fixed_rate(NULL, "uart1_pclk", NULL, CLK_IS_ROOT,
-					125000000);
+	clk = clk_register_fixed_rate(NULL, "uart1_pclk", NULL, 0, 125000000);
 	if (IS_ERR(clk))
 		pr_err("uart1_pclk not registered\n");
 	ret = clk_register_clkdev(clk, NULL, "20215000.uart");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
