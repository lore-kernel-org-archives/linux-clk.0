Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lb0-f196.google.com ([209.85.217.196]:34684 "EHLO
	mail-lb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752101AbcA0MYs (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jan 2016 07:24:48 -0500
From: Alexander Kochetkov <al.kochet@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Kochetkov <al.kochet@gmail.com>
Subject: [PATCH] clk: rockchip: Allow sclk_i2s0 and i2s0_frac to change their parents rate on rk3188
Date: Wed, 27 Jan 2016 15:24:29 +0300
Message-Id: <1453897469-2134-1-git-send-email-al.kochet@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allow sclk_i2s0 and i2s0_frac to change their parents rate as
that the upstream dividers are purely there to feed sclk_i2s0

Tested on radxarock-lite.

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
---
 drivers/clk/rockchip/clk-rk3188.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index fe728f8..50e3eee 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -691,10 +691,10 @@ static struct rockchip_clk_branch rk3188_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "i2s0_pre", "i2s_src", 0,
 			RK2928_CLKSEL_CON(3), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(0), 9, GFLAGS),
-	COMPOSITE_FRAC(0, "i2s0_frac", "i2s0_pre", 0,
+	COMPOSITE_FRAC(0, "i2s0_frac", "i2s0_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(7), 0,
 			RK2928_CLKGATE_CON(0), 10, GFLAGS),
-	MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
+	MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(3), 8, 2, MFLAGS),
 
 	GATE(0, "hclk_imem0", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 14, GFLAGS),
-- 
1.7.9.5

