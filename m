Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49013 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964843AbcA0WWX (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jan 2016 17:22:23 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Steven Miao <realmz6@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	adi-buildroot-devel@lists.sourceforge.net
Subject: [PATCH] blackfin: Use generic clkdev.h header
Date: Wed, 27 Jan 2016 14:22:21 -0800
Message-Id: <1453933341-9443-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The generic header file is equivalent to the blackfin version, so
just use the generic one.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Not compile tested, just done with visual inspection.

 arch/blackfin/include/asm/Kbuild   |  1 +
 arch/blackfin/include/asm/clkdev.h | 16 ----------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 arch/blackfin/include/asm/clkdev.h

diff --git a/arch/blackfin/include/asm/Kbuild b/arch/blackfin/include/asm/Kbuild
index 91d49c0a3118..9413b3c54970 100644
--- a/arch/blackfin/include/asm/Kbuild
+++ b/arch/blackfin/include/asm/Kbuild
@@ -2,6 +2,7 @@
 generic-y += auxvec.h
 generic-y += bitsperlong.h
 generic-y += bugs.h
+generic-y += clkdev.h
 generic-y += cputime.h
 generic-y += current.h
 generic-y += device.h
diff --git a/arch/blackfin/include/asm/clkdev.h b/arch/blackfin/include/asm/clkdev.h
deleted file mode 100644
index 7ac2436856a5..000000000000
--- a/arch/blackfin/include/asm/clkdev.h
+++ /dev/null
@@ -1,16 +0,0 @@
-#ifndef __ASM_CLKDEV__H_
-#define __ASM_CLKDEV__H_
-
-#include <linux/slab.h>
-
-static inline struct clk_lookup_alloc *__clkdev_alloc(size_t size)
-{
-	return kzalloc(size, GFP_KERNEL);
-}
-
-#ifndef CONFIG_COMMON_CLK
-#define __clk_put(clk)
-#define __clk_get(clk) ({ 1; })
-#endif
-
-#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

