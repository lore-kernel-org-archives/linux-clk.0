Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.135]:32803 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753558AbcKBHFT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2016 03:05:19 -0400
From: Jianqun Xu <jay.xu@rock-chips.com>
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de,
        huangtao@rock-chips.com, zhangqing@rock-chips.com,
        zhengxing@rock-chips.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        lintao@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH] clk: rockchip: fix some clocks' name to be more standard style
Date: Wed,  2 Nov 2016 15:04:56 +0800
Message-Id: <1478070296-23080-1-git-send-email-jay.xu@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Fix aclk_emmcgrf to aclk_emmc_grf, and fix aclk_emmccore to be
aclk_emmc_core.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3399.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 2c7cba7..b3df2c6 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -935,11 +935,11 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 			RK3399_CLKGATE_CON(6), 13, GFLAGS),
 	COMPOSITE_NOGATE(ACLK_EMMC, "aclk_emmc", mux_aclk_emmc_p, CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(21), 7, 1, MFLAGS, 0, 5, DFLAGS),
-	GATE(ACLK_EMMC_CORE, "aclk_emmccore", "aclk_emmc", CLK_IGNORE_UNUSED,
+	GATE(ACLK_EMMC_CORE, "aclk_emmc_core", "aclk_emmc", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(32), 8, GFLAGS),
 	GATE(ACLK_EMMC_NOC, "aclk_emmc_noc", "aclk_emmc", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(32), 9, GFLAGS),
-	GATE(ACLK_EMMC_GRF, "aclk_emmcgrf", "aclk_emmc", CLK_IGNORE_UNUSED,
+	GATE(ACLK_EMMC_GRF, "aclk_emmc_grf", "aclk_emmc", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(32), 10, GFLAGS),
 
 	/* perilp0 */
-- 
1.9.1


