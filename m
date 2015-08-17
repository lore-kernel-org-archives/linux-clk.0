Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Michael Niewoehner <linux@mniewoehner.de>
Subject: [PATCH] clk: rockchip: add pclk_cpu to the list of rk3188 critical
 clocks
Message-Id: <5400BEF8-5245-4F7B-845B-D326A7BC56B5@mniewoehner.de>
Date: Mon, 17 Aug 2015 19:38:22 +0200
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

gpio clock is getting disabled to save power but pclk_cpu is needed for act8865 regulator

Signed-off-by: Michael Niewoehner <linux@mniewoehner.de>
---
 drivers/clk/rockchip/clk-rk3188.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index e4f9d47..1c93229 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -708,6 +708,7 @@ static const char *const rk3188_critical_clocks[] __initconst = {
 	"aclk_cpu",
 	"aclk_peri",
 	"hclk_peri",
+	"pclk_cpu",
 };
 
 static void __init rk3188_common_clk_init(struct device_node *np)
-- 
2.5.0

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
