Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49941 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753622AbcCATAs (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2016 14:00:48 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Daniel Tang <dt.tangr@gmail.com>
Subject: [PATCH 31/41] clk: nspire: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:16 -0800
Message-Id: <1456858826-28541-32-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Daniel Tang <dt.tangr@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-nspire.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-nspire.c b/drivers/clk/clk-nspire.c
index a378db7b2382..64f196a90816 100644
--- a/drivers/clk/clk-nspire.c
+++ b/drivers/clk/clk-nspire.c
@@ -125,8 +125,7 @@ static void __init nspire_clk_setup(struct device_node *node,
 
 	of_property_read_string(node, "clock-output-names", &clk_name);
 
-	clk = clk_register_fixed_rate(NULL, clk_name, NULL, CLK_IS_ROOT,
-			info.base_clock);
+	clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, info.base_clock);
 	if (!IS_ERR(clk))
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 	else
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

