Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] clk: sunxi-ng: Check kzalloc() for errors and cleanup error path
Date: Fri,  3 Feb 2017 15:00:50 -0800
Message-Id: <20170203230050.26181-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This kzalloc() could fail. Let's bail out with -ENOMEM here
instead of NULL dereferencing. That silences static checkers. We
should also cleanup on the error path even though this function
returning an error probably means the system won't boot.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

The code looks suspiciously like the error handling was removed
on purpose.

 drivers/clk/sunxi-ng/ccu_common.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 6986e11e91b0..8a47bafd7890 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -75,6 +75,11 @@ int sunxi_ccu_probe(struct device_node *node, void __iomem *reg,
 		goto err_clk_unreg;
 
 	reset = kzalloc(sizeof(*reset), GFP_KERNEL);
+	if (!reset) {
+		ret = -ENOMEM;
+		goto err_alloc_reset;
+	}
+
 	reset->rcdev.of_node = node;
 	reset->rcdev.ops = &ccu_reset_ops;
 	reset->rcdev.owner = THIS_MODULE;
@@ -90,6 +95,16 @@ int sunxi_ccu_probe(struct device_node *node, void __iomem *reg,
 	return 0;
 
 err_of_clk_unreg:
+	kfree(reset);
+err_alloc_reset:
+	of_clk_del_provider(node);
 err_clk_unreg:
+	while (--i >= 0) {
+		struct clk_hw *hw = desc->hw_clks->hws[i];
+
+		if (!hw)
+			continue;
+		clk_hw_unregister(hw);
+	}
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
