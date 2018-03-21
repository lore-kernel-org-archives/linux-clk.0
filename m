Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:41648 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751753AbeCUCqG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 22:46:06 -0400
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/3] clk: rockchip: Fix wrong parents for MMC phase clock for rk3328
Date: Wed, 21 Mar 2018 10:39:18 +0800
Message-Id: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

commit c420c1e4db22 ("clk: rockchip: Prevent calculating mmc phase if
clock rate is zero") catches some gremlins for clk-rk3328.c that the
parents of MMC phase clock should be clk_{sdmmc, sdio, emmc}, but not
sclk_{sdmmc, sdio, emmc}.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3328.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index f680b42..252366a 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -810,24 +810,24 @@ enum rk3328_plls {
 	GATE(0, "pclk_phy_niu", "pclk_phy_pre", 0, RK3328_CLKGATE_CON(15), 15, GFLAGS),
 
 	/* PD_MMC */
-	MMC(SCLK_SDMMC_DRV, "sdmmc_drv", "sclk_sdmmc",
+	MMC(SCLK_SDMMC_DRV, "sdmmc_drv", "clk_sdmmc",
 	    RK3328_SDMMC_CON0, 1),
-	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "sclk_sdmmc",
+	MMC(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "clk_sdmmc",
 	    RK3328_SDMMC_CON1, 1),
 
-	MMC(SCLK_SDIO_DRV, "sdio_drv", "sclk_sdio",
+	MMC(SCLK_SDIO_DRV, "sdio_drv", "clk_sdio",
 	    RK3328_SDIO_CON0, 1),
-	MMC(SCLK_SDIO_SAMPLE, "sdio_sample", "sclk_sdio",
+	MMC(SCLK_SDIO_SAMPLE, "sdio_sample", "clk_sdio",
 	    RK3328_SDIO_CON1, 1),
 
-	MMC(SCLK_EMMC_DRV, "emmc_drv", "sclk_emmc",
+	MMC(SCLK_EMMC_DRV, "emmc_drv", "clk_emmc",
 	    RK3328_EMMC_CON0, 1),
-	MMC(SCLK_EMMC_SAMPLE, "emmc_sample", "sclk_emmc",
+	MMC(SCLK_EMMC_SAMPLE, "emmc_sample", "clk_emmc",
 	    RK3328_EMMC_CON1, 1),
 
-	MMC(SCLK_SDMMC_EXT_DRV, "sdmmc_ext_drv", "sclk_sdmmc_ext",
+	MMC(SCLK_SDMMC_EXT_DRV, "sdmmc_ext_drv", "clk_sdmmc_ext",
 	    RK3328_SDMMC_EXT_CON0, 1),
-	MMC(SCLK_SDMMC_EXT_SAMPLE, "sdmmc_ext_sample", "sclk_sdmmc_ext",
+	MMC(SCLK_SDMMC_EXT_SAMPLE, "sdmmc_ext_sample", "clk_sdmmc_ext",
 	    RK3328_SDMMC_EXT_CON1, 1),
 };
 
-- 
1.9.1


