Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: add R8A7792 support
Date: Thu, 26 May 2016 00:40:44 +0300
Message-ID: <9904764.Bsg49gKsuS@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Renesas R-Car V2H (R8A7792) clocks are handled by R-Car gen2 clock driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'clk-next' branch of CLK group's 'linux.git' repo.

 drivers/clk/renesas/Kconfig  |    1 +
 drivers/clk/renesas/Makefile |    1 +
 2 files changed, 2 insertions(+)

Index: linux/drivers/clk/renesas/Kconfig
===================================================================
--- linux.orig/drivers/clk/renesas/Kconfig
+++ linux/drivers/clk/renesas/Kconfig
@@ -11,6 +11,7 @@ config CLK_RENESAS_CPG_MSTP
 	default y if ARCH_R8A7779
 	default y if ARCH_R8A7790
 	default y if ARCH_R8A7791
+	default y if ARCH_R8A7792
 	default y if ARCH_R8A7793
 	default y if ARCH_R8A7794
 	default y if ARCH_SH73A0
Index: linux/drivers/clk/renesas/Makefile
===================================================================
--- linux.orig/drivers/clk/renesas/Makefile
+++ linux/drivers/clk/renesas/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_ARCH_R8A7778)		+= clk-r8a77
 obj-$(CONFIG_ARCH_R8A7779)		+= clk-r8a7779.o
 obj-$(CONFIG_ARCH_R8A7790)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7791)		+= clk-rcar-gen2.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7792)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7793)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7794)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7795)		+= r8a7795-cpg-mssr.o
