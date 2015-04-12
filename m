Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: mturquette@linaro.org,
	sboyd@codeaurora.org,
	sebastian.hesselbarth@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH] clk: si5351: fix .recalc_rate for multisynth 6-7
Date: Sun, 12 Apr 2015 14:48:26 +0200
Message-Id: <1428842906-24808-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

MS6 and MS7 do not have the MSx_P3 field. Do the 'params.p3 == 0'
check for MS0-M5 only. See [AN619, p. 6] for details.

Referenced document:
[AN619] Manually Generating an Si5351 Register Map, Rev. 0.4

Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
 drivers/clk/clk-si5351.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 8e90bdd..e7db92f 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -607,9 +607,6 @@ static unsigned long si5351_msynth_recalc_rate(struct clk_hw *hw,
 	if (!hwdata->params.valid)
 		si5351_read_parameters(hwdata->drvdata, reg, &hwdata->params);
 
-	if (hwdata->params.p3 == 0)
-		return parent_rate;
-
 	/*
 	 * multisync0-5: fOUT = (128 * P3 * fIN) / (P1*P3 + P2 + 512*P3)
 	 * multisync6-7: fOUT = fIN / P1
@@ -617,6 +614,8 @@ static unsigned long si5351_msynth_recalc_rate(struct clk_hw *hw,
 	rate = parent_rate;
 	if (hwdata->num > 5) {
 		m = hwdata->params.p1;
+	} else if (hwdata->params.p3 == 0) {
+		return parent_rate;
 	} else if ((si5351_reg_read(hwdata->drvdata, reg + 2) &
 		    SI5351_OUTPUT_CLK_DIVBY4) == SI5351_OUTPUT_CLK_DIVBY4) {
 		m = 4;
-- 
1.9.1
