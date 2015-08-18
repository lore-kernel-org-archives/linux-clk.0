Return-Path: <michael.allwright@upb.de>
MIME-Version: 1.0
Date: Tue, 18 Aug 2015 17:40:00 +0200
Message-ID: <CALcgO_7+iDr6FvaUjXdRWXpTpHu8shVKS6nqQ6i9gC=9TmfBGw@mail.gmail.com>
Subject: [RFC] Allow for gate and mux control using non-atomic GPIO
From: Michael Allwright <michael.allwright@upb.de>
To: Jyri Sarha <jsarha@ti.com>, ce3a@gmx.de, mturquette@baylibre.com,
	sboyd@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

The current implementation of clk-gpio completely ignores the use case
where GPIO pins may be accessed over a message based bus like SPI or
I2C. To fix this, and following the comments in clk.h, we should use
the prepare/unprepare methods to do the work where the GPIO operation
would be non-atomic. I propose the following UNTESTED patch (should
apply cleanly over linux-next).

>From 7a21c155e561d84741ce11f0cc4c1f8c5b97d7dc Mon Sep 17 00:00:00 2001
From: Michael Allwright <allsey87@gmail.com>
Date: Tue, 18 Aug 2015 17:26:34 +0200
Subject: [PATCH] Allow non-atomic GPIO ops to control gates and muxes.
 Following the comments in clk.h, use prepare/unprepare methods to do the GPIO
 work in cases where the specified pin can sleep

---
 drivers/clk/clk-gpio.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 10819e2..3172073 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -56,6 +56,29 @@ static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
     return gpiod_get_value(clk->gpiod);
 }

+static int clk_gpio_gate_prepare(struct clk_hw *hw)
+{
+    struct clk_gpio *clk = to_clk_gpio(hw);
+
+    gpiod_set_value_cansleep(clk->gpiod, 1);
+
+    return 0;
+}
+
+static void clk_gpio_gate_unprepare(struct clk_hw *hw)
+{
+    struct clk_gpio *clk = to_clk_gpio(hw);
+
+    gpiod_set_value_cansleep(clk->gpiod, 0);
+}
+
+static int clk_gpio_gate_is_prepared(struct clk_hw *hw)
+{
+    struct clk_gpio *clk = to_clk_gpio(hw);
+
+    return gpiod_get_value_cansleep(clk->gpiod);
+}
+
 const struct clk_ops clk_gpio_gate_ops = {
     .enable = clk_gpio_gate_enable,
     .disable = clk_gpio_gate_disable,
@@ -63,6 +86,14 @@ const struct clk_ops clk_gpio_gate_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_gpio_gate_ops);

+const struct clk_ops clk_sleepable_gpio_gate_ops = {
+    .enable = clk_gpio_gate_prepare,
+    .disable = clk_gpio_gate_unprepare,
+    .is_enabled = clk_gpio_gate_is_prepared,
+};
+EXPORT_SYMBOL_GPL(clk_sleepable_gpio_gate_ops);
+
+
 /**
  * DOC: basic clock multiplexer which can be controlled with a gpio output
  * Traits of this clock:
@@ -75,14 +106,14 @@ static u8 clk_gpio_mux_get_parent(struct clk_hw *hw)
 {
     struct clk_gpio *clk = to_clk_gpio(hw);

-    return gpiod_get_value(clk->gpiod);
+    return gpiod_get_value_cansleep(clk->gpiod);
 }

 static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
 {
     struct clk_gpio *clk = to_clk_gpio(hw);

-    gpiod_set_value(clk->gpiod, index);
+    gpiod_set_value_cansleep(clk->gpiod, index);

     return 0;
 }
@@ -170,10 +201,17 @@ struct clk *clk_register_gpio_gate(struct device
*dev, const char *name,
         const char *parent_name, unsigned gpio, bool active_low,
         unsigned long flags)
 {
-    return clk_register_gpio(dev, name,
-            (parent_name ? &parent_name : NULL),
-            (parent_name ? 1 : 0), gpio, active_low, flags,
-            &clk_gpio_gate_ops);
+    if(gpio_cansleep(gpio))
+        return clk_register_gpio(dev, name,
+                (parent_name ? &parent_name : NULL),
+                (parent_name ? 1 : 0), gpio, active_low, flags,
+                &clk_sleepable_gpio_gate_ops);
+    else
+        return clk_register_gpio(dev, name,
+                (parent_name ? &parent_name : NULL),
+                (parent_name ? 1 : 0), gpio, active_low, flags,
+                &clk_gpio_gate_ops);
+
 }
 EXPORT_SYMBOL_GPL(clk_register_gpio_gate);

-- 
1.9.1
