Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DD4C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Feb 2021 11:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7653A64E04
	for <linux-clk@archiver.kernel.org>; Mon, 15 Feb 2021 11:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhBOL6K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Feb 2021 06:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhBOL6H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Feb 2021 06:58:07 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194DEC061574
        for <linux-clk@vger.kernel.org>; Mon, 15 Feb 2021 03:57:27 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id o38so4066399pgm.9
        for <linux-clk@vger.kernel.org>; Mon, 15 Feb 2021 03:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wtOFBAROWn4tRAGWU26y/eJJ/kwxNC4QA5jAPbFGV7g=;
        b=wlHupBR1vtKwm24/995UNv8lpusZKFFBBgk6UJmyW9yZoohl0GKOvEJMd6AQZBaAMT
         l7A94hvMo+jrQr753WX/IQbq50M36674RcdQ16U8aCORaUhajyzppg1jXt80Ltvz8lpD
         I5C8f4TQgvUsKynlv3JMRKYRUiQG3o0SAguTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wtOFBAROWn4tRAGWU26y/eJJ/kwxNC4QA5jAPbFGV7g=;
        b=JsEA4D/vuW7sPct+jJi67fYOCMSkJl0NSpb188oCDIv/za9XcS31fcx25Qc6ifnAKV
         heRYGdoeNmK0lGPfoDHsVxkKacPhhm/NZs2F3BvmrS2fJ9AVr9Lu99tyg4tYyTgyIYoC
         hbKITYVW7Ek0/FZ3rVgsV8Wj4xk4/+0hYPfIRNR0BZFVNLNF7i6vE6Zk9NLvvpT7d2wu
         4U6DQHbfe0kXlbC7FZNJqI2xGy/mm9WPnDhcE67Ubc8j02/wqFcEq1pHiuPxlwXURha/
         839Tyb7pyiKmKVbAWpshtKNHvHaxTwQbXHOfrZVQtOx1MzCRjmdLDflXQq5ZdAlVtzbS
         hYdw==
X-Gm-Message-State: AOAM5304qoiow1INYvRVB6unX1jH4ZQavWFH0DMWbV6C9hQDIVI0FXaG
        hu5tYATdB5+lmoE1yGlTaCWj/Agn0rYcUg==
X-Google-Smtp-Source: ABdhPJz/yAzGJGWuL52vFZHe7Ni8abCUE2hGZsqISk9nlVj//hWIJ9T8D0L6v6AOWZqWKDjhxzqI+Q==
X-Received: by 2002:a62:640d:0:b029:1c0:3a5c:f0f7 with SMTP id y13-20020a62640d0000b02901c03a5cf0f7mr15223480pfb.12.1613390246286;
        Mon, 15 Feb 2021 03:57:26 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id a5sm17929504pgl.41.2021.02.15.03.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 03:57:25 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org
Cc:     Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/2] clk: mstar: Allow MStar clk drivers to be compile tested
Date:   Mon, 15 Feb 2021 20:57:09 +0900
Message-Id: <20210215115710.3762276-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow COMPILE_TEST to also build the MStar clk drivers
instead of only building them when ARCH_MSTARV7 is selected.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Suggested-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/Makefile      | 2 +-
 drivers/clk/mstar/Kconfig | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 7fed7e5944cd..e5e23a44fbe9 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -95,7 +95,7 @@ obj-$(CONFIG_MACH_PIC32)		+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_ARCH_MMP)			+= mmp/
 endif
-obj-$(CONFIG_ARCH_MSTARV7)		+= mstar/
+obj-y					+= mstar/
 obj-y					+= mvebu/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
 obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
diff --git a/drivers/clk/mstar/Kconfig b/drivers/clk/mstar/Kconfig
index 23765edde3af..eab8f7dcaa90 100644
--- a/drivers/clk/mstar/Kconfig
+++ b/drivers/clk/mstar/Kconfig
@@ -1,5 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config MSTAR_MSC313_MPLL
-	bool
+	bool "MStar MPLL driver"
+	depends on ARCH_MSTARV7 || COMPILE_TEST
+	default ARCH_MSTARV7
 	select REGMAP
 	select REGMAP_MMIO
+	help
+	  Support for the MPLL PLL and dividers block present on
+	  MStar/Sigmastar SoCs.
-- 
2.30.0.rc2

