Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] clk: sunxi: ccu-sun5i needs nkmp
Date: Mon, 13 Mar 2017 17:25:58 +0100
Message-Id: <20170313162614.840660-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

A randconfig build ran into this rare link error:

drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.1+0x4): undefined reference to `ccu_nkmp_ops'
drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.7+0x4): undefined reference to `ccu_nkmp_ops'

This adds the missing 'select'.

Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
For some reason this fix (first sent on Feb 14) didn't make it into mainline
as of v4.11-rc2 and is still needed there. I see it in the sunxi tree.
---
 drivers/clk/sunxi-ng/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 695bbf9ef428..b6e2aa5d0246 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -70,6 +70,7 @@ config SUN5I_CCU
 	select SUNXI_CCU_MULT
 	select SUNXI_CCU_NK
 	select SUNXI_CCU_NKM
+	select SUNXI_CCU_NKMP
 	select SUNXI_CCU_NM
 	select SUNXI_CCU_MP
 	select SUNXI_CCU_PHASE
-- 
2.9.0
