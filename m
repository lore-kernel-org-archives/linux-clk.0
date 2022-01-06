Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B60C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jan 2022 05:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234297AbiAFF6e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jan 2022 00:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiAFF6e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jan 2022 00:58:34 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C96C061245
        for <linux-clk@vger.kernel.org>; Wed,  5 Jan 2022 21:58:34 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 205so1703143pfu.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Jan 2022 21:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xy0s/bG/77IbnsCl2jphUEvh5EOackYvRNc3QDAL5KM=;
        b=NhJPi0DCjwL/dLd6c3uV6nb4llPRlrfUg1seAGOwr3gDRbaYUxWaz5JTpAa4KLIHv1
         Bjq3l5l7YWu3AYxuSL8Sd7iZOXyEf3Gy8iPm/IMm/ORYYDfhsHGXl+gI3DICg2qCgh/m
         VquvH91wwhdnM8uMjkaylgJk1ldKcrWSyvfWj9Rxt4YDZtNPjc2tAVFnLadhB5hnU5hx
         R6T4EqMw1zcfF4rLOdbUxmthD+2u68xv4kboCc8dasFZGZcOR9gnf3FyVooaVyXyy8dt
         AxmPquuivGozjA83O+QANvBL/PN9wvmWQnzivjR/Px+waIaydAtbEKR0djWrrdhlb95l
         bztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xy0s/bG/77IbnsCl2jphUEvh5EOackYvRNc3QDAL5KM=;
        b=v43rbl3Lgpm4dncxG54oKZkjk9StphZ2bjh5uwYxXzWRoTZtjlTsPx2j19rhx82SD5
         mkiNBMMlk7CwES7z1xTkxAe8twGhpPZkTckgoPQE8huHrAnRpT2ItROjH4piJj5Y19UA
         vWEGBaY1LQ2h3f5sfoNFCtTxZ4SBQ9kc2jGuKuO4PnoGXnqhJ2gm5fDMsXg1NT+fnZuI
         NgvilrDV2CihZJ82KsaN58GxOXjJVUvTiDCBIRU5tLkHSyoLZpI7GR5AjWcs1SB/Ghdm
         PJikzZVq1y4JiTsG4CbZpTStgQr+m8aeFw0TcHlHpJcwKAFgAneSz/EnWVOHZQbssCn+
         y4Fg==
X-Gm-Message-State: AOAM531bM1B/OoJ8NZbuBbbgOva2s4pu3G4cbO8fPyjrH+pa8D8CwIIG
        xWME8sgCOzF+gzVCJzj3Dg6xew==
X-Google-Smtp-Source: ABdhPJxDgNBnwLi1RBsJAamw0N6o2z+OUH1X+EQxGH3qrv36V5IS5y0dhPMBDfFOq8oSozQWgdryMg==
X-Received: by 2002:a63:750b:: with SMTP id q11mr35999917pgc.349.1641448713496;
        Wed, 05 Jan 2022 21:58:33 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id j4sm980840pfj.34.2022.01.05.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 21:58:32 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v3] clk: sifive: Fix W=1 kernel build warning
Date:   Thu,  6 Jan 2022 13:58:28 +0800
Message-Id: <a298286a42461e07c92e282224f469d84344feac.1641434305.git.zong.li@sifive.com>
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

Changed in v3:
 - Rebase on v5.16-rc8
 - Add fixes tag

Changed in v2:
 - Move definition of variable to C file from header

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

