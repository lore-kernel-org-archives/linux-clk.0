Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 2/8] clk: axis: Use new macro CLK_OF_DECLARE_DRIVER
Date: Tue,  5 Jul 2016 18:23:26 +0200
Message-Id: <1467735814-23518-3-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This driver initializes a clock provider via of_artpec6_clkctrl_setup
and then continues the initialization on artpec6_clkctrl_probe.

Use the new macro to notify the clk subsystem about this behaviour.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/clk/axis/clk-artpec6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/axis/clk-artpec6.c b/drivers/clk/axis/clk-artpec6.c
index ffc988b098e4..da1a073c2236 100644
--- a/drivers/clk/axis/clk-artpec6.c
+++ b/drivers/clk/axis/clk-artpec6.c
@@ -113,8 +113,8 @@ static void of_artpec6_clkctrl_setup(struct device_node *np)
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clkdata->clk_data);
 }
 
-CLK_OF_DECLARE(artpec6_clkctrl, "axis,artpec6-clkctrl",
-	       of_artpec6_clkctrl_setup);
+CLK_OF_DECLARE_DRIVER(artpec6_clkctrl, "axis,artpec6-clkctrl",
+		      of_artpec6_clkctrl_setup);
 
 static int artpec6_clkctrl_probe(struct platform_device *pdev)
 {
-- 
2.8.1
