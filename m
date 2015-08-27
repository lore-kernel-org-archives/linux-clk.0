Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 6/8] clk: imx5: retain early UART clocks during kernel init
Date: Thu, 27 Aug 2015 18:39:19 +0200
Message-Id: <1440693561-28095-7-git-send-email-l.stach@pengutronix.de>
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
 drivers/clk/imx/clk-imx51-imx53.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/imx/clk-imx51-imx53.c b/drivers/clk/imx/clk-imx51-imx53.c
index a7e4f394be0d..701d1d912a4b 100644
--- a/drivers/clk/imx/clk-imx51-imx53.c
+++ b/drivers/clk/imx/clk-imx51-imx53.c
@@ -130,6 +130,20 @@ static const char *cpu_podf_sels[] = { "pll1_sw", "step_sel" };
 static struct clk *clk[IMX5_CLK_END];
 static struct clk_onecell_data clk_data;
 
+static void __init imx5_uart_disable_cb(void)
+{
+	clk_disable_unprepare(clk[IMX5_CLK_UART1_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART1_PER_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART2_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART2_PER_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART3_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART3_PER_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART4_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART4_PER_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART5_IPG_GATE]);
+	clk_disable_unprepare(clk[IMX5_CLK_UART5_PER_GATE]);
+}
+
 static void __init mx5_clocks_common_init(void __iomem *ccm_base)
 {
 	clk[IMX5_CLK_DUMMY]		= imx_clk_fixed("dummy", 0);
@@ -310,6 +324,20 @@ static void __init mx5_clocks_common_init(void __iomem *ccm_base)
 	clk_prepare_enable(clk[IMX5_CLK_TMAX1]);
 	clk_prepare_enable(clk[IMX5_CLK_TMAX2]); /* esdhc2, fec */
 	clk_prepare_enable(clk[IMX5_CLK_TMAX3]); /* esdhc1, esdhc4 */
+
+	if (imx_clk_keep_uart()) {
+		clk_prepare_enable(clk[IMX5_CLK_UART1_IPG_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART1_PER_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART2_IPG_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART2_PER_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART3_IPG_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART3_PER_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART4_IPG_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART4_PER_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART5_IPG_GATE]);
+		clk_prepare_enable(clk[IMX5_CLK_UART5_PER_GATE]);
+		imx_clk_set_uart_disable_callback(imx5_uart_disable_cb);
+	}
 }
 
 static void __init mx50_clocks_init(struct device_node *np)
-- 
2.5.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
