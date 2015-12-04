Return-Path: <alexandre.belloni@free-electrons.com>
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH v3 11/13] ARM: at91: remove useless includes and function prototypes
Date: Fri,  4 Dec 2015 18:03:46 +0100
Message-Id: <1449248628-3486-12-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1449248628-3486-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1449248628-3486-1-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Remove leftover from the previous cleanup

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 arch/arm/mach-at91/generic.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-at91/generic.h b/arch/arm/mach-at91/generic.h
index d224e195706a..28ca57a2060f 100644
--- a/arch/arm/mach-at91/generic.h
+++ b/arch/arm/mach-at91/generic.h
@@ -11,13 +11,6 @@
 #ifndef _AT91_GENERIC_H
 #define _AT91_GENERIC_H
 
-#include <linux/of.h>
-#include <linux/reboot.h>
-
- /* Map io */
-extern void __init at91_map_io(void);
-extern void __init at91_alt_map_io(void);
-
 #ifdef CONFIG_PM
 extern void __init at91rm9200_pm_init(void);
 extern void __init at91sam9260_pm_init(void);
-- 
2.5.0
