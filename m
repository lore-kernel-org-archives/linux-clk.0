Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.uni-paderborn.de ([131.234.142.9]:53998 "EHLO
	mail.uni-paderborn.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752341AbbHJOuz (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 10 Aug 2015 10:50:55 -0400
MIME-Version: 1.0
Date: Mon, 10 Aug 2015 16:50:50 +0200
Message-ID: <CALcgO_49YPGoCOv23Vz9vbnq9+AN3WqvYyg9_TtvsQcz8ia2Hw@mail.gmail.com>
Subject: [PATCH RFC] clk-gpio-gate: use prepare/unprepare to do the GPIO work
From: Michael Allwright <michael.allwright@upb.de>
To: Jyri Sarha <jsarha@ti.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

>From 19512587a6799c3cb96dc3f95d989b7c778a6f8c Mon Sep 17 00:00:00 2001
From: Michael Allwright <allsey87@gmail.com>
Date: Mon, 10 Aug 2015 16:44:05 +0200
Subject: [PATCH] clk-gpio-gate: use prepare/unprepare ops to control clock
 enabling via gpiod_set_value_cansleep. This allows for GPIO expanders on I2C
 and SPI buses

---
 drivers/clk/clk-gpio-gate.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
index a71cabe..432edd9 100644
--- a/drivers/clk/clk-gpio-gate.c
+++ b/drivers/clk/clk-gpio-gate.c
@@ -22,8 +22,8 @@
  * DOC: basic gpio gated clock which can be enabled and disabled
  *      with gpio output
  * Traits of this clock:
- * prepare - clk_(un)prepare only ensures parent is (un)prepared
- * enable - clk_enable and clk_disable are functional & control gpio
+ * prepare - clk_(un)prepare ensures parent is (un)prepared and control gpio
+ * enable - clk_enable and clk_disable only ensures parent is enabled/disabled
  * rate - inherits rate from parent.  No clk_set_rate support
  * parent - fixed parent.  No clk_set_parent support
  */
@@ -32,28 +32,45 @@

 static int clk_gpio_gate_enable(struct clk_hw *hw)
 {
+    return 0;
+}
+
+static void clk_gpio_gate_disable(struct clk_hw *hw)
+{
+}
+
+static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
+{
+    return 0;
+}
+
+static int clk_gpio_gate_prepare(struct clk_hw *hw)
+{
     struct clk_gpio *clk = to_clk_gpio(hw);

-    gpiod_set_value(clk->gpiod, 1);
+    gpiod_set_value_cansleep(clk->gpiod, 1);

     return 0;
 }

-static void clk_gpio_gate_disable(struct clk_hw *hw)
+static void clk_gpio_gate_unprepare(struct clk_hw *hw)
 {
     struct clk_gpio *clk = to_clk_gpio(hw);

-    gpiod_set_value(clk->gpiod, 0);
+    gpiod_set_value_cansleep(clk->gpiod, 0);
 }

-static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
+static int clk_gpio_gate_is_prepared(struct clk_hw *hw)
 {
     struct clk_gpio *clk = to_clk_gpio(hw);

-    return gpiod_get_value(clk->gpiod);
+    return gpiod_get_value_cansleep(clk->gpiod);
 }

 const struct clk_ops clk_gpio_gate_ops = {
+    .prepare = clk_gpio_gate_prepare,
+    .unprepare = clk_gpio_gate_unprepare,
+    .is_prepared = clk_gpio_gate_is_prepared,
     .enable = clk_gpio_gate_enable,
     .disable = clk_gpio_gate_disable,
     .is_enabled = clk_gpio_gate_is_enabled,
-- 
1.9.1
