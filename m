Return-Path: <axel.lin@ingics.com>
Return-Path: <axel.lin@ingics.com>
From: Axel Lin <axel.lin@ingics.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] clk: qcom: lcc-ipq806x: Fixup overriding val in regmap_read call
Date: Sat, 10 Sep 2016 11:47:30 +0800
Message-Id: <1473479250-2225-1-git-send-email-axel.lin@ingics.com>
List-ID: <linux-clk.vger.kernel.org>

Drop the assignment of regmap_read return code to val, so the code checks
the value read.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/clk/qcom/lcc-ipq806x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/lcc-ipq806x.c b/drivers/clk/qcom/lcc-ipq806x.c
index db3998e..977e98e 100644
--- a/drivers/clk/qcom/lcc-ipq806x.c
+++ b/drivers/clk/qcom/lcc-ipq806x.c
@@ -443,7 +443,7 @@ static int lcc_ipq806x_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 
 	/* Configure the rate of PLL4 if the bootloader hasn't already */
-	val = regmap_read(regmap, 0x0, &val);
+	regmap_read(regmap, 0x0, &val);
 	if (!val)
 		clk_pll_configure_sr(&pll4, regmap, &pll4_config, true);
 	/* Enable PLL4 source on the LPASS Primary PLL Mux */
-- 
2.7.4
