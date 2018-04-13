Return-Path: <evgreen@chromium.org>
Return-Path: <evgreen@chromium.org>
From: Evan Green <evgreen@chromium.org>
To: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Evan Green <evgreen@chromium.org>
Subject: [PATCH] clk: qcom: Base rcg parent rate off plan frequency
Date: Fri, 13 Apr 2018 13:33:36 -0700
Message-Id: <20180413203336.134364-1-evgreen@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

_freq_tbl_determine_rate uses the pre_div found in the clock plan
multiplied by the requested rate from the caller to determine the
best parent rate to set. If the requested rate is not exactly equal
to the rate that was found in the clock plan, then using the requested
rate in parent rate calculations is incorrect. For instance, if 150MHz
was requested, but 200MHz was the match found, and that plan had a
pre_div of 3, then the parent should be set to 600MHz, not 450MHz.

Signed-off-by: Evan Green <evgreen@chromium.org>
---
 drivers/clk/qcom/clk-rcg2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bbeaf9c09dbb..ec6cee8ff1bc 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -211,6 +211,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 	clk_flags = clk_hw_get_flags(hw);
 	p = clk_hw_get_parent_by_index(hw, index);
 	if (clk_flags & CLK_SET_RATE_PARENT) {
+		rate = f->freq;
 		if (f->pre_div) {
 			rate /= 2;
 			rate *= f->pre_div + 1;
-- 
2.17.0.484.g0c8726318c-goog
