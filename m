Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB2AC47097
	for <linux-clk@archiver.kernel.org>; Mon, 31 May 2021 17:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 677966124B
	for <linux-clk@archiver.kernel.org>; Mon, 31 May 2021 17:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbhEaRiE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 May 2021 13:38:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:42584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231295AbhEaRhk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 31 May 2021 13:37:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2878A60231;
        Mon, 31 May 2021 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622482559;
        bh=bWlqfBY4H7dnMT6+o3IWxYiXTD9T9L6bekH/c2DVyUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sZPBxXyoRQU3afKwHEbcTLkHCbGrxlztTK+7Rt16xoamaeOUx6Q7MTDL6ShCu6WU7
         Rz4Olkpc3VMC8P1u78NWSVAPg9kTWJDYTgy5mmCyjyqHRInG0xWFQlEYRKF59+dswp
         pkLnJuPFT+tYNiDJhalN0mFZnPfGHDY36jTLEqqeyp+xT/vvFa16Fxg6ct3H1Ee4J3
         mnwUklQCk38L8/62/RRvs4bk7PkX+T3AyUt/8Elq8AoGaFQstYsQC7cEp//Pc+InrQ
         Y66UA4qjId6fujPpqSWyqiQC+8UFGgD8QRbWOoAznSSeDu/D/gfI8D740JfM6r40tg
         jUp3LNTPp7zBg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/7] mips: ralink: convert to CONFIG_COMMON_CLK
Date:   Mon, 31 May 2021 19:34:25 +0200
Message-Id: <20210531173429.2467403-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531173429.2467403-1-arnd@kernel.org>
References: <20210531173429.2467403-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

ralink only has a very trivial clock implementation, with everything
being fixed clocks.

Convert it to CONFIG_COMMON_CLK to reduce the number of platforms
that rely on legacy clocks. Of course, the clocks really should
be read from the device tree instead, but this is a step into that
direction.

This adds about 50KB to the kernel image size, which is an unfortunate
increase, but not as bad as I had feared:

   text	   data	    bss	    dec	    hex	filename
3778560	1582216	  92256	5453032	 5334e8	vmlinux-vocore-before
3822148	1601192	  92304	5515644	 54297c	vmlinux-vocore-after
3870226	1644468	 200192	5714886	 5733c6	vmlinux-rt305x-before
3916727	1668404	 200240	5785371	 58471b	vmlinux-rt305x-after

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig        |  1 +
 arch/mips/ralink/Kconfig |  5 ----
 arch/mips/ralink/clk.c   | 64 ++--------------------------------------
 3 files changed, 4 insertions(+), 66 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 5dbc60adb2f0..8fe6b30de7dd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -630,6 +630,7 @@ config MACH_NINTENDO64
 config RALINK
 	bool "Ralink based machines"
 	select CEVT_R4K
+	select COMMON_CLK
 	select CSRC_R4K
 	select BOOT_RAW
 	select DMA_NONCOHERENT
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index ec4daa63c5e3..c800bf5559b5 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -28,22 +28,18 @@ choice
 		bool "RT288x"
 		select MIPS_AUTO_PFN_OFFSET
 		select MIPS_L1_CACHE_SHIFT_4
-		select HAVE_LEGACY_CLK
 		select HAVE_PCI
 
 	config SOC_RT305X
 		bool "RT305x"
-		select HAVE_LEGACY_CLK
 
 	config SOC_RT3883
 		bool "RT3883"
-		select HAVE_LEGACY_CLK
 		select HAVE_PCI
 
 	config SOC_MT7620
 		bool "MT7620/8"
 		select CPU_MIPSR2_IRQ_VI
-		select HAVE_LEGACY_CLK
 		select HAVE_PCI
 
 	config SOC_MT7621
@@ -54,7 +50,6 @@ choice
 		select SYS_SUPPORTS_MIPS_CPS
 		select SYS_SUPPORTS_HIGHMEM
 		select MIPS_GIC
-		select COMMON_CLK
 		select CLKSRC_MIPS_GIC
 		select HAVE_PCI if PCI_MT7621
 		select SOC_BUS
diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
index f0bcb1051c30..5b02bb7e0829 100644
--- a/arch/mips/ralink/clk.c
+++ b/arch/mips/ralink/clk.c
@@ -10,79 +10,21 @@
 #include <linux/export.h>
 #include <linux/clkdev.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 
 #include <asm/time.h>
 
 #include "common.h"
 
-struct clk {
-	struct clk_lookup cl;
-	unsigned long rate;
-};
-
 void ralink_clk_add(const char *dev, unsigned long rate)
 {
-	struct clk *clk = kzalloc(sizeof(struct clk), GFP_KERNEL);
+	struct clk *clk = clk_register_fixed_rate(NULL, dev, NULL, 0, rate);
 
 	if (!clk)
 		panic("failed to add clock");
 
-	clk->cl.dev_id = dev;
-	clk->cl.clk = clk;
-
-	clk->rate = rate;
-
-	clkdev_add(&clk->cl);
-}
-
-/*
- * Linux clock API
- */
-int clk_enable(struct clk *clk)
-{
-	return 0;
-}
-EXPORT_SYMBOL_GPL(clk_enable);
-
-void clk_disable(struct clk *clk)
-{
-}
-EXPORT_SYMBOL_GPL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	if (!clk)
-		return 0;
-
-	return clk->rate;
-}
-EXPORT_SYMBOL_GPL(clk_get_rate);
-
-int clk_set_rate(struct clk *clk, unsigned long rate)
-{
-	return -1;
-}
-EXPORT_SYMBOL_GPL(clk_set_rate);
-
-long clk_round_rate(struct clk *clk, unsigned long rate)
-{
-	return -1;
-}
-EXPORT_SYMBOL_GPL(clk_round_rate);
-
-int clk_set_parent(struct clk *clk, struct clk *parent)
-{
-	WARN_ON(clk);
-	return -1;
-}
-EXPORT_SYMBOL_GPL(clk_set_parent);
-
-struct clk *clk_get_parent(struct clk *clk)
-{
-	WARN_ON(clk);
-	return NULL;
+	clkdev_create(clk, NULL, "%s", dev);
 }
-EXPORT_SYMBOL_GPL(clk_get_parent);
 
 void __init plat_time_init(void)
 {
-- 
2.29.2

