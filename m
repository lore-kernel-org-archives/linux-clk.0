Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49961 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753670AbcCATAu (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2016 14:00:50 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Loc Ho <lho@apm.com>
Subject: [PATCH 41/41] clk: xgene: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:26 -0800
Message-Id: <1456858826-28541-42-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Loc Ho <lho@apm.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index bd7156baa08b..ce4cac7c6583 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -198,7 +198,7 @@ static void xgene_pllclk_init(struct device_node *np, enum xgene_pll_type pll_ty
 	of_property_read_string(np, "clock-output-names", &clk_name);
 	clk = xgene_register_clk_pll(NULL,
 			clk_name, of_clk_get_parent_name(np, 0),
-			CLK_IS_ROOT, reg, 0, pll_type, &clk_lock,
+			0, reg, 0, pll_type, &clk_lock,
 			version);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(np, of_clk_src_simple_get, clk);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

