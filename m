Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.132]:42071 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752988AbcAGMR5 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 7 Jan 2016 07:17:57 -0500
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: keescook@google.com, leozwang@google.com,
	linux-rockchip@lists.infradead.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] clk: rockchip: rk3036: fix the FLAGs for clock mux
Date: Thu,  7 Jan 2016 20:17:33 +0800
Message-Id: <1452169057-24467-2-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com>
References: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The DFLAGS are used for the clock dividers, the CLKSEL_CON flags
of COMPOSITE_NODIV type should be MFLAGS.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3036.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index ebce980..7e3b41c 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -224,16 +224,16 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKGATE_CON(2), 2, GFLAGS),
 
 	COMPOSITE_NODIV(SCLK_TIMER0, "sclk_timer0", mux_timer_p, CLK_IGNORE_UNUSED,
-			RK2928_CLKSEL_CON(2), 4, 1, DFLAGS,
+			RK2928_CLKSEL_CON(2), 4, 1, MFLAGS,
 			RK2928_CLKGATE_CON(1), 0, GFLAGS),
 	COMPOSITE_NODIV(SCLK_TIMER1, "sclk_timer1", mux_timer_p, CLK_IGNORE_UNUSED,
-			RK2928_CLKSEL_CON(2), 5, 1, DFLAGS,
+			RK2928_CLKSEL_CON(2), 5, 1, MFLAGS,
 			RK2928_CLKGATE_CON(1), 1, GFLAGS),
 	COMPOSITE_NODIV(SCLK_TIMER2, "sclk_timer2", mux_timer_p, CLK_IGNORE_UNUSED,
-			RK2928_CLKSEL_CON(2), 6, 1, DFLAGS,
+			RK2928_CLKSEL_CON(2), 6, 1, MFLAGS,
 			RK2928_CLKGATE_CON(2), 4, GFLAGS),
 	COMPOSITE_NODIV(SCLK_TIMER3, "sclk_timer3", mux_timer_p, CLK_IGNORE_UNUSED,
-			RK2928_CLKSEL_CON(2), 7, 1, DFLAGS,
+			RK2928_CLKSEL_CON(2), 7, 1, MFLAGS,
 			RK2928_CLKGATE_CON(2), 5, GFLAGS),
 
 	MUX(0, "uart_pll_clk", mux_pll_src_apll_dpll_gpll_usb480m_p, 0,
@@ -279,13 +279,13 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKGATE_CON(3), 2, GFLAGS),
 
 	COMPOSITE_NODIV(0, "sclk_sdmmc_src", mux_mmc_src_p, 0,
-			RK2928_CLKSEL_CON(12), 8, 2, DFLAGS,
+			RK2928_CLKSEL_CON(12), 8, 2, MFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 	DIV(SCLK_SDMMC, "sclk_sdmmc", "sclk_sdmmc_src", 0,
 			RK2928_CLKSEL_CON(11), 0, 7, DFLAGS),
 
 	COMPOSITE_NODIV(0, "sclk_sdio_src", mux_mmc_src_p, 0,
-			RK2928_CLKSEL_CON(12), 10, 2, DFLAGS,
+			RK2928_CLKSEL_CON(12), 10, 2, MFLAGS,
 			RK2928_CLKGATE_CON(2), 13, GFLAGS),
 	DIV(SCLK_SDIO, "sclk_sdio", "sclk_sdio_src", 0,
 			RK2928_CLKSEL_CON(11), 8, 7, DFLAGS),
-- 
1.7.9.5


