Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34471 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756149AbdDPQ6L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2017 12:58:11 -0400
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: shmobile: r8a7791: add GyroADC clock
Date: Sun, 16 Apr 2017 18:57:08 +0200
Message-Id: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the GyroADC clock to the R8A7791 device tree.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
---
 include/dt-bindings/clock/r8a7791-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/r8a7791-clock.h b/include/dt-bindings/clock/r8a7791-clock.h
index adc50dc31ab3..ef692134146b 100644
--- a/include/dt-bindings/clock/r8a7791-clock.h
+++ b/include/dt-bindings/clock/r8a7791-clock.h
@@ -109,6 +109,7 @@
 #define R8A7791_CLK_SATA0		15
 
 /* MSTP9 */
+#define R8A7791_CLK_GYROADC		1
 #define R8A7791_CLK_GPIO7		4
 #define R8A7791_CLK_GPIO6		5
 #define R8A7791_CLK_GPIO5		7
-- 
2.11.0

