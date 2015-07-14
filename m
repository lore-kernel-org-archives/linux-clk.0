Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 1/2] clk: h8300: Drop allocation printk and cleanup sizeof style
Date: Mon, 13 Jul 2015 17:11:49 -0700
Message-Id: <1436832710-23989-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We don't need to print an error on allocation failures, drop it.
While we're here, change the sizeof() to be sizeof(*<ptr>) to
make code more future proof.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/h8300/clk-h8s2678.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index 4701b093e497..c121eb55e2e1 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -98,11 +98,9 @@ static void __init h8s2678_pll_clk_setup(struct device_node *node)
 	}
 
 
-	pll_clock = kzalloc(sizeof(struct pll_clock), GFP_KERNEL);
-	if (!pll_clock) {
-		pr_err("%s: failed to alloc memory", clk_name);
+	pll_clock = kzalloc(sizeof(*pll_clock), GFP_KERNEL);
+	if (!pll_clock)
 		return;
-	}
 
 	pll_clock->sckcr = of_iomap(node, 0);
 	if (pll_clock->sckcr == NULL) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

