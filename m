Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com,
	zhangqing@rock-chips.com,
	wxt@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/3] clk: rockchip: rk3036: fix parent of hclk_vcodec
Date: Thu, 28 Jan 2016 01:01:44 +0100
Message-Id: <1453939306-984-2-git-send-email-heiko@sntech.de>
In-Reply-To: <1453939306-984-1-git-send-email-heiko@sntech.de>
References: <1453939306-984-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

hclk_vcodec is a child of aclk_vcodec with the fixed factor clock
hclk_vcodec_pre in between and not a child of hclk_disp_pre.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3036.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 9c317a3..38139dc 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -380,7 +380,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(HCLK_LCDC, "hclk_lcdc", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(9), 5, GFLAGS),
 
 	/* hclk_video gates */
-	GATE(HCLK_VCODEC, "hclk_vcodec", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(3), 12, GFLAGS),
+	GATE(HCLK_VCODEC, "hclk_vcodec", "hclk_vcodec_pre", 0, RK2928_CLKGATE_CON(3), 12, GFLAGS),
 
 	/* xin24m gates */
 	GATE(SCLK_PVTM_CORE, "sclk_pvtm_core", "xin24m", 0, RK2928_CLKGATE_CON(10), 0, GFLAGS),
-- 
2.6.4
