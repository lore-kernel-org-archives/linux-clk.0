Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BB6C433E9
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 08:36:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EDBC64FFF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 08:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhCJIgL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Mar 2021 03:36:11 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41064 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhCJIgJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Mar 2021 03:36:09 -0500
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lJuK8-0003QI-35
        for linux-clk@vger.kernel.org; Wed, 10 Mar 2021 08:36:08 +0000
Received: by mail-wr1-f71.google.com with SMTP id g5so7612092wrd.22
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 00:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7UxAFifTu8sU7gViKdQC961bKcjK3MvZFPTtwzp8Z94=;
        b=OXPsnZxoXxAzC51eXlRy3gdwgcQxrgy/9vsypgtCSX+WM1eZZbPTWH+pCkp2Th2m6D
         mvU6yM20wjTA2k5kVNuII6sGQKgHiUTGJt98QXPRLVzjmnAoIgFnobWvfsyFzGbKbJHp
         nwxwDX9qb/R5Vj0lIn2D6B+jqXI/z43SDkeQ5hsrGEL6h5UsqXnmCXdvjgQUmxn6b7SQ
         G4fx2wePkj7pjBNAEPuAWyiEEhqYZ0IqxKCQATR6Ntys31xUZSlnzhBUdR22vHk8MhgA
         GAtKNbfks1j8pSwdiyjzRlj8SIHs90x3ZSdpYPlMhtr8cQ+ge6NDhTJFGM/8LNRbto8W
         o/xg==
X-Gm-Message-State: AOAM533a6c/ws3q0KrUh8yqif3u3TR1X7rIJWbdjsZ/5EHE6MliD1JWH
        jZGGP+9YzX33U48nCPpdLaJJbhvGiqHLldDwWktAik9iBap7bIgzVUfEdERQ1hbHtqA06Rhp4O+
        gAgJ8ERWEo5qUhVH8f5nm0DNUL9LN/6NDiXYmBA==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr2229032wme.114.1615365367740;
        Wed, 10 Mar 2021 00:36:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzre2rLibVvflzX2MrQlXqX4OZ1UrJ20LDyRBd9TPGnPB0yloUbIcy/A0jwyJm4iqYiEGZYgQ==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr2229010wme.114.1615365367542;
        Wed, 10 Mar 2021 00:36:07 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id m17sm28675495wrx.92.2021.03.10.00.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:36:07 -0800 (PST)
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
Subject: [RFC v2 1/5] clk: socfpga: allow building N5X clocks with ARCH_N5X
Date:   Wed, 10 Mar 2021 09:33:23 +0100
Message-Id: <20210310083327.480837-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Intel's eASIC N5X (ARCH_N5X) architecture shares a lot with Agilex
(ARCH_AGILEX) so it uses the same socfpga_agilex.dtsi, with minor
changes.  Also the clock drivers are the same.

However the clock drivers won't be build without ARCH_AGILEX.  One could
assume that ARCH_N5X simply depends on ARCH_AGILEX but this was not
modeled in Kconfig.  In current stage the ARCH_N5X is simply
unbootable.

Add a separate Kconfig entry for clocks used by both ARCH_N5X and
ARCH_AGILEX so the necessary objects will be built if either of them is
selected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/Kconfig          | 1 +
 drivers/clk/Makefile         | 1 +
 drivers/clk/socfpga/Kconfig  | 6 ++++++
 drivers/clk/socfpga/Makefile | 4 ++--
 4 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/socfpga/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index a588d56502d4..1d1891b9cad2 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -394,6 +394,7 @@ source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
 source "drivers/clk/sifive/Kconfig"
+source "drivers/clk/socfpga/Kconfig"
 source "drivers/clk/sprd/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b22ae4f81e0b..12e46b12e587 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
 obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
 obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
+obj-$(CONFIG_ARCH_N5X)			+= socfpga/
 obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
new file mode 100644
index 000000000000..cae6fd9fac64
--- /dev/null
+++ b/drivers/clk/socfpga/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+config COMMON_CLK_AGILEX
+	bool
+	# Intel Agilex / N5X clock controller support
+	default y if ARCH_AGILEX || ARCH_N5X
+	depends on ARCH_AGILEX || ARCH_N5X
diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
index bf736f8d201a..e3614f758184 100644
--- a/drivers/clk/socfpga/Makefile
+++ b/drivers/clk/socfpga/Makefile
@@ -3,5 +3,5 @@ obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
 obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
 obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
 obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
-obj-$(CONFIG_ARCH_AGILEX) += clk-agilex.o
-obj-$(CONFIG_ARCH_AGILEX) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
+obj-$(CONFIG_COMMON_CLK_AGILEX) += clk-agilex.o
+obj-$(CONFIG_COMMON_CLK_AGILEX) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
-- 
2.25.1

