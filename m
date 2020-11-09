Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AB9C2D0A3
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 23:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 205EC2074F
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 23:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="co8pXfkp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730885AbgKIXgY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Nov 2020 18:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729706AbgKIXgY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Nov 2020 18:36:24 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72512C0613CF
        for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2020 15:36:24 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q5so6690114pfk.6
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2020 15:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxjxsv76g+03tpq2JzV/lTjh7qUYeMNyElJ5DnUb+S8=;
        b=co8pXfkpV4SEg6BjhKzNpVUZFMrTgrZKCE3gPh+PN/WQlZQWNzlhM89uMDAsenWczr
         z/smo0kguCTowIlhi+D2gUck8vY6ivj9L+rsA+cj0Sr2RymUb5XImvVcxlw4UrSaRd/k
         IsEGCvsevyd0uR7RD7JU0y0aGZmqyVcJmUn4RElKyD0R1Vczr4lPcZM1dTpoeTh7Iczl
         gPWc+QEHdvVCzQUTsoEC7iWKSjJz3s3PC0F+f+Srk5bpyKC81OkfS2+S5zvK0t/OrLBN
         XlIv82+SjvLv4riX6zX7mlMtq1c0Oc5tWMpKQOolNxtT0PCJ7TivVjccwVt3c78QVJCT
         hYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxjxsv76g+03tpq2JzV/lTjh7qUYeMNyElJ5DnUb+S8=;
        b=SxMKKM+Lxb3gSMKZ1fmqgPtoG2jC7/5SH+UGdhSdtUyrNerdLD77Fn9pkzFHYvB1bg
         pmC2iUg6obSqKrzS+e+WErjS0u8wnYhZPVUsMeU58IhaMtmMGquwVsftLrgjCLSahYJ7
         Kyo+LqtOPevEUKknZjaAS2wQoVGIYt7xYot2fxIHw43Rh4hEnjfc7aEQea+iG1hcBE80
         zBUoGT65O8uIdrxWQHn8+Gp82ysgjAF8YK7dyNnhilo85jg2Fjd2U2l6vgXnEzqe8osQ
         tCgaaikbo51JIIAIE/W5ZKQrrdFTPoQ2pN36ETIDVgHzJYJGFQV3HCUi9qGAQXMX1WlF
         A6dw==
X-Gm-Message-State: AOAM532Z5hcqSAC/CpZwZYYrtu65nYUibWbyB2tU5JJdmn9tX3wu7B+y
        HsOP/0b7wkSx/kHVQWAINrDr2Sj7wo73Rh8m0hQ=
X-Google-Smtp-Source: ABdhPJwRr2PxJEQRLjlAxMKf0qKIDg0L2X3e9Q9lxagQLrOKeACphnrNKBKkWX6tqKDc/6ex0b4M6w==
X-Received: by 2002:a63:7847:: with SMTP id t68mr9880039pgc.422.1604964983868;
        Mon, 09 Nov 2020 15:36:23 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id e6sm12373927pfn.190.2020.11.09.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 15:36:23 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>,
        linux-clk@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: meson: enable building as modules
Date:   Mon,  9 Nov 2020 15:36:22 -0800
Message-Id: <20201109233622.23598-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make it possible to build all clk drivers as modules, but default
remains built-in.

No functional changes.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Depends on series adding new API to get clk consumer from clk_hw:
https://lore.kernel.org/linux-amlogic/20201021162147.563655-1-jbrunet@baylibre.com/

 drivers/clk/meson/Kconfig       | 7 ++++---
 drivers/clk/meson/axg-aoclk.c   | 5 ++++-
 drivers/clk/meson/axg.c         | 5 ++++-
 drivers/clk/meson/g12a-aoclk.c  | 5 ++++-
 drivers/clk/meson/g12a.c        | 5 ++++-
 drivers/clk/meson/gxbb-aoclk.c  | 5 ++++-
 drivers/clk/meson/gxbb.c        | 5 ++++-
 drivers/clk/meson/meson-aoclk.c | 4 ++++
 drivers/clk/meson/meson-eeclk.c | 3 +++
 9 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 034da203e8e0..fc002c155bc3 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -58,7 +58,7 @@ config COMMON_CLK_MESON8B
 	  want peripherals and CPU frequency scaling to work.
 
 config COMMON_CLK_GXBB
-	bool "GXBB and GXL SoC clock controllers support"
+	tristate "GXBB and GXL SoC clock controllers support"
 	depends on ARM64
 	default y
 	select COMMON_CLK_MESON_REGMAP
@@ -74,7 +74,7 @@ config COMMON_CLK_GXBB
 	  Say Y if you want peripherals and CPU frequency scaling to work.
 
 config COMMON_CLK_AXG
-	bool "AXG SoC clock controllers support"
+	tristate "AXG SoC clock controllers support"
 	depends on ARM64
 	default y
 	select COMMON_CLK_MESON_REGMAP
