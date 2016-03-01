Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Guo Zeng <Guo.Zeng@csr.com>, Barry Song <Baohua.Song@csr.com>
Subject: [PATCH 14/41] clk: sirf: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:59 -0800
Message-Id: <1456858826-28541-15-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Guo Zeng <Guo.Zeng@csr.com>
Cc: Barry Song <Baohua.Song@csr.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sirf/clk-atlas6.c | 7 +++----
 drivers/clk/sirf/clk-prima2.c | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sirf/clk-atlas6.c b/drivers/clk/sirf/clk-atlas6.c
index c5eaa9d16247..665fa681b2e1 100644
--- a/drivers/clk/sirf/clk-atlas6.c
+++ b/drivers/clk/sirf/clk-atlas6.c
@@ -130,10 +130,9 @@ static void __init atlas6_clk_init(struct device_node *np)
 		panic("unable to map clkc registers\n");
 
 	/* These are always available (RTC and 26MHz OSC)*/
-	atlas6_clks[rtc] = clk_register_fixed_rate(NULL, "rtc", NULL,
-		CLK_IS_ROOT, 32768);
-	atlas6_clks[osc] = clk_register_fixed_rate(NULL, "osc", NULL,
-		CLK_IS_ROOT, 26000000);
+	atlas6_clks[rtc] = clk_register_fixed_rate(NULL, "rtc", NULL, 0, 32768);
+	atlas6_clks[osc] = clk_register_fixed_rate(NULL, "osc", NULL, 0,
+						   26000000);
 
 	for (i = pll1; i < maxclk; i++) {
 		atlas6_clks[i] = clk_register(NULL, atlas6_clk_hw_array[i]);
diff --git a/drivers/clk/sirf/clk-prima2.c b/drivers/clk/sirf/clk-prima2.c
index f92c40264342..aac1c8ec151a 100644
--- a/drivers/clk/sirf/clk-prima2.c
+++ b/drivers/clk/sirf/clk-prima2.c
@@ -129,10 +129,9 @@ static void __init prima2_clk_init(struct device_node *np)
 		panic("unable to map clkc registers\n");
 
 	/* These are always available (RTC and 26MHz OSC)*/
-	prima2_clks[rtc] = clk_register_fixed_rate(NULL, "rtc", NULL,
-		CLK_IS_ROOT, 32768);
-	prima2_clks[osc] = clk_register_fixed_rate(NULL, "osc", NULL,
-		CLK_IS_ROOT, 26000000);
+	prima2_clks[rtc] = clk_register_fixed_rate(NULL, "rtc", NULL, 0, 32768);
+	prima2_clks[osc] = clk_register_fixed_rate(NULL, "osc", NULL, 0,
+						   26000000);
 
 	for (i = pll1; i < maxclk; i++) {
 		prima2_clks[i] = clk_register(NULL, prima2_clk_hw_array[i]);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
