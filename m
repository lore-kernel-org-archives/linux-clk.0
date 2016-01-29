Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH] clk: tango4: rename ARCH_TANGOX to ARCH_TANGO
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: linux-clk <linux-clk@vger.kernel.org>
Message-ID: <56AB721A.1000609@sigmadesigns.com>
Date: Fri, 29 Jan 2016 15:07:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
List-ID: <linux-clk.vger.kernel.org>

Requested by arm-soc maintainer Kevin Hilman in v9 review.
http://article.gmane.org/gmane.linux.ports.arm.kernel/456331

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
IIUC, the merge window is now closed, but this patch might be
accepted in the clk-fixes branch, so that the corresponding
platform code successfully builds its clk driver.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/mach-tango
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f4165bb9a270..f50cb257e0ba 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -42,7 +42,7 @@ obj-$(CONFIG_COMMON_CLK_SI514)		+= clk-si514.o
 obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_STM32)		+= clk-stm32f4.o
-obj-$(CONFIG_ARCH_TANGOX)		+= clk-tango4.o
+obj-$(CONFIG_ARCH_TANGO)		+= clk-tango4.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_U300)			+= clk-u300.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
-- 
2.6.3
