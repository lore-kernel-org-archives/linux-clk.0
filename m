Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 3/4] clk: ti: clk-3xxx: Remove unused structures
Date: Wed, 15 Jul 2015 13:08:18 -0700
Message-Id: <1436990899-13105-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
References: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Sparse complains about these structures missing static, but they
also don't look to be used. Remove them.

drivers/clk/ti/clk-3xxx.c:74:30: warning: symbol 'clkhwops_omap3430es2_ssi_wait' was not declared. Should it be static?
drivers/clk/ti/clk-3xxx.c:157:30: warning: symbol 'clkhwops_omap3430es2_hsotgusb_wait' was not declared. Should it be static?

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/clk-3xxx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/ti/clk-3xxx.c b/drivers/clk/ti/clk-3xxx.c
index bd8291b53fd0..676ee8f6d813 100644
--- a/drivers/clk/ti/clk-3xxx.c
+++ b/drivers/clk/ti/clk-3xxx.c
@@ -71,11 +71,6 @@ static void omap3430es2_clk_ssi_find_idlest(struct clk_hw_omap *clk,
 	*idlest_val = OMAP34XX_CM_IDLEST_VAL;
 }
 
-const struct clk_hw_omap_ops clkhwops_omap3430es2_ssi_wait = {
-	.find_idlest	= omap3430es2_clk_ssi_find_idlest,
-	.find_companion	= omap2_clk_dflt_find_companion,
-};
-
 const struct clk_hw_omap_ops clkhwops_omap3430es2_iclk_ssi_wait = {
 	.allow_idle	= omap2_clkt_iclk_allow_idle,
 	.deny_idle	= omap2_clkt_iclk_deny_idle,
@@ -154,11 +149,6 @@ const struct clk_hw_omap_ops clkhwops_omap3430es2_iclk_hsotgusb_wait = {
 	.find_companion	= omap2_clk_dflt_find_companion,
 };
 
-const struct clk_hw_omap_ops clkhwops_omap3430es2_hsotgusb_wait = {
-	.find_idlest	= omap3430es2_clk_hsotgusb_find_idlest,
-	.find_companion	= omap2_clk_dflt_find_companion,
-};
-
 /**
  * am35xx_clk_find_idlest - return clock ACK info for AM35XX IPSS
  * @clk: struct clk * being enabled
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

