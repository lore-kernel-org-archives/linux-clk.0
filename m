Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	=?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: zynq: remove redundant $(CONFIG_ARCH_ZYNQ) in Makefile
Date: Mon, 27 Jul 2015 16:36:42 +0900
Message-Id: <1437982602-26886-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Kbuild descends into drivers/clk/zynq/ only when CONFIG_ARCH_ZYNQ
is enabled.  (see drivers/clk/Makefile)

$(CONFIG_ARCH_ZYNQ) in drivers/clk/zynq/Makefile always evaluates
to 'y'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/zynq/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynq/Makefile b/drivers/clk/zynq/Makefile
index 156d923..0afc2e7 100644
--- a/drivers/clk/zynq/Makefile
+++ b/drivers/clk/zynq/Makefile
@@ -1,3 +1,3 @@
 # Zynq clock specific Makefile
 
-obj-$(CONFIG_ARCH_ZYNQ)	+= clkc.o pll.o
+obj-y	+= clkc.o pll.o
-- 
1.9.1

