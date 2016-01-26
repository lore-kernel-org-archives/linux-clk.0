Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:55710 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932404AbcAZDe6 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2016 22:34:58 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
	Xing Zheng <zhengxing@rock-chips.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH] clk: rockchip: fix wrong mmc phase shift for rk3228
Date: Tue, 26 Jan 2016 11:30:18 +0800
Message-Id: <1453779018-30666-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

mmc sample shift is 0 for rk3228 refer to user manaul.
So it's broken if we enable mmc tuning for rk3228.

Fixes: 307a2e9ac ("clk: rockchip: add clock controller for rk3228")
Cc: Xing Zheng <zhengxing@rock-chips.com>
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3228.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index 981a502..97f49aa 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -605,13 +605,13 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 
 	/* PD_MMC */
 	MMC(SCLK_SDMMC_DRV,    "sdmmc_drv",    "sclk_sdmmc", RK3228_SDMMC_CON0, 1),
-	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "sclk_sdmmc", RK3228_SDMMC_CON1, 1),
+	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "sclk_sdmmc", RK3228_SDMMC_CON1, 0),
 
 	MMC(SCLK_SDIO_DRV,     "sdio_drv",     "sclk_sdio",  RK3228_SDIO_CON0,  1),
-	MMC(SCLK_SDIO_SAMPLE,  "sdio_sample",  "sclk_sdio",  RK3228_SDIO_CON1,  1),
+	MMC(SCLK_SDIO_SAMPLE,  "sdio_sample",  "sclk_sdio",  RK3228_SDIO_CON1,  0),
 
 	MMC(SCLK_EMMC_DRV,     "emmc_drv",     "sclk_emmc",  RK3228_EMMC_CON0,  1),
-	MMC(SCLK_EMMC_SAMPLE,  "emmc_sample",  "sclk_emmc",  RK3228_EMMC_CON1,  1),
+	MMC(SCLK_EMMC_SAMPLE,  "emmc_sample",  "sclk_emmc",  RK3228_EMMC_CON1,  0),
 };
 
 static const char *const rk3228_critical_clocks[] __initconst = {
-- 
2.3.7


