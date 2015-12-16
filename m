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
Subject: [PATCH] clk: gpio: handle error codes for of_clk_get_parent_count()
Date: Wed, 16 Dec 2015 10:35:03 -0800
Message-Id: <1450290903-24470-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1450290511-14442-1-git-send-email-computersforpeace@gmail.com>
References: <1450290511-14442-1-git-send-email-computersforpeace@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

We might make bad memory allocations if we get (e.g.) -ENOSYS from
of_clk_get_parent_count().

Noticed by Coverity.

Fixes: f66541ba02d5 ("clk: gpio: Get parent clk names in of_gpio_clk_setup()")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Sergej Sawazki <ce3a@gmx.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>
---
Sorry, I noticed Coverity was complaining about 1 more.

 drivers/clk/clk-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index c1baa89cbf91..1767b9e3ca93 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -287,12 +287,14 @@ static void __init of_gpio_clk_setup(struct device_node *node,
 	const char **parent_names;
 	int i, num_parents;
 
+	num_parents = of_clk_get_parent_count(node);
+	if (num_parents < 0)
+		return;
+
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return;
 
-	num_parents = of_clk_get_parent_count(node);
-
 	parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
 	if (!parent_names) {
 		kfree(data);
-- 
2.6.0.rc2.230.g3dd15c0
