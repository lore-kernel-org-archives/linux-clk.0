Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:40550 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751791AbeCUCqH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 22:46:07 -0400
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/3] clk: rockchip: Fix wrong parent for SDMMC phase clock for rk3228
Date: Wed, 21 Mar 2018 10:39:19 +0800
Message-Id: <1521599960-34381-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com>
References: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

commit c420c1e4db22 ("clk: rockchip: Prevent calculating mmc phase
if clock rate is zero") catches one gremlin again for clk-rk3228.c
that the parent of SDMMC phase clock should be sclk_sdmmc0, but not
sclk_sdmmc. However, I don't like the name of sclk_sdmmc0, so I now
rename it to be sclk_sdmmc.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3228.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index 11e7f2d..7af4818 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -387,7 +387,7 @@ enum rk3228_plls {
 			RK2928_CLKSEL_CON(23), 5, 2, MFLAGS, 0, 6, DFLAGS,
 			RK2928_CLKGATE_CON(2), 15, GFLAGS),
 
-	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc0", mux_mmc_src_p, 0,
+	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(11), 8, 2, MFLAGS, 0, 8, DFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 
-- 
1.9.1


