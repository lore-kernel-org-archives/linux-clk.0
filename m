Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 4/8] clk: sunxi: mod0: Use new macro CLK_OF_DECLARE_DRIVER
Date: Tue,  5 Jul 2016 18:23:28 +0200
Message-Id: <1467735814-23518-5-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This driver initializes a clock provider via sun4i_a10_mod0_setup
and then continues the initialization on sun4i_a10_mod0_clk_probe.

Use the new macro to notify the clk subsystem about this behaviour.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/clk/sunxi/clk-mod0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index b38d71cec74c..e54266cc1c51 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -91,7 +91,8 @@ static void __init sun4i_a10_mod0_setup(struct device_node *node)
 	sunxi_factors_register(node, &sun4i_a10_mod0_data,
 			       &sun4i_a10_mod0_lock, reg);
 }
-CLK_OF_DECLARE(sun4i_a10_mod0, "allwinner,sun4i-a10-mod0-clk", sun4i_a10_mod0_setup);
+CLK_OF_DECLARE_DRIVER(sun4i_a10_mod0, "allwinner,sun4i-a10-mod0-clk",
+		      sun4i_a10_mod0_setup);
 
 static int sun4i_a10_mod0_clk_probe(struct platform_device *pdev)
 {
-- 
2.8.1
