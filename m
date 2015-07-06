Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Hai Li <hali@codeaurora.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, georgi.djakov@linaro.org,
	tomeu.vizoso@collabora.com, architt@codeaurora.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hai Li <hali@codeaurora.org>
Subject: [PATCH v2] clk: qcom: Use parent rate when set rate to pixel RCG clock
Date: Mon,  6 Jul 2015 10:49:36 -0400
Message-Id: <1436194176-17701-1-git-send-email-hali@codeaurora.org>
In-Reply-To: <1435271733-24455-1-git-send-email-hali@codeaurora.org>
References: <1435271733-24455-1-git-send-email-hali@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Since the parent rate has been recalculated, pixel RCG clock
should rely on it to find the correct M/N values during set_rate,
instead of calling __clk_round_rate() to its parent again.

v2: Rebase on clk-next and avoid build warning

Signed-off-by: Hai Li <hali@codeaurora.org>
Tested-by: Archit Taneja <architt@codeaurora.org>
Fixes: 99cbd064b059 ("clk: qcom: Support display RCG clocks")
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index b95d17f..92936f0 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -530,19 +530,16 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	struct freq_tbl f = *rcg->freq_tbl;
 	const struct frac_entry *frac = frac_table_pixel;
-	unsigned long request, src_rate;
+	unsigned long request;
 	int delta = 100000;
 	u32 mask = BIT(rcg->hid_width) - 1;
 	u32 hid_div;
-	int index = qcom_find_src_index(hw, rcg->parent_map, f.src);
-	struct clk *parent = clk_get_parent_by_index(hw->clk, index);
 
 	for (; frac->num; frac++) {
 		request = (rate * frac->den) / frac->num;
 
-		src_rate = __clk_round_rate(parent, request);
-		if ((src_rate < (request - delta)) ||
-			(src_rate > (request + delta)))
+		if ((parent_rate < (request - delta)) ||
+			(parent_rate > (request + delta)))
 			continue;
 
 		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

