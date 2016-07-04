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
Subject: [PATCH 02/10] clk: meson: make gxbb explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:12 -0400
Message-ID: <20160704211220.5685-3-paul.gortmaker@windriver.com>
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The Kconfig currently controlling compilation of this code is:

drivers/clk/meson/Kconfig:config COMMON_CLK_GXBB
drivers/clk/meson/Kconfig:      bool

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE and ALIAS are no-op for non-modules.

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
 drivers/clk/meson/gxbb.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 007b7157cf4b..a4c6684b3019 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1,4 +1,6 @@
 /*
+ * AmLogic S905 / GXBB Clock Controller Driver
+ *
  * Copyright (c) 2016 AmLogic, Inc.
  * Michael Turquette <mturquette@baylibre.com>
  *
@@ -19,7 +21,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/module.h>
+#include <linux/init.h>
 
 #include "clkc.h"
 #include "gxbb.h"
@@ -926,7 +928,6 @@ static const struct of_device_id gxbb_clkc_match_table[] = {
 	{ .compatible = "amlogic,gxbb-clkc" },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, gxbb_match_table);
 
 static struct platform_driver gxbb_driver = {
 	.probe		= gxbb_clkc_probe,
@@ -940,15 +941,4 @@ static int __init gxbb_clkc_init(void)
 {
 	return platform_driver_register(&gxbb_driver);
 }
-module_init(gxbb_clkc_init);
-
-static void __exit gxbb_clkc_exit(void)
-{
-	platform_driver_unregister(&gxbb_driver);
-}
-module_exit(gxbb_clkc_exit);
-
-MODULE_DESCRIPTION("AmLogic S905 / GXBB Clock Controller Driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:gxbb-clkc");
-MODULE_AUTHOR("Michael Turquette <mturquette@baylibre.com>");
+device_initcall(gxbb_clkc_init);
-- 
2.8.4
