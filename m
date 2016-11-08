Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	xf@rock-chips.com,
	rocky.hao@rock-chips.com
Cc: huangtao@rock-chips.com,
	xxx@rock-chips.com,
	jay.xu@rock-chips.com,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH] clk: rockchip: validity should be checked prior to clock rate change
Date: Tue,  8 Nov 2016 17:10:14 +0800
Message-Id: <1478596214-761-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

If validity is not checked prior to clock rate change, clk_set_rate(
cpu_clk, unsupported_rate) will return success, but the real clock rate
change operation is prohibited in post clock change event. Alough post
clock change event will report error due to unsupported clock rate is
set, but this error message is ignored by clock framework.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Rocky Hao <rocky.hao@rock-chips.com>
---
 drivers/clk/rockchip/clk-cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 05b3d73bfefa..c4b0cc83fa87 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -125,8 +125,17 @@ static int rockchip_cpuclk_pre_rate_change(struct rockchip_cpuclk *cpuclk,
 {
 	const struct rockchip_cpuclk_reg_data *reg_data = cpuclk->reg_data;
 	unsigned long alt_prate, alt_div;
+	const struct rockchip_cpuclk_rate_table *rate;
 	unsigned long flags;
 
+	/* check validity of the new rate */
+	rate = rockchip_get_cpuclk_settings(cpuclk, ndata->new_rate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for cpuclk\n",
+		       __func__, ndata->new_rate);
+		return -EINVAL;
+	}
+
 	alt_prate = clk_get_rate(cpuclk->alt_parent);
 
 	spin_lock_irqsave(cpuclk->lock, flags);
-- 
1.9.1
