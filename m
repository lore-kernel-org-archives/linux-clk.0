Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] ARM: plat-versatile: remove stale clock header
Date: Sat, 18 Mar 2017 09:59:43 +0100
Message-Id: <20170318085944.15899-2-linus.walleij@linaro.org>
In-Reply-To: <20170318085944.15899-1-linus.walleij@linaro.org>
References: <20170318085944.15899-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

All the Versatile platforms (Integrator, Versatile, RealView
Versatile Express) have been migrated to use the drivers/clk
subsystem. Clean out this header that is not referenced
anywhere anymore.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/plat-versatile/include/plat/clock.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/arm/plat-versatile/include/plat/clock.h

diff --git a/arch/arm/plat-versatile/include/plat/clock.h b/arch/arm/plat-versatile/include/plat/clock.h
deleted file mode 100644
index 3cfb024ccd70..000000000000
--- a/arch/arm/plat-versatile/include/plat/clock.h
+++ /dev/null
@@ -1,15 +0,0 @@
-#ifndef PLAT_CLOCK_H
-#define PLAT_CLOCK_H
-
-#include <asm/hardware/icst.h>
-
-struct clk_ops {
-	long	(*round)(struct clk *, unsigned long);
-	int	(*set)(struct clk *, unsigned long);
-	void	(*setvco)(struct clk *, struct icst_vco);
-};
-
-int icst_clk_set(struct clk *, unsigned long);
-long icst_clk_round(struct clk *, unsigned long);
-
-#endif
-- 
2.9.3
