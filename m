Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Abel Vesa <abel.vesa@nxp.com>
To: <shawnguo@kernel.org>, <kernel@pengutronix.de>, <fabio.estevam@nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: [PATCH 3/4] arm: imx: Correct ahb clk parent select
Date: Thu, 22 Mar 2018 11:55:28 +0200
Message-ID: <1521712529-632-4-git-send-email-abel.vesa@nxp.com>
In-Reply-To: <1521712529-632-1-git-send-email-abel.vesa@nxp.com>
References: <1521712529-632-1-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Abel Vesa <abel.vesa@nxp.com>, anson.huang@nxp.com,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Anson Huang <anson.huang@nxp.com>

Design team change the ahb's clk parent options but did NOT update the DOC
accordingly in time, so the AHB/IPG's clk rate in clk tree is incorrect, AHB is
67.5MHz and IPG is 33.75MHz, but using scope to monitor them, they are actually
135MHz and 67.5MHz, update the clk parent option to make clk tree info correct.

Signed-off-by: Anson Huang <anson.huang@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-imx7d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index d786f98..3553b68 100644
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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
