Return-Path: <Paul.Gortmaker@windriver.com>
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linux-kernel@vger.kernel.org>
CC: Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Neil
 Armstrong <narmstrong@baylibre.com>, <linux-clk@vger.kernel.org>
Subject: [PATCH 05/10] clk: oxnas: make it explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:15 -0400
Message-ID: <20160704211220.5685-6-paul.gortmaker@windriver.com>
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The Kconfig currently controlling compilation of this code is:

drivers/clk/Kconfig:config COMMON_CLK_OXNAS
drivers/clk/Kconfig:    bool "Clock driver for the OXNAS SoC Family"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/clk/clk-oxnas.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
index 79bcb2e42060..47649ac5d399 100644
--- a/drivers/clk/clk-oxnas.c
+++ b/drivers/clk/clk-oxnas.c
@@ -18,7 +18,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/stringify.h>
@@ -170,26 +170,17 @@ static int oxnas_stdclk_probe(struct platform_device *pdev)
 				   clk_oxnas->onecell_data);
 }
 
-static int oxnas_stdclk_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
-
-	return 0;
-}
-
 static const struct of_device_id oxnas_stdclk_dt_ids[] = {
 	{ .compatible = "oxsemi,ox810se-stdclk" },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, oxnas_stdclk_dt_ids);
 
 static struct platform_driver oxnas_stdclk_driver = {
 	.probe = oxnas_stdclk_probe,
-	.remove = oxnas_stdclk_remove,
 	.driver	= {
 		.name = "oxnas-stdclk",
+		.suppress_bind_attrs = true,
 		.of_match_table = oxnas_stdclk_dt_ids,
 	},
 };
-
-module_platform_driver(oxnas_stdclk_driver);
+builtin_platform_driver(oxnas_stdclk_driver);
-- 
2.8.4
