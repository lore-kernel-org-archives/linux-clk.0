Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 1/2] clk: Check for allocation errors in of_clk_init()
Date: Mon,  6 Jul 2015 16:59:37 -0700
Message-Id: <1436227178-2465-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <20150610154941.GJ10549@mwanda>
References: <20150610154941.GJ10549@mwanda>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dan Carpenter reports that we don't check the allocation here for
failure. Add a failure check and free any previously allocated
providers from the clk_provider_list.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/clk/clk.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ddb4b541016f..705156828a7a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3112,8 +3112,17 @@ void __init of_clk_init(const struct of_device_id *matches)
 
 	/* First prepare the list of the clocks providers */
 	for_each_matching_node_and_match(np, matches, &match) {
-		struct clock_provider *parent =
-			kzalloc(sizeof(struct clock_provider),	GFP_KERNEL);
+		struct clock_provider *parent;
+
+		parent = kzalloc(sizeof(*parent), GFP_KERNEL);
+		if (!parent) {
+			list_for_each_entry_safe(clk_provider, next,
+						 &clk_provider_list, node) {
+				list_del(&clk_provider->node);
+				kfree(clk_provider);
+			}
+			return;
+		}
 
 		parent->clk_init_cb = match->data;
 		parent->np = np;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

