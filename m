Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v2 2/8] clk: imx25: retain early UART clocks during kernel init
Date: Fri,  4 Sep 2015 18:00:13 +0200
Message-Id: <1441382419-4343-3-git-send-email-l.stach@pengutronix.de>
In-Reply-To: <1441382419-4343-1-git-send-email-l.stach@pengutronix.de>
References: <1441382419-4343-1-git-send-email-l.stach@pengutronix.de>
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
 drivers/clk/imx/clk-imx25.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
index ec1a4c1dacf1..e55acea762fb 100644
--- a/drivers/clk/imx/clk-imx25.c
+++ b/drivers/clk/imx/clk-imx25.c
@@ -86,6 +86,14 @@ enum mx25_clks {
 
 static struct clk *clk[clk_max];
 
+static struct clk **uart_clks[] __initdata = { &clk[uart_ipg_per],
+					       &clk[uart1_ipg],
+					       &clk[uart2_ipg],
+					       &clk[uart3_ipg],
+					       &clk[uart4_ipg],
+					       &clk[uart5_ipg],
+					       NULL };
+
 static int __init __mx25_clocks_init(unsigned long osc_rate,
 				     void __iomem *ccm_base)
 {
@@ -233,6 +241,8 @@ static int __init __mx25_clocks_init(unsigned long osc_rate,
 	 */
 	clk_set_parent(clk[cko_sel], clk[ipg]);
 
+	imx_register_uart_clocks(uart_clks);
+
 	return 0;
 }
 
-- 
2.5.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
