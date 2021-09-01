Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8794C432BE
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 16:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A29F261059
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 16:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhIAQJc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:09:32 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:46364 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242527AbhIAQJc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Sep 2021 12:09:32 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C0D692255B;
        Wed,  1 Sep 2021 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1630512514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=VvuVJN98m5AXxURIg422NWPf2DVo5XBVcLHNwb3tcqs=;
        b=Dp6Gy+7S1bysEY1kiTmVZX6cNlXi02iyL27Dtpt6m90mhpGwLYLG2I/zQ3VoGjeXDPehhN
        3GYXh6wCacNjw6VUcJlDFnkbnV2en6pfaPgHuha9N3FLFOwBtcgni/onkW6u72efakQgFr
        1fs6qDT1o4KHpCTDHXs2Td+ziLP8uXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1630512514;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=VvuVJN98m5AXxURIg422NWPf2DVo5XBVcLHNwb3tcqs=;
        b=w6YqQnLXg3xFWSqoy60XtvQkHR/pmqmqMzUFeaB5CVGUE2On7y+S6isfGMNGX7UKWQ4z1m
        FgfMvsHwXrQFEECg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7895A13AE1;
        Wed,  1 Sep 2021 16:08:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id KywdG4KlL2G/DAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Wed, 01 Sep 2021 16:08:34 +0000
Date:   Wed, 1 Sep 2021 18:08:33 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-clk@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/2] clk: versatile: Rename ICST to CLK_ICST
Message-ID: <20210901180833.4558932d@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For consistency, prefix the ICST config option with CLK as all other
clock source drivers have.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
---
 arch/arm/mach-integrator/Kconfig |    2 +-
 arch/arm/mach-realview/Kconfig   |    2 +-
 arch/arm/mach-versatile/Kconfig  |    2 +-
 arch/arm/mach-vexpress/Kconfig   |    2 +-
 drivers/clk/versatile/Kconfig    |    2 +-
 drivers/clk/versatile/Makefile   |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

--- linux-5.14.orig/arch/arm/mach-integrator/Kconfig	2021-09-01 17:59:24.942741599 +0200
+++ linux-5.14/arch/arm/mach-integrator/Kconfig	2021-09-01 18:00:06.681274791 +0200
@@ -6,7 +6,7 @@ menuconfig ARCH_INTEGRATOR
 	select CMA
 	select DMA_CMA
 	select HAVE_TCM
-	select ICST
+	select CLK_ICST
 	select MFD_SYSCON
 	select PLAT_VERSATILE
 	select POWER_RESET
--- linux-5.14.orig/arch/arm/mach-realview/Kconfig	2021-09-01 17:59:24.942741599 +0200
+++ linux-5.14/arch/arm/mach-realview/Kconfig	2021-09-01 18:00:06.681274791 +0200
@@ -11,7 +11,7 @@ menuconfig ARCH_REALVIEW
 	select HAVE_ARM_TWD if SMP
 	select HAVE_PATA_PLATFORM
 	select HAVE_TCM
-	select ICST
+	select CLK_ICST
 	select MACH_REALVIEW_EB if ARCH_MULTI_V5
 	select MFD_SYSCON
 	select PLAT_VERSATILE
--- linux-5.14.orig/arch/arm/mach-versatile/Kconfig	2021-09-01 17:59:24.942741599 +0200
+++ linux-5.14/arch/arm/mach-versatile/Kconfig	2021-09-01 18:00:06.681274791 +0200
@@ -7,7 +7,7 @@ config ARCH_VERSATILE
 	select ARM_VIC
 	select CLKSRC_VERSATILE
 	select CPU_ARM926T
-	select ICST
+	select CLK_ICST
 	select MFD_SYSCON
 	select PLAT_VERSATILE
 	select POWER_RESET
--- linux-5.14.orig/arch/arm/mach-vexpress/Kconfig	2021-09-01 17:59:24.942741599 +0200
+++ linux-5.14/arch/arm/mach-vexpress/Kconfig	2021-09-01 18:00:06.681274791 +0200
@@ -11,7 +11,7 @@ menuconfig ARCH_VEXPRESS
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select HAVE_PATA_PLATFORM
-	select ICST
+	select CLK_ICST
 	select NO_IOPORT_MAP
 	select PLAT_VERSATILE
 	select POWER_RESET
--- linux-5.14.orig/drivers/clk/versatile/Kconfig	2021-09-01 17:59:24.942741599 +0200
+++ linux-5.14/drivers/clk/versatile/Kconfig	2021-09-01 18:05:25.939393462 +0200
@@ -3,7 +3,7 @@
 menu "Clock driver for ARM Reference designs"
 	depends on HAS_IOMEM
 
-config ICST
+config CLK_ICST
 	bool "Clock driver for ARM Reference designs ICST"
 	select REGMAP_MMIO
 	help
--- linux-5.14.orig/drivers/clk/versatile/Makefile	2021-08-30 00:04:50.000000000 +0200
+++ linux-5.14/drivers/clk/versatile/Makefile	2021-09-01 18:07:46.446233983 +0200
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Makefile for Versatile-specific clocks
-obj-$(CONFIG_ICST)		+= icst.o clk-icst.o clk-versatile.o
+obj-$(CONFIG_CLK_ICST)		+= icst.o clk-icst.o clk-versatile.o
 obj-$(CONFIG_INTEGRATOR_IMPD1)	+= clk-impd1.o
 obj-$(CONFIG_CLK_SP810)		+= clk-sp810.o
 obj-$(CONFIG_CLK_VEXPRESS_OSC)	+= clk-vexpress-osc.o


-- 
Jean Delvare
SUSE L3 Support
