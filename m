Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 2/2] clk: Move clk_provider_list to scope of function using it
Date: Mon,  6 Jul 2015 16:59:38 -0700
Message-Id: <1436227178-2465-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436227178-2465-1-git-send-email-sboyd@codeaurora.org>
References: <20150610154941.GJ10549@mwanda>
 <1436227178-2465-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The list isn't used after of_clk_init() is called, so we don't
need to keep an empty list around after init. Put the list on the
stack.

Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 705156828a7a..7873151a7ff8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3054,8 +3054,6 @@ struct clock_provider {
 	struct list_head node;
 };
 
-static LIST_HEAD(clk_provider_list);
-
 /*
  * This function looks for a parent clock. If there is one, then it
  * checks that the provider for this parent clock was initialized, in
@@ -3106,6 +3104,7 @@ void __init of_clk_init(const struct of_device_id *matches)
 	struct clock_provider *clk_provider, *next;
 	bool is_init_done;
 	bool force = false;
+	LIST_HEAD(clk_provider_list);
 
 	if (!matches)
 		matches = &__clk_of_table;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
