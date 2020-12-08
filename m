Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED51C197BF
	for <linux-clk@archiver.kernel.org>; Tue,  8 Dec 2020 07:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C9DB23A79
	for <linux-clk@archiver.kernel.org>; Tue,  8 Dec 2020 07:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgLHHQG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Dec 2020 02:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgLHHQF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Dec 2020 02:16:05 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5FCC0617A6
        for <linux-clk@vger.kernel.org>; Mon,  7 Dec 2020 23:14:44 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id d2so9159827pfq.5
        for <linux-clk@vger.kernel.org>; Mon, 07 Dec 2020 23:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
        b=Aazs3T1N2ed8oyUqwgz37G5mtv5J4uDEZyGnu9nTT9p6akotV1DW6qXNnntO9L9dgT
         qvw3m53PKFjisUI+UQIMspRNBBFk/G0iLopeyx7n1XjLH08COMup271lYqwh2jWY1qf6
         FlYl4m95B7EcNZ8KkCo8ORLU3Lojm0QqWJzT1SbJDhingXKlQe0XuYz7chsJLnKJX2vJ
         S86x8qON/NIDP2pa5xawGZGujWLOjpRVlNfAMq6ZCa5ZH032XpPqhZ5/4TZPubvEoXkm
         2RayuYwPoVj6KNwBlBupqJxxzcwokVuLMJu3FtlHRBqS8Vmqy64iWhBnA6XKF5KPvobI
         VnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
        b=RwojZvCj7MPy82+ZpiB3msJ85bzyB0DU5RvJ5qSO+qUupklNOg6Uj1NbcpWCFK3rx+
         wHW/zeACaCxoZ0pAnaWDzQSgVcrLYe2sq2M5JOlhw8XXKOUHTiHhw2K0Igb31zj7kfPq
         to8TsKSWCASldHPbcbjcvv3/GtoNBUkyOjfYhouUxWmOArdmCx5OwHZ+2L/aRDLRMr1f
         hjdlpro0k0wBV6/3sXxp5uSpec8Zi7hA7WzD+kG+VX3cgTQnuxI8yKlbhBSAQM9Pb9Dj
         SmohoP/j6XXIfKG7sp8NQhHwyjICrqVufjh3fYYtC2LZ+W27PFjxqc61DkFLvrkPoki/
         2reA==
X-Gm-Message-State: AOAM533Httu9xDJaRE9XDWDykINOOAti340jBnR1AiuwC01pnOc1Qdly
        6ckpgng25fdzN4v1mUQiohAaIw==
X-Google-Smtp-Source: ABdhPJwfnqr3YFFbBhqE0RjM3qof/vQOj7+WZX0iENnNmxJBcPWb2hVUPggV/AawdatuEzinUAHsOQ==
X-Received: by 2002:a63:c644:: with SMTP id x4mr21854083pgg.421.1607411684422;
        Mon, 07 Dec 2020 23:14:44 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id gp17sm1801318pjb.0.2020.12.07.23.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 23:14:43 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>
Subject: [PATCH v6 2/5] clk: sifive: Use common name for prci configuration
Date:   Tue,  8 Dec 2020 15:14:29 +0800
Message-Id: <20201208071432.55583-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208071432.55583-1-zong.li@sifive.com>
References: <20201208071432.55583-1-zong.li@sifive.com>
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

