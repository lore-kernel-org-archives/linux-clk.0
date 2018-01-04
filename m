Return-Path: <weiyongjun1@huawei.com>
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Georgi Djakov <georgi.djakov@linaro.org>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH -next] clk: qcom: msm8916: Fix return value check in qcom_apcs_msm8916_clk_probe()
Date: Thu, 4 Jan 2018 06:34:43 +0000
Message-ID: <1515047683-169770-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

In case of error, the function dev_get_regmap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 81ac38847a1d ("clk: qcom: Add APCS clock controller support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/qcom/apcs-msm8916.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index 246957f..b1cc8db 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -49,11 +49,10 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct clk_regmap_mux_div *a53cc;
 	struct regmap *regmap;
 	struct clk_init_data init = { };
-	int ret;
+	int ret = -ENODEV;
 
 	regmap = dev_get_regmap(parent, NULL);
-	if (IS_ERR(regmap)) {
-		ret = PTR_ERR(regmap);
+	if (!regmap) {
 		dev_err(dev, "failed to get regmap: %d\n", ret);
 		return ret;
 	}
