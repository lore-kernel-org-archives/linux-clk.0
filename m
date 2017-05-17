Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: enable SUNXI_CCU_MP for PRCM
Date: Wed, 17 May 2017 23:19:01 +0200
Message-Id: <20170517212035.3100471-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

The newly added PRCM CCU driver uses SUNXI_CCU_MP_WITH_MUX_GATE, which causes
a link error when no other driver enables SUNXI_CCU_MP:

drivers/clk/built-in.o:(.data+0x5c8c8): undefined reference to `ccu_mp_ops'

This adds an explicit 'select' statement for it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/sunxi-ng/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index b0d551a8efe4..eb89c7801f00 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -156,6 +156,7 @@ config SUN8I_R_CCU
 	bool "Support for Allwinner SoCs' PRCM CCUs"
 	select SUNXI_CCU_DIV
 	select SUNXI_CCU_GATE
+	select SUNXI_CCU_MP
 	default MACH_SUN8I || (ARCH_SUNXI && ARM64)
 
 endif
-- 
2.9.0
