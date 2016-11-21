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
Subject: [PATCH 1/2] clk: qcom: clk-smd-rpm: Fix clk_hw_onecell_data references
Date: Mon, 21 Nov 2016 16:04:49 +0200
Message-Id: <20161121140450.12353-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The clk_hw_onecell_data struct is missing references to the
actual clocks. Fix this.

Reported-by: Michael Scott <michael.scott@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a27013dbc0aa..58821f7213b0 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -148,8 +148,7 @@ struct clk_smd_rpm_req {
 
 struct rpm_cc {
 	struct qcom_rpm *rpm;
-	struct clk_hw_onecell_data data;
-	struct clk_hw *hws[];
+	struct clk_hw_onecell_data *data;
 };
 
 struct rpm_smd_clk_desc {
@@ -470,9 +469,7 @@ MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
 
 static int rpm_smd_clk_probe(struct platform_device *pdev)
 {
-	struct clk_hw **hws;
 	struct rpm_cc *rcc;
-	struct clk_hw_onecell_data *data;
 	int ret;
 	size_t num_clks, i;
 	struct qcom_smd_rpm *rpm;
@@ -492,14 +489,13 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
 	rpm_smd_clks = desc->clks;
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
 		if (!rpm_smd_clks[i])
@@ -518,17 +514,19 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < num_clks; i++) {
 		if (!rpm_smd_clks[i]) {
-			data->hws[i] = ERR_PTR(-ENOENT);
+			rcc->data->hws[i] = ERR_PTR(-ENOENT);
 			continue;
 		}
 
 		ret = devm_clk_hw_register(&pdev->dev, &rpm_smd_clks[i]->hw);
 		if (ret)
 			goto err;
+
+		rcc->data->hws[i] = &rpm_smd_clks[i]->hw;
 	}
 
 	ret = of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
-				     data);
+				     rcc->data);
 	if (ret)
 		goto err;
 
