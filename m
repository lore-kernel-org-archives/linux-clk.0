Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Do not build clk-div6 for R8A7792
Date: Tue, 25 Apr 2017 19:26:01 +0200
Message-Id: <1493141161-28069-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

R-Car V2H does not have "DIV6" programmable clocks, hence there is no
need to build clk-div6.o.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued up in clk-renesas-for-v4.13.

 drivers/clk/renesas/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 1072f7653c0c5e70..5b8fccf574787632 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_ARCH_R8A7778)		+= clk-r8a7778.o
 obj-$(CONFIG_ARCH_R8A7779)		+= clk-r8a7779.o
 obj-$(CONFIG_ARCH_R8A7790)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7791)		+= clk-rcar-gen2.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7792)		+= clk-rcar-gen2.o clk-div6.o
+obj-$(CONFIG_ARCH_R8A7792)		+= clk-rcar-gen2.o
 obj-$(CONFIG_ARCH_R8A7793)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7794)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7795)		+= r8a7795-cpg-mssr.o rcar-gen3-cpg.o
-- 
2.7.4
