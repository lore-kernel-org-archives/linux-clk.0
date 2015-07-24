Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH] clk: gpio: Mark parent_names array const
Date: Fri, 24 Jul 2015 11:54:39 -0700
Message-Id: <1437764079-30022-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Let's encourage const arrays of parent names like other basic
clock types.

Cc: Sergej Sawazki <ce3a@gmx.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-gpio.c       | 13 +++++++------
 include/linux/clk-provider.h |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 41277a1526c7..10819e248414 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -95,7 +95,7 @@ const struct clk_ops clk_gpio_mux_ops = {
 EXPORT_SYMBOL_GPL(clk_gpio_mux_ops);
 
 static struct clk *clk_register_gpio(struct device *dev, const char *name,
-		const char **parent_names, u8 num_parents, unsigned gpio,
+		const char * const *parent_names, u8 num_parents, unsigned gpio,
 		bool active_low, unsigned long flags,
 		const struct clk_ops *clk_gpio_ops)
 {
@@ -188,7 +188,7 @@ EXPORT_SYMBOL_GPL(clk_register_gpio_gate);
  * @flags: clock flags
  */
 struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
-		const char **parent_names, u8 num_parents, unsigned gpio,
+		const char * const *parent_names, u8 num_parents, unsigned gpio,
 		bool active_low, unsigned long flags)
 {
 	if (num_parents != 2) {
@@ -213,7 +213,7 @@ struct clk_gpio_delayed_register_data {
 	struct mutex lock;
 	struct clk *clk;
 	struct clk *(*clk_register_get)(const char *name,
-			const char **parent_names, u8 num_parents,
+			const char * const *parent_names, u8 num_parents,
 			unsigned gpio, bool active_low);
 };
 
@@ -273,7 +273,7 @@ out:
 }
 
 static struct clk *of_clk_gpio_gate_delayed_register_get(const char *name,
-		const char **parent_names, u8 num_parents,
+		const char * const *parent_names, u8 num_parents,
 		unsigned gpio, bool active_low)
 {
 	return clk_register_gpio_gate(NULL, name, parent_names[0],
@@ -281,7 +281,7 @@ static struct clk *of_clk_gpio_gate_delayed_register_get(const char *name,
 }
 
 static struct clk *of_clk_gpio_mux_delayed_register_get(const char *name,
-		const char **parent_names, u8 num_parents, unsigned gpio,
+		const char * const *parent_names, u8 num_parents, unsigned gpio,
 		bool active_low)
 {
 	return clk_register_gpio_mux(NULL, name, parent_names, num_parents,
@@ -291,7 +291,8 @@ static struct clk *of_clk_gpio_mux_delayed_register_get(const char *name,
 static void __init of_gpio_clk_setup(struct device_node *node,
 		const char *gpio_name,
 		struct clk *(*clk_register_get)(const char *name,
-				const char **parent_names, u8 num_parents,
+				const char * const *parent_names,
+				u8 num_parents,
 				unsigned gpio, bool active_low))
 {
 	struct clk_gpio_delayed_register_data *data;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 402478ed9933..07f615f8eb92 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -579,7 +579,7 @@ void of_gpio_clk_gate_setup(struct device_node *node);
 
 extern const struct clk_ops clk_gpio_mux_ops;
 struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
-		const char **parent_names, u8 num_parents, unsigned gpio,
+		const char * const *parent_names, u8 num_parents, unsigned gpio,
 		bool active_low, unsigned long flags);
 
 void of_gpio_mux_clk_setup(struct device_node *node);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
