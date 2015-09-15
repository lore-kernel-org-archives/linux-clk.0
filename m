Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mark Salter <msalter@redhat.com>,
	Aurelien Jacquiot <a-jacquiot@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-c6x-dev@linux-c6x.org
Subject: [PATCH] c6x: Use generic clkdev.h header
Date: Tue, 15 Sep 2015 16:09:22 -0700
Message-Id: <1442358562-3348-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The c6x clkdev.h header is the same as the asm-generic header, so
just use the asm-generic one.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 arch/c6x/include/asm/Kbuild   |  1 +
 arch/c6x/include/asm/clkdev.h | 22 ----------------------
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 arch/c6x/include/asm/clkdev.h

diff --git a/arch/c6x/include/asm/Kbuild b/arch/c6x/include/asm/Kbuild
index f17c4dc6050c..a9bc2c5106d2 100644
--- a/arch/c6x/include/asm/Kbuild
+++ b/arch/c6x/include/asm/Kbuild
@@ -4,6 +4,7 @@ generic-y += auxvec.h
 generic-y += barrier.h
 generic-y += bitsperlong.h
 generic-y += bugs.h
+generic-y += clkdev.h
 generic-y += cputime.h
 generic-y += current.h
 generic-y += device.h
diff --git a/arch/c6x/include/asm/clkdev.h b/arch/c6x/include/asm/clkdev.h
deleted file mode 100644
index 76a070b1c2e5..000000000000
--- a/arch/c6x/include/asm/clkdev.h
+++ /dev/null
@@ -1,22 +0,0 @@
-#ifndef _ASM_CLKDEV_H
-#define _ASM_CLKDEV_H
-
-#include <linux/slab.h>
-
-struct clk;
-
-static inline int __clk_get(struct clk *clk)
-{
-	return 1;
-}
-
-static inline void __clk_put(struct clk *clk)
-{
-}
-
-static inline struct clk_lookup_alloc *__clkdev_alloc(size_t size)
-{
-	return kzalloc(size, GFP_KERNEL);
-}
-
-#endif /* _ASM_CLKDEV_H */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

