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
Subject: [PATCH v2 2/2] clk: qcom: clk-rpm: Fix clk_hw references
Date: Wed, 23 Nov 2016 16:52:49 +0200
Message-Id: <20161123145249.14912-2-georgi.djakov@linaro.org>
In-Reply-To: <20161123145249.14912-1-georgi.djakov@linaro.org>
References: <20161123145249.14912-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Fix the clk_hw references to the actual clocks and add a xlate function
to return the hw pointers from the already existing static array.

Reported-by: Michael Scott <michael.scott@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 1950a9572624..df3e5fe8442a 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -127,8 +127,8 @@ struct clk_rpm {
 
 struct rpm_cc {
 	struct qcom_rpm *rpm;
-	struct clk_hw_onecell_data data;
-	struct clk_hw *hws[];
+	struct clk_rpm **clks;
+	size_t num_clks;
 };
 
 struct rpm_clk_desc {
@@ -391,11 +391,23 @@ static const struct of_device_id rpm_clk_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rpm_clk_match_table);
 
+static struct clk_hw *qcom_rpm_clk_hw_get(struct of_phandle_args *clkspec,
+					  void *data)
+{
+	struct rpm_cc *rcc = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= rcc->num_clks) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return rcc->clks[idx] ? &rcc->clks[idx]->hw : ERR_PTR(-ENOENT);
+}
+
 static int rpm_clk_probe(struct platform_device *pdev)
 {
-	struct clk_hw **hws;
 	struct rpm_cc *rcc;
-	struct clk_hw_onecell_data *data;
 	int ret;
 	size_t num_clks, i;
 	struct qcom_rpm *rpm;
@@ -415,14 +427,12 @@ static int rpm_clk_probe(struct platform_device *pdev)
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
+	rcc->clks = rpm_clks;
+	rcc->num_clks = num_clks;
 
 	for (i = 0; i < num_clks; i++) {
 		if (!rpm_clks[i])
@@ -436,18 +446,16 @@ static int rpm_clk_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < num_clks; i++) {
-		if (!rpm_clks[i]) {
-			data->hws[i] = ERR_PTR(-ENOENT);
+		if (!rpm_clks[i])
 			continue;
-		}
 
 		ret = devm_clk_hw_register(&pdev->dev, &rpm_clks[i]->hw);
 		if (ret)
 			goto err;
 	}
 
-	ret = of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
-				     data);
+	ret = of_clk_add_hw_provider(pdev->dev.of_node, qcom_rpm_clk_hw_get,
+				     rcc);
 	if (ret)
 		goto err;
 
