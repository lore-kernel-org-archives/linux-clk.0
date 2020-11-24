Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0293C2D0E4
	for <linux-clk@archiver.kernel.org>; Tue, 24 Nov 2020 12:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D1D020708
	for <linux-clk@archiver.kernel.org>; Tue, 24 Nov 2020 12:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YhN2yWhb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yrUzkSb8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733139AbgKXMRo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Nov 2020 07:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729172AbgKXMRn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Nov 2020 07:17:43 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BDDC0613D6
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2020 04:17:43 -0800 (PST)
Date:   Tue, 24 Nov 2020 13:17:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606220261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=kTDmb1nq5DsvYQtwEl53F/9vZGifeG6mz+DsJxGUu+E=;
        b=YhN2yWhbwvzUGKovyNANDYlW+ka3jffakficckcHO+I4LLXn2KZYQkoiLZwzuZ1Gp2L8C9
        l9CuA4sBLQw7a0fL/IzhRW9bid1EdCn4fn1XUg+6NJ1YgzUqmeo/jwzoijJWECggsW/yg4
        B3N7YbVs5Tqk2rU47cv+J3a7lBSN8xlm+n875bszbd7FNCl77Ze3lKYL4mGgF2s8Xw3jer
        Q8x1hntI3qhJik8kKLNuILrQLceneYugZSCwimc8FgLDjp9AWiRhXAQbjW4EhOA6HSq2k/
        eBYg6xcnmlj4pCsBY0uPc++kkmoEkZWD3L/+P5CtwTxEH3fCX3QIG6aVUmSWLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606220261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=kTDmb1nq5DsvYQtwEl53F/9vZGifeG6mz+DsJxGUu+E=;
        b=yrUzkSb8WpJMxXjPjQOJIHsVm9yqrLRUvlkyVQfMkpF+cWw9wmCHSbn10kYiHpIcVAGhN5
        WzHA64TKvssixRCA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [RFC PATCH] clk: imx8qxp: Unbreak auto module building for
 MXC_CLK_SCU
Message-ID: <20201124121740.ytag7rm53umi2qvm@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Automatic moudule building is broken by adding module support to
i.MX8QXP clock driver. It can be tested by ARM defconfig +
CONFIG_IMX_MBOX=m and CONFIG_MXC_CLK_SCU=m.

The compile breaks because the modules and source files are mixed.
After fixing that, the build breaks because the SCU driver has no
license or symbols, which are required by the CLK_IMX8QXP driver, are
not properly exported.

The following patch is against -rc5:

Compile module clk-imx-scu.o which contains of clk-scu.o clk-lpcg-scu.o
if CONFIG_MXC_CLK_SCU is enabled.
Compile modules clk-imx8qxp.o and clk-imx8qxp-lpcg.o if
CONFIG_CLK_IMX8QXP is enabled.
Add EXPORT_SYMBOL_GPL() to functions which fail to resolve once
CONFIG_CLK_IMX8QXP is enabled as module.
Add License GPL to clk-scu.c.

In -next it breaks additionally because device_is_bound() is not made available
to modules.
Any suggestions? Should the original commit be revoked?

Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

 drivers/clk/imx/Makefile       | 6 +++---
 drivers/clk/imx/clk-lpcg-scu.c | 1 +
 drivers/clk/imx/clk-scu.c      | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index dd6a737d060b4..b8bf9460c91d7 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -26,9 +26,9 @@ obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
 obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
-obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
-clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o
-clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
+obj-$(CONFIG_MXC_CLK_SCU)	+= clk-imx-scu.o
+clk-imx-scu-y			:= clk-scu.o clk-lpcg-scu.o
+obj-$(CONFIG_CLK_IMX8QXP)	+= clk-imx8qxp.o clk-imx8qxp-lpcg.o
 
 obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
 obj-$(CONFIG_CLK_IMX25)  += clk-imx25.o
diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
index 1f0e44f921aee..336dce43da82d 100644
--- a/drivers/clk/imx/clk-lpcg-scu.c
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -115,3 +115,4 @@ struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
 
 	return hw;
 }
+EXPORT_SYMBOL_GPL(imx_clk_lpcg_scu);
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b8b2072742a56..026a33606ae53 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -9,6 +9,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/module.h>
 
 #include "clk-scu.h"
 
@@ -132,6 +133,7 @@ int imx_clk_scu_init(void)
 {
 	return imx_scu_get_handle(&ccm_ipc_handle);
 }
+EXPORT_SYMBOL_GPL(imx_clk_scu_init);
 
 /*
  * clk_scu_recalc_rate - Get clock rate for a SCU clock
@@ -387,3 +389,5 @@ struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 
 	return hw;
 }
+EXPORT_SYMBOL_GPL(__imx_clk_scu);
+MODULE_LICENSE("GPL");
-- 
2.29.2

