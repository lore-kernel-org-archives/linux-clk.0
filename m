Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 5/8] clk: sunxi: Use new macro CLK_OF_DECLARE_DRIVER
Date: Tue,  5 Jul 2016 18:23:31 +0200
Message-Id: <1467735814-23518-8-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This driver initializes a clock provider via sun8i_a23_apb0_setup
and then continues the initialization on sun8i_a23_apb0_clk_probe.

Use the new macro to notify the clk subsystem about this behaviour.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/clk/sunxi/clk-sun8i-apb0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-sun8i-apb0.c
index 2ea61debffc1..b6be5d2d9440 100644
--- a/drivers/clk/sunxi/clk-sun8i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
@@ -82,8 +82,8 @@ err_unmap:
 	of_address_to_resource(node, 0, &res);
 	release_mem_region(res.start, resource_size(&res));
 }
-CLK_OF_DECLARE(sun8i_a23_apb0, "allwinner,sun8i-a23-apb0-clk",
-	       sun8i_a23_apb0_setup);
+CLK_OF_DECLARE_DRIVER(sun8i_a23_apb0, "allwinner,sun8i-a23-apb0-clk",
+		      sun8i_a23_apb0_setup);
 
 static int sun8i_a23_apb0_clk_probe(struct platform_device *pdev)
 {
-- 
2.8.1
