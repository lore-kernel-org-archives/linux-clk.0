Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v4 3/6] meson: clk: Rename register names according to Amlogic datasheet
Date: Fri, 29 Jul 2016 16:01:01 +0200
Message-Id: <1469800864-43440-4-git-send-email-serveralex@gmail.com>
In-Reply-To: <1469800864-43440-1-git-send-email-serveralex@gmail.com>
References: <1469800864-43440-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/meson8b.c | 26 +++++++++++++-------------
 drivers/clk/meson/meson8b.h | 11 +++++------
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 537cc53..0c6e26f 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -111,17 +111,17 @@ static struct clk_fixed_rate meson8b_xtal = {
 
 static struct meson_clk_pll meson8b_fixed_pll = {
 	.m = {
-		.reg_off = MESON8B_REG_PLL_FIXED,
+		.reg_off = HHI_MPLL_CNTL,
 		.shift   = 0,
 		.width   = 9,
 	},
 	.n = {
-		.reg_off = MESON8B_REG_PLL_FIXED,
+		.reg_off = HHI_MPLL_CNTL,
 		.shift   = 9,
 		.width   = 5,
 	},
 	.od = {
-		.reg_off = MESON8B_REG_PLL_FIXED,
+		.reg_off = HHI_MPLL_CNTL,
 		.shift   = 16,
 		.width   = 2,
 	},
@@ -137,17 +137,17 @@ static struct meson_clk_pll meson8b_fixed_pll = {
 
 static struct meson_clk_pll meson8b_vid_pll = {
 	.m = {
-		.reg_off = MESON8B_REG_PLL_VID,
+		.reg_off = HHI_VID_PLL_CNTL,
 		.shift   = 0,
 		.width   = 9,
 	},
 	.n = {
-		.reg_off = MESON8B_REG_PLL_VID,
+		.reg_off = HHI_VID_PLL_CNTL,
 		.shift   = 9,
 		.width   = 5,
 	},
 	.od = {
-		.reg_off = MESON8B_REG_PLL_VID,
+		.reg_off = HHI_VID_PLL_CNTL,
 		.shift   = 16,
 		.width   = 2,
 	},
@@ -163,17 +163,17 @@ static struct meson_clk_pll meson8b_vid_pll = {
 
 static struct meson_clk_pll meson8b_sys_pll = {
 	.m = {
-		.reg_off = MESON8B_REG_PLL_SYS,
+		.reg_off = HHI_SYS_PLL_CNTL,
 		.shift   = 0,
 		.width   = 9,
 	},
 	.n = {
-		.reg_off = MESON8B_REG_PLL_SYS,
+		.reg_off = HHI_SYS_PLL_CNTL,
 		.shift   = 9,
 		.width   = 5,
 	},
 	.od = {
-		.reg_off = MESON8B_REG_PLL_SYS,
+		.reg_off = HHI_SYS_PLL_CNTL,
 		.shift   = 16,
 		.width   = 2,
 	},
@@ -250,7 +250,7 @@ static struct clk_fixed_factor meson8b_fclk_div7 = {
  * forthcoming coordinated clock rates feature
  */
 static struct meson_clk_cpu meson8b_cpu_clk = {
-	.reg_off = MESON8B_REG_SYS_CPU_CNTL1,
+	.reg_off = HHI_SYS_CPU_CLK_CNTL1,
 	.div_table = cpu_div_table,
 	.clk_nb.notifier_call = meson_clk_cpu_notifier_cb,
 	.hw.init = &(struct clk_init_data){
@@ -264,7 +264,7 @@ static struct meson_clk_cpu meson8b_cpu_clk = {
 static u32 mux_table_clk81[]	= { 6, 5, 7 };
 
 struct clk_mux meson8b_mpeg_clk_sel = {
-	.reg = (void *)MESON8B_REG_HHI_MPEG,
+	.reg = (void *)HHI_MPEG_CLK_CNTL,
 	.mask = 0x7,
 	.shift = 12,
 	.flags = CLK_MUX_READ_ONLY,
@@ -286,7 +286,7 @@ struct clk_mux meson8b_mpeg_clk_sel = {
 };
 
 struct clk_divider meson8b_mpeg_clk_div = {
-	.reg = (void *)MESON8B_REG_HHI_MPEG,
+	.reg = (void *)HHI_MPEG_CLK_CNTL,
 	.shift = 0,
 	.width = 7,
 	.lock = &clk_lock,
@@ -300,7 +300,7 @@ struct clk_divider meson8b_mpeg_clk_div = {
 };
 
 struct clk_gate meson8b_clk81 = {
-	.reg = (void *)MESON8B_REG_HHI_MPEG,
+	.reg = (void *)HHI_MPEG_CLK_CNTL,
 	.bit_idx = 7,
 	.lock = &clk_lock,
 	.hw.init = &(struct clk_init_data){
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 5b9cb9f..b2f29f7 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -30,11 +30,10 @@
  *
  * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
-#define MESON8B_REG_SYS_CPU_CNTL1	0x015c /* 0x57 offset in data sheet */
-#define MESON8B_REG_HHI_MPEG		0x0174 /* 0x5d offset in data sheet */
-#define MESON8B_REG_MALI		0x01b0 /* 0x6c offset in data sheet */
-#define MESON8B_REG_PLL_FIXED		0x0280
-#define MESON8B_REG_PLL_SYS		0x0300
-#define MESON8B_REG_PLL_VID		0x0320
+#define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
+#define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
+#define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
+#define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
+#define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
 
 #endif /* __MESON8B_H */
-- 
2.5.0
