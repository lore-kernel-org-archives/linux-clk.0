Return-Path: <axel.lin@ingics.com>
Return-Path: <axel.lin@ingics.com>
Message-ID: <1449211896.14226.2.camel@ingics.com>
Subject: clk: scpi: Fix checking return value of
 platform_device_register_simple()
From: Axel Lin <axel.lin@ingics.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org
Date: Fri, 04 Dec 2015 14:51:36 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

platform_device_register_simple() returns ERR_PTR on error.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index cd0f272..89e9ca7 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -299,7 +299,7 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 	/* Add the virtual cpufreq device */
 	cpufreq_dev = platform_device_register_simple("scpi-cpufreq",
 						      -1, NULL, 0);
-	if (!cpufreq_dev)
+	if (IS_ERR(cpufreq_dev))
 		pr_warn("unable to register cpufreq device");
 
 	return 0;
-- 
2.1.4
