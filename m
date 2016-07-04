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
Subject: [PATCH 04/10] clk: mvebu: make ap806-system-controller explicitly non-modular
Date: Mon, 4 Jul 2016 17:12:14 -0400
Message-ID: <20160704211220.5685-5-paul.gortmaker@windriver.com>
In-Reply-To: <20160704211220.5685-1-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The Kconfig currently controlling compilation of this code is:

drivers/clk/mvebu/Kconfig:config ARMADA_AP806_SYSCON
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
 drivers/clk/mvebu/ap806-system-controller.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 02023baf86c9..8181b919f062 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -14,7 +14,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -135,34 +135,17 @@ fail0:
 	return ret;
 }
 
-static int ap806_syscon_clk_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
-	clk_unregister_fixed_factor(ap806_clks[3]);
-	clk_unregister_fixed_rate(ap806_clks[2]);
-	clk_unregister_fixed_rate(ap806_clks[1]);
-	clk_unregister_fixed_rate(ap806_clks[0]);
-
-	return 0;
-}
-
 static const struct of_device_id ap806_syscon_of_match[] = {
 	{ .compatible = "marvell,ap806-system-controller", },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, armada8k_pcie_of_match);
 
 static struct platform_driver ap806_syscon_driver = {
 	.probe = ap806_syscon_clk_probe,
-	.remove = ap806_syscon_clk_remove,
 	.driver		= {
 		.name	= "marvell-ap806-system-controller",
 		.of_match_table = ap806_syscon_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(ap806_syscon_driver);
-
-MODULE_DESCRIPTION("Marvell AP806 System Controller driver");
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(ap806_syscon_driver);
-- 
2.8.4
