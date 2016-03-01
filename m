Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 21/41] clk: x86: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:06 -0800
Message-Id: <1456858826-28541-22-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/x86/clk-lpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/x86/clk-lpt.c b/drivers/clk/x86/clk-lpt.c
index f827083defc4..54e0cf9d8edd 100644
--- a/drivers/clk/x86/clk-lpt.c
+++ b/drivers/clk/x86/clk-lpt.c
@@ -30,7 +30,7 @@ static int lpt_clk_probe(struct platform_device *pdev)
 	/* LPSS free running clock */
 	drvdata->name = "lpss_clk";
 	clk = clk_register_fixed_rate(&pdev->dev, drvdata->name, NULL,
-				      CLK_IS_ROOT, 100000000);
+				      0, 100000000);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
