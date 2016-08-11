Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 08/10] clk: qcom: Cleanup some macro defs
Date: Thu, 11 Aug 2016 14:10:56 +0530
Message-Id: <1470904858-11930-9-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

From: Taniya Das <tdas@codeaurora.org>

Move all
'# define XYZ'
to
'#define XYZ'

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index e8f3505..854487e 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -21,28 +21,28 @@
 #include "common.h"
 
 #define PLL_MODE		0x00
-# define PLL_OUTCTRL		BIT(0)
-# define PLL_BYPASSNL		BIT(1)
-# define PLL_RESET_N		BIT(2)
-# define PLL_LOCK_COUNT_SHIFT	8
-# define PLL_LOCK_COUNT_MASK	0x3f
-# define PLL_BIAS_COUNT_SHIFT	14
-# define PLL_BIAS_COUNT_MASK	0x3f
-# define PLL_VOTE_FSM_ENA	BIT(20)
-# define PLL_VOTE_FSM_RESET	BIT(21)
-# define PLL_ACTIVE_FLAG	BIT(30)
-# define PLL_LOCK_DET		BIT(31)
+#define PLL_OUTCTRL		BIT(0)
+#define PLL_BYPASSNL		BIT(1)
+#define PLL_RESET_N		BIT(2)
+#define PLL_LOCK_COUNT_SHIFT	8
+#define PLL_LOCK_COUNT_MASK	0x3f
+#define PLL_BIAS_COUNT_SHIFT	14
+#define PLL_BIAS_COUNT_MASK	0x3f
+#define PLL_VOTE_FSM_ENA	BIT(20)
+#define PLL_VOTE_FSM_RESET	BIT(21)
+#define PLL_ACTIVE_FLAG	BIT(30)
+#define PLL_LOCK_DET		BIT(31)
 
 #define PLL_L_VAL		0x04
 #define PLL_ALPHA_VAL		0x08
 #define PLL_ALPHA_VAL_U		0x0c
 
 #define PLL_USER_CTL		0x10
-# define PLL_POST_DIV_SHIFT	8
-# define PLL_POST_DIV_MASK	0xf
-# define PLL_ALPHA_EN		BIT(24)
-# define PLL_VCO_SHIFT		20
-# define PLL_VCO_MASK		0x3
+#define PLL_POST_DIV_SHIFT	8
+#define PLL_POST_DIV_MASK	0xf
+#define PLL_ALPHA_EN		BIT(24)
+#define PLL_VCO_SHIFT		20
+#define PLL_VCO_MASK		0x3
 
 #define PLL_USER_CTL_U		0x14
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
