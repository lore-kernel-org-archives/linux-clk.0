Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 2/4] clk: ti: Mark ti_clk_features static
Date: Wed, 15 Jul 2015 13:08:17 -0700
Message-Id: <1436990899-13105-3-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
References: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This variable isn't exported outside of this file so mark it
static. Silences the following sparse warning:

drivers/clk/ti/clk.c:36:24: warning: symbol 'ti_clk_features' was not declared. Should it be static?

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 931b44118bdf..5dcc1bdfc7f4 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -33,7 +33,7 @@
 struct ti_clk_ll_ops *ti_clk_ll_ops;
 static struct device_node *clocks_node_ptr[CLK_MAX_MEMMAPS];
 
-struct ti_clk_features ti_clk_features;
+static struct ti_clk_features ti_clk_features;
 
 struct clk_iomap {
 	struct regmap *regmap;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
