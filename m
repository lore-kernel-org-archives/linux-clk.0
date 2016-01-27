Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49074 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934363AbcA0WXj (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jan 2016 17:23:39 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mips@linux-mips.org
Subject: [PATCH] MIPS: Use generic clkdev.h header
Date: Wed, 27 Jan 2016 14:23:36 -0800
Message-Id: <1453933416-9714-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The generic header file is equivalent to the MIPS one, so use the
generic one instead.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Not compiled, just made from visual inspection.

 arch/mips/include/asm/Kbuild   |  1 +
 arch/mips/include/asm/clkdev.h | 27 ---------------------------
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 arch/mips/include/asm/clkdev.h

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index c7fe4d01e79c..9740066cc631 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -1,5 +1,6 @@
 # MIPS headers
 generic-(CONFIG_GENERIC_CSUM) += checksum.h
+generic-y += clkdev.h
 generic-y += cputime.h
 generic-y += current.h
 generic-y += dma-contiguous.h
diff --git a/arch/mips/include/asm/clkdev.h b/arch/mips/include/asm/clkdev.h
deleted file mode 100644
index 1b3ad7b09dc1..000000000000
--- a/arch/mips/include/asm/clkdev.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/*
- *  based on arch/arm/include/asm/clkdev.h
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
-#define __clk_get(clk)	({ 1; })
-#define __clk_put(clk)	do { } while (0)
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

