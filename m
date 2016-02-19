Return-Path: <festevam@gmail.com>
Return-Path: <festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@codeaurora.org,
	linux@arm.linux.org.uk,
	linux-clk@vger.kernel.org,
	Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] clk: gpio: Fix buggy merge
Date: Fri, 19 Feb 2016 15:29:16 -0200
Message-Id: <1455902956-10016-1-git-send-email-festevam@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Clock maintainer mis-merged Russell King's commit 7ed88aa2efa54
("clk: fix clk-gpio.c with optional clock= DT property")
causing the gpio-gate-clock not to be registered.

Adjust the code, so that it looks like Russell's original submission.

With this fix in place, Wifi chip can be successfully probed on a
imx6q-cubox-i.

Suggested-by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/clk/clk-gpio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 19fed65..05cca92 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -287,15 +287,12 @@ static void __init of_gpio_clk_setup(struct device_node *node,
 	const char **parent_names;
 	int i, num_parents;
 
-	num_parents = of_clk_get_parent_count(node);
-	if (num_parents < 0)
-		return;
-
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return;
 
-	if (num_parents) {
+	num_parents = of_clk_get_parent_count(node);
+	if (num_parents > 0) {
 		parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
 		if (!parent_names) {
 			kfree(data);
-- 
1.9.1
