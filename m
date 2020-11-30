Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A109C5519F
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:24:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0067E20731
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mfwPWEz/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgK3IYX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Nov 2020 03:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgK3IYW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Nov 2020 03:24:22 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E816C0617A6
        for <linux-clk@vger.kernel.org>; Mon, 30 Nov 2020 00:23:42 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id hk16so916166pjb.4
        for <linux-clk@vger.kernel.org>; Mon, 30 Nov 2020 00:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
        b=mfwPWEz/CJRM0/NB94KY/1D3XBd67iXUIfy+EQSaTUf0ytLC0Ukj0TlmUxpSAlxAKG
         sklU3ZWcikAGPOAQWpFn6bo56QzvuTFRHhRRAHzHzM+riPPuuw6Fqqz1hRE7COjgfYqj
         wcxBGbCqM8UcXvr2pOLJskDiFZVIkKV0XnijHaUtKYtMKoUTPy5Cj2msZ8pulle8/x0D
         YlZQZtMbL8iZAPxVty7oDcemvmygD4S6DaQJX5eZ4lhCyT5Uf5NY/dOtOmHtcGgC0Zi1
         mt2Ag310MRyHBPPj9H/daPUGP8Sy5pdrfn3KcxnSbxAlicjedSbJvjp9aEQFQe0k/hpd
         /tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
        b=BgvRv4niuaJ1McOmnWX71dbFbWgVix6qdVCjlGvZJtnzADgRmwg8cOhfPphDpqAMgx
         vin0V2ON5XpJyAxOCaH1Vkpd/mSlFCHF0W95eWZtgaF+P43p4p4md1XrcMgJXg8ly0ML
         fXkVjW0EHDpSPjOj5yOrxBEjXOAUBCKdDIplIyIziNoIUf41hHZrEY52xpTRS5fYtB/I
         FFrusi1/K9C8wanajTUweYMiYbT4G0CivlzhkdIpxKKrSl1Ei6hWh9rgdgYw5gLH6fkm
         GOaw7pfyzskAPNtVF4DsgfEDS2HJop0W2ggT5CIQdAzx456EJhFlbkoLn3jnP+BA/Xp9
         znMA==
X-Gm-Message-State: AOAM533lcdyoVJPckBz+ZPAFxO8OAcqU1Gy3/pUVCNyjIQhVGu3TRReG
        b+ZJuEsr8Aj22wVCnhVhkQqIsw==
X-Google-Smtp-Source: ABdhPJwZtC1G54KfvnBlF+6C+5WN0K0xdjy+8Ti0bGTR95m3BYdxmwHSis4NYp7UI0nkJKxolp+mCw==
X-Received: by 2002:a17:902:144:b029:d7:dbfc:beee with SMTP id 62-20020a1709020144b02900d7dbfcbeeemr18091271plb.32.1606724622124;
        Mon, 30 Nov 2020 00:23:42 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id u1sm21265338pjn.40.2020.11.30.00.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 00:23:41 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>
Subject: [PATCH v5 2/5] clk: sifive: Use common name for prci configuration
Date:   Mon, 30 Nov 2020 16:23:27 +0800
Message-Id: <20201130082330.77268-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130082330.77268-1-zong.li@sifive.com>
References: <20201130082330.77268-1-zong.li@sifive.com>
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

