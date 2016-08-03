Return-Path: <zywang33@gmail.com>
Return-Path: <zywang33@gmail.com>
From: Chris Zhong <zyw@rock-chips.com>
To: dianders@chromium.org,
	tfiga@chromium.org,
	heiko@sntech.de,
	yzq@rock-chips.com,
	groeck@chromium.org,
	wulf@rock-chips.com,
	marcheu@chromium.org
Cc: linux-rockchip@lists.infradead.org,
	Chris Zhong <zyw@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: mark rk3399 hdcp_noc and pclk_vio_grf as critical
Date: Wed,  3 Aug 2016 15:36:24 +0800
Message-Id: <1470209784-2665-1-git-send-email-zyw@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

The Type-C DP need these clocks: aclk_hdcp_noc, hclk_hdcp_noc,
pclk_hdcp_noc, pclk_vio_grf. Mark them as critical to avoid someone
close them.

Signed-off-by: Chris Zhong <zyw@rock-chips.com>

---

 drivers/clk/rockchip/clk-rk3399.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 78e51cb..6c8ed25 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1466,6 +1466,9 @@ static struct rockchip_clk_branch rk3399_clk_pmu_branches[] __initdata = {
 
 static const char *const rk3399_cru_critical_clocks[] __initconst = {
 	"aclk_cci_pre",
+	"aclk_hdcp_noc",
+	"hclk_hdcp_noc",
+	"pclk_hdcp_noc",
 	"pclk_perilp0",
 	"pclk_perilp0",
 	"hclk_perilp0",
@@ -1485,6 +1488,7 @@ static const char *const rk3399_cru_critical_clocks[] __initconst = {
 	"gpll_hclk_perilp1_src",
 	"gpll_aclk_perilp0_src",
 	"gpll_aclk_perihp_src",
+	"pclk_vio_grf",
 };
 
 static const char *const rk3399_pmucru_critical_clocks[] __initconst = {
-- 
2.6.3
