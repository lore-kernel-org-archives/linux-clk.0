Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: rockchip: Prevent calculating mmc phase if clock rate is zero
Date: Mon,  5 Mar 2018 11:21:49 +0800
Message-Id: <1520220109-177862-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

The MMC sample and drv clock for rockchip platforms are derived from
the bus clock output to the MMC/SDIO card. So it should never happens
that the clk rate is zero given it should inherits the clock rate from
its parent. If something goes wrong and makes the clock rate to be zero,
the calculation would be wrong but may still make the mmc tuning process
work luckily. However it makes people harder to debug when the following
data transfer is unstable.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-mmc-phase.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index 077fcdc..c0c14e4 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -58,6 +58,12 @@ static int rockchip_mmc_get_phase(struct clk_hw *hw)
 	u16 degrees;
 	u32 delay_num = 0;
 
+	/* See the comment for rockchip_mmc_set_phase below */
+	if (!rate) {
+		pr_err("%s: invalid clk rate", __func__);
+		return -EINVAL;
+	}
+
 	raw_value = readl(mmc_clock->reg) >> (mmc_clock->shift);
 
 	degrees = (raw_value & ROCKCHIP_MMC_DEGREE_MASK) * 90;
@@ -84,6 +90,25 @@ static int rockchip_mmc_set_phase(struct clk_hw *hw, int degrees)
 	u32 raw_value;
 	u32 delay;
 
+	/*
+	 * The below calculation is based on the output clock from
+	 * MMC host to the card, which expects the phase clock inherits
+	 * the clock rate from its parent, namely the output clock
+	 * provider of MMC host. However, things may go wrong if
+	 * (1) It is orphan.
+	 * (2) It is assigned to the wrong parent.
+	 *
+	 * This check help debug the case (1), which seems to be the
+	 * most likely problem we often made and explicitly makes people
+	 * harder to debug the unstable mmc tuning stuff. So hope people
+	 * to have a close look at this comment to help check out what was
+	 * happening.
+	 */
+	if (!rate) {
+		pr_err("%s: invalid clk rate", __func__);
+		return -EINVAL;
+	}
+
 	nineties = degrees / 90;
 	remainder = (degrees % 90);
 
-- 
1.9.1
