Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Shawn Guo <shawn.guo@linaro.org>,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] clk: zte: Mark pll config tables as const
Date: Fri,  7 Apr 2017 12:23:38 -0700
Message-Id: <20170407192338.30905-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These should be const.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/zte/clk-zx296718.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zte/clk-zx296718.c b/drivers/clk/zte/clk-zx296718.c
index 8db0119bc6f7..a10962988ba8 100644
--- a/drivers/clk/zte/clk-zx296718.c
+++ b/drivers/clk/zte/clk-zx296718.c
@@ -94,14 +94,14 @@
 
 static DEFINE_SPINLOCK(clk_lock);
 
-static struct zx_pll_config pll_cpu_table[] = {
+static const struct zx_pll_config pll_cpu_table[] = {
 	PLL_RATE(1312000000, 0x00103621, 0x04aaaaaa),
 	PLL_RATE(1407000000, 0x00103a21, 0x04aaaaaa),
 	PLL_RATE(1503000000, 0x00103e21, 0x04aaaaaa),
 	PLL_RATE(1600000000, 0x00104221, 0x04aaaaaa),
 };
 
-static struct zx_pll_config pll_vga_table[] = {
+static const struct zx_pll_config pll_vga_table[] = {
 	PLL_RATE(36000000,  0x00102464, 0x04000000), /* 800x600@56 */
 	PLL_RATE(40000000,  0x00102864, 0x04000000), /* 800x600@60 */
 	PLL_RATE(49500000,  0x00103164, 0x04800000), /* 800x600@75 */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
