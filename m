Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD38C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jan 2022 09:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbiAGJHV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jan 2022 04:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236732AbiAGJHU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jan 2022 04:07:20 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB08C061245
        for <linux-clk@vger.kernel.org>; Fri,  7 Jan 2022 01:07:20 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id l16-20020a17090a409000b001b2e9628c9cso5864261pjg.4
        for <linux-clk@vger.kernel.org>; Fri, 07 Jan 2022 01:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMLMTjtN7/aBpkgEjUCNT6Xs+iYtlwPhnAUDic5DMM4=;
        b=jBkwEa1BhY8CFNTW6n8czNsfnlJouNkzNSAFm0bxvbthXg5A6OnBDfob2ypeSVTRYO
         aXk/C2QuX1zIwroEAfyEkot+jBoPlgGPeiy2a50TTB8b7rMVqsGFef0g4nifHTNtB8Yj
         sRXdH7rUr10s4EprHY8DdiLDgyRfysP+VqgkkykakblM6/EhgWEud4V13sgKhwxrFZvl
         hbmuDfVqkXpFw0SKLEQEXBPBbR92Z0mP65iMIZFsJ/5y4LeaeEOW5azQHrD7MALX2ZwN
         eq7CQBolgqtLNcdJQmVvgnja5B0aDuyla4/wsOW6a3IMGlOG6cyt0Ki2F9Rw3NzKIIvk
         JoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMLMTjtN7/aBpkgEjUCNT6Xs+iYtlwPhnAUDic5DMM4=;
        b=mwVei4tuF6uxVZP3r8gQEU03BgdSRVp3iuTJ7XbHtGRd+r6y1Fz3tQu0r12uDhfK4t
         NAGOwXxBUoZBdB7p9VzOfDxAhuWwiTvGUAMDnjqEmcAwHZ3+vhuvEHO9oCAbXMaGe+Fe
         3eQKGh0UP16Td+g4F8dVTHmJjx19xqqdH5Png+LvW2jz0+uQS/HF60tK/zLtgu+1wwBx
         uUCvdPGFfkzsH85oKzlJNq3KUOvvwUkVYKcVwoR9LcONDtpoLy3okJXzQRX61Tu637gw
         sGzB2LjBs+8qidZd9B+azG824R5SKUaUdtzDj27OVKihDkjDS+jAwB9QYa4l4SZKyRk5
         2oAA==
X-Gm-Message-State: AOAM530ppIZyfbLnWct8qZ8TKcFcZEqCIqOJjmSyEsSPpzls2gvaDxyU
        RF2WqnUwFB7IITVAMWylePWv/TCzrwox7A==
X-Google-Smtp-Source: ABdhPJw8L9a9oJaRHl+obIVH+5jy823jSvPFm9FNGzGlG1+huRo/LarbYfjt/N9vX+XVA00hjIPPrg==
X-Received: by 2002:a17:902:e790:b0:149:7a3f:826a with SMTP id cp16-20020a170902e79000b001497a3f826amr53696927plb.76.1641546440046;
        Fri, 07 Jan 2022 01:07:20 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f18sm4073965pgf.65.2022.01.07.01.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:07:19 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
Date:   Fri,  7 Jan 2022 17:07:15 +0800
Message-Id: <20220107090715.2601-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
Declare static const variable 'prci_clk_fu540' where it's used").
For fixing W=1 kernel build warning(s) about ‘prci_clk_fu540’ defined
but not used [-Wunused-const-variable=], the problem is that the C file
of fu540 and fu740 doesn't use these variables, but they includes the
header files. We could refine the code by moving the definition of these
variables into fu540 and fu740 implementation respectively instead of
common core code, then we could still separate the SoCs-dependent data
in their own implementation.

