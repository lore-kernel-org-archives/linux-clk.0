Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] clk: Add is_enabled sanity check
Date: Fri, 22 Apr 2016 10:32:36 +0800
Message-Id: <1461292356-26043-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

If .enable and .disable is implemented, we must implement .is_enabled
per document. Otherwise, clk_disable_unused_subtree will not disable
the unused clock if the .is_enabled is not implemented, unecessary
power consumption happens on the clock as a result.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/clk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f13c3f4..5e63bee 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2526,6 +2526,10 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 	int i, ret;
 	struct clk_core *core;
 
+	if (hw->init->ops->enable && !hw->init->ops->is_enabled)
+		pr_warn("Warning: %s %s must implement .is_enabled\n",
+			__func__, hw->init->name);
+
 	core = kzalloc(sizeof(*core), GFP_KERNEL);
 	if (!core) {
 		ret = -ENOMEM;
-- 
1.9.1
