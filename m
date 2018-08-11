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
Subject: [PATCH v4 2/2] clk: qcom: gcc: Register QUPv3 RCGs for DFS on SDM845
Date: Sat, 11 Aug 2018 07:23:56 +0530
Message-Id: <1533952436-17221-3-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
References: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

QUPv3 clocks support DFS and thus register the RCGs which require support
for the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index fa1a196..fef6732 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3458,9 +3458,29 @@ enum {
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
@@ -3470,6 +3490,11 @@ static int gcc_sdm845_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
 	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
 
+	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
+					ARRAY_SIZE(gcc_dfs_clocks));
+	if (ret)
+		return ret;
+
 	return qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
 }
 
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
