Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 09/11] clk: qcom: Add support for table based lookups in clk-regmap-mux
Date: Thu, 29 Sep 2016 14:05:50 +0530
Message-Id: <1475138152-859-10-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add support to pass a table of values for parent selection similar
to whats done in clk-mux

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-regmap-mux.c | 13 +++++++++++++
 drivers/clk/qcom/clk-regmap-mux.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index cae3071..14a2af5 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -28,6 +28,7 @@ static u8 mux_get_parent(struct clk_hw *hw)
 	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
 	struct clk_regmap *clkr = to_clk_regmap(hw);
 	unsigned int mask = GENMASK(mux->width - 1, 0);
+	int num_parents = clk_hw_get_num_parents(hw);
 	unsigned int val;
 
 	regmap_read(clkr->regmap, mux->reg, &val);
@@ -35,6 +36,15 @@ static u8 mux_get_parent(struct clk_hw *hw)
 	val >>= mux->shift;
 	val &= mask;
 
+	if (mux->table) {
+		int i;
+
+		for (i = 0; i < num_parents; i++)
+			if (mux->table[i] == val)
+				return i;
+		return -EINVAL;
+	}
+
 	return val;
 }
 
@@ -45,6 +55,9 @@ static int mux_set_parent(struct clk_hw *hw, u8 index)
 	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
 	unsigned int val;
 
+	if (mux->table)
+		index = mux->table[index];
+
 	val = index;
 	val <<= mux->shift;
 
diff --git a/drivers/clk/qcom/clk-regmap-mux.h b/drivers/clk/qcom/clk-regmap-mux.h
index 5cec761..310804e 100644
--- a/drivers/clk/qcom/clk-regmap-mux.h
+++ b/drivers/clk/qcom/clk-regmap-mux.h
@@ -21,6 +21,7 @@ struct clk_regmap_mux {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	u32			*table;
 	struct clk_regmap	clkr;
 };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
