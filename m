Return-Path: <mmcclint@codeaurora.org>
From: Matthew McClintock <mmcclint@codeaurora.org>
To: andy.gross@linaro.org,
	linux-arm-msm@vger.kernel.org
Cc: qca-upstream.external@qca.qualcomm.com,
	Matthew McClintock <mmcclint@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Pradeep Banavathi <pradeepb@codeaurora.org>,
	Senthilkumar N L <snlakshm@codeaurora.org>,
	Varadarajan Narayanan <varada@codeaurora.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/17] clk: qcom: ipq4019: add some fixed clocks for ddrppl and fepll
Date: Wed, 23 Mar 2016 17:05:00 -0500
Message-Id: <1458770712-10880-6-git-send-email-mmcclint@codeaurora.org>
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Drivers for these don't exist yet so we will add them as fixed clocks
so we don't BUG() if we change clocks that reference these clocks.

Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 38ada8d..f0b0a5a 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1316,6 +1316,16 @@ MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
 
 static int gcc_ipq4019_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+
+	clk_register_fixed_rate(dev, "fepll125", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "fepll125dly", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "fepllwcss2g", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "fepllwcss5g", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "fepll200", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "fepll500", "xo", 0, 200000000);
+	clk_register_fixed_rate(dev, "ddrpllapss", "xo", 0, 666000000);
+
 	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
