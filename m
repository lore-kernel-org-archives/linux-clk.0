Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:34541 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751700AbeCOIyk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Mar 2018 04:54:40 -0400
Received: by mail-pl0-f67.google.com with SMTP id u13-v6so3363617plq.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Mar 2018 01:54:40 -0700 (PDT)
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        dbasehore@chromium.org, diander@chromium.ogr,
        briannorris@chromium.org, Lin Huang <hl@rock-chips.com>
Subject: [PATCH] clk: rockchip: assign correct id for pclk_ddr and hclk_sd in rk3399
Date: Thu, 15 Mar 2018 16:54:31 +0800
Message-Id: <1521104071-19595-1-git-send-email-hl@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Assign id PCLK_DDR to pclk_ddr, id HCLK_SD to hclk_sd, so we can
assign frequency for them in dts.

Change-Id: I6c4d15d37ddabe4ed34e2351cf26e660672ae9ee
Signed-off-by: Lin Huang <hl@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3399.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 6847120..a29c99e 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -670,7 +670,7 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 			RK3399_CLKGATE_CON(9), 7, GFLAGS,
 			&rk3399_uart3_fracmux),
 
-	COMPOSITE(0, "pclk_ddr", mux_pll_src_cpll_gpll_p, CLK_IGNORE_UNUSED,
+	COMPOSITE(PCLK_DDR, "pclk_ddr", mux_pll_src_cpll_gpll_p, CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(6), 15, 1, MFLAGS, 8, 5, DFLAGS,
 			RK3399_CLKGATE_CON(3), 4, GFLAGS),
 
@@ -886,7 +886,7 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 			RK3399_CLKGATE_CON(31), 8, GFLAGS),
 
 	/* sdio & sdmmc */
-	COMPOSITE(0, "hclk_sd", mux_pll_src_cpll_gpll_p, 0,
+	COMPOSITE(HCLK_SD, "hclk_sd", mux_pll_src_cpll_gpll_p, 0,
 			RK3399_CLKSEL_CON(13), 15, 1, MFLAGS, 8, 5, DFLAGS,
 			RK3399_CLKGATE_CON(12), 13, GFLAGS),
 	GATE(HCLK_SDMMC, "hclk_sdmmc", "hclk_sd", 0,
-- 
2.7.4

