Return-Path: <anischal@codeaurora.org>
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH v3 1/3] clk: qcom: Clear hardware clock control bit of RCG
Date: Tue,  3 Apr 2018 18:52:39 +0530
Message-Id: <1522761761-15262-2-git-send-email-anischal@codeaurora.org>
In-Reply-To: <1522761761-15262-1-git-send-email-anischal@codeaurora.org>
References: <1522761761-15262-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

For upcoming targets like sdm845, POR value of the hardware clock control
bit is set for most of root clocks which needs to be cleared for software
to be able to control. For older targets like MSM8996, this bit is reserved
bit and having POR value as 0 so this patch will work for the older targets
too. So update the configuration mask to take care of the same to clear
hardware clock control bit.

Signed-off-by: Amit Nischal <anischal@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bbeaf9c..984de9c 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -42,6 +42,7 @@
 #define CFG_MODE_SHIFT		12
 #define CFG_MODE_MASK		(0x3 << CFG_MODE_SHIFT)
 #define CFG_MODE_DUAL_EDGE	(0x2 << CFG_MODE_SHIFT)
+#define CFG_HW_CLK_CTRL_MASK	BIT(20)

 #define M_REG			0x8
 #define N_REG			0xc
@@ -276,7 +277,7 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	}

 	mask = BIT(rcg->hid_width) - 1;
-	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK;
+	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
 	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
 	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
