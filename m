Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH 05/41] clk: mediatek: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:50 -0800
Message-Id: <1456858826-28541-6-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: James Liao <jamesjj.liao@mediatek.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mediatek/clk-mtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 352830369e0e..5ada644e6200 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -58,8 +58,8 @@ void __init mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_clk *rc = &clks[i];
 
-		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent,
-				rc->parent ? 0 : CLK_IS_ROOT, rc->rate);
+		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent, 0,
+					      rc->rate);
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %ld\n",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
