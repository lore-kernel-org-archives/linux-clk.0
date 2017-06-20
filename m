Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tero Kristo <t-kristo@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: keystone: TI_SCI_PROTOCOL is needed for clk driver
Date: Tue, 20 Jun 2017 22:12:37 +0200
Message-Id: <20170620201249.145468-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

CONFIG_COMPILE_TEST allows building a configuration without
TI_SCI_PROTOCOL, which then fails to link:

drivers/clk/keystone/sci-clk.o: In function `ti_sci_clk_probe':
sci-clk.c:(.text.ti_sci_clk_probe+0x4c): undefined reference to `devm_ti_sci_get_handle'

This makes it a hard dependency. Right now, that means we can't
actually compile-test the driver unless ARCH_KEYSTONE is set as
well, but we can fix that by allowing TI_MESSAGE_MANAGER to
be selected for COMPILE_TEST as well.

Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/keystone/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/keystone/Kconfig b/drivers/clk/keystone/Kconfig
index 1fea328a36fe..7e9f0176578a 100644
--- a/drivers/clk/keystone/Kconfig
+++ b/drivers/clk/keystone/Kconfig
@@ -8,7 +8,8 @@ config COMMON_CLK_KEYSTONE
 config TI_SCI_CLK
 	tristate "TI System Control Interface clock drivers"
 	depends on (ARCH_KEYSTONE || COMPILE_TEST) && OF
-	default TI_SCI_PROTOCOL
+	depends on TI_SCI_PROTOCOL
+	default ARCH_KEYSTONE
 	---help---
 	  This adds the clock driver support over TI System Control Interface.
 	  If you wish to use clock resources from the PMMC firmware, say Y.
-- 
2.9.0
