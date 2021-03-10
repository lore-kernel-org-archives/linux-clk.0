Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AE3C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 08:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1632964FEF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 08:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhCJImj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Mar 2021 03:42:39 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41322 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhCJImY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Mar 2021 03:42:24 -0500
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lJuMn-0003kL-3Q
        for linux-clk@vger.kernel.org; Wed, 10 Mar 2021 08:38:53 +0000
Received: by mail-wr1-f69.google.com with SMTP id r12so7665608wro.15
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 00:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kWUlJm1h/cD+o2JnnbxCTfx8shPW082WTgFnXFEhHuE=;
        b=nxvCo80t71vvxYoFVhJ9q4FxcL3roXgHh0zRQ3YDgkynwQGTiw7blkiJz7+0Bz+YOK
         kwFLMQKJnOvEAabDKfNE0/luxYnZ8AgM61w8NjEMLTqj1ICFrzDJtcBvD3bKPuNH648M
         8wGlYKVrNv0Kq7YOCwO/+at0Q0IiQh8j/v2Jbw0dtsspmi9maImTybqf8yHDnLyv6Kza
         ecNB/z7ppZ4DQPXvjlzKgyY8oNMQpuN7PO9+llYTR94nMw1kvZg5xZ/1bO3iwtbGnXzc
         e3FejJ4sNLzDQ6svnLiamNUjXpETTiSgRrFtzCcPxNuUmQ/Yvd7JgMPpDtVX+Xa8wGBx
         LZ2A==
X-Gm-Message-State: AOAM533D7ckzbpc6aVg7KGp/3K6L+01IbeSmdEvm+NXGyAHcV69UYO9c
        tHf3HrT70n8IqhvKrvoPz6Sw9hzfr82w8405uxiqo6YTaIgRN6XWuiCN77OVZzdsj0om9bg0rok
        Pj73ZYhAUt/8pDzVM5lppkvB/UxkynobMgKu9zQ==
X-Received: by 2002:a05:6000:191:: with SMTP id p17mr2331468wrx.154.1615365532717;
        Wed, 10 Mar 2021 00:38:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyownReKaTZMWbHVmMbUowjv9w6MYTu6DR7rPD+40lY/aAL94Jldh5Hc3FANVrWuTp5YYmT+A==
X-Received: by 2002:a05:6000:191:: with SMTP id p17mr2331462wrx.154.1615365532595;
        Wed, 10 Mar 2021 00:38:52 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id u20sm32781061wru.6.2021.03.10.00.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:38:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFC v2 5/5] clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks
Date:   Wed, 10 Mar 2021 09:38:39 +0100
Message-Id: <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
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
 drivers/clk/socfpga/Kconfig | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e34457539edf..9b582b3fca34 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -104,10 +104,7 @@ obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
-obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
-obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
-obj-$(CONFIG_ARCH_N5X)			+= socfpga/
-obj-$(CONFIG_ARCH_SOCFPGA64)		+= socfpga/
+obj-y					+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index 834797c68cb2..fb93b7cede27 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -1,6 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
+config COMMON_CLK_SOCFPGA
+	bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_SOCFPGA && !ARCH_SOCFPGA64
+	depends on ARCH_SOCFPGA || ARCH_SOCFPGA64 || COMPILE_TEST
+	default y if ARCH_SOCFPGA || ARCH_SOCFPGA64
+	help
+	  Support for the clock controllers present on Intel SoCFPGA and eASIC
+	  devices like Stratix 10, Agilex and N5X eASIC.
+
+if COMMON_CLK_SOCFPGA
+
 config COMMON_CLK_SOCFPGA64
-	bool
-	# Intel Stratix / Agilex / N5X clock controller support
+	bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST && !ARCH_SOCFPGA64
 	default y if ARCH_SOCFPGA64
-	depends on ARCH_SOCFPGA64
+	depends on ARCH_SOCFPGA64 || COMPILE_TEST
+
+endif # COMMON_CLK_SOCFPGA
-- 
2.25.1