Fixes: 487dc7bb6a0c ("clk: sifive: fu540-prci: Declare static
const variable 'prci_clk_fu540' where it's used")
Signed-off-by: Zong Li <zong.li@sifive.com>

---
Changed in v3:
 - Rebase on v5.16-rc8
 - Add fixes tag

Changed in v2:
 - Move definition of variable to C file from header
---
 drivers/clk/sifive/fu540-prci.c  |  6 +++++-
 drivers/clk/sifive/fu540-prci.h  |  6 +-----
 drivers/clk/sifive/fu740-prci.c  |  6 +++++-
 drivers/clk/sifive/fu740-prci.h  | 11 +----------
 drivers/clk/sifive/sifive-prci.c |  5 -----
 5 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
index 29bab915003c..5568bc26e36f 100644
--- a/drivers/clk/sifive/fu540-prci.c
+++ b/drivers/clk/sifive/fu540-prci.c
@@ -20,7 +20,6 @@
 
 #include <dt-bindings/clock/sifive-fu540-prci.h>
 
-#include "fu540-prci.h"
 #include "sifive-prci.h"
 
 /* PRCI integration data for each WRPLL instance */
@@ -87,3 +86,8 @@ struct __prci_clock __prci_init_clocks_fu540[] = {
 		.ops = &sifive_fu540_prci_tlclksel_clk_ops,
 	},
 };
+
+struct prci_clk_desc prci_clk_fu540 = {
+	.clks = __prci_init_clocks_fu540,
+	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
+};
diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
index c220677dc010..931d6cad8c1c 100644
--- a/drivers/clk/sifive/fu540-prci.h
+++ b/drivers/clk/sifive/fu540-prci.h
@@ -7,10 +7,6 @@
 #ifndef __SIFIVE_CLK_FU540_PRCI_H
 #define __SIFIVE_CLK_FU540_PRCI_H
 
-#include "sifive-prci.h"
-
-#define NUM_CLOCK_FU540	4
-
-extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
+extern struct prci_clk_desc prci_clk_fu540;
 
 #endif /* __SIFIVE_CLK_FU540_PRCI_H */
diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
index 53f6e00a03b9..0ade3dcd24ed 100644
--- a/drivers/clk/sifive/fu740-prci.c
+++ b/drivers/clk/sifive/fu740-prci.c
@@ -8,7 +8,6 @@
 
 #include <dt-bindings/clock/sifive-fu740-prci.h>
 
-#include "fu540-prci.h"
 #include "sifive-prci.h"
 
 /* PRCI integration data for each WRPLL instance */
@@ -132,3 +131,8 @@ struct __prci_clock __prci_init_clocks_fu740[] = {
 		.ops = &sifive_fu740_prci_pcie_aux_clk_ops,
 	},
 };
+
+struct prci_clk_desc prci_clk_fu740 = {
+	.clks = __prci_init_clocks_fu740,
+	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu740),
+};
diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
index 511a0bf7ba2b..5bc0e18f058c 100644
--- a/drivers/clk/sifive/fu740-prci.h
+++ b/drivers/clk/sifive/fu740-prci.h
@@ -7,15 +7,6 @@
 #ifndef __SIFIVE_CLK_FU740_PRCI_H
 #define __SIFIVE_CLK_FU740_PRCI_H
 
-#include "sifive-prci.h"
-
-#define NUM_CLOCK_FU740	9
-
-extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
-
-static const struct prci_clk_desc prci_clk_fu740 = {
-	.clks = __prci_init_clocks_fu740,
-	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu740),
-};
+extern struct prci_clk_desc prci_clk_fu740;
 
 #endif /* __SIFIVE_CLK_FU740_PRCI_H */
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 80a288c59e56..916d2fc28b9c 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -12,11 +12,6 @@
 #include "fu540-prci.h"
 #include "fu740-prci.h"
 
-static const struct prci_clk_desc prci_clk_fu540 = {
-	.clks = __prci_init_clocks_fu540,
-	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
-};
-
 /*
  * Private functions
  */
-- 
2.31.1

