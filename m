Return-Path: <abel.vesa@nxp.com>
From: Abel Vesa <abel.vesa@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@freescale.com>,
	Irina Tirdea <irina.tirdea@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Anson Huang <anson.huang@nxp.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	Abel Vesa <abelvesa@linux.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Anson Huang <b20788@freescale.com>,
	Abel Vesa <abel.vesa@nxp.com>
Subject: [RESEND 3/4] clk: imx7d: Correct ahb clk parent select
Date: Wed, 28 Mar 2018 09:46:38 +0300
Message-Id: <1522219599-10831-5-git-send-email-abel.vesa@nxp.com>
In-Reply-To: <1522219599-10831-1-git-send-email-abel.vesa@nxp.com>
References: <1522219599-10831-1-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: abel.vesa@nxp.com
List-ID: <linux-clk.vger.kernel.org>

From: Anson Huang <b20788@freescale.com>

Design team change the ahb's clk parent options but
did NOT update the DOC accordingly in time, so the
AHB/IPG's clk rate in clk tree is incorrect, AHB is
67.5MHz and IPG is 33.75MHz, but using scope to
monitor them, they are actually 135MHz and 67.5MHz,
update the clk parent option to make clk tree info
correct.

Signed-off-by: Anson Huang <b20788@freescale.com>
Signed-off-by: Irina Tirdea <irina.tirdea@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-imx7d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 1cc485f..50da4cb 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -74,7 +74,7 @@ static const char *nand_usdhc_bus_sel[] = { "osc", "pll_sys_pfd2_270m_clk",
 
 static const char *ahb_channel_sel[] = { "osc", "pll_sys_pfd2_270m_clk",
 	"pll_dram_533m_clk", "pll_sys_pfd0_392m_clk",
-	"pll_enet_125m_clk", "pll_usb_main_clk", "pll_audio_post_div",
+	"pll_enet_250m_clk", "pll_usb_main_clk", "pll_audio_post_div",
 	"pll_video_post_div", };
 
 static const char *dram_phym_sel[] = { "pll_dram_main_clk",
-- 
2.7.4
