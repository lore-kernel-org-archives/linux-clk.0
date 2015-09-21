Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v4 5/8] clk: imx35: retain early UART clocks during kernel init
Date: Mon, 21 Sep 2015 18:54:01 +0200
Message-Id: <1442854444-4460-6-git-send-email-l.stach@pengutronix.de>
In-Reply-To: <1442854444-4460-1-git-send-email-l.stach@pengutronix.de>
References: <1442854444-4460-1-git-send-email-l.stach@pengutronix.de>
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
 drivers/clk/imx/clk-imx35.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/imx/clk-imx35.c b/drivers/clk/imx/clk-imx35.c
index 8623cd4e49fd..ba8b33328a8d 100644
--- a/drivers/clk/imx/clk-imx35.c
+++ b/drivers/clk/imx/clk-imx35.c
@@ -84,6 +84,14 @@ enum mx35_clks {
 
 static struct clk *clk[clk_max];
 
+static struct clk ** const uart_clks[] __initconst = {
+	&clk[ipg],
+	&clk[uart1_gate],
+	&clk[uart2_gate],
+	&clk[uart3_gate],
+	NULL
+};
+
 int __init mx35_clocks_init(void)
 {
 	void __iomem *base;
@@ -296,6 +304,8 @@ int __init mx35_clocks_init(void)
 	 */
 	clk_prepare_enable(clk[scc_gate]);
 
+	imx_register_uart_clocks(uart_clks);
+
 	imx_print_silicon_rev("i.MX35", mx35_revision());
 
 	mxc_timer_init(MX35_GPT1_BASE_ADDR, MX35_INT_GPT, GPT_TYPE_IMX31);
-- 
2.5.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
