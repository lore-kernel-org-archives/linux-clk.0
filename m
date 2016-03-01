Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49851 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569AbcCATAp (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2016 14:00:45 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 37/41] clk: scpi: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:22 -0800
Message-Id: <1456858826-28541-38-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 89e9ca78bb94..6962ee5d1e9a 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -155,7 +155,7 @@ scpi_clk_ops_init(struct device *dev, const struct of_device_id *match,
 	unsigned long min = 0, max = 0;
 
 	init.name = name;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 	init.num_parents = 0;
 	init.ops = match->data;
 	sclk->hw.init = &init;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

