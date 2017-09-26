Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 3/4] clk-u300: Add some spaces for better code readability
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Message-ID: <fd1866a5-f7a5-cfb4-0a87-b473e094c72e@users.sourceforge.net>
Date: Tue, 26 Sep 2017 20:23:51 +0200
MIME-Version: 1.0
In-Reply-To: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 19:46:51 +0200

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-u300.c | 64 +++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-u300.c b/drivers/clk/clk-u300.c
index ae78461c7836..b36ca3a14c42 100644
--- a/drivers/clk/clk-u300.c
+++ b/drivers/clk/clk-u300.c
@@ -229,15 +229,15 @@
 #define U300_SYSCON_S0CCR_CLOCK_FREQ_MASK			(0x01E0)
 #define U300_SYSCON_S0CCR_CLOCK_SELECT_MASK			(0x001E)
 #define U300_SYSCON_S0CCR_CLOCK_ENABLE				(0x0001)
-#define U300_SYSCON_S0CCR_SEL_MCLK				(0x8<<1)
-#define U300_SYSCON_S0CCR_SEL_ACC_FSM_CLK			(0xA<<1)
-#define U300_SYSCON_S0CCR_SEL_PLL60_48_CLK			(0xC<<1)
-#define U300_SYSCON_S0CCR_SEL_PLL60_60_CLK			(0xD<<1)
-#define U300_SYSCON_S0CCR_SEL_ACC_PLL208_CLK			(0xE<<1)
-#define U300_SYSCON_S0CCR_SEL_APP_PLL13_CLK			(0x0<<1)
-#define U300_SYSCON_S0CCR_SEL_APP_FSM_CLK			(0x2<<1)
-#define U300_SYSCON_S0CCR_SEL_RTC_CLK				(0x4<<1)
-#define U300_SYSCON_S0CCR_SEL_APP_PLL208_CLK			(0x6<<1)
+#define U300_SYSCON_S0CCR_SEL_MCLK				(0x8 << 1)
+#define U300_SYSCON_S0CCR_SEL_ACC_FSM_CLK			(0xA << 1)
+#define U300_SYSCON_S0CCR_SEL_PLL60_48_CLK			(0xC << 1)
+#define U300_SYSCON_S0CCR_SEL_PLL60_60_CLK			(0xD << 1)
+#define U300_SYSCON_S0CCR_SEL_ACC_PLL208_CLK			(0xE << 1)
+#define U300_SYSCON_S0CCR_SEL_APP_PLL13_CLK			(0x0 << 1)
+#define U300_SYSCON_S0CCR_SEL_APP_FSM_CLK			(0x2 << 1)
+#define U300_SYSCON_S0CCR_SEL_RTC_CLK				(0x4 << 1)
+#define U300_SYSCON_S0CCR_SEL_APP_PLL208_CLK			(0x6 << 1)
 /* SYS_1_CLK_CONTROL second clock control 16 bit (R/W) */
 #define U300_SYSCON_S1CCR					(0x124)
 #define U300_SYSCON_S1CCR_FIELD_MASK				(0x43FF)
@@ -247,15 +247,15 @@
 #define U300_SYSCON_S1CCR_CLOCK_FREQ_MASK			(0x01E0)
 #define U300_SYSCON_S1CCR_CLOCK_SELECT_MASK			(0x001E)
 #define U300_SYSCON_S1CCR_CLOCK_ENABLE				(0x0001)
-#define U300_SYSCON_S1CCR_SEL_MCLK				(0x8<<1)
-#define U300_SYSCON_S1CCR_SEL_ACC_FSM_CLK			(0xA<<1)
-#define U300_SYSCON_S1CCR_SEL_PLL60_48_CLK			(0xC<<1)
-#define U300_SYSCON_S1CCR_SEL_PLL60_60_CLK			(0xD<<1)
-#define U300_SYSCON_S1CCR_SEL_ACC_PLL208_CLK			(0xE<<1)
-#define U300_SYSCON_S1CCR_SEL_ACC_PLL13_CLK			(0x0<<1)
-#define U300_SYSCON_S1CCR_SEL_APP_FSM_CLK			(0x2<<1)
-#define U300_SYSCON_S1CCR_SEL_RTC_CLK				(0x4<<1)
-#define U300_SYSCON_S1CCR_SEL_APP_PLL208_CLK			(0x6<<1)
+#define U300_SYSCON_S1CCR_SEL_MCLK				(0x8 << 1)
+#define U300_SYSCON_S1CCR_SEL_ACC_FSM_CLK			(0xA << 1)
+#define U300_SYSCON_S1CCR_SEL_PLL60_48_CLK			(0xC << 1)
+#define U300_SYSCON_S1CCR_SEL_PLL60_60_CLK			(0xD << 1)
+#define U300_SYSCON_S1CCR_SEL_ACC_PLL208_CLK			(0xE << 1)
+#define U300_SYSCON_S1CCR_SEL_ACC_PLL13_CLK			(0x0 << 1)
+#define U300_SYSCON_S1CCR_SEL_APP_FSM_CLK			(0x2 << 1)
+#define U300_SYSCON_S1CCR_SEL_RTC_CLK				(0x4 << 1)
+#define U300_SYSCON_S1CCR_SEL_APP_PLL208_CLK			(0x6 << 1)
 /* SYS_2_CLK_CONTROL third clock contol 16 bit (R/W) */
 #define U300_SYSCON_S2CCR					(0x128)
 #define U300_SYSCON_S2CCR_FIELD_MASK				(0xC3FF)
