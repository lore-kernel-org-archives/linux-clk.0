Return-Path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] clk: qcom: Do not drop device node twice
Date: Sat, 11 Feb 2017 15:04:56 -0800
Message-Id: <1486854296-23156-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-clk.vger.kernel.org>

of_find_node_by_name() drops the reference to a passed device node.
It is not necessary to drop it again, and doing so may result in the
device node being released prematurely.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/clk/qcom/common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index cfab7b400381..03f9d316f969 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -145,7 +145,6 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 	clocks_node = of_find_node_by_path("/clocks");
 	if (clocks_node)
 		node = of_find_node_by_name(clocks_node, path);
-	of_node_put(clocks_node);
 
 	if (!node) {
 		fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
-- 
2.7.4
