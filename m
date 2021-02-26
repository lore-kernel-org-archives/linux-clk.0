Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE60C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 14:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C55564EF6
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 14:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhBZOP6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Feb 2021 09:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhBZOPn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Feb 2021 09:15:43 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CE3C06178B
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 06:14:18 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id g3so11107401edb.11
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fiQu2oPApg5uagXMeqvolPXEApCItlWJFjBIgQNcT+U=;
        b=J5pKGpp119dXassFAQHDedxcYd25QkctzzdK/xuhuJiTm3yxPt1cK8uG+fpwUUdGy+
         IiimOncJrA+KsZtTxqnEaWqkr/ahi005229VXf7F+d02ok7m5USrYAvviwADS1Fxzuay
         2l1WLWwav6JcD1uEa0BWutnySL0uDe5xzN7BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fiQu2oPApg5uagXMeqvolPXEApCItlWJFjBIgQNcT+U=;
        b=dmBKtmn05Ig+LlwZTPMwh82X7TRP56AN7ocKvcNbc7gDc2VNJeGFeqoJu4TzPNr5/0
         a8/3AjWhRd6oM885rCllsycvUcoS9VJwFI6uBzdx0oxrFEUciElKA1qxQG9xy5+FHaoq
         Mum9JDumW85HsJ2AGs9YO558Y4IAx/dBn24qJPC/jU1yFx1ryu2H9Uqz51w6P1TU1Nuf
         KZgPV6ol8Yqvytjw5klINU1dR1Bjv1Aa//pqS3SjVr5pTeI0kCc411AxRUGJlL9te7o7
         QoKSXhNFAwY8e1glBcWLeMQ5NAmo2texNASd24/V5ysBoIEA0F2PBQgKdZhluXk09BIt
         1woQ==
X-Gm-Message-State: AOAM531/AzU2gPfOVkQkQ92DdsVst8lWTceJ5DUoYh5Zrnc5gH6ldFGq
        j/0IjDpY36KX0awnsGu4RtJU2Q==
X-Google-Smtp-Source: ABdhPJw/Q9UFfy0SlSake+cTOwjAruZIS7wv4RgEF5dEECeCFkfD0F584h7BRA9fzQUyQlAlUYBC7w==
X-Received: by 2002:aa7:d451:: with SMTP id q17mr3483756edr.381.1614348856948;
        Fri, 26 Feb 2021 06:14:16 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id g3sm5316838ejz.91.2021.02.26.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:14:16 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 2/2] drivers: misc: add ripple counter driver
Date:   Fri, 26 Feb 2021 15:14:11 +0100
Message-Id: <20210226141411.2517368-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The only purpose of this driver is to serve as a consumer of the input
clock, to prevent it from being disabled by clk_disable_unused().

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/misc/Kconfig      |  7 +++++++
 drivers/misc/Makefile     |  1 +
 drivers/misc/ripple-ctr.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 drivers/misc/ripple-ctr.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index f532c59bb59b..44b0b6ce42df 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -445,6 +445,13 @@ config HISI_HIKEY_USB
 	  switching between the dual-role USB-C port and the USB-A host ports
 	  using only one USB controller.
 
+config RIPPLE_CTR
+	tristate "Trivial ripple counter driver"
+	help
+	  This provides a stub driver for a ripple counter, whose
+	  only purpose is to request and enable the clock source
+	  driving the counter.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 99b6f15a3c70..d560163068a9 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_HABANA_AI)		+= habanalabs/
 obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
+obj-$(CONFIG_RIPPLE_CTR)	+= ripple-ctr.o
diff --git a/drivers/misc/ripple-ctr.c b/drivers/misc/ripple-ctr.c
new file mode 100644
index 000000000000..f086eaf335df
--- /dev/null
+++ b/drivers/misc/ripple-ctr.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static int ripple_ctr_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	return clk_prepare_enable(clk);
+}
+
+static const struct of_device_id ripple_ctr_ids[] = {
+	{ .compatible = "linux,ripple-counter", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ripple_ctr_ids);
+
+static struct platform_driver ripple_ctr_driver = {
+	.driver	= {
+		.name		= "ripple-counter",
+		.of_match_table	= ripple_ctr_ids,
+	},
+	.probe	= ripple_ctr_probe,
+};
+module_platform_driver(ripple_ctr_driver);
-- 
2.29.2

