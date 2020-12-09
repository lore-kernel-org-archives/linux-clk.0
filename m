Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4FDC4167B
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 09:50:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCF3F23BC7
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 09:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbgLIJuR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Dec 2020 04:50:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgLIJuK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Dec 2020 04:50:10 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3593C06179C
        for <linux-clk@vger.kernel.org>; Wed,  9 Dec 2020 01:49:30 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w5so79409pgj.3
        for <linux-clk@vger.kernel.org>; Wed, 09 Dec 2020 01:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
        b=RxFi9/p86xNpYk+bgvT10A5D8Q5O4kxMzyz75yKU8o4khbCrIEWDcrKszYL97lxjj8
         qwxW4xuV0N1nn2pxp6Fu6TEnHrVA/00qzvN2jqVTVxFe02M0j+sI1+zO9bUvZylpgWsl
         6LbFuO0YAI5n0F0SrC9I1j3nYS/lNjlQZHWRDvAiqOaNieugsUFobG1kjNGj7Y6BSjBk
         cacQjbk9m9WuyhQPl/uJmJ+oyR1FPxtbRkLa84Gd4O8GELdBROCX6bbQYjlLz80fiss9
         zXqr4IEkBA4FTgM4oO6jtiWz1rn1KKVNYxMDsUOOftukQ+3a/7oh6heI9uwAC83KvmGb
         xfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
        b=er6q/HJBtEm2FMV49EFBKeZ32e5JJSCoDmbKy8yTDz3XVmTG+29KswbI34+X2UsPa0
         wSD0cK9ug/DGvQNrCU+2GX4oFhfsQC+txGRo0OGHbZxV9ig2QGw5uRqCJhXoxCEVRj8J
         oPsui7cwX0UQkxjwwPwJUgsJTW+oKxN+im7VeAjm/myTdrv4V1XwmWw592V9EofII/DU
         l7qKG0UAXq0gjRZZ3J0baU3JD3VRoIxePUAnH6SGUH6+7KRceCcdRH30Vjrm84XYj5OW
         HaLq688y7OI6qAVPXcYdhKKMdAOzR57GkUaM9e2U6EiPHKVk0CJthBw+uinq3vQDfXJY
         4TlQ==
X-Gm-Message-State: AOAM531aT7rokDYOSzHPvmDf1Pram7fJh00tD/PKf5GXgkRbqO4icTlq
        3P6I3rv+A56WcS6m8seuRDgskA==
X-Google-Smtp-Source: ABdhPJxxFa9Co8dth0Y5535n/HOB9tOdSNShGd/e9jPuwNVWTmIZqj1EQu6nnWEdPn7oky+hRlUOPQ==
X-Received: by 2002:a62:145:0:b029:19e:a395:bd3d with SMTP id 66-20020a6201450000b029019ea395bd3dmr133559pfb.13.1607507370226;
        Wed, 09 Dec 2020 01:49:30 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id 129sm1890354pfw.86.2020.12.09.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 01:49:29 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>
Subject: [PATCH v7 2/5] clk: sifive: Use common name for prci configuration
Date:   Wed,  9 Dec 2020 17:49:13 +0800
Message-Id: <20201209094916.17383-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209094916.17383-1-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
patch is prepared for fu740 support.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
---
 arch/riscv/Kconfig.socs     | 2 +-
 drivers/clk/sifive/Kconfig  | 6 +++---
 drivers/clk/sifive/Makefile | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..3284d5c291be 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -5,7 +5,7 @@ config SOC_SIFIVE
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select CLK_SIFIVE
-	select CLK_SIFIVE_FU540_PRCI
+	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
 	help
 	  This enables support for SiFive SoC platform hardware.
diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index f3b4eb9cb0f5..ab48cf7e0105 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -8,12 +8,12 @@ menuconfig CLK_SIFIVE
 
 if CLK_SIFIVE
 
-config CLK_SIFIVE_FU540_PRCI
-	bool "PRCI driver for SiFive FU540 SoCs"
+config CLK_SIFIVE_PRCI
+	bool "PRCI driver for SiFive SoCs"
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
 	help
 	  Supports the Power Reset Clock interface (PRCI) IP block found in
-	  FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
+	  FU540 SoCs. If this kernel is meant to run on a SiFive FU540 SoC,
 	  enable this driver.
 
 endif
diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
index 51b6ebc359e4..3074cdbc6009 100644
--- a/drivers/clk/sifive/Makefile
+++ b/drivers/clk/sifive/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)	+= sifive-prci.o fu540-prci.o
+obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= sifive-prci.o fu540-prci.o
-- 
2.29.2

