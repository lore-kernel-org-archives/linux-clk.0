Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Sergej Sawazki <ce3a@gmx.de>,
	Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 2/2] clk: clk-gpio: Request GPIO descriptor as LOW
Date: Sun, 24 Sep 2017 18:19:19 +0200
Message-Id: <20170924161919.24832-2-linus.walleij@linaro.org>
In-Reply-To: <20170924161919.24832-1-linus.walleij@linaro.org>
References: <20170924161919.24832-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Requesting the GPIOD_OUT_LOW low will make sure the GPIO is
deasserted when requested. The gpiolib core will make sure that
if the GPIO line is active low, it will be logically driven high
when deasserted, see drivers/gpiolib.c gpiod_configure_flags().

Cc: Sergej Sawazki <ce3a@gmx.de>
Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/clk-gpio.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 9d057073e110..151513c655c3 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -109,14 +109,6 @@ static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
 	if (!clk_gpio)
 		return ERR_PTR(-ENOMEM);
 
-	/*
-	 * Set to disabled no matter what: NOTE if the GPIO line is active low
-	 * the GPIO descriptor knows this and will set it high to deassert the
-	 * line. This assumes the GPIO descriptor has been requested using
-	 * GPIOD_ASIS by the callers so we need to initialize it as disabled here.
-	 */
-	gpiod_set_value(gpiod, 0);
-
 	init.name = name;
 	init.ops = clk_gpio_ops;
 	init.flags = flags | CLK_IS_BASIC;
@@ -237,7 +229,7 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
 	is_mux = of_device_is_compatible(node, "gpio-mux-clock");
 
 	gpio_name = is_mux ? "select" : "enable";
-	gpiod = devm_gpiod_get(&pdev->dev, gpio_name, GPIOD_ASIS);
+	gpiod = devm_gpiod_get(&pdev->dev, gpio_name, GPIOD_OUT_LOW);
 	if (IS_ERR(gpiod)) {
 		ret = PTR_ERR(gpiod);
 		if (ret == -EPROBE_DEFER)
-- 
2.13.5
