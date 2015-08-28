Return-Path: <bethencourt@gmail.com>
Return-Path: <bethencourt@gmail.com>
Sender: Luis de Bethencourt <bethencourt@gmail.com>
Date: Fri, 28 Aug 2015 14:44:14 +0200
From: Luis de Bethencourt <luis@debethencourt.com>
To: linux-kernel@vger.kernel.org
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 4/5] clk: sunxi: sun8i-apb0: Fix module autoload for OF
 platform driver
Message-ID: <20150828124414.GA26661@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

This platform driver has a OF device ID table but the OF module
alias information is not created so module autoloading won't work.

Signed-off-by: Luis de Bethencourt <luis@debethencourt.com>
---
 drivers/clk/sunxi/clk-sun8i-apb0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/clk-sun8i-apb0.c
index 155d002..7ae5d2c 100644
--- a/drivers/clk/sunxi/clk-sun8i-apb0.c
+++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
@@ -52,6 +52,7 @@ static const struct of_device_id sun8i_a23_apb0_clk_dt_ids[] = {
 	{ .compatible = "allwinner,sun8i-a23-apb0-clk" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, sun8i_a23_apb0_clk_dt_ids);
 
 static struct platform_driver sun8i_a23_apb0_clk_driver = {
 	.driver = {
-- 
2.4.6
