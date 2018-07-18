Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:8216 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730361AbeGRPM4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jul 2018 11:12:56 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] clk: renesas: r9a06g032: Avoid needless probe deferring
Date: Wed, 18 Jul 2018 15:34:36 +0100
Message-Id: <1531924476-23261-1-git-send-email-phil.edworthy@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

To avoid all SoC peripheral drivers deferring their probes, both clock and
pinctrl drivers should already be probed. Since the pinctrl driver requires
a clock to access the registers, the clock driver should be probed before
the pinctrl driver.

Therefore, move the clock driver from subsys_initcall to core_initcall.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index a0b6ecd..b03d616 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -877,17 +877,18 @@ static const struct of_device_id r9a06g032_match[] = {
 	{ }
 };
 
-static struct platform_driver r9a06g032_clock_driver = {
+static struct platform_driver r9a06g032_clock_driver __refdata = {
 	.driver		= {
 		.name	= "renesas,r9a06g032-sysctrl",
 		.of_match_table = r9a06g032_match,
 	},
+	.probe = r9a06g032_clocks_probe,
 };
 
 static int __init r9a06g032_clocks_init(void)
 {
-	return platform_driver_probe(&r9a06g032_clock_driver,
-			r9a06g032_clocks_probe);
+	platform_driver_register(&r9a06g032_clock_driver);
+	return 0;
 }
 
-subsys_initcall(r9a06g032_clocks_init);
+core_initcall(r9a06g032_clocks_init);
-- 
2.7.4

