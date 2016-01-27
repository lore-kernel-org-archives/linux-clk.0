Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Russell King <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: Use generic clkdev.h header
Date: Wed, 27 Jan 2016 14:11:42 -0800
Message-Id: <1453932702-6930-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Get rid of the clkdev.h file in the ARM port and use the generic
one because we've gotten rid of all the machine specific
mach/clkdev.h files.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 arch/arm/include/asm/Kbuild   |  1 +
 arch/arm/include/asm/clkdev.h | 31 -------------------------------
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 arch/arm/include/asm/clkdev.h

diff --git a/arch/arm/include/asm/Kbuild b/arch/arm/include/asm/Kbuild
index 16da6380eb85..43cd07708cf9 100644
--- a/arch/arm/include/asm/Kbuild
+++ b/arch/arm/include/asm/Kbuild
@@ -1,6 +1,7 @@
 
 
 generic-y += bitsperlong.h
+generic-y += clkdev.h
 generic-y += cputime.h
 generic-y += current.h
 generic-y += early_ioremap.h
diff --git a/arch/arm/include/asm/clkdev.h b/arch/arm/include/asm/clkdev.h
deleted file mode 100644
index 4e8a4b27d7c7..000000000000
--- a/arch/arm/include/asm/clkdev.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- *  arch/arm/include/asm/clkdev.h
- *
- *  Copyright (C) 2008 Russell King.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * Helper for the clk API to assist looking up a struct clk.
- */
-#ifndef __ASM_CLKDEV_H
-#define __ASM_CLKDEV_H
-
-#include <linux/slab.h>
-
-#ifndef CONFIG_COMMON_CLK
-#ifdef CONFIG_HAVE_MACH_CLKDEV
-#include <mach/clkdev.h>
-#else
-#define __clk_get(clk)	({ 1; })
-#define __clk_put(clk)	do { } while (0)
-#endif
-#endif
-
-static inline struct clk_lookup_alloc *__clkdev_alloc(size_t size)
-{
-	return kzalloc(size, GFP_KERNEL);
-}
-
-#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
