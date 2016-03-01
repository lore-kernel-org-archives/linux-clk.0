Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 10/41] clk: nxp: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:55 -0800
Message-Id: <1456858826-28541-11-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Joachim Eastwood <manabian@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/nxp/clk-lpc18xx-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-cgu.c b/drivers/clk/nxp/clk-lpc18xx-cgu.c
index c924572fc9bc..2531174b399e 100644
--- a/drivers/clk/nxp/clk-lpc18xx-cgu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-cgu.c
@@ -605,7 +605,7 @@ static void __init lpc18xx_cgu_register_source_clks(struct device_node *np,
 
 	/* Register the internal 12 MHz RC oscillator (IRC) */
 	clk = clk_register_fixed_rate(NULL, clk_src_names[CLK_SRC_IRC],
-				      NULL, CLK_IS_ROOT, 12000000);
+				      NULL, 0, 12000000);
 	if (IS_ERR(clk))
 		pr_warn("%s: failed to register irc clk\n", __func__);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
