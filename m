Return-Path: <ray.jui@broadcom.com>
Return-Path: <ray.jui@broadcom.com>
From: Ray Jui <ray.jui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: David Binderman <dcb314@hotmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH] clk: iproc: Remove redundant check
Date: Wed,  5 Apr 2017 12:53:37 -0700
Message-Id: <1491422017-24421-1-git-send-email-ray.jui@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

Remove the redundant check of 'rate' in the if statement of the
'pll_set_rate' function

Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
---
 drivers/clk/bcm/clk-iproc-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
index e04634c..2d61893 100644
--- a/drivers/clk/bcm/clk-iproc-pll.c
+++ b/drivers/clk/bcm/clk-iproc-pll.c
@@ -277,7 +277,7 @@ static int pll_set_rate(struct iproc_clk *clk, unsigned int rate_index,
 	if (rate >= VCO_LOW && rate < VCO_HIGH) {
 		ki = 4;
 		kp_index = KP_BAND_MID;
-	} else if (rate >= VCO_HIGH && rate && rate < VCO_HIGH_HIGH) {
+	} else if (rate >= VCO_HIGH && rate < VCO_HIGH_HIGH) {
 		ki = 3;
 		kp_index = KP_BAND_HIGH;
 	} else if (rate >= VCO_HIGH_HIGH && rate < VCO_MAX) {
-- 
2.1.4
