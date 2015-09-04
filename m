Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:38823 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932854AbbIDARY (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 3 Sep 2015 20:17:24 -0400
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v3] clk: rockchip: reset init state before mmc card initialization
Date: Fri,  4 Sep 2015 08:15:33 +0800
Message-Id: <1441325733-4131-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

mmc host controller's IO input/output timing is unpredictable if
bootloader execute tuning for HS200 mode. It might make kernel failed
to initialize mmc card in identification mode. The root cause is
tuning phase and degree setting for HS200 mode in bootloader aren't
applicable to that of identification mode in kernel stage. Anyway, we
can't force all bootloaders to reset tuning phase and degree setting
before into kernel. Simply reset it in rockchip_clk_register_mmc.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v3:
- remove the function call
- add Heiko's tag

Changes in v2:
- rename to rockchip_clk_mmc_reset
- simplifying the code

 drivers/clk/rockchip/clk-mmc-phase.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index 9b61342..1c8162e 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -41,6 +41,8 @@ static unsigned long rockchip_mmc_recalc(struct clk_hw *hw,
 #define ROCKCHIP_MMC_DEGREE_MASK 0x3
 #define ROCKCHIP_MMC_DELAYNUM_OFFSET 2
 #define ROCKCHIP_MMC_DELAYNUM_MASK (0xff << ROCKCHIP_MMC_DELAYNUM_OFFSET)
+#define ROCKCHIP_MMC_INIT_STATE_RESET 0x1
+#define ROCKCHIP_MMC_INIT_STATE_SHIFT 1
 
 #define PSECS_PER_SEC 1000000000000LL
 
@@ -143,6 +145,15 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 	mmc_clock->reg = reg;
 	mmc_clock->shift = shift;
 
+	/*
+	 * Assert init_state to soft reset the CLKGEN
+	 * for mmc tuning phase and degree
+	 */
+	if (mmc_clock->shift == ROCKCHIP_MMC_INIT_STATE_SHIFT)
+		writel(HIWORD_UPDATE(ROCKCHIP_MMC_INIT_STATE_RESET,
+				     ROCKCHIP_MMC_INIT_STATE_RESET,
+				     mmc_clock->shift), mmc_clock->reg);
+
 	clk = clk_register(NULL, &mmc_clock->hw);
 	if (IS_ERR(clk))
 		goto err_free;
-- 
2.3.7


