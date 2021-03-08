Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534DFC4332B
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 18:24:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 319B2652AC
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 18:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhCHSYJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Mar 2021 13:24:09 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36039 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhCHSXz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Mar 2021 13:23:55 -0500
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lJKXq-0004Cq-CI
        for linux-clk@vger.kernel.org; Mon, 08 Mar 2021 18:23:54 +0000
Received: by mail-wr1-f72.google.com with SMTP id h5so5175878wrr.17
        for <linux-clk@vger.kernel.org>; Mon, 08 Mar 2021 10:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PzhmjnnDaBAM6gz8zOmUYx1vx5KSpg9Ds20f5pFImQQ=;
        b=sUk9Fot41iUFL/zH1RPXFw7kqnLebJH6hspShxOyRkIw7ON9cuVdFZQK4mWrMpU93h
         5KEenuoJMZkhR4A96SkIldUY46uD1Zc6qm3MpbAtji/jzPAXnSIKofUanm6DgHb7vG2/
         G1d5PLV74XOtu6lIct2dYw+LgqPDZal/3UH/yxTU8bxgm0SawVO9fxoQBxfquCoccnCl
         CQH3VnjgnDhP24gBip26DWwAGlDW9aNRPycq/w+lJiJHKY3tWMDp+1R7yp1JBluqgPvL
         lZItvxAMJjYmvOYmQOI9W866UXRYt/zfDcyyakMHuMKhzTF2lskjkBQnacTJ01UsQnU6
         fJUQ==
X-Gm-Message-State: AOAM532njlBDj5Eyo3X69Af+LZ/KcLHC+eh0qGb3bgFp0pAUeNdeoDcR
        wFFT9WQE3CHpdam71v4AkdQ+TPyEuDlxC6VxOVaO59E2s6KQlY37l8XfPu46Ia2LpsOJmDIeCPN
        6EMQbT8sBVZrtYL/jlQHDpdYKHYvqMexvtyhCug==
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr23826949wrw.95.1615227834162;
        Mon, 08 Mar 2021 10:23:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6by2i2b5cJeyKFWf+JvioS4ol4PlyvgX86myQjOefknz3S/le/EI3WF/MNfYVqwAjsZrJTg==
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr23826942wrw.95.1615227834053;
        Mon, 08 Mar 2021 10:23:54 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id f22sm158207wmb.31.2021.03.08.10.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:23:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 3/3] clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks
Date:   Mon,  8 Mar 2021 19:23:39 +0100
Message-Id: <20210308182339.379775-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308182339.379775-1-krzysztof.kozlowski@canonical.com>
References: <20210308182339.379775-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Stratix 10 / Agilex / N5X clocks do not use anything other than OF
or COMMON_CLK so they should be compile testable on most of the
platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/Makefile        |  5 +----
 drivers/clk/socfpga/Kconfig | 22 ++++++++++++++++------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 12e46b12e587..9b582b3fca34 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -104,10 +104,7 @@ obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
-obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
-obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
-obj-$(CONFIG_ARCH_N5X)			+= socfpga/
-obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
+obj-y					+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index 4922cc35f4cc..de7b3137e215 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -1,13 +1,23 @@
 # SPDX-License-Identifier: GPL-2.0
+config COMMON_CLK_SOCFPGA
+	bool "Intel SoCFPGA family clock support" if COMPILE_TEST
+	depends on ARCH_AGILEX || ARCH_N5X || ARCH_SOCFPGA || ARCH_STRATIX10 || COMPILE_TEST
+	default y if ARCH_AGILEX || ARCH_N5X || ARCH_SOCFPGA || ARCH_STRATIX10
+	help
+	  Support for the clock controllers present on Intel SoCFPGA and eASIC
+          devices like Stratix 10, Agilex and N5X eASIC.
+
+if COMMON_CLK_SOCFPGA
+
 config COMMON_CLK_STRATIX10
-	bool
-	# Intel Stratix / Agilex / N5X clock controller support
+	bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST
 	default y if ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
-	depends on ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10
+	depends on ARCH_AGILEX || ARCH_N5X || ARCH_STRATIX10 || COMPILE_TEST
 
 config COMMON_CLK_AGILEX
-	bool
-	# Intel Agilex / N5X clock controller support
+	bool "Intel Agilex / N5X clock controller support" if COMPILE_TEST
 	default y if ARCH_AGILEX || ARCH_N5X
-	depends on ARCH_AGILEX || ARCH_N5X
+	depends on ARCH_AGILEX || ARCH_N5X || COMPILE_TEST
 	select COMMON_CLK_STRATIX10
+
+endif # COMMON_CLK_SOCFPGA
-- 
2.25.1

