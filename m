Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>,
	Jyri Sarha <jsarha@ti.com>
Subject: [PATCH] clk: gpio: Add debug messages for clock ops
Date: Sat,  4 Feb 2017 21:22:30 +0100
Message-Id: <1486239750-24846-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

Debug messages are helpful when debugging the clock tree setup.

Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
 drivers/clk/clk-gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 86b2457..012c289 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -38,6 +38,7 @@ static int clk_gpio_gate_enable(struct clk_hw *hw)
 	struct clk_gpio *clk = to_clk_gpio(hw);
 
 	gpiod_set_value(clk->gpiod, 1);
+	pr_debug("%s clock enabled\n", clk_hw_get_name(hw));
 
 	return 0;
 }
@@ -47,6 +48,7 @@ static void clk_gpio_gate_disable(struct clk_hw *hw)
 	struct clk_gpio *clk = to_clk_gpio(hw);
 
 	gpiod_set_value(clk->gpiod, 0);
+	pr_debug("%s clock disabled\n", clk_hw_get_name(hw));
 }
 
 static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
@@ -83,6 +85,7 @@ static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
 	struct clk_gpio *clk = to_clk_gpio(hw);
 
 	gpiod_set_value(clk->gpiod, index);
+	pr_debug("%s set parent %d\n", clk_hw_get_name(hw), index);
 
 	return 0;
 }
-- 
2.7.4
