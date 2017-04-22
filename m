Return-Path: <dan.carpenter@oracle.com>
Date: Sat, 22 Apr 2017 13:43:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Irina Tirdea <irina.tirdea@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL
Message-ID: <20170422104333.tcdpvessre3pvafk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

clkdev_hw_create() returns NULLs on error, it doesn't return error
pointers.

Fixes: 41ee7caf59e1 ("clk: x86: add "mclk" alias for Baytrail/Cherrytrail")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
index fafc99120dc2..f99abc1106f0 100644
--- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -339,8 +339,8 @@ static int plt_clk_probe(struct platform_device *pdev)
 		}
 	}
 	data->mclk_lookup = clkdev_hw_create(&data->clks[3]->hw, "mclk", NULL);
-	if (IS_ERR(data->mclk_lookup)) {
-		err = PTR_ERR(data->mclk_lookup);
+	if (!data->mclk_lookup) {
+		err = -ENOMEM;
 		goto err_unreg_clk_plt;
 	}
 
