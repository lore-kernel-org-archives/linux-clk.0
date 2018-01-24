Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	project-aspen-dev@linaro.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 5/5] clk: hi3798cv200: add COMBPHY0 clock support
Date: Wed, 24 Jan 2018 19:48:27 +0800
Message-Id: <1516794507-5607-6-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
References: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

From: Jianguo Sun <sunjianguo1@huawei.com>

The clock COMBPHY1 has already been supported by hi3798cv200 driver,
but COMBPHY0 is missing.  It adds COMBPHY0 clock support.

Since the mux table is being shared by COMBPHY0 and COMBPHY1, it renames
comphy1_mux_p and comphy1_mux_table a bit to drop instance number '1'
from there.

Signed-off-by: Jianguo Sun <sunjianguo1@huawei.com>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 15 +++++++++++----
 include/dt-bindings/clock/histb-clock.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index 451830e08375..d6e3971bac9e 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -49,6 +49,7 @@
 #define HI3798CV200_FIXED_60M			83
 #define HI3798CV200_FIXED_166P5M		84
 #define HI3798CV200_SDIO0_MUX			85
+#define HI3798CV200_COMBPHY0_MUX		86
 
 #define HI3798CV200_CRG_NR_CLKS			128
 
@@ -74,9 +75,9 @@
 		"100m", "50m", "25m", "200m", "150m" };
 static u32 mmc_mux_table[] = {0, 1, 2, 3, 6};
 
-static const char *const comphy1_mux_p[] = {
+static const char *const comphy_mux_p[] = {
 		"100m", "25m"};
-static u32 comphy1_mux_table[] = {2, 3};
+static u32 comphy_mux_table[] = {2, 3};
 
 static const char *const sdio_mux_p[] = {
 		"100m", "50m", "150m", "166p5m" };
@@ -85,9 +86,12 @@
 static struct hisi_mux_clock hi3798cv200_mux_clks[] = {
 	{ HI3798CV200_MMC_MUX, "mmc_mux", mmc_mux_p, ARRAY_SIZE(mmc_mux_p),
 		CLK_SET_RATE_PARENT, 0xa0, 8, 3, 0, mmc_mux_table, },
+	{ HI3798CV200_COMBPHY0_MUX, "combphy0_mux",
+		comphy_mux_p, ARRAY_SIZE(comphy_mux_p),
+		CLK_SET_RATE_PARENT, 0x188, 2, 2, 0, comphy_mux_table, },
 	{ HI3798CV200_COMBPHY1_MUX, "combphy1_mux",
-		comphy1_mux_p, ARRAY_SIZE(comphy1_mux_p),
-		CLK_SET_RATE_PARENT, 0x188, 10, 2, 0, comphy1_mux_table, },
+		comphy_mux_p, ARRAY_SIZE(comphy_mux_p),
+		CLK_SET_RATE_PARENT, 0x188, 10, 2, 0, comphy_mux_table, },
 	{ HI3798CV200_SDIO0_MUX, "sdio0_mux", sdio_mux_p,
 		ARRAY_SIZE(sdio_mux_p), CLK_SET_RATE_PARENT,
 		0x9c, 8, 2, 0, sdio_mux_table, },
@@ -147,6 +151,9 @@
 		CLK_SET_RATE_PARENT, 0xcc, 4, 0, },
 	{ HISTB_ETH1_MACIF_CLK, "clk_macif1", "clk_bus_m1",
 		CLK_SET_RATE_PARENT, 0xcc, 25, 0, },
+	/* COMBPHY0 */
+	{ HISTB_COMBPHY0_CLK, "clk_combphy0", "combphy0_mux",
+		CLK_SET_RATE_PARENT, 0x188, 0, 0, },
 	/* COMBPHY1 */
 	{ HISTB_COMBPHY1_CLK, "clk_combphy1", "combphy1_mux",
 		CLK_SET_RATE_PARENT, 0x188, 8, 0, },
diff --git a/include/dt-bindings/clock/histb-clock.h b/include/dt-bindings/clock/histb-clock.h
index eba850ff0017..fab30b3f78b2 100644
--- a/include/dt-bindings/clock/histb-clock.h
+++ b/include/dt-bindings/clock/histb-clock.h
@@ -61,6 +61,7 @@
 #define HISTB_USB2_OTG_UTMI_CLK		39
 #define HISTB_USB2_PHY1_REF_CLK		40
 #define HISTB_USB2_PHY2_REF_CLK		41
+#define HISTB_COMBPHY0_CLK		42
 
 /* clocks provided by mcu CRG */
 #define HISTB_MCE_CLK			1
-- 
1.9.1
