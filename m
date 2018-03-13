Return-Path: <mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] clk: clk-gpio: Allow GPIO to sleep in set/get_parent
Date: Tue, 13 Mar 2018 09:54:03 +0100
Message-Id: <1520931243-29091-1-git-send-email-mike.looijmans@topic.nl>
List-ID: <linux-clk.vger.kernel.org>

When changing or retrieving clock parents, the caller is in a sleepable
state (like prepare) so the GPIO operation need not be atomic. Replace
gpiod_{g|s}et_value with gpiod_{g|s}et_value_cansleep in the {g|s}et_parent
calls for the GPIO based clock mux.

This fixes a "slowpath" warning when the GPIO controller is an I2C expander
or something similar.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/clk/clk-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 151513c..40af4fb 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -73,14 +73,14 @@ static u8 clk_gpio_mux_get_parent(struct clk_hw *hw)
 {
 	struct clk_gpio *clk = to_clk_gpio(hw);
 
-	return gpiod_get_value(clk->gpiod);
+	return gpiod_get_value_cansleep(clk->gpiod);
 }
 
 static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct clk_gpio *clk = to_clk_gpio(hw);
 
-	gpiod_set_value(clk->gpiod, index);
+	gpiod_set_value_cansleep(clk->gpiod, index);
 
 	return 0;
 }
-- 
1.9.1
