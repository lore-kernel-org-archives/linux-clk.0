Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yanhaifeng@hisilicon.com>, <haojian.zhuang@linaro.org>,
        <zhangfei.gao@linaro.org>, <xuwei5@hisilicon.com>,
        <yanghongwei@hisilicon.com>,
        Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 5/5] clk: hisilicon: hi3519: add driver remove path and fix some issues
Date: Tue, 10 May 2016 17:19:13 +0800
Message-ID: <1462871953-26606-6-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1462871953-26606-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1462871953-26606-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

1. Add driver remove path.
2. Fix some issues.
   -Fix the ordering issue about clock provider being published.
   -Add error checking upon registering clocks.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/clk-hi3519.c | 116 ++++++++++++++++++++++++++++++++-----
 1 file changed, 100 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
index 715c730..51b173e 100644
--- a/drivers/clk/hisilicon/clk-hi3519.c
+++ b/drivers/clk/hisilicon/clk-hi3519.c
@@ -38,6 +38,11 @@
 
 #define HI3519_NR_CLKS		128
 
+struct hi3519_crg_data {
+	struct hisi_clock_data *clk_data;
+	struct hisi_reset_controller *rstc;
+};
+
 static const struct hisi_fixed_rate_clock hi3519_fixed_rate_clks[] = {
 	{ HI3519_FIXED_24M, "24m", NULL, 0, 24000000, },
 	{ HI3519_FIXED_50M, "50m", NULL, 0, 50000000, },
@@ -80,33 +85,105 @@ static const struct hisi_gate_clock hi3519_gate_clks[] = {
 		CLK_SET_RATE_PARENT, 0xe4, 18, 0, },
 };
 
-static int hi3519_clk_probe(struct platform_device *pdev)
+static struct hisi_clock_data *hi3519_clk_register(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct hisi_clock_data *clk_data;
-	struct hisi_reset_controller *rstc;
+	int ret;
 
-	rstc = hisi_reset_init(np);
-	if (!rstc)
+	clk_data = hisi_clk_alloc(pdev, HI3519_NR_CLKS);
+	if (!clk_data)
+		return ERR_PTR(-ENOMEM);
+
+	ret = hisi_clk_register_fixed_rate(hi3519_fixed_rate_clks,
+				     ARRAY_SIZE(hi3519_fixed_rate_clks),
+				     clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = hisi_clk_register_mux(hi3519_mux_clks,
+				ARRAY_SIZE(hi3519_mux_clks),
+				clk_data);
+	if (ret)
+		goto unregister_fixed_rate;
+
+	ret = hisi_clk_register_gate(hi3519_gate_clks,
+				ARRAY_SIZE(hi3519_gate_clks),
+				clk_data);
+	if (ret)
+		goto unregister_mux;
+
+	ret = of_clk_add_provider(pdev->dev.of_node,
+			of_clk_src_onecell_get, &clk_data->clk_data);
+	if (ret)
+		goto unregister_gate;
+
+	return clk_data;
+
+unregister_fixed_rate:
+	hisi_clk_unregister_fixed_rate(hi3519_fixed_rate_clks,
+				ARRAY_SIZE(hi3519_fixed_rate_clks),
+				clk_data);
+
+unregister_mux:
+	hisi_clk_unregister_mux(hi3519_mux_clks,
+				ARRAY_SIZE(hi3519_mux_clks),
+				clk_data);
+unregister_gate:
+	hisi_clk_unregister_gate(hi3519_gate_clks,
+				ARRAY_SIZE(hi3519_gate_clks),
+				clk_data);
+	return ERR_PTR(ret);
+}
+
+static void hi3519_clk_unregister(struct platform_device *pdev)
+{
+	struct hi3519_crg_data *crg = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	hisi_clk_unregister_gate(hi3519_gate_clks,
+				ARRAY_SIZE(hi3519_mux_clks),
+				crg->clk_data);
+	hisi_clk_unregister_mux(hi3519_mux_clks,
+				ARRAY_SIZE(hi3519_mux_clks),
+				crg->clk_data);
+	hisi_clk_unregister_fixed_rate(hi3519_fixed_rate_clks,
+				ARRAY_SIZE(hi3519_fixed_rate_clks),
+				crg->clk_data);
+}
+
+static int hi3519_clk_probe(struct platform_device *pdev)
+{
+	struct hi3519_crg_data *crg;
+
+	crg = devm_kmalloc(&pdev->dev, sizeof(*crg), GFP_KERNEL);
+	if (!crg)
+		return -ENOMEM;
+
+	crg->rstc = hisi_reset_init(pdev);
+	if (!crg->rstc)
 		return -ENOMEM;
 
-	clk_data = hisi_clk_init(np, HI3519_NR_CLKS);
-	if (!clk_data) {
-		hisi_reset_exit(rstc);
-		return -ENODEV;
+	crg->clk_data = hi3519_clk_register(pdev);
+	if (IS_ERR(crg->clk_data)) {
+		hisi_reset_exit(crg->rstc);
+		return PTR_ERR(crg->clk_data);
 	}
 
-	hisi_clk_register_fixed_rate(hi3519_fixed_rate_clks,
-				     ARRAY_SIZE(hi3519_fixed_rate_clks),
-				     clk_data);
-	hisi_clk_register_mux(hi3519_mux_clks, ARRAY_SIZE(hi3519_mux_clks),
-					clk_data);
-	hisi_clk_register_gate(hi3519_gate_clks,
-			ARRAY_SIZE(hi3519_gate_clks), clk_data);
+	platform_set_drvdata(pdev, crg);
+	return 0;
+}
+
+static int hi3519_clk_remove(struct platform_device *pdev)
+{
+	struct hi3519_crg_data *crg = platform_get_drvdata(pdev);
 
+	hisi_reset_exit(crg->rstc);
+	hi3519_clk_unregister(pdev);
 	return 0;
 }
 
+
 static const struct of_device_id hi3519_clk_match_table[] = {
 	{ .compatible = "hisilicon,hi3519-crg" },
 	{ }
@@ -115,6 +192,7 @@ MODULE_DEVICE_TABLE(of, hi3519_clk_match_table);
 
 static struct platform_driver hi3519_clk_driver = {
 	.probe          = hi3519_clk_probe,
+	.remove		= hi3519_clk_remove,
 	.driver         = {
 		.name   = "hi3519-clk",
 		.of_match_table = hi3519_clk_match_table,
@@ -127,5 +205,11 @@ static int __init hi3519_clk_init(void)
 }
 core_initcall(hi3519_clk_init);
 
+static void __exit hi3519_clk_exit(void)
+{
+	platform_driver_unregister(&hi3519_clk_driver);
+}
+module_exit(hi3519_clk_exit);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("HiSilicon Hi3519 Clock Driver");
-- 
1.9.1
