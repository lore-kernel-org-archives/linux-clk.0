Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.scott@linaro.org,
	georgi.djakov@linaro.org
Subject: [PATCH 2/2] clk: qcom: clk-rpm: Fix clk_hw_onecell_data references
Date: Mon, 21 Nov 2016 16:04:50 +0200
Message-Id: <20161121140450.12353-2-georgi.djakov@linaro.org>
In-Reply-To: <20161121140450.12353-1-georgi.djakov@linaro.org>
References: <20161121140450.12353-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The clk_hw_onecell_data struct is missing references to the
actual clocks. Fix this.

Reported-by: Michael Scott <michael.scott@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 1950a9572624..5dbed3b1546a 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -127,8 +127,7 @@ struct clk_rpm {
 
 struct rpm_cc {
 	struct qcom_rpm *rpm;
-	struct clk_hw_onecell_data data;
-	struct clk_hw *hws[];
+	struct clk_hw_onecell_data *data;
 };
 
 struct rpm_clk_desc {
@@ -393,9 +392,7 @@ MODULE_DEVICE_TABLE(of, rpm_clk_match_table);
 
 static int rpm_clk_probe(struct platform_device *pdev)
 {
-	struct clk_hw **hws;
 	struct rpm_cc *rcc;
-	struct clk_hw_onecell_data *data;
 	int ret;
 	size_t num_clks, i;
 	struct qcom_rpm *rpm;
@@ -415,14 +412,13 @@ static int rpm_clk_probe(struct platform_device *pdev)
 	rpm_clks = desc->clks;
 	num_clks = desc->num_clks;
 
-	rcc = devm_kzalloc(&pdev->dev, sizeof(*rcc) + sizeof(*hws) * num_clks,
-			   GFP_KERNEL);
+	rcc = devm_kzalloc(&pdev->dev, sizeof(*rcc), GFP_KERNEL);
 	if (!rcc)
 		return -ENOMEM;
 
-	hws = rcc->hws;
-	data = &rcc->data;
-	data->num = num_clks;
+	rcc->data = devm_kzalloc(&pdev->dev, sizeof(*rcc->data) + num_clks *
+				 sizeof(*rcc->data->hws), GFP_KERNEL);
+	rcc->data->num = num_clks;
 
 	for (i = 0; i < num_clks; i++) {
 		if (!rpm_clks[i])
@@ -437,17 +433,19 @@ static int rpm_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < num_clks; i++) {
 		if (!rpm_clks[i]) {
-			data->hws[i] = ERR_PTR(-ENOENT);
+			rcc->data->hws[i] = ERR_PTR(-ENOENT);
 			continue;
 		}
 
 		ret = devm_clk_hw_register(&pdev->dev, &rpm_clks[i]->hw);
 		if (ret)
 			goto err;
+
+		rcc->data->hws[i] = &rpm_clks[i]->hw;
 	}
 
 	ret = of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
-				     data);
+				     rcc->data);
 	if (ret)
 		goto err;
 
