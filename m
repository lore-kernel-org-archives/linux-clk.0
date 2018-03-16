Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:41411 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752244AbeCPDCh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Mar 2018 23:02:37 -0400
Received: by mail-pl0-f66.google.com with SMTP id b7-v6so1009945plr.8
        for <linux-clk@vger.kernel.org>; Thu, 15 Mar 2018 20:02:36 -0700 (PDT)
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        dbasehore@chromium.org, diander@chromium.org,
        briannorris@chromium.org, shawn.lin@rock-chips.com,
        Lin Huang <hl@rock-chips.com>
Subject: [PATCH v2 1/2] clk: rockchip: assign correct id for pclk_ddr and hclk_sd in rk3399
Date: Fri, 16 Mar 2018 11:02:27 +0800
Message-Id: <1521169348-8552-1-git-send-email-hl@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Since hclk_sd and pclk_ddr source clock from CPLL or GPLL,
and these two PLL may change their frequency. If we do not
assign right id to pclk_ddr and hclk_sd, they will alway use
default cur register value, and may get the frequency
exceed their signed off frequency. So assign correct Id
for them, then we can assign frequency for them in dts.

Change-Id: I6c4d15d37ddabe4ed34e2351cf26e660672ae9ee
Signed-off-by: Lin Huang <hl@rock-chips.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
---
Changes in v2:
- add more detail in commit message

 drivers/clk/rockchip/clk-rk3399.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 3e57c6e..bca10d6 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -671,7 +671,7 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 			RK3399_CLKGATE_CON(9), 7, GFLAGS,
 			&rk3399_uart3_fracmux),
 
-	COMPOSITE(0, "pclk_ddr", mux_pll_src_cpll_gpll_p, CLK_IGNORE_UNUSED,
+	COMPOSITE(PCLK_DDR, "pclk_ddr", mux_pll_src_cpll_gpll_p, CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(6), 15, 1, MFLAGS, 8, 5, DFLAGS,
 			RK3399_CLKGATE_CON(3), 4, GFLAGS),
 
@@ -887,7 +887,7 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 			RK3399_CLKGATE_CON(31), 8, GFLAGS),
 
 	/* sdio & sdmmc */
-	COMPOSITE(0, "hclk_sd", mux_pll_src_cpll_gpll_p, 0,
+	COMPOSITE(HCLK_SD, "hclk_sd", mux_pll_src_cpll_gpll_p, 0,
 			RK3399_CLKSEL_CON(13), 15, 1, MFLAGS, 8, 5, DFLAGS,
 			RK3399_CLKGATE_CON(12), 13, GFLAGS),
 	GATE(HCLK_SDMMC, "hclk_sdmmc", "hclk_sd", 0,
-- 
2.7.4

