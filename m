Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C31C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 10:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhLHKJ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 05:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhLHKJz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 05:09:55 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05EEC0617A1
        for <linux-clk@vger.kernel.org>; Wed,  8 Dec 2021 02:06:23 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id v19so1205252plo.7
        for <linux-clk@vger.kernel.org>; Wed, 08 Dec 2021 02:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vLsqqIOcK3x87D0lqx5TjStNHLlKk/oR3ZFyCJp2s0U=;
        b=KZkrJZQF1iqqcIYWB/INHACwNxQlYjBuUCagjsMviC4w8dR9cDh1bmtZmWBjnMsiJZ
         rC6tn1lLx7SyHN6UgSVSOerot5qYiwA0+3tobbXRHmAM3kjP82zBDqLmSn97bY5JYfyq
         YWUTHvchOyjkgsPKBYLlLgB/W7RNxLZgGR/VIv1n9g8EFF8+1HMY+3R+/u+itWXDo7ve
         CrxrX2w8g9NyDlwFoQL9bJhANRi8fB8RMMlLB5spyxYAOkpZT1ydZ21yU+OuL+QTGFLZ
         d/X4LFPHKbKyMu01TijurTGtM03tdRjZTH8t6lduMuIAz66kHpH4iF/JvcSOvBVDcKJI
         G/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vLsqqIOcK3x87D0lqx5TjStNHLlKk/oR3ZFyCJp2s0U=;
        b=g6sU1lFdJji8voFvGhijw62p9irHJWSpnZ4yC32xa0N4q0NVOkADs54YPsJKfDat5u
         EnK1f+zW+I7vwi7x/OH45RfHEiEGl8X+OSFAHNyPZmnODPixL+iXEJzmvUyhTrOKNK2S
         EYh3FtYomY5VSoBIckCnpc6pS5AGXgN6VfrCPUu0EOmKTEqGMBYDSR2aBKIlH/YPEv+x
         lbe8olioGR80ERGPFt9iUuU38O/cBY20aeRYR9ru/R1Q0LODZB2nNOSctqFXbIEZYLkW
         aVsU6tPnieqyoR6dtR5llggMtSaM2RtoYo+96itVv8GQeCBMpueI9czCRwBHbANUsf+U
         dfnw==
X-Gm-Message-State: AOAM530sR6mB+LDBojyF7AVO/RVH4h9e5lsI0ba3JTpY1xtoUUjo7FDG
        Gn4bI6h41nfTZsAhK4WD+MOzhw==
X-Google-Smtp-Source: ABdhPJxJM0rGENjhTjTx6Is6PlZ+znZvJakmsXjGiFUmS4EBjePVGdAA4K1S3V9+/m+9zXrnyLbsog==
X-Received: by 2002:a17:90b:350b:: with SMTP id ls11mr6002127pjb.227.1638957983430;
        Wed, 08 Dec 2021 02:06:23 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y28sm2886312pfa.208.2021.12.08.02.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 02:06:22 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
Date:   Wed,  8 Dec 2021 18:06:18 +0800
Message-Id: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
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
variable into fu540 and fu740 implementation respectively, instead of
common core code, then we could still separate the SoCs-dependent data
in their own implementation.

Signed-off-by: Zong Li <zong.li@sifive.com>
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

