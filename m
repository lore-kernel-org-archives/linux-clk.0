Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.137]:50722 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932079AbcDTLM0 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 20 Apr 2016 07:12:26 -0400
From: Xing Zheng <zhengxing@rock-chips.com>
To: linux-rockchip@lists.infradead.org, heiko@sntech.de
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
	elaine.zhang@rock-chips.com, jay.xu@rock-chips.com,
	dianders@chromium.org, Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH 6/6] clk: rockchip: rk3399: fix the gate bit for i2c4 and i2c8
Date: Wed, 20 Apr 2016 19:12:10 +0800
Message-Id: <1461150730-29787-1-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1461150414-29638-1-git-send-email-zhengxing@rock-chips.com>
References: <1461150414-29638-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The gate bits of the i2c4 and i2c8 are incorrect due to the manual
error, we need to fix them.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3399.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index e81cc85..3c5ab39 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1411,11 +1411,11 @@ static struct rockchip_clk_branch rk3399_clk_pmu_branches[] __initdata = {
 
 	COMPOSITE_NOMUX(SCLK_I2C4_PMU, "clk_i2c4_pmu", "ppll", 0,
 			RK3399_PMU_CLKSEL_CON(3), 0, 7, DFLAGS,
-			RK3399_PMU_CLKGATE_CON(0), 11, GFLAGS),
+			RK3399_PMU_CLKGATE_CON(0), 10, GFLAGS),
 
 	COMPOSITE_NOMUX(SCLK_I2C8_PMU, "clk_i2c8_pmu", "ppll", 0,
 			RK3399_PMU_CLKSEL_CON(2), 8, 7, DFLAGS,
-			RK3399_PMU_CLKGATE_CON(0), 10, GFLAGS),
+			RK3399_PMU_CLKGATE_CON(0), 11, GFLAGS),
 
 	DIV(0, "clk_32k_suspend_pmu", "xin24m", CLK_IGNORE_UNUSED,
 			RK3399_PMU_CLKSEL_CON(4), 0, 10, DFLAGS),
-- 
1.7.9.5


