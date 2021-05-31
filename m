Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99564C4708F
	for <linux-clk@archiver.kernel.org>; Mon, 31 May 2021 17:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CA6561186
	for <linux-clk@archiver.kernel.org>; Mon, 31 May 2021 17:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhEaRh7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 May 2021 13:37:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:42572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231918AbhEaRhh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 31 May 2021 13:37:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2ECE61108;
        Mon, 31 May 2021 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622482557;
        bh=CjtccExGdEjqd7ZBav8OsgNzxL/PiG1ahhPgaXxezeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mn+jpNvupUAR3/SJpCl02TTfc4oLu7jA28EbBAv0ju4+B5e5wgceZBeupw2v0zibR
         i3D+OPKc/MQy3sAbkz2DjLwMA+tdOPvuR+ifeApltjTeo/3IOsOM/7or0VuVDUIiQn
         15f8iBnkzpKxRyCMjq4rWEemwMr0PdI4cnJe3QePNcdSvMqUEj+HxFwC8zZ/LgqZAE
         rpapUCOuHajKPgtvl7N+Mlr04dp79zNYhTTIk5QwqXuv5jEEQw5z+ZZdcZ7JiGlePH
         /R5JU+Qv8hFy3qIFGzBXHVCZqMgwohtYYNSFPlF9Ojys9g4eakgyy7rh1VKKBo4lq+
         t9AczSDWbINrw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/7] mips: ar7: convert to clkdev_lookup
Date:   Mon, 31 May 2021 19:34:23 +0200
Message-Id: <20210531173429.2467403-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531173429.2467403-1-arnd@kernel.org>
References: <20210531173429.2467403-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

ar7 is one of only two platforms that provide the clock interface but
implement a custom version of the clkdev_lookup code.

Change this to use the generic version instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig     |  1 +
 arch/mips/ar7/clock.c | 32 ++++++++++++--------------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed51970c08e7..1cc03a7652a9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -215,6 +215,7 @@ config AR7
 	select SYS_SUPPORTS_ZBOOT_UART16550
 	select GPIOLIB
 	select VLYNQ
+	select CLKDEV_LOOKUP
 	select HAVE_LEGACY_CLK
 	help
 	  Support for the Texas Instruments AR7 System-on-a-Chip
diff --git a/arch/mips/ar7/clock.c b/arch/mips/ar7/clock.c
index 95def949c971..c614f254f370 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2009 Florian Fainelli <florian@openwrt.org>
  */
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -14,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/clk.h>
+#include <linux/clkdev.h>
 
 #include <asm/addrspace.h>
 #include <asm/mach-ar7/ar7.h>
@@ -424,27 +426,15 @@ unsigned long clk_get_rate(struct clk *clk)
 }
 EXPORT_SYMBOL(clk_get_rate);
 
-struct clk *clk_get(struct device *dev, const char *id)
-{
-	if (!strcmp(id, "bus"))
-		return &bus_clk;
+static struct clk_lookup ar7_clkdev_table[] = {
+	CLKDEV_INIT(NULL, "bus", &bus_clk),
 	/* cpmac and vbus share the same rate */
-	if (!strcmp(id, "cpmac"))
-		return &vbus_clk;
-	if (!strcmp(id, "cpu"))
-		return &cpu_clk;
-	if (!strcmp(id, "dsp"))
-		return &dsp_clk;
-	if (!strcmp(id, "vbus"))
-		return &vbus_clk;
-	return ERR_PTR(-ENOENT);
-}
-EXPORT_SYMBOL(clk_get);
-
-void clk_put(struct clk *clk)
-{
-}
-EXPORT_SYMBOL(clk_put);
+	CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
+	CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
+	CLKDEV_INIT(NULL, "cpu", &cpu_clk),
+	CLKDEV_INIT(NULL, "dsp", &dsp_clk),
+	CLKDEV_INIT(NULL, "vbus", &vbus_clk),
+};
 
 void __init ar7_init_clocks(void)
 {
@@ -462,6 +452,8 @@ void __init ar7_init_clocks(void)
 	}
 	/* adjust vbus clock rate */
 	vbus_clk.rate = bus_clk.rate / 2;
+
+	clkdev_add_table(ar7_clkdev_table, ARRAY_SIZE(ar7_clkdev_table));
 }
 
 /* dummy functions, should not be called */
-- 
2.29.2

