Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH] clk: hisilicon: Remove CLK_IS_ROOT
Date: Tue, 19 Apr 2016 18:22:46 -0700
Message-Id: <1461115366-21562-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now (see commit 47b0eeb3dc8a "clk: Deprecate
CLK_IS_ROOT", 2016-02-02) so remove it.

Cc: Jiancheng Xue <xuejiancheng@huawei.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/hisilicon/clk-hi3519.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
index ee9df821201c..cb7dfe678a05 100644
--- a/drivers/clk/hisilicon/clk-hi3519.c
+++ b/drivers/clk/hisilicon/clk-hi3519.c
@@ -38,15 +38,15 @@
 #define HI3519_NR_CLKS		128
 
 static const struct hisi_fixed_rate_clock hi3519_fixed_rate_clks[] = {
-	{ HI3519_FIXED_24M, "24m", NULL, CLK_IS_ROOT, 24000000, },
-	{ HI3519_FIXED_50M, "50m", NULL, CLK_IS_ROOT, 50000000, },
-	{ HI3519_FIXED_75M, "75m", NULL, CLK_IS_ROOT, 75000000, },
-	{ HI3519_FIXED_125M, "125m", NULL, CLK_IS_ROOT, 125000000, },
-	{ HI3519_FIXED_150M, "150m", NULL, CLK_IS_ROOT, 150000000, },
-	{ HI3519_FIXED_200M, "200m", NULL, CLK_IS_ROOT, 200000000, },
-	{ HI3519_FIXED_250M, "250m", NULL, CLK_IS_ROOT, 250000000, },
-	{ HI3519_FIXED_300M, "300m", NULL, CLK_IS_ROOT, 300000000, },
-	{ HI3519_FIXED_400M, "400m", NULL, CLK_IS_ROOT, 400000000, },
+	{ HI3519_FIXED_24M, "24m", NULL, 0, 24000000, },
+	{ HI3519_FIXED_50M, "50m", NULL, 0, 50000000, },
+	{ HI3519_FIXED_75M, "75m", NULL, 0, 75000000, },
+	{ HI3519_FIXED_125M, "125m", NULL, 0, 125000000, },
+	{ HI3519_FIXED_150M, "150m", NULL, 0, 150000000, },
+	{ HI3519_FIXED_200M, "200m", NULL, 0, 200000000, },
+	{ HI3519_FIXED_250M, "250m", NULL, 0, 250000000, },
+	{ HI3519_FIXED_300M, "300m", NULL, 0, 300000000, },
+	{ HI3519_FIXED_400M, "400m", NULL, 0, 400000000, },
 };
 
 static const char *const fmc_mux_p[] = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
