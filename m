Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:53813 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757134AbcKXQZA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Nov 2016 11:25:00 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: renesas: cpg_mstp: build for R8A774{3,5}
Date: Thu, 24 Nov 2016 17:24:31 +0100
Message-Id: <20161124162448.3761610-1-arnd@arndb.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We get a link failure on R8A7745 and R8A7743 when the other platforms
are disabled and nothing selects the clk-rcar-gen2 driver:

drivers/clk/renesas/clk-rcar-gen2.o: In function `rcar_gen2_cpg_clocks_init':
clk-rcar-gen2.c:(.init.text+0x39c): undefined reference to `cpg_mstp_add_clk_domain'

This adds another 'select' statement to get them to build as well.

Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 2586dfa0026b..4ebd9d3d24b7 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -10,6 +10,8 @@ config CLK_RENESAS_CPG_MSTP
 	default y if ARCH_R7S72100
 	default y if ARCH_R8A73A4
 	default y if ARCH_R8A7740
+	default y if ARCH_R8A7743
+	default y if ARCH_R8A7745
 	default y if ARCH_R8A7778
 	default y if ARCH_R8A7779
 	default y if ARCH_R8A7790
-- 
2.9.0

