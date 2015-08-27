Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 3/8] clk: imx27: retain early UART clocks during kernel init
Date: Thu, 27 Aug 2015 18:39:16 +0200
Message-Id: <1440693561-28095-4-git-send-email-l.stach@pengutronix.de>
In-Reply-To: <1440693561-28095-1-git-send-email-l.stach@pengutronix.de>
References: <1440693561-28095-1-git-send-email-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Make sure to keep UART clocks enabled during kernel init if
earlyprintk or earlycon are active.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/clk/imx/clk-imx27.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index d9d50d54ef2a..54fb783123a9 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -47,6 +47,17 @@ static const char *ssi_sel_clks[] = { "spll_gate", "mpll", };
 static struct clk *clk[IMX27_CLK_MAX];
 static struct clk_onecell_data clk_data;
 
+static void __init imx27_uart_disable_cb(void)
+{
+	clk_disable_unprepare(clk[IMX27_CLK_PER1_GATE]);
+	clk_disable_unprepare(clk[IMX27_CLK_UART1_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX27_CLK_UART2_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX27_CLK_UART3_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX27_CLK_UART4_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX27_CLK_UART5_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX27_CLK_UART6_IPG_GATE]);
+}
+
 static void __init _mx27_clocks_init(unsigned long fref)
 {
 	BUG_ON(!ccm);
@@ -163,6 +174,17 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 	clk_prepare_enable(clk[IMX27_CLK_EMI_AHB_GATE]);
 
+	if (imx_clk_keep_uart()) {
+		clk_prepare_enable(clk[IMX27_CLK_PER1_GATE]);
+		clk_prepare_enable(clk[IMX27_CLK_UART1_IPG_GATE]);
+		clk_prepare_enable(clk[IMX27_CLK_UART2_IPG_GATE]);
+		clk_prepare_enable(clk[IMX27_CLK_UART3_IPG_GATE]);
+		clk_prepare_enable(clk[IMX27_CLK_UART4_IPG_GATE]);
+		clk_prepare_enable(clk[IMX27_CLK_UART5_IPG_GATE]);
+		clk_prepare_enable(clk[IMX27_CLK_UART6_IPG_GATE]);
+		imx_clk_set_uart_disable_callback(imx27_uart_disable_cb);
+	}
+
 	imx_print_silicon_rev("i.MX27", mx27_revision());
 }
 
-- 
2.5.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
