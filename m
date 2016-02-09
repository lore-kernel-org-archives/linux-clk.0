Return-Path: <slemieux.tyco@gmail.com>
Return-Path: <slemieux.tyco@gmail.com>
From: slemieux.tyco@gmail.com
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: stigge@antcom.de,
	vz@mleia.com,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: lpc32xx: do not prepare clock "0"
Date: Tue,  9 Feb 2016 13:29:10 -0500
Message-Id: <1455042550-18766-1-git-send-email-slemieux.tyco@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Sylvain Lemieux <slemieux@tycoint.com>

The following errors are display in the console during the power-on:
[    0.000000] lpc32xx_usb_clk_init: failed to register (null) clock: -12
[    0.000000] lpc32xx_clk_init: failed to register (null) clock: -12

There is no need to prepare clock "0"; the first clock used is 1;

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 10dd0fd..981ff0d 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -1515,7 +1515,7 @@ static void __init lpc32xx_clk_init(struct device_node *np)
 		return;
 	}
 
-	for (i = 0; i < LPC32XX_CLK_MAX; i++) {
+	for (i = 1; i < LPC32XX_CLK_MAX; i++) {
 		clk[i] = lpc32xx_clk_register(i);
 		if (IS_ERR(clk[i])) {
 			pr_err("failed to register %s clock: %ld\n",
@@ -1555,7 +1555,7 @@ static void __init lpc32xx_usb_clk_init(struct device_node *np)
 		return;
 	}
 
-	for (i = 0; i < LPC32XX_USB_CLK_MAX; i++) {
+	for (i = 1; i < LPC32XX_USB_CLK_MAX; i++) {
 		usb_clk[i] = lpc32xx_clk_register(i + LPC32XX_CLK_USB_OFFSET);
 		if (IS_ERR(usb_clk[i])) {
 			pr_err("failed to register %s clock: %ld\n",
-- 
1.8.3.1