@@ -100,7 +100,7 @@ config COMMON_CLK_AXG_AUDIO
 	  aka axg, Say Y if you want audio subsystem to work.
 
 config COMMON_CLK_G12A
-	bool "G12 and SM1 SoC clock controllers support"
+	tristate "G12 and SM1 SoC clock controllers support"
 	depends on ARM64
 	default y
 	select COMMON_CLK_MESON_REGMAP
@@ -110,6 +110,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_AO_CLKC
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
+	select COMMON_CLK_MESON_VID_PLL_DIV
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index b488b40c9d0e..af6db437bcd8 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include "meson-aoclk.h"
 #include "axg-aoclk.h"
 
@@ -326,6 +327,7 @@ static const struct of_device_id axg_aoclkc_match_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, axg_aoclkc_match_table);
 
 static struct platform_driver axg_aoclkc_driver = {
 	.probe		= meson_aoclkc_probe,
@@ -335,4 +337,5 @@ static struct platform_driver axg_aoclkc_driver = {
 	},
 };
 
-builtin_platform_driver(axg_aoclkc_driver);
+module_platform_driver(axg_aoclkc_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 13fc0006f63d..7ca7ea7345e5 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "clk-regmap.h"
 #include "clk-pll.h"
@@ -1354,6 +1355,7 @@ static const struct of_device_id clkc_match_table[] = {
 	{ .compatible = "amlogic,axg-clkc", .data = &axg_clkc_data },
 	{}
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver axg_driver = {
 	.probe		= meson_eeclkc_probe,
@@ -1363,4 +1365,5 @@ static struct platform_driver axg_driver = {
 	},
 };
 
-builtin_platform_driver(axg_driver);
+module_platform_driver(axg_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 62499563e4f5..b52990e574d2 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include "meson-aoclk.h"
 #include "g12a-aoclk.h"
 
@@ -461,6 +462,7 @@ static const struct of_device_id g12a_aoclkc_match_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, g12a_aoclkc_match_table);
 
 static struct platform_driver g12a_aoclkc_driver = {
 	.probe		= meson_aoclkc_probe,
@@ -470,4 +472,5 @@ static struct platform_driver g12a_aoclkc_driver = {
 	},
 };
 
-builtin_platform_driver(g12a_aoclkc_driver);
+module_platform_driver(g12a_aoclkc_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index b814d44917a5..66094bfec2cc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -15,6 +15,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/module.h>
 
 #include "clk-mpll.h"
 #include "clk-pll.h"
@@ -5370,6 +5371,7 @@ static const struct of_device_id clkc_match_table[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver g12a_driver = {
 	.probe		= meson_g12a_probe,
@@ -5379,4 +5381,5 @@ static struct platform_driver g12a_driver = {
 	},
 };
 
-builtin_platform_driver(g12a_driver);
+module_platform_driver(g12a_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index e940861a396b..fce95cf89836 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -5,6 +5,7 @@
  */
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include "meson-aoclk.h"
 #include "gxbb-aoclk.h"
 
@@ -287,6 +288,7 @@ static const struct of_device_id gxbb_aoclkc_match_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, gxbb_aoclkc_match_table);
 
 static struct platform_driver gxbb_aoclkc_driver = {
 	.probe		= meson_aoclkc_probe,
@@ -295,4 +297,5 @@ static struct platform_driver gxbb_aoclkc_driver = {
 		.of_match_table = gxbb_aoclkc_match_table,
 	},
 };
-builtin_platform_driver(gxbb_aoclkc_driver);
+module_platform_driver(gxbb_aoclkc_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 0a68af6eec3d..d6eed760327d 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "gxbb.h"
 #include "clk-regmap.h"
@@ -3519,6 +3520,7 @@ static const struct of_device_id clkc_match_table[] = {
 	{ .compatible = "amlogic,gxl-clkc", .data = &gxl_clkc_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver gxbb_driver = {
 	.probe		= meson_eeclkc_probe,
@@ -3528,4 +3530,5 @@ static struct platform_driver gxbb_driver = {
 	},
 };
 
-builtin_platform_driver(gxbb_driver);
+module_platform_driver(gxbb_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index bf8bea675d24..f0858fe789bc 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -14,6 +14,8 @@
 #include <linux/reset-controller.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
+#include <linux/module.h>
+
 #include <linux/slab.h>
 #include "meson-aoclk.h"
 
@@ -84,3 +86,5 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 		(void *) data->hw_data);
 }
+EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index a7cb1e7aedc4..8d5a5dab955a 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+#include <linux/module.h>
 
 #include "clk-regmap.h"
 #include "meson-eeclk.h"
@@ -54,3 +55,5 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 					   data->hw_onecell_data);
 }
+EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

