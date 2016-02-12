Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Feb 2016 16:33:13 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: mmcc8974: Use gdscs .parent and remove
 genpd calls
Message-ID: <20160212003313.GB4847@codeaurora.org>
References: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
 <1448986336-16846-7-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448986336-16846-7-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Rajendra Nayak wrote:
> With gdsc driver capable of handling hierarchical power domains,
> specify oxili_gdsc as parent of oxilicx_gdsc.
> 
> Remove all direct calls to genpd from the mmcc clock driver. The
> adding and removing of subdomains is now handled from within
> the gdsc driver.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next + this squashed in

---8<----
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 6b2e4e808125..bcda56e81503 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2617,7 +2617,6 @@ MODULE_DEVICE_TABLE(of, mmcc_msm8974_match_table);
 static int mmcc_msm8974_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
-	int ret;
 
 	regmap = qcom_cc_map(pdev, &mmcc_msm8974_desc);
 	if (IS_ERR(regmap))
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
