Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH 28/41] clk: ls1x: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:13 -0800
Message-Id: <1456858826-28541-29-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-ls1x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-ls1x.c b/drivers/clk/clk-ls1x.c
index d4c61985f448..5097831387ff 100644
--- a/drivers/clk/clk-ls1x.c
+++ b/drivers/clk/clk-ls1x.c
@@ -88,8 +88,7 @@ void __init ls1x_clk_init(void)
 {
 	struct clk *clk;
 
-	clk = clk_register_fixed_rate(NULL, "osc_33m_clk", NULL, CLK_IS_ROOT,
-				      OSC);
+	clk = clk_register_fixed_rate(NULL, "osc_33m_clk", NULL, 0, OSC);
 	clk_register_clkdev(clk, "osc_33m_clk", NULL);
 
 	/* clock derived from 33 MHz OSC clk */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
