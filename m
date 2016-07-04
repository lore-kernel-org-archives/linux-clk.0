Return-Path: <Paul.Gortmaker@windriver.com>
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linux-kernel@vger.kernel.org>
CC: Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>,
        <linux-clk@vger.kernel.org>
Subject: [PATCH 03/10] clk: mvebu: make cp110-system-controller explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:13 -0400
Message-ID: <20160704211220.5685-4-paul.gortmaker@windriver.com>
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The Kconfig currently controlling compilation of this code is:

drivers/clk/mvebu/Kconfig:config ARMADA_CP110_SYSCON
drivers/clk/mvebu/Kconfig:      bool

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

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/clk/mvebu/cp110-system-controller.c | 34 +++--------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index 7fa42d6b2b92..15c8b76cc27f 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -30,7 +30,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -362,45 +362,17 @@ fail0:
 	return ret;
 }
 
-static int cp110_syscon_clk_remove(struct platform_device *pdev)
-{
-	int i;
-
-	of_clk_del_provider(pdev->dev.of_node);
-
-	for (i = 0; i < CP110_MAX_GATABLE_CLOCKS; i++) {
-		struct clk *clk = cp110_clks[CP110_MAX_CORE_CLOCKS + i];
-
-		if (clk)
-			cp110_unregister_gate(clk);
-	}
-
-	clk_unregister_fixed_factor(cp110_clks[CP110_CORE_NAND]);
-	clk_unregister_fixed_factor(cp110_clks[CP110_CORE_CORE]);
-	clk_unregister_fixed_factor(cp110_clks[CP110_CORE_EIP]);
-	clk_unregister_fixed_factor(cp110_clks[CP110_CORE_PPV2]);
-	clk_unregister_fixed_rate(cp110_clks[CP110_CORE_APLL]);
-
-	return 0;
-}
-
 static const struct of_device_id cp110_syscon_of_match[] = {
 	{ .compatible = "marvell,cp110-system-controller0", },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, armada8k_pcie_of_match);
 
 static struct platform_driver cp110_syscon_driver = {
 	.probe = cp110_syscon_clk_probe,
-	.remove = cp110_syscon_clk_remove,
 	.driver		= {
 		.name	= "marvell-cp110-system-controller0",
 		.of_match_table = cp110_syscon_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(cp110_syscon_driver);
-
-MODULE_DESCRIPTION("Marvell CP110 System Controller 0 driver");
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(cp110_syscon_driver);
-- 
2.8.4
