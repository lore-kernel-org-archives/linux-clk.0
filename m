Return-Path: <Paul.Gortmaker@windriver.com>
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linux-kernel@vger.kernel.org>
CC: Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione
	<carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>, <linux-clk@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>
Subject: [PATCH 01/10] clk: meson8b: make it explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:11 -0400
Message-ID: <20160704211220.5685-2-paul.gortmaker@windriver.com>
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The Kconfig currently controlling compilation of this code is:

drivers/clk/meson/Kconfig:config COMMON_CLK_MESON8B
drivers/clk/meson/Kconfig:      bool

...meaning that it currently is not being built as a module by anyone.
However a recent commit added a bunch of modular boilerplate to this
driver.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

Also note that MODULE DEVICE_TABLE/ALIAS are no-op when non-modular.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/clk/meson/meson8b-clkc.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index b1902e91213d..4c9413cdf373 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -1,4 +1,6 @@
 /*
+ * AmLogic S805 / Meson8b Clock Controller Driver
+ *
  * Copyright (c) 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
  *
@@ -23,7 +25,7 @@
 #include <linux/of_address.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <linux/platform_device.h>
-#include <linux/module.h>
+#include <linux/init.h>
 
 #include "clkc.h"
 
@@ -429,7 +431,6 @@ static const struct of_device_id meson8b_clkc_match_table[] = {
 	{ .compatible = "amlogic,meson8b-clkc" },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, meson8b_match_table);
 
 static struct platform_driver meson8b_driver = {
 	.probe		= meson8b_clkc_probe,
@@ -443,16 +444,4 @@ static int __init meson8b_clkc_init(void)
 {
 	return platform_driver_register(&meson8b_driver);
 }
-module_init(meson8b_clkc_init);
-
-static void __exit meson8b_clkc_exit(void)
-{
-	platform_driver_unregister(&meson8b_driver);
-}
-module_exit(meson8b_clkc_exit);
-
-MODULE_DESCRIPTION("AmLogic S805 / Meson8b Clock Controller Driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:meson8b-clkc");
-MODULE_AUTHOR("Michael Turquette <mturquette@baylibre.com>");
-MODULE_AUTHOR("Carlo Caione <carlo@endlessm.com>");
+device_initcall(meson8b_clkc_init);
-- 
2.8.4
