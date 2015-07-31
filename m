Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 07/26] clk: ti: Remove CLK_IS_BASIC check
Date: Fri, 31 Jul 2015 10:03:47 -0700
Message-Id: <1438362246-6664-8-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This code is never called with a basic clock type, so the check
here is not doing anything useful and is blocking the removal of
__clk_get_flags(). Remove the check so we can delete the
__clk_get_flags() API.

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/autoidle.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/ti/autoidle.c b/drivers/clk/ti/autoidle.c
index 94f0dcd94181..527f2c6dd0aa 100644
--- a/drivers/clk/ti/autoidle.c
+++ b/drivers/clk/ti/autoidle.c
@@ -47,9 +47,6 @@ int omap2_clk_deny_idle(struct clk *clk)
 {
 	struct clk_hw_omap *c;
 
-	if (__clk_get_flags(clk) & CLK_IS_BASIC)
-		return -EINVAL;
-
 	c = to_clk_hw_omap(__clk_get_hw(clk));
 	if (c->ops && c->ops->deny_idle)
 		c->ops->deny_idle(c);
@@ -66,9 +63,6 @@ int omap2_clk_allow_idle(struct clk *clk)
 {
 	struct clk_hw_omap *c;
 
-	if (__clk_get_flags(clk) & CLK_IS_BASIC)
-		return -EINVAL;
-
 	c = to_clk_hw_omap(__clk_get_hw(clk));
 	if (c->ops && c->ops->allow_idle)
 		c->ops->allow_idle(c);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
