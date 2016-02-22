Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/9] clk: gpio: Remove impossible check for of_clk_get_parent_count() < 0
Date: Mon, 22 Feb 2016 12:54:41 -0800
Message-Id: <1456174487-28397-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The check for < 0 is impossible now that
of_clk_get_parent_count() returns an unsigned int. Simplify the
code and update the type here.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 522bffdbacc5..08f65acc5d57 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -205,15 +205,13 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	const char **parent_names, *gpio_name;
-	int num_parents, gpio;
+	unsigned int num_parents;
+	int gpio;
 	enum of_gpio_flags of_flags;
 	struct clk *clk;
 	bool active_low, is_mux;
 
 	num_parents = of_clk_get_parent_count(node);
-	if (num_parents < 0)
-		num_parents = 0;
-
 	if (num_parents) {
 		parent_names = devm_kcalloc(&pdev->dev, num_parents,
 					    sizeof(char *), GFP_KERNEL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
