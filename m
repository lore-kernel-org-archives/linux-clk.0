Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F7DC61DD8
	for <linux-clk@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 400F320674
	for <linux-clk@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GC+wCOZX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgKKKGY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Nov 2020 05:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727337AbgKKKGT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Nov 2020 05:06:19 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B76C0613D6
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2020 02:06:19 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id r186so1169393pgr.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2020 02:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
        b=GC+wCOZXigNUTzVyZoZ5sQt0B+qGYQ1rxmobkqe9PjmIvCc/rsn/BC8H3SYZc1hh7I
         ccETM+g3YzkfkhlvzwnMVXtFwOcS9ucDcp9DLB0k6R0WOAdnNzMABEvcf5WqS0Im3vSN
         Q8DKnOqwENJeRcYAZBFf2Cm/JpxjIZlkTedy2/RlgQ0hj60kJk9yTI6lvt4enmm9Rhhq
         00HHbUlbR28KDigrln9y4ub2QAB8IT1RoQdrVL8NlXWcUK/g1VPzGDK9B1xJ0dx8NrNO
         0WrqDqiHfe0ve9o60xGs5YrUO4zAbx/BYypBao5sHykIa0P47nR/r9/I5PDEpjN94jxC
         sPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
        b=hGbXnKqfqEbnbe0PnWyneufIBYXrAZxeohl8OMCDooxl1hzQ/6walXdhuccYgj7Pxd
         BL2Rwys28/KZ2VZVxd1K9o/yrEF7Jj9OYMJ2wMwS/XLoWJsJG+r1VdWgC3D1FpRtZYh7
         QIVT7tQ2Ys8cIcoOZlAKItd24I1eMVwuQ0bI8mIbB2Lnnjq9yt6eSBwISi80EvOPXtaB
         k0mKKEgphzobzPbFshHp0385OMdCq9qTD7MSxol9kl79wxa5L2kstJBCdgtjaf2GwhM8
         ocGDIQD4bWn7IFm9Ln0kcjloC0X0Au7X+kbHlEyWIr7MwNW8QFbOfgqeswIpaUp+UIym
         GD1g==
X-Gm-Message-State: AOAM530gMiQe0Ss5SPpWT7nrCWUSoiAczAHZDhzg5OG+lMj6s7aDqcQX
        4X6B0ZkpwU7l/oPSO1KYAQ9vgA==
X-Google-Smtp-Source: ABdhPJzaTSpLq60xMn+cJpFbOkkYXEhNYIOqlqrtQTK0CvD4ZUtz6woJa+U319CNjyJImvVsb89P1A==
X-Received: by 2002:a63:e650:: with SMTP id p16mr20477838pgj.295.1605089179165;
        Wed, 11 Nov 2020 02:06:19 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id u22sm1872801pgf.24.2020.11.11.02.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 02:06:18 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>
Subject: [PATCH v4 2/4] clk: sifive: Use common name for prci configuration
Date:   Wed, 11 Nov 2020 18:06:06 +0800
Message-Id: <20201111100608.108842-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111100608.108842-1-zong.li@sifive.com>
References: <20201111100608.108842-1-zong.li@sifive.com>
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

