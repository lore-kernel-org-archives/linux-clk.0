Return-Path: <shawnguo@kernel.org>
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jun Nie <jun.nie@linaro.org>,
	Baoyou Xie <xie.baoyou@zte.com.cn>,
	Xin Zhou <zhou.xin8@zte.com.cn>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] clk: zte: add pll_vga clock for zx296718
Date: Tue, 21 Mar 2017 16:38:23 +0800
Message-Id: <1490085503-15713-4-git-send-email-shawnguo@kernel.org>
In-Reply-To: <1490085503-15713-1-git-send-email-shawnguo@kernel.org>
References: <1490085503-15713-1-git-send-email-shawnguo@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

From: Shawn Guo <shawn.guo@linaro.org>

It adds zx296718 pll_vga clock for VGA support, so that VGA device can
get required pixel rate from clock driver for different display mode.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/zte/clk-zx296718.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/zte/clk-zx296718.c b/drivers/clk/zte/clk-zx296718.c
index f2e1e8b3a8d5..8db0119bc6f7 100644
--- a/drivers/clk/zte/clk-zx296718.c
+++ b/drivers/clk/zte/clk-zx296718.c
@@ -101,6 +101,29 @@
 	PLL_RATE(1600000000, 0x00104221, 0x04aaaaaa),
 };
 
+static struct zx_pll_config pll_vga_table[] = {
+	PLL_RATE(36000000,  0x00102464, 0x04000000), /* 800x600@56 */
+	PLL_RATE(40000000,  0x00102864, 0x04000000), /* 800x600@60 */
+	PLL_RATE(49500000,  0x00103164, 0x04800000), /* 800x600@75 */
+	PLL_RATE(50000000,  0x00103264, 0x04000000), /* 800x600@72 */
+	PLL_RATE(56250000,  0x00103864, 0x04400000), /* 800x600@85 */
+	PLL_RATE(65000000,  0x00104164, 0x04000000), /* 1024x768@60 */
+	PLL_RATE(74375000,  0x00104a64, 0x04600000), /* 1280x720@60 */
+	PLL_RATE(75000000,  0x00104b64, 0x04800000), /* 1024x768@70 */
+	PLL_RATE(78750000,  0x00104e64, 0x04c00000), /* 1024x768@75 */
+	PLL_RATE(85500000,  0x00105564, 0x04800000), /* 1360x768@60 */
+	PLL_RATE(106500000, 0x00106a64, 0x04800000), /* 1440x900@60 */
+	PLL_RATE(108000000, 0x00106c64, 0x04000000), /* 1280x1024@60 */
+	PLL_RATE(110000000, 0x00106e64, 0x04000000), /* 1024x768@85 */
+	PLL_RATE(135000000, 0x00105a44, 0x04000000), /* 1280x1024@75 */
+	PLL_RATE(136750000, 0x00104462, 0x04600000), /* 1440x900@75 */
+	PLL_RATE(148500000, 0x00104a62, 0x04400000), /* 1920x1080@60 */
+	PLL_RATE(157000000, 0x00104e62, 0x04800000), /* 1440x900@85 */
+	PLL_RATE(157500000, 0x00104e62, 0x04c00000), /* 1280x1024@85 */
+	PLL_RATE(162000000, 0x00105162, 0x04000000), /* 1600x1200@60 */
+	PLL_RATE(193250000, 0x00106062, 0x04a00000), /* 1920x1200@60 */
+};
+
 PNAME(osc) = {
 	"osc24m",
 	"osc32k",
@@ -369,6 +392,7 @@
 
 static struct clk_zx_pll zx296718_pll_clk[] = {
 	ZX296718_PLL("pll_cpu",	"osc24m",	PLL_CPU_REG,	pll_cpu_table),
+	ZX296718_PLL("pll_vga",	"osc24m",	PLL_VGA_REG,	pll_vga_table),
 };
 
 static struct zx_clk_fixed_factor top_ffactor_clk[] = {
-- 
1.9.1
