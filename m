Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.131]:46369 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752254AbcAGM0g (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 7 Jan 2016 07:26:36 -0500
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	zhengxing@rock-chips.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, keescook@google.com,
	leozwang@google.com
Subject: [PATCH v2 5/5] clk: rockchip: rk3036: add HCLK_MAC id for emac
Date: Thu,  7 Jan 2016 20:26:18 +0800
Message-Id: <1452169578-24565-1-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com>
References: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We need to add HCLK_MAC id explicitly because that it is referred
by hclk in the emac driver.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3036.c      |    2 +-
 include/dt-bindings/clock/rk3036-cru.h |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index bc7fbac..15cd29a 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -404,7 +404,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(HCLK_OTG1, "hclk_otg1", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(7), 3, GFLAGS),
 	GATE(HCLK_I2S, "hclk_i2s", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),
 	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
-	GATE(0, "hclk_mac", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 15, GFLAGS),
+	GATE(HCLK_MAC, "hclk_mac", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 15, GFLAGS),
 
 	/* pclk_peri gates */
 	GATE(0, "pclk_peri_matrix", "pclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(4), 1, GFLAGS),
diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
index ebc7a7b..3396591 100644
--- a/include/dt-bindings/clock/rk3036-cru.h
+++ b/include/dt-bindings/clock/rk3036-cru.h
@@ -92,6 +92,7 @@
 #define HCLK_SDMMC		456
 #define HCLK_SDIO		457
 #define HCLK_EMMC		459
+#define HCLK_MAC		460
 #define HCLK_I2S		462
 #define HCLK_LCDC		465
 #define HCLK_ROM		467
-- 
1.7.9.5


