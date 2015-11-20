Return-Path: <zywang33@gmail.com>
Return-Path: <zywang33@gmail.com>
From: Chris Zhong <zyw@rock-chips.com>
To: heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	mark.yao@rock-chips.com,
	treding@nvidia.com,
	emil.l.velikov@gmail.com
Cc: airlied@linux.ie,
	ajaykumar.rs@samsung.com,
	rmk+kernel@arm.linux.org.uk,
	dri-devel@lists.freedesktop.org,
	Chris Zhong <zyw@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/13] clk: rockchip: add mipidsi clocks on rk3288
Date: Fri, 20 Nov 2015 16:15:28 +0800
Message-Id: <1448007339-10966-3-git-send-email-zyw@rock-chips.com>
In-Reply-To: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
References: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

sclk_mipidsi_24m is the gating of mipi dsi phy.

Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/clk/rockchip/clk-rk3288.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 9040878..c7d7ebf 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -709,7 +709,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	GATE(SCLK_LCDC_PWM1, "sclk_lcdc_pwm1", "xin24m", 0, RK3288_CLKGATE_CON(13), 11, GFLAGS),
 	GATE(SCLK_PVTM_CORE, "sclk_pvtm_core", "xin24m", 0, RK3288_CLKGATE_CON(5), 9, GFLAGS),
 	GATE(SCLK_PVTM_GPU, "sclk_pvtm_gpu", "xin24m", 0, RK3288_CLKGATE_CON(5), 10, GFLAGS),
-	GATE(0, "sclk_mipidsi_24m", "xin24m", 0, RK3288_CLKGATE_CON(5), 15, GFLAGS),
+	GATE(SCLK_MIPI_24M, "sclk_mipidsi_24m", "xin24m", 0, RK3288_CLKGATE_CON(5), 15, GFLAGS),
 
 	/* sclk_gpu gates */
 	GATE(ACLK_GPU, "aclk_gpu", "sclk_gpu", 0, RK3288_CLKGATE_CON(18), 0, GFLAGS),
-- 
2.6.3
