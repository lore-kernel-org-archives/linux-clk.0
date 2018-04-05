Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Xing Zheng <xing.zheng@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Ziyuan Xu <xzy.xu@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/2] clk: rockchip: Add CLK_DIVIDER_EVEN for all mmc clock consumers
Date: Thu,  5 Apr 2018 13:38:19 +0800
Message-Id: <1522906699-127765-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1522906699-127765-1-git-send-email-shawn.lin@rock-chips.com>
References: <1522906699-127765-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

For conventional Rockchip platforms, mmc hosts, except RK3399's
eMMC controller, should ask their clock parents to provider the
closest clock rate with a even div number. That wasn't done
explicitly by the clock framework. but now we have CLK_DIVIDER_EVEN
flag to help.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3036.c |  7 ++++---
 drivers/clk/rockchip/clk-rk3128.c |  9 ++++++---
 drivers/clk/rockchip/clk-rk3188.c |  6 +++---
 drivers/clk/rockchip/clk-rk3228.c |  7 ++++---
 drivers/clk/rockchip/clk-rk3288.c | 12 ++++++++----
 drivers/clk/rockchip/clk-rk3328.c |  9 ++++++---
 drivers/clk/rockchip/clk-rk3368.c |  9 ++++++---
 drivers/clk/rockchip/clk-rk3399.c |  6 ++++--
 drivers/clk/rockchip/clk-rv1108.c |  7 ++++---
 9 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index c300198..155fd4f 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -290,16 +290,17 @@ enum rk3036_plls {
 			RK2928_CLKSEL_CON(12), 8, 2, MFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 	DIV(SCLK_SDMMC, "sclk_sdmmc", "sclk_sdmmc_src", 0,
-			RK2928_CLKSEL_CON(11), 0, 7, DFLAGS),
+			RK2928_CLKSEL_CON(11), 0, 7, DFLAGS | CLK_DIVIDER_EVEN),
 
 	COMPOSITE_NODIV(0, "sclk_sdio_src", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(12), 10, 2, MFLAGS,
 			RK2928_CLKGATE_CON(2), 13, GFLAGS),
 	DIV(SCLK_SDIO, "sclk_sdio", "sclk_sdio_src", 0,
-			RK2928_CLKSEL_CON(11), 8, 7, DFLAGS),
+			RK2928_CLKSEL_CON(11), 8, 7, DFLAGS | CLK_DIVIDER_EVEN),
 
 	COMPOSITE(SCLK_EMMC, "sclk_emmc", mux_mmc_src_p, 0,
-			RK2928_CLKSEL_CON(12), 12, 2, MFLAGS, 0, 7, DFLAGS,
+			RK2928_CLKSEL_CON(12), 12, 2, MFLAGS, 0, 7,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 14, GFLAGS),
 
 	MMC(SCLK_SDMMC_DRV,    "sdmmc_drv",    "sclk_sdmmc", RK3036_SDMMC_CON0, 1),
diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index 5970a50..7c6e30a 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -324,15 +324,18 @@ enum rk3128_plls {
 			RK2928_CLKGATE_CON(2), 15, GFLAGS),
 
 	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc0", mux_mmc_src_p, 0,
