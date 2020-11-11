Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3CBC388F9
	for <linux-clk@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4254020756
	for <linux-clk@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UGyq1yTV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgKKJf0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Nov 2020 04:35:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgKKJfZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Nov 2020 04:35:25 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41BCC0613D4
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2020 01:35:25 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id r186so1121180pgr.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2020 01:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
        b=UGyq1yTV49UYRiRLph02TaWZro1hVWIiT4Tk4DywL+OB71P7AOMoiNF8zcyQ4B25bg
         3aevqT98TpiAp5+XwIV1UyN7wJzO+nZikqOAlNP2B1WMvWvtqaiS8M0l2752qHJW25kN
         GWcamTWVT4wVb2fxk+gzwIe1zGK7vFnXs/tynF9G2BWlW4onBuzZzxOT4L7pX5no+767
         edU1A2k8rjNqsdPpPZyk5CTVUhDm26tTAPvWqhmlxu7sxHDmftzcXRITdsflnIv+DyAc
         o+JpWydN4tLC5jfYMR0R+MfgcdlanDbglfujs7nKqijoShFbuUhX1Ih2nd5yLgmX71BO
         6HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
        b=aUE3/fmcyQ7TsJlFaLr2s7+evb8t27nzIRKXvAfXH5ZwbBkuh+x69R8709WZfldboa
         HNNPc85doEjjLSI0P46CN0vqs5GHyKI08dpi63IebVuq31tel5omjYd8uLi2KUB8HoTK
         wbKNmfqIv9qoOkZ2ILQR9S0dYVuwAd7a+nykBJmT5OXYLVcbdVQrh0LCV7Ui5cwXIm51
         2QzWpxYGQOiemCaeRY6RvPOa0wvzHu7u1PX2219jxbiaTRtT3M6nIH9JWXOzd6VLO8jf
         Jo5DrYF4gJ1xjtq4nOmQjO8122+2z/ORQ8I4aUzfgIMwf5Pbxz8Krnt4jQZrkY36DkZn
         IRMA==
X-Gm-Message-State: AOAM530k62SxFviafy27EThFtU7rBoWZcitwc6USyuc71ZcSuOFAtWoP
        3EtSiv45QgsOC7enRA8DwyTAgA==
X-Google-Smtp-Source: ABdhPJy1xLIajCcPrYI2GaBfqupBdYzvJLKKc4OlehU0OlQNjTpGwUNXC6B+xFGagGogFdDpTC8BKg==
X-Received: by 2002:a63:3c5b:: with SMTP id i27mr18893262pgn.268.1605087325273;
        Wed, 11 Nov 2020 01:35:25 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id m6sm1862424pfa.61.2020.11.11.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 01:35:24 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>
Subject: [PATCH v3 2/3] clk: sifive: Use common name for prci configuration
Date:   Wed, 11 Nov 2020 17:35:13 +0800
Message-Id: <20201111093514.103155-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111093514.103155-1-zong.li@sifive.com>
References: <20201111093514.103155-1-zong.li@sifive.com>
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
index 627effe2ece1..fe3e2cb4c4d8 100644
--- a/drivers/clk/sifive/Makefile
+++ b/drivers/clk/sifive/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += sifive-prci.o
 
-obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)	+= fu540-prci.o
+obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= fu540-prci.o
-- 
2.29.2

