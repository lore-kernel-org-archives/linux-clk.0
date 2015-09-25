Return-Path: <shraddha.6596@gmail.com>
Return-Path: <shraddha.6596@gmail.com>
From: Shraddha Barke <shraddha.6596@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [PATCH] Clk: tegra: Use module_platform_driver
Date: Sat, 26 Sep 2015 00:40:14 +0530
Message-Id: <1443208214-8810-1-git-send-email-shraddha.6596@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Use module_platform_driver for drivers whose init and exit functions
only register and unregister, respectively.

Coccinelle patch used-

@a@
identifier f, x;
@@
-static f(...) { return platform_driver_register(&x); }

@b depends on a@
identifier e, a.x;
@@
-static e(...) { platform_driver_unregister(&x); }

@c depends on a && b@
identifier a.f;
declarer name module_init;
@@
-module_init(f);

@d depends on a && b && c@
identifier b.e, a.x;
declarer name module_exit;
declarer name module_platform_driver;
@@
-module_exit(e);
+module_platform_driver(x);

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 6125333..88b4ef4 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -147,18 +147,7 @@ static struct platform_driver tegra124_dfll_fcpu_driver = {
 		.pm = &tegra124_dfll_pm_ops,
 	},
 };
-
-static int __init tegra124_dfll_fcpu_init(void)
-{
-	return platform_driver_register(&tegra124_dfll_fcpu_driver);
-}
-module_init(tegra124_dfll_fcpu_init);
-
-static void __exit tegra124_dfll_fcpu_exit(void)
-{
-	platform_driver_unregister(&tegra124_dfll_fcpu_driver);
-}
-module_exit(tegra124_dfll_fcpu_exit);
+module_platform_driver(tegra124_dfll_fcpu_driver);
 
 MODULE_DESCRIPTION("Tegra124 DFLL clock source driver");
 MODULE_LICENSE("GPL v2");
-- 
2.1.4
