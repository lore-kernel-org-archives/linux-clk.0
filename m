Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] clk: renesas: Provide Kconfig symbols for CPG/MSSR and CPG/MSTP support
Date: Wed, 13 Apr 2016 16:44:15 +0200
Message-Id: <1460558657-10128-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1460558657-10128-1-git-send-email-geert+renesas@glider.be>
References: <1460558657-10128-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Currently the decision whether to build the renesas-cpg-mssr and
clk-mstp drivers is handled by Makefile logic.  However, the rcar-sysc
driver will need to know whether CPG/MSSR and/or CPG/MSTP support are
available or not.

To avoid having to duplicate this logic, move it to Kconfig. Provide
non-visible CLK_RENESAS_CPG_MSSR and CLK_RENESAS_CPG_MSTP Kconfig
symbols, which can be used by both Makefiles and C code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/clk/Kconfig          |  1 +
 drivers/clk/renesas/Kconfig  | 16 ++++++++++++++++
 drivers/clk/renesas/Makefile | 26 ++++++++++++++------------
 3 files changed, 31 insertions(+), 12 deletions(-)
 create mode 100644 drivers/clk/renesas/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 16f7d33421d8b63b..c45554957499ea60 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -201,6 +201,7 @@ source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
+source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/samsung/Kconfig"
 source "drivers/clk/tegra/Kconfig"
 source "drivers/clk/ti/Kconfig"
diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
new file mode 100644
index 0000000000000000..2115ce410cfb4bc9
--- /dev/null
+++ b/drivers/clk/renesas/Kconfig
@@ -0,0 +1,16 @@
+config CLK_RENESAS_CPG_MSSR
+	bool
+	default y if ARCH_R8A7795
+
+config CLK_RENESAS_CPG_MSTP
+	bool
+	default y if ARCH_R7S72100
+	default y if ARCH_R8A73A4
+	default y if ARCH_R8A7740
+	default y if ARCH_R8A7778
+	default y if ARCH_R8A7779
+	default y if ARCH_R8A7790
+	default y if ARCH_R8A7791
+	default y if ARCH_R8A7793
+	default y if ARCH_R8A7794
+	default y if ARCH_SH73A0
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 7e2579b303267d8b..ead8bb8435249493 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -1,13 +1,15 @@
 obj-$(CONFIG_ARCH_EMEV2)		+= clk-emev2.o
-obj-$(CONFIG_ARCH_R7S72100)		+= clk-rz.o clk-mstp.o
-obj-$(CONFIG_ARCH_R8A73A4)		+= clk-r8a73a4.o clk-mstp.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7740)		+= clk-r8a7740.o clk-mstp.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7778)		+= clk-r8a7778.o clk-mstp.o
-obj-$(CONFIG_ARCH_R8A7779)		+= clk-r8a7779.o clk-mstp.o
-obj-$(CONFIG_ARCH_R8A7790)		+= clk-rcar-gen2.o clk-mstp.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7791)		+= clk-rcar-gen2.o clk-mstp.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7793)		+= clk-rcar-gen2.o clk-mstp.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7794)		+= clk-rcar-gen2.o clk-mstp.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7795)		+= renesas-cpg-mssr.o \
-					   r8a7795-cpg-mssr.o clk-div6.o
-obj-$(CONFIG_ARCH_SH73A0)		+= clk-sh73a0.o clk-mstp.o clk-div6.o
+obj-$(CONFIG_ARCH_R7S72100)		+= clk-rz.o
+obj-$(CONFIG_ARCH_R8A73A4)		+= clk-r8a73a4.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7740)		+= clk-r8a7740.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7778)		+= clk-r8a7778.o
+obj-$(CONFIG_ARCH_R8A7779)		+= clk-r8a7779.o
+obj-$(CONFIG_ARCH_R8A7790)		+= clk-rcar-gen2.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7791)		+= clk-rcar-gen2.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7793)		+= clk-rcar-gen2.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7794)		+= clk-rcar-gen2.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7795)		+= r8a7795-cpg-mssr.o
+obj-$(CONFIG_ARCH_SH73A0)		+= clk-sh73a0.o clk-div6.o
+
+obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o clk-div6.o
+obj-$(CONFIG_CLK_RENESAS_CPG_MSTP)	+= clk-mstp.o
-- 
1.9.1
