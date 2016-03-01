Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 23/41] clk: zte: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:08 -0800
Message-Id: <1456858826-28541-24-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/zte/clk-zx296702.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/zte/clk-zx296702.c b/drivers/clk/zte/clk-zx296702.c
index ebd20d852e73..76e967c19775 100644
--- a/drivers/clk/zte/clk-zx296702.c
+++ b/drivers/clk/zte/clk-zx296702.c
@@ -234,8 +234,7 @@ static void __init zx296702_top_clocks_init(struct device_node *np)
 	WARN_ON(!topcrm_base);
 
 	clk[ZX296702_OSC] =
-		clk_register_fixed_rate(NULL, "osc", NULL, CLK_IS_ROOT,
-				30000000);
+		clk_register_fixed_rate(NULL, "osc", NULL, 0, 30000000);
 	clk[ZX296702_PLL_A9] =
 		clk_register_zx_pll("pll_a9", "osc", 0, topcrm_base
 				+ 0x01c, pll_a9_config,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
