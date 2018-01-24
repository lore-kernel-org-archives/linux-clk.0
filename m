Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	project-aspen-dev@linaro.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 4/5] clk: hi3798cv200: fix define indentation
Date: Wed, 24 Jan 2018 19:48:26 +0800
Message-Id: <1516794507-5607-5-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
References: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

It's a coding-style fix, which corrects the indentation for all those
clock definitions, so that the code looks nicer and new definitions can
be added with a recommended indentation.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 48 ++++++++++++++---------------
 include/dt-bindings/clock/histb-clock.h | 54 ++++++++++++++++-----------------
 2 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index 6017ade0cd92..451830e08375 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -27,30 +27,30 @@
 #include "reset.h"
 
 /* hi3798CV200 core CRG */
-#define HI3798CV200_INNER_CLK_OFFSET	64
-#define HI3798CV200_FIXED_24M	65
-#define HI3798CV200_FIXED_25M	66
-#define HI3798CV200_FIXED_50M	67
-#define HI3798CV200_FIXED_75M	68
-#define HI3798CV200_FIXED_100M	69
-#define HI3798CV200_FIXED_150M	70
-#define HI3798CV200_FIXED_200M	71
-#define HI3798CV200_FIXED_250M	72
-#define HI3798CV200_FIXED_300M	73
-#define HI3798CV200_FIXED_400M	74
-#define HI3798CV200_MMC_MUX	75
-#define HI3798CV200_ETH_PUB_CLK	76
-#define HI3798CV200_ETH_BUS_CLK	77
-#define HI3798CV200_ETH_BUS0_CLK	78
-#define HI3798CV200_ETH_BUS1_CLK	79
-#define HI3798CV200_COMBPHY1_MUX	80
-#define HI3798CV200_FIXED_12M	81
-#define HI3798CV200_FIXED_48M	82
-#define HI3798CV200_FIXED_60M	83
-#define HI3798CV200_FIXED_166P5M	84
-#define HI3798CV200_SDIO0_MUX	85
-
-#define HI3798CV200_CRG_NR_CLKS		128
+#define HI3798CV200_INNER_CLK_OFFSET		64
+#define HI3798CV200_FIXED_24M			65
+#define HI3798CV200_FIXED_25M			66
+#define HI3798CV200_FIXED_50M			67
+#define HI3798CV200_FIXED_75M			68
+#define HI3798CV200_FIXED_100M			69
+#define HI3798CV200_FIXED_150M			70
+#define HI3798CV200_FIXED_200M			71
+#define HI3798CV200_FIXED_250M			72
+#define HI3798CV200_FIXED_300M			73
+#define HI3798CV200_FIXED_400M			74
+#define HI3798CV200_MMC_MUX			75
+#define HI3798CV200_ETH_PUB_CLK			76
+#define HI3798CV200_ETH_BUS_CLK			77
+#define HI3798CV200_ETH_BUS0_CLK		78
+#define HI3798CV200_ETH_BUS1_CLK		79
+#define HI3798CV200_COMBPHY1_MUX		80
+#define HI3798CV200_FIXED_12M			81
+#define HI3798CV200_FIXED_48M			82
+#define HI3798CV200_FIXED_60M			83
+#define HI3798CV200_FIXED_166P5M		84
+#define HI3798CV200_SDIO0_MUX			85
+
+#define HI3798CV200_CRG_NR_CLKS			128
 
 static const struct hisi_fixed_rate_clock hi3798cv200_fixed_rate_clks[] = {
 	{ HISTB_OSC_CLK, "clk_osc", NULL, 0, 24000000, },
diff --git a/include/dt-bindings/clock/histb-clock.h b/include/dt-bindings/clock/histb-clock.h
index 067f5e501b0c..eba850ff0017 100644
--- a/include/dt-bindings/clock/histb-clock.h
+++ b/include/dt-bindings/clock/histb-clock.h
@@ -22,18 +22,18 @@
 #define HISTB_OSC_CLK			0
 #define HISTB_APB_CLK			1
 #define HISTB_AHB_CLK			2
-#define HISTB_UART1_CLK		3
-#define HISTB_UART2_CLK		4
-#define HISTB_UART3_CLK		5
-#define HISTB_I2C0_CLK		6
-#define HISTB_I2C1_CLK		7
-#define HISTB_I2C2_CLK		8
-#define HISTB_I2C3_CLK		9
-#define HISTB_I2C4_CLK		10
-#define HISTB_I2C5_CLK		11
-#define HISTB_SPI0_CLK		12
-#define HISTB_SPI1_CLK		13
-#define HISTB_SPI2_CLK		14
+#define HISTB_UART1_CLK			3
+#define HISTB_UART2_CLK			4
+#define HISTB_UART3_CLK			5
+#define HISTB_I2C0_CLK			6
+#define HISTB_I2C1_CLK			7
+#define HISTB_I2C2_CLK			8
+#define HISTB_I2C3_CLK			9
+#define HISTB_I2C4_CLK			10
+#define HISTB_I2C5_CLK			11
+#define HISTB_SPI0_CLK			12
+#define HISTB_SPI1_CLK			13
+#define HISTB_SPI2_CLK			14
 #define HISTB_SCI_CLK			15
 #define HISTB_FMC_CLK			16
 #define HISTB_MMC_BIU_CLK		17
@@ -43,7 +43,7 @@
 #define HISTB_SDIO0_BIU_CLK		21
 #define HISTB_SDIO0_CIU_CLK		22
 #define HISTB_SDIO0_DRV_CLK		23
-#define HISTB_SDIO0_SAMPLE_CLK	24
+#define HISTB_SDIO0_SAMPLE_CLK		24
 #define HISTB_PCIE_AUX_CLK		25
 #define HISTB_PCIE_PIPE_CLK		26
 #define HISTB_PCIE_SYS_CLK		27
@@ -53,21 +53,21 @@
 #define HISTB_ETH1_MAC_CLK		31
 #define HISTB_ETH1_MACIF_CLK		32
 #define HISTB_COMBPHY1_CLK		33
-#define HISTB_USB2_BUS_CLK	34
-#define HISTB_USB2_PHY_CLK	35
-#define HISTB_USB2_UTMI_CLK	36
-#define HISTB_USB2_12M_CLK	37
-#define HISTB_USB2_48M_CLK	38
-#define HISTB_USB2_OTG_UTMI_CLK	39
-#define HISTB_USB2_PHY1_REF_CLK	40
-#define HISTB_USB2_PHY2_REF_CLK	41
+#define HISTB_USB2_BUS_CLK		34
+#define HISTB_USB2_PHY_CLK		35
+#define HISTB_USB2_UTMI_CLK		36
+#define HISTB_USB2_12M_CLK		37
+#define HISTB_USB2_48M_CLK		38
+#define HISTB_USB2_OTG_UTMI_CLK		39
+#define HISTB_USB2_PHY1_REF_CLK		40
+#define HISTB_USB2_PHY2_REF_CLK		41
 
 /* clocks provided by mcu CRG */
-#define HISTB_MCE_CLK	1
-#define HISTB_IR_CLK	2
-#define HISTB_TIMER01_CLK	3
-#define HISTB_LEDC_CLK	4
-#define HISTB_UART0_CLK	5
-#define HISTB_LSADC_CLK	6
+#define HISTB_MCE_CLK			1
+#define HISTB_IR_CLK			2
+#define HISTB_TIMER01_CLK		3
+#define HISTB_LEDC_CLK			4
+#define HISTB_UART0_CLK			5
+#define HISTB_LSADC_CLK			6
 
 #endif	/* __DTS_HISTB_CLOCK_H */
-- 
1.9.1
