Return-Path: <suzuki.katsuhiro@socionext.com>
From: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-clk@vger.kernel.org
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	linux-kernel@vger.kernel.org,
	Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Subject: [PATCH 2/2] clk: uniphier: add video input subsystem clock
Date: Thu, 10 Aug 2017 16:23:46 +0900
Message-Id: <20170810072346.32299-2-suzuki.katsuhiro@socionext.com>
In-Reply-To: <20170810072346.32299-1-suzuki.katsuhiro@socionext.com>
References: <20170810072346.32299-1-suzuki.katsuhiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Add a clock for video input subsystem (EXIV) on
UniPhier LD11/LD20 SoCs.

Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
---
 drivers/clk/uniphier/clk-uniphier-sys.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/uniphier/clk-uniphier-sys.c b/drivers/clk/uniphier/clk-uniphier-sys.c
index 7c4528d0fb6e..c60aa586fea7 100644
--- a/drivers/clk/uniphier/clk-uniphier-sys.c
+++ b/drivers/clk/uniphier/clk-uniphier-sys.c
@@ -65,6 +65,10 @@
 	UNIPHIER_CLK_FACTOR("evea-io100m", -1, "spll", 1, 20),		\
 	UNIPHIER_CLK_GATE("evea", (idx), "evea-io100m", 0x2108, 1)
 
+#define UNIPHIER_LD11_SYS_CLK_EXIV(idx)					\
+	UNIPHIER_CLK_FACTOR("exiv-io200m", -1, "spll", 1, 10),		\
+	UNIPHIER_CLK_GATE("exiv", (idx), "exiv-io200m", 0x2110, 2)
+
 const struct uniphier_clk_data uniphier_sld3_sys_clk_data[] = {
 	UNIPHIER_CLK_FACTOR("spll", -1, "ref", 65, 1),		/* 1597.44 MHz */
 	UNIPHIER_CLK_FACTOR("upll", -1, "ref", 6000, 512),	/* 288 MHz */
@@ -168,6 +172,7 @@ const struct uniphier_clk_data uniphier_ld11_sys_clk_data[] = {
 	UNIPHIER_CLK_FACTOR("usb2", -1, "ref", 24, 25),
 	UNIPHIER_LD11_SYS_CLK_AIO(40),
 	UNIPHIER_LD11_SYS_CLK_EVEA(41),
+	UNIPHIER_LD11_SYS_CLK_EXIV(42),
 	/* CPU gears */
 	UNIPHIER_CLK_DIV4("cpll", 2, 3, 4, 8),
 	UNIPHIER_CLK_DIV4("mpll", 2, 3, 4, 8),
@@ -206,6 +211,7 @@ const struct uniphier_clk_data uniphier_ld20_sys_clk_data[] = {
 	UNIPHIER_CLK_GATE("usb30-phy1", 17, NULL, 0x210c, 13),
 	UNIPHIER_LD11_SYS_CLK_AIO(40),
 	UNIPHIER_LD11_SYS_CLK_EVEA(41),
+	UNIPHIER_LD11_SYS_CLK_EXIV(42),
 	/* CPU gears */
 	UNIPHIER_CLK_DIV4("cpll", 2, 3, 4, 8),
 	UNIPHIER_CLK_DIV4("spll", 2, 3, 4, 8),
-- 
2.13.2
