Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 2/2] clk: qcom: gcc: Register QUPv3 RCGs for DFS on SDM845
Date: Thu, 28 Jun 2018 17:17:31 +0530
Message-Id: <1530186451-24648-3-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1530186451-24648-1-git-send-email-tdas@codeaurora.org>
References: <1530186451-24648-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

QUPv3 clocks support DFS and thus register the RCGs which require support
for the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index e78e6f5..034c762 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3421,9 +3421,29 @@ enum {
 };
 MODULE_DEVICE_TABLE(of, gcc_sdm845_match_table);

+static struct clk_rcg2 *gcc_dfs_clocks[] = {
+	&gcc_qupv3_wrap0_s0_clk_src,
+	&gcc_qupv3_wrap0_s1_clk_src,
+	&gcc_qupv3_wrap0_s2_clk_src,
+	&gcc_qupv3_wrap0_s3_clk_src,
+	&gcc_qupv3_wrap0_s4_clk_src,
+	&gcc_qupv3_wrap0_s5_clk_src,
+	&gcc_qupv3_wrap0_s6_clk_src,
+	&gcc_qupv3_wrap0_s7_clk_src,
+	&gcc_qupv3_wrap1_s0_clk_src,
+	&gcc_qupv3_wrap1_s1_clk_src,
+	&gcc_qupv3_wrap1_s2_clk_src,
+	&gcc_qupv3_wrap1_s3_clk_src,
+	&gcc_qupv3_wrap1_s4_clk_src,
+	&gcc_qupv3_wrap1_s5_clk_src,
+	&gcc_qupv3_wrap1_s6_clk_src,
+	&gcc_qupv3_wrap1_s7_clk_src,
+};
+
 static int gcc_sdm845_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;

 	regmap = qcom_cc_map(pdev, &gcc_sdm845_desc);
 	if (IS_ERR(regmap))
@@ -3437,7 +3457,12 @@ static int gcc_sdm845_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x48190, BIT(0), 0x1);
 	regmap_update_bits(regmap, 0x52004, BIT(22), 0x1);

-	return qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
+	if (ret)
+		return ret;
+
+	return qcom_cc_register_rcg_dfs(pdev, gcc_dfs_clocks,
+					ARRAY_SIZE(gcc_dfs_clocks));
 }

 static struct platform_driver gcc_sdm845_driver = {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
