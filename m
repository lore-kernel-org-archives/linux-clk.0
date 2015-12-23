Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] clk: gpio: fix memory leak
Date: Wed, 23 Dec 2015 12:03:59 +0530
Message-Id: <1450852439-366-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

If we fail to allocate parent_name then we are returning but we missed
freeing data which has already been allocated.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/clk/clk-gpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 335322d..c1baa89 100644
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
1.9.1
