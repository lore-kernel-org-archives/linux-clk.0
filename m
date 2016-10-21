Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:56670 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934263AbcJUPr4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2016 11:47:56 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix link error for rcar-gen2
Date: Fri, 21 Oct 2016 17:47:06 +0200
Message-Id: <20161021154737.3803065-1-arnd@arndb.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The addition of one more rcar-gen2 based SoC caused a build error (again)
in my randconfig builds:

arch/arm/mach-shmobile/setup-rcar-gen2.o: In function `rcar_gen2_timer_init':
setup-rcar-gen2.c:(.init.text+0x200): undefined reference to `rcar_gen2_clocks_init'

I think this has happened twice in the past. Instead of adding each SoC
one at a time, this changes the existing list to always build the
rcar-gen2 related clk files whenever the generic symbol is selected.

Fixes: 1254f607fc3d ("ARM: shmobile: r8a7743: basic SoC support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/renesas/Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 90dd0db7d9c6..762d122eddec 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -4,11 +4,7 @@ obj-$(CONFIG_ARCH_R8A73A4)		+= clk-r8a73a4.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7740)		+= clk-r8a7740.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7778)		+= clk-r8a7778.o
 obj-$(CONFIG_ARCH_R8A7779)		+= clk-r8a7779.o
-obj-$(CONFIG_ARCH_R8A7790)		+= clk-rcar-gen2.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7791)		+= clk-rcar-gen2.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7792)		+= clk-rcar-gen2.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7793)		+= clk-rcar-gen2.o clk-div6.o
-obj-$(CONFIG_ARCH_R8A7794)		+= clk-rcar-gen2.o clk-div6.o
+obj-$(CONFIG_ARCH_RCAR_GEN2)		+= clk-rcar-gen2.o clk-div6.o
 obj-$(CONFIG_ARCH_R8A7795)		+= r8a7795-cpg-mssr.o rcar-gen3-cpg.o
 obj-$(CONFIG_ARCH_R8A7796)		+= r8a7796-cpg-mssr.o rcar-gen3-cpg.o
 obj-$(CONFIG_ARCH_SH73A0)		+= clk-sh73a0.o clk-div6.o
-- 
2.9.0

