Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:38073 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751593AbcAOLya (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jan 2016 06:54:30 -0500
From: Yakir Yang <ykk@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH] clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for hclk_vio_bus
Date: Fri, 15 Jan 2016 19:54:14 +0800
Message-Id: <1452858854-841-1-git-send-email-ykk@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

HCLK_VIO_BUS is the noc bus controller clock for display module,
due to it shouldn't belong to any driver, but we need it enabled,
so just mark it as the CLK_IGNORE_UNUSED flag.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3036.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 484de46..00fac21 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -379,7 +379,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(ACLK_VIO, "aclk_vio", "aclk_disp1_pre", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(6), 13, GFLAGS),
 	GATE(ACLK_LCDC, "aclk_lcdc", "aclk_disp1_pre", 0, RK2928_CLKGATE_CON(9), 6, GFLAGS),
 
-	GATE(HCLK_VIO_BUS, "hclk_vio_bus", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(6), 12, GFLAGS),
+	GATE(HCLK_VIO_BUS, "hclk_vio_bus", "hclk_disp_pre", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(6), 12, GFLAGS),
 	GATE(HCLK_LCDC, "hclk_lcdc", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(9), 5, GFLAGS),
 
 	/* hclk_video gates */
-- 
1.9.1


