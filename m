Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 18/41] clk: ti: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:03 -0800
Message-Id: <1456858826-28541-19-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index b5bcd77e8d0f..5fcf247759ac 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -305,8 +305,8 @@ struct clk __init *ti_clk_register_clk(struct ti_clk *setup)
 	case TI_CLK_FIXED:
 		fixed = setup->data;
 
-		clk = clk_register_fixed_rate(NULL, setup->name, NULL,
-					      CLK_IS_ROOT, fixed->frequency);
+		clk = clk_register_fixed_rate(NULL, setup->name, NULL, 0,
+					      fixed->frequency);
 		break;
 	case TI_CLK_MUX:
 		clk = ti_clk_register_mux(setup);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
