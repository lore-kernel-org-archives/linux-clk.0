Return-Path: <tklauser@distanz.ch>
From: Tobias Klauser <tklauser@distanz.ch>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: explicitly include linux/spinlock.h
Date: Mon, 15 May 2017 12:23:07 +0200
Message-Id: <20170515102307.28743-1-tklauser@distanz.ch>
List-ID: <linux-clk.vger.kernel.org>

ccu_reset.h and ccu_reset.c use spinlock_t and associated functions but
rely on implict inclusion of linux/spinlock.h which means that changes
in other headers could break the build. Thus, add an explicit include.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/clk/sunxi-ng/ccu_reset.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/ccu_reset.h b/drivers/clk/sunxi-ng/ccu_reset.h
index 36a4679210bd..ff8f5ebca435 100644
--- a/drivers/clk/sunxi-ng/ccu_reset.h
+++ b/drivers/clk/sunxi-ng/ccu_reset.h
@@ -15,6 +15,7 @@
 #define _CCU_RESET_H_
 
 #include <linux/reset-controller.h>
+#include <linux/spinlock.h>
 
 struct ccu_reset_map {
 	u16	reg;
-- 
2.13.0