-			RK2928_CLKSEL_CON(11), 6, 2, MFLAGS, 0, 6, DFLAGS,
+			RK2928_CLKSEL_CON(11), 6, 2, MFLAGS, 0, 6,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 
 	COMPOSITE(SCLK_SDIO, "sclk_sdio", mux_mmc_src_p, 0,
-			RK2928_CLKSEL_CON(12), 6, 2, MFLAGS, 0, 6, DFLAGS,
+			RK2928_CLKSEL_CON(12), 6, 2, MFLAGS, 0, 6,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 13, GFLAGS),
 
 	COMPOSITE(SCLK_EMMC, "sclk_emmc", mux_mmc_src_p, 0,
-			RK2928_CLKSEL_CON(12), 14, 2, MFLAGS, 8, 6, DFLAGS,
+			RK2928_CLKSEL_CON(12), 14, 2, MFLAGS, 8, 6,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 14, GFLAGS),
 
 	DIV(SCLK_PVTM, "clk_pvtm", "clk_pvtm_func", 0,
diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 67e73fd..32f199d 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -402,13 +402,13 @@ enum rk3188_plls {
 			RK2928_CLKGATE_CON(2), 10, GFLAGS),
 
 	COMPOSITE_NOMUX(SCLK_SDMMC, "sclk_sdmmc", "hclk_peri", 0,
-			RK2928_CLKSEL_CON(11), 0, 6, DFLAGS,
+			RK2928_CLKSEL_CON(11), 0, 6, DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 	COMPOSITE_NOMUX(SCLK_SDIO, "sclk_sdio", "hclk_peri", 0,
-			RK2928_CLKSEL_CON(12), 0, 6, DFLAGS,
+			RK2928_CLKSEL_CON(12), 0, 6, DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 13, GFLAGS),
 	COMPOSITE_NOMUX(SCLK_EMMC, "sclk_emmc", "hclk_peri", 0,
-			RK2928_CLKSEL_CON(12), 8, 6, DFLAGS,
+			RK2928_CLKSEL_CON(12), 8, 6, DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 14, GFLAGS),
 
 	MUX(0, "uart_src", mux_pll_src_gpll_cpll_p, 0,
diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index 7af4818..15da16a 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -388,20 +388,21 @@ enum rk3228_plls {
 			RK2928_CLKGATE_CON(2), 15, GFLAGS),
 
 	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
-			RK2928_CLKSEL_CON(11), 8, 2, MFLAGS, 0, 8, DFLAGS,
+			RK2928_CLKSEL_CON(11), 8, 2, MFLAGS, 0, 8,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 
 	COMPOSITE_NODIV(SCLK_SDIO_SRC, "sclk_sdio_src", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(11), 10, 2, MFLAGS,
 			RK2928_CLKGATE_CON(2), 13, GFLAGS),
 	DIV(SCLK_SDIO, "sclk_sdio", "sclk_sdio_src", 0,
-			RK2928_CLKSEL_CON(12), 0, 8, DFLAGS),
+			RK2928_CLKSEL_CON(12), 0, 8, DFLAGS | CLK_DIVIDER_EVEN),
 
 	COMPOSITE_NODIV(0, "sclk_emmc_src", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(11), 12, 2, MFLAGS,
 			RK2928_CLKGATE_CON(2), 14, GFLAGS),
 	DIV(SCLK_EMMC, "sclk_emmc", "sclk_emmc_src", 0,
-			RK2928_CLKSEL_CON(12), 8, 8, DFLAGS),
+			RK2928_CLKSEL_CON(12), 8, 8, DFLAGS | CLK_DIVIDER_EVEN),
 
 	/*
 	 * Clock-Architecture Diagram 2
diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 450de24..2a6f231 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -508,16 +508,20 @@ enum rk3288_plls {
 			RK3288_CLKGATE_CON(2), 11, GFLAGS),
 
 	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
-			RK3288_CLKSEL_CON(11), 6, 2, MFLAGS, 0, 6, DFLAGS,
+			RK3288_CLKSEL_CON(11), 6, 2, MFLAGS, 0, 6,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3288_CLKGATE_CON(13), 0, GFLAGS),
 	COMPOSITE(SCLK_SDIO0, "sclk_sdio0", mux_mmc_src_p, 0,
-			RK3288_CLKSEL_CON(12), 6, 2, MFLAGS, 0, 6, DFLAGS,
+			RK3288_CLKSEL_CON(12), 6, 2, MFLAGS, 0, 6,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3288_CLKGATE_CON(13), 1, GFLAGS),
 	COMPOSITE(SCLK_SDIO1, "sclk_sdio1", mux_mmc_src_p, 0,
-			RK3288_CLKSEL_CON(34), 14, 2, MFLAGS, 8, 6, DFLAGS,
+			RK3288_CLKSEL_CON(34), 14, 2, MFLAGS, 8, 6,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3288_CLKGATE_CON(13), 2, GFLAGS),
 	COMPOSITE(SCLK_EMMC, "sclk_emmc", mux_mmc_src_p, 0,
-			RK3288_CLKSEL_CON(12), 14, 2, MFLAGS, 8, 6, DFLAGS,
+			RK3288_CLKSEL_CON(12), 14, 2, MFLAGS, 8, 6,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3288_CLKGATE_CON(13), 3, GFLAGS),
 
 	MMC(SCLK_SDMMC_DRV,    "sdmmc_drv",    "sclk_sdmmc", RK3288_SDMMC_CON0, 1),
diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 252366a..f81acf8 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -632,15 +632,18 @@ enum rk3328_plls {
 			RK3328_CLKGATE_CON(4), 3, GFLAGS),
 
 	COMPOSITE(SCLK_SDIO, "clk_sdio", mux_2plls_24m_u480m_p, 0,
-			RK3328_CLKSEL_CON(31), 8, 2, MFLAGS, 0, 8, DFLAGS,
+			RK3328_CLKSEL_CON(31), 8, 2, MFLAGS, 0, 8,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3328_CLKGATE_CON(4), 4, GFLAGS),
 
 	COMPOSITE(SCLK_EMMC, "clk_emmc", mux_2plls_24m_u480m_p, 0,
-			RK3328_CLKSEL_CON(32), 8, 2, MFLAGS, 0, 8, DFLAGS,
+			RK3328_CLKSEL_CON(32), 8, 2, MFLAGS, 0, 8,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3328_CLKGATE_CON(4), 5, GFLAGS),
 
 	COMPOSITE(SCLK_SDMMC_EXT, "clk_sdmmc_ext", mux_2plls_24m_u480m_p, 0,
-			RK3328_CLKSEL_CON(43), 8, 2, MFLAGS, 0, 8, DFLAGS,
+			RK3328_CLKSEL_CON(43), 8, 2, MFLAGS, 0, 8,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3328_CLKGATE_CON(4), 10, GFLAGS),
 
 	COMPOSITE(SCLK_REF_USB3OTG_SRC, "clk_ref_usb3otg_src", mux_2plls_p, 0,
diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 7c4d242..17a6293 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -550,13 +550,16 @@ enum rk3368_plls {
 
 
 	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
-			RK3368_CLKSEL_CON(50), 8, 2, MFLAGS, 0, 7, DFLAGS,
+			RK3368_CLKSEL_CON(50), 8, 2, MFLAGS, 0, 7,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3368_CLKGATE_CON(7), 12, GFLAGS),
 	COMPOSITE(SCLK_SDIO0, "sclk_sdio0", mux_mmc_src_p, 0,
-			RK3368_CLKSEL_CON(48), 8, 2, MFLAGS, 0, 7, DFLAGS,
+			RK3368_CLKSEL_CON(48), 8, 2, MFLAGS, 0, 7,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3368_CLKGATE_CON(7), 13, GFLAGS),
 	COMPOSITE(SCLK_EMMC, "sclk_emmc", mux_mmc_src_p, 0,
-			RK3368_CLKSEL_CON(51), 8, 2, MFLAGS, 0, 7, DFLAGS,
+			RK3368_CLKSEL_CON(51), 8, 2, MFLAGS, 0, 7,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3368_CLKGATE_CON(7), 15, GFLAGS),
 
 	MMC(SCLK_SDMMC_DRV,    "sdmmc_drv",    "sclk_sdmmc", RK3368_SDMMC_CON0, 1),
diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 118759d..aedb3d0 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -896,11 +896,13 @@ enum rk3399_pmu_plls {
 			RK3399_CLKGATE_CON(33), 9, GFLAGS),
 
 	COMPOSITE(SCLK_SDIO, "clk_sdio", mux_pll_src_cpll_gpll_npll_ppll_upll_24m_p, 0,
-			RK3399_CLKSEL_CON(15), 8, 3, MFLAGS, 0, 7, DFLAGS,
+			RK3399_CLKSEL_CON(15), 8, 3, MFLAGS, 0, 7,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3399_CLKGATE_CON(6), 0, GFLAGS),
 
 	COMPOSITE(SCLK_SDMMC, "clk_sdmmc", mux_pll_src_cpll_gpll_npll_ppll_upll_24m_p, 0,
-			RK3399_CLKSEL_CON(16), 8, 3, MFLAGS, 0, 7, DFLAGS,
+			RK3399_CLKSEL_CON(16), 8, 3, MFLAGS, 0, 7,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RK3399_CLKGATE_CON(6), 1, GFLAGS),
 
 	MMC(SCLK_SDMMC_DRV,     "sdmmc_drv",    "clk_sdmmc", RK3399_SDMMC_CON0, 1),
diff --git a/drivers/clk/rockchip/clk-rv1108.c b/drivers/clk/rockchip/clk-rv1108.c
index 089cb17..b63af26 100644
--- a/drivers/clk/rockchip/clk-rv1108.c
+++ b/drivers/clk/rockchip/clk-rv1108.c
@@ -721,20 +721,21 @@ enum rv1108_plls {
 			RV1108_CLKGATE_CON(15), 11, GFLAGS),
 
 	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
-			RV1108_CLKSEL_CON(25), 8, 2, MFLAGS, 0, 8, DFLAGS,
+			RV1108_CLKSEL_CON(25), 8, 2, MFLAGS, 0, 8,
+			DFLAGS | CLK_DIVIDER_EVEN,
 			RV1108_CLKGATE_CON(5), 0, GFLAGS),
 
 	COMPOSITE_NODIV(0, "sclk_sdio_src", mux_mmc_src_p, 0,
 			RV1108_CLKSEL_CON(25), 10, 2, MFLAGS,
 			RV1108_CLKGATE_CON(5), 2, GFLAGS),
 	DIV(SCLK_SDIO, "sclk_sdio", "sclk_sdio_src", 0,
-			RV1108_CLKSEL_CON(26), 0, 8, DFLAGS),
+			RV1108_CLKSEL_CON(26), 0, 8, DFLAGS | CLK_DIVIDER_EVEN),
 
 	COMPOSITE_NODIV(0, "sclk_emmc_src", mux_mmc_src_p, 0,
 			RV1108_CLKSEL_CON(25), 12, 2, MFLAGS,
 			RV1108_CLKGATE_CON(5), 1, GFLAGS),
 	DIV(SCLK_EMMC, "sclk_emmc", "sclk_emmc_src", 0,
-			RK2928_CLKSEL_CON(26), 8, 8, DFLAGS),
+			RK2928_CLKSEL_CON(26), 8, 8, DFLAGS | CLK_DIVIDER_EVEN),
 	GATE(HCLK_SDMMC, "hclk_sdmmc", "hclk_periph", 0, RV1108_CLKGATE_CON(15), 0, GFLAGS),
 	GATE(HCLK_SDIO, "hclk_sdio", "hclk_periph", 0, RV1108_CLKGATE_CON(15), 1, GFLAGS),
 	GATE(HCLK_EMMC, "hclk_emmc", "hclk_periph", 0, RV1108_CLKGATE_CON(15), 2, GFLAGS),
-- 
1.9.1
