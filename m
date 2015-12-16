Return-Path: <computersforpeace@gmail.com>
Return-Path: <computersforpeace@gmail.com>
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	<linux-kernel@vger.kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Jyri Sarha <jsarha@ti.com>,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH] clk: gpio: fix memory leak in of_gpio_clk_setup()
Date: Wed, 16 Dec 2015 10:28:31 -0800
Message-Id: <1450290511-14442-1-git-send-email-computersforpeace@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Reported by Coverity.

Fixes: f66541ba02d5 ("clk: gpio: Get parent clk names in of_gpio_clk_setup()")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Sergej Sawazki <ce3a@gmx.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 335322dc403f..c1baa89cbf91 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -294,8 +294,10 @@ static void __init of_gpio_clk_setup(struct device_node *node,
 	num_parents = of_clk_get_parent_count(node);
 
 	parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
-	if (!parent_names)
+	if (!parent_names) {
+		kfree(data);
 		return;
+	}
 
 	for (i = 0; i < num_parents; i++)
 		parent_names[i] = of_clk_get_parent_name(node, i);
-- 
2.6.0.rc2.230.g3dd15c0
