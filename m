Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v3 8/8] clk: qcom: msm8916: Remove hard-coded sleep_clk_src
Date: Tue, 20 Oct 2015 19:58:00 +0300
Message-Id: <1445360280-2347-9-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The sleep_clk_src has been moved to DT, so we do not need to
register it in the GCC driver anymore.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 3e1062fed230..6b687790fe24 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -3364,9 +3364,6 @@ static int gcc_msm8916_probe(struct platform_device *pdev)
 		clk = clk_register_fixed_factor(dev, "xo", "xo_board", 0, 1, 1);
 		if (IS_ERR(clk))
 			return PTR_ERR(clk);
-
-		clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
-					CLK_IS_ROOT, 32768);
 	}
 
 	return qcom_cc_probe(pdev, &gcc_msm8916_desc);