@@ -266,15 +266,15 @@
 #define U300_SYSCON_S2CCR_CLOCK_FREQ_MASK			(0x01E0)
 #define U300_SYSCON_S2CCR_CLOCK_SELECT_MASK			(0x001E)
 #define U300_SYSCON_S2CCR_CLOCK_ENABLE				(0x0001)
-#define U300_SYSCON_S2CCR_SEL_MCLK				(0x8<<1)
-#define U300_SYSCON_S2CCR_SEL_ACC_FSM_CLK			(0xA<<1)
-#define U300_SYSCON_S2CCR_SEL_PLL60_48_CLK			(0xC<<1)
-#define U300_SYSCON_S2CCR_SEL_PLL60_60_CLK			(0xD<<1)
-#define U300_SYSCON_S2CCR_SEL_ACC_PLL208_CLK			(0xE<<1)
-#define U300_SYSCON_S2CCR_SEL_ACC_PLL13_CLK			(0x0<<1)
-#define U300_SYSCON_S2CCR_SEL_APP_FSM_CLK			(0x2<<1)
-#define U300_SYSCON_S2CCR_SEL_RTC_CLK				(0x4<<1)
-#define U300_SYSCON_S2CCR_SEL_APP_PLL208_CLK			(0x6<<1)
+#define U300_SYSCON_S2CCR_SEL_MCLK				(0x8 << 1)
+#define U300_SYSCON_S2CCR_SEL_ACC_FSM_CLK			(0xA << 1)
+#define U300_SYSCON_S2CCR_SEL_PLL60_48_CLK			(0xC << 1)
+#define U300_SYSCON_S2CCR_SEL_PLL60_60_CLK			(0xD << 1)
+#define U300_SYSCON_S2CCR_SEL_ACC_PLL208_CLK			(0xE << 1)
+#define U300_SYSCON_S2CCR_SEL_ACC_PLL13_CLK			(0x0 << 1)
+#define U300_SYSCON_S2CCR_SEL_APP_FSM_CLK			(0x2 << 1)
+#define U300_SYSCON_S2CCR_SEL_RTC_CLK				(0x4 << 1)
+#define U300_SYSCON_S2CCR_SEL_APP_PLL208_CLK			(0x6 << 1)
 /* SC_PLL_IRQ_CONTROL 16bit (R/W) */
 #define U300_SYSCON_PICR					(0x0130)
 #define U300_SYSCON_PICR_MASK					(0x00FF)
@@ -568,14 +568,14 @@ syscon_clk_recalc_rate(struct clk_hw *hw,
 	struct clk_syscon *sclk = to_syscon(hw);
 	u16 perf = syscon_get_perf();
 
-	switch(sclk->clk_val) {
+	switch (sclk->clk_val) {
 	case U300_SYSCON_SBCER_FAST_BRIDGE_CLK_EN:
 	case U300_SYSCON_SBCER_I2C0_CLK_EN:
 	case U300_SYSCON_SBCER_I2C1_CLK_EN:
 	case U300_SYSCON_SBCER_MMC_CLK_EN:
 	case U300_SYSCON_SBCER_SPI_CLK_EN:
 		/* The FAST clocks have one progression */
-		switch(perf) {
+		switch (perf) {
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW_POWER:
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW:
 			return 13000000;
@@ -586,7 +586,7 @@ syscon_clk_recalc_rate(struct clk_hw *hw,
 	case U300_SYSCON_SBCER_NANDIF_CLK_EN:
 	case U300_SYSCON_SBCER_XGAM_CLK_EN:
 		/* AMBA interconnect peripherals */
-		switch(perf) {
+		switch (perf) {
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW_POWER:
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW:
 			return 6500000;
@@ -598,7 +598,7 @@ syscon_clk_recalc_rate(struct clk_hw *hw,
 	case U300_SYSCON_SBCER_SEMI_CLK_EN:
 	case U300_SYSCON_SBCER_EMIF_CLK_EN:
 		/* EMIF speeds */
-		switch(perf) {
+		switch (perf) {
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW_POWER:
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW:
 			return 13000000;
@@ -609,7 +609,7 @@ syscon_clk_recalc_rate(struct clk_hw *hw,
 		}
 	case U300_SYSCON_SBCER_CPU_CLK_EN:
 		/* And the fast CPU clock */
-		switch(perf) {
+		switch (perf) {
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW_POWER:
 		case U300_SYSCON_CCR_CLKING_PERFORMANCE_LOW:
 			return 13000000;
-- 
2.14.1
