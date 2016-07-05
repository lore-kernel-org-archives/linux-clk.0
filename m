Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 3/8] clk: npx: Use new macro CLK_OF_DECLARE_DRIVER
Date: Tue,  5 Jul 2016 18:23:27 +0200
Message-Id: <1467735814-23518-4-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This driver initializes a clock provider via lpc18xx_creg_clk_init
and then continues the initialization on lpc18xx_creg_clk_probe.

Use the new macro to notify the clk subsystem about this behaviour.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/clk/nxp/clk-lpc18xx-creg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-creg.c b/drivers/clk/nxp/clk-lpc18xx-creg.c
index 9e35749dafdf..c6e802e7e6ec 100644
--- a/drivers/clk/nxp/clk-lpc18xx-creg.c
+++ b/drivers/clk/nxp/clk-lpc18xx-creg.c
@@ -184,7 +184,8 @@ static void __init lpc18xx_creg_clk_init(struct device_node *np)
 
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_creg_early_data);
 }
-CLK_OF_DECLARE(lpc18xx_creg_clk, "nxp,lpc1850-creg-clk", lpc18xx_creg_clk_init);
+CLK_OF_DECLARE_DRIVER(lpc18xx_creg_clk, "nxp,lpc1850-creg-clk",
+		      lpc18xx_creg_clk_init);
 
 static struct clk *clk_creg[CREG_CLK_MAX];
 static struct clk_onecell_data clk_creg_data = {
-- 
2.8.1
