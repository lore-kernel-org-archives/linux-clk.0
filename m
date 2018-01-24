Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Anson Huang <Anson.Huang@nxp.com>
To: <shawnguo@kernel.org>, <kernel@pengutronix.de>, <fabio.estevam@nxp.com>,
 <mturquette@baylibre.com>, <sboyd@codeaurora.org>
Subject: [PATCH] clk: imx: imx6sx: update cko mux options
Date: Wed, 24 Jan 2018 22:31:21 +0800
Message-ID: <1516804281-19123-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: aisheng.dong@nxp.com, linux-kernel@vger.kernel.org, Linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

According to latest reference manual (Rev.2, 9/2017),
previous CKO1/2's mux options are incorrect, update
them.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx6sx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index e6d389e..bc3f9eb 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -63,17 +63,17 @@ static const char *lcdif2_sels[]	= { "lcdif2_podf", "ipp_di0", "ipp_di1", "ldb_d
 static const char *display_sels[]	= { "pll2_bus", "pll2_pfd2_396m", "pll3_usb_otg", "pll3_pfd1_540m", };
 static const char *csi_sels[]		= { "osc", "pll2_pfd2_396m", "pll3_120m", "pll3_pfd1_540m", };
 static const char *cko1_sels[]		= {
-	"pll3_usb_otg", "pll2_bus", "pll1_sys", "pll5_video_div",
-	"dummy", "ocram", "dummy", "pxp_axi", "epdc_axi", "lcdif_pix",
-	"epdc_pix", "ahb", "ipg", "perclk", "ckil", "pll4_audio_div",
+	"dummy", "dummy", "dummy", "dummy",
+	"vadc", "ocram", "qspi2", "m4", "enet_ahb", "lcdif2_pix",
+	"lcdif1_pix", "ahb", "ipg", "perclk", "ckil", "pll4_audio_div",
 };
 static const char *cko2_sels[]		= {
 	"dummy", "mmdc_p0_fast", "usdhc4", "usdhc1", "dummy", "wrck",
 	"ecspi_root", "dummy", "usdhc3", "pcie", "arm", "csi_core",
-	"lcdif_axi", "dummy", "osc", "dummy", "gpu2d_ovg_core",
-	"usdhc2", "ssi1", "ssi2", "ssi3", "gpu2d_core", "dummy",
-	"dummy", "dummy", "dummy", "esai_extal", "eim_slow", "uart_serial",
-	"spdif", "asrc", "dummy",
+	"display_axi", "dummy", "osc", "dummy", "dummy",
+	"usdhc2", "ssi1", "ssi2", "ssi3", "gpu_axi_podf", "dummy",
+	"can_podf", "lvds1_out", "qspi1", "esai_extal", "eim_slow",
+	"uart_serial", "spdif", "audio", "dummy",
 };
 static const char *cko_sels[] = { "cko1", "cko2", };
 static const char *lvds_sels[]	= {
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
