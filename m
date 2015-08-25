Return-Path: <linux@mniewoehner.de>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: [PATCH v3] clk: rockchip: add pclk_cpu to the list of rk3188 critical  clocks
From: Michael Niewoehner <linux@mniewoehner.de>
In-Reply-To: <20150825185931.31346.26497@quantum>
Date: Tue, 25 Aug 2015 22:22:07 +0200
Cc: Heiko Stuebner <heiko@sntech.de>,
 sboyd@codeaurora.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Message-Id: <8804658D-175F-4668-BC12-4AC439438B61@mniewoehner.de>
References: <5400BEF8-5245-4F7B-845B-D326A7BC56B5@mniewoehner.de> <5275855.eah07vmf4I@phil> <9DBF9CCE-196E-43FB-BA76-BFB4B5F47A22@mniewoehner.de> <10213368.VjAQGt7Kjq@phil> <F5234F5E-2A91-4B63-B260-3F20A4D16A9D@mniewoehner.de> <20150825185931.31346.26497@quantum>
To: Michael Turquette <mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

pclk_cpu needs to keep running because it is needed for devices like
the act8865 regulator but with the recent gpio clock handling this is
not always the case anymore. So add it to the list of critical clocks.

Signed-off-by: Michael Niewoehner <linux@mniewoehner.de>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
Changes in v3:
- fix git format-patch problem

Changes in v2:
- adapt commit message
- add Linus Walleij to recipients, as the patch is related to the gpio =
clock
 change in the rockchip pinctrl driver it should go through his tree as =
well

 drivers/clk/rockchip/clk-rk3188.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3188.c =
b/drivers/clk/rockchip/clk-rk3188.c
index ed02bbc..f63a642 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -716,6 +716,7 @@ static const char *const rk3188_critical_clocks[] =
__initconst =3D {
 	"aclk_cpu",
 	"aclk_peri",
 	"hclk_peri",
+	"pclk_cpu",
 };
=20
 static void __init rk3188_common_clk_init(struct device_node *np)
--=20
2.5.0
