Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:47600 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1952191AbdDYRg2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2017 13:36:28 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing
Date: Tue, 25 Apr 2017 19:36:25 +0200
Message-Id: <1493141785-29117-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

If the R-Car RST driver is not included, compile-testing R-Car clock
drivers fails with a link error:

    undefined reference to `rcar_rst_read_mode_pins'

To fix this, provide a dummy version.  Use the exact same test logic as
in drivers/soc/renesas/Makefile, as there is no Kconfig symbol (yet) to
control compilation of the R-Car RST driver.

Fixes: 527c02f66d263d2e ("soc: renesas: Add R-Car RST driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This isn't an issue now, but it does prevent enabling compile-testing of
the R-Car clock drivers.  As this is a dependency between two different
subsystems, I think this patch should be fast-tracked.

The #ifdef condition will be revised later, when the R-Car RST driver
gains its own Kconfig symbol.
---
 include/linux/soc/renesas/rcar-rst.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/soc/renesas/rcar-rst.h b/include/linux/soc/renesas/rcar-rst.h
index a18e0783946b66ec..787e7ad53d45f61c 100644
--- a/include/linux/soc/renesas/rcar-rst.h
+++ b/include/linux/soc/renesas/rcar-rst.h
@@ -1,6 +1,11 @@
 #ifndef __LINUX_SOC_RENESAS_RCAR_RST_H__
 #define __LINUX_SOC_RENESAS_RCAR_RST_H__
 
+#if defined(CONFIG_ARCH_RCAR_GEN1) || defined(CONFIG_ARCH_RCAR_GEN2) || \
+    defined(CONFIG_ARCH_R8A7795) || defined(CONFIG_ARCH_R8A7796)
 int rcar_rst_read_mode_pins(u32 *mode);
+#else
+static inline int rcar_rst_read_mode_pins(u32 *mode) { return -ENODEV; }
+#endif
 
 #endif /* __LINUX_SOC_RENESAS_RCAR_RST_H__ */
-- 
2.7.4

