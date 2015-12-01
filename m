Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH] clk: rockchip: fix rk3368 cpuclk divider offsets
Date: Tue, 01 Dec 2015 22:31:56 +0100
Message-ID: <6481456.ejZyd6DyuY@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Due to a copy-paste error the the rk3368 cpuclk settings were acessing
rk3288-specific register offsets. This never caused problems till now,
as cpu frequency scaling in't used currently at all.

Reported-by: Xing Zheng <zhengxing@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Posted for reference, as described above this doesn't cause any breakage,
so can probably simply wait for 4.5

 drivers/clk/rockchip/clk-rk3368.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 7e6b783..2ae9c57 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -184,13 +184,13 @@ static const struct rockchip_cpuclk_reg_data rk3368_cpuclkl_data = {
 
 #define RK3368_CLKSEL0(_offs, _aclkm)					\
 	{								\
-		.reg = RK3288_CLKSEL_CON(0 + _offs),			\
+		.reg = RK3368_CLKSEL_CON(0 + _offs),			\
 		.val = HIWORD_UPDATE(_aclkm, RK3368_DIV_ACLKM_MASK,	\
 				RK3368_DIV_ACLKM_SHIFT),		\
 	}
 #define RK3368_CLKSEL1(_offs, _atclk, _pdbg)				\
 	{								\
-		.reg = RK3288_CLKSEL_CON(1 + _offs),			\
+		.reg = RK3368_CLKSEL_CON(1 + _offs),			\
 		.val = HIWORD_UPDATE(_atclk, RK3368_DIV_ATCLK_MASK,	\
 				RK3368_DIV_ATCLK_SHIFT) |		\
 		       HIWORD_UPDATE(_pdbg, RK3368_DIV_PCLK_DBG_MASK,	\
-- 
2.6.1
