Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7425C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jan 2022 06:55:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbiAJGzn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jan 2022 01:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbiAJGzm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jan 2022 01:55:42 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E47C06173F
        for <linux-clk@vger.kernel.org>; Sun,  9 Jan 2022 22:55:42 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id i8-20020a17090a138800b001b3936fb375so5808521pja.1
        for <linux-clk@vger.kernel.org>; Sun, 09 Jan 2022 22:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ga/Od3KnKWj8t6bt46K7KiC7VAoXXyAJ/YENFxvbQ9w=;
        b=ZGvbg7Pcc3RY8usQUiwJ70tWCipo+jDomplquSHS7TFkDP7pGXK9fEAwJzsC2EjlU4
         POFvCJNXLUj2dkbch5qJhwp/lnlfIAYHCLKwTRy4AlyLR06YPy8wlMHBNpJofB4aT2n7
         3GJeX0Sde+v+OxwS+iUdGd/VtqjOWV7NtnIuC5Rs8g3rF7+R32Ndh3pyEbMoKI9gYNkA
         0jTMl8X7jeS7cJbpimDOe6GQP7xuzuWKuJaLIDXtCgJOabuutKMvt1y/M/pSbI5KlpKe
         gn94uU8a/S+oxruC1NVSrhe1uXLgysy6hDiJwVWH9XtGD26Oxq+h83Br/i1pWZQ7T2py
         KU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ga/Od3KnKWj8t6bt46K7KiC7VAoXXyAJ/YENFxvbQ9w=;
        b=RZjrssMXZrYx3t9mKSHPp4rFQRdQw9x6EJ3T2zVOOOv0TXe1SMxfW8alMFTmEkq8Pk
         yoTd3+C/YaPSHHVoWyCxZxF8V3ujGPhPkZFI0gcCyoTCmf+BiO3AOliNoX/RPYgHp+Nk
         PyCU1I83Th2WQLfkXMf1bQmGfds9NshbCgugAF1Y9bJDKA67IyWx7hVZGEqoZJj31VuB
         NIRhOOMsRLepuUa903QsQXbO3stqYJi2S7chbEQV8lPoMYvD01NVPKgNiGhbh+q3c+RL
         X+v1tDclS6V+wCTQGfM1wNGEFoxMeu8elZnMMywJoWE39zESbAUf3XNXikbuUnO5fr1x
         8z8A==
X-Gm-Message-State: AOAM532UHpo8dzP+axnCfEGL0FFTwaFv2Lrd+pkSKwKZ+6xS078M1HXI
        iasiVAmpuNsHgYpbeyvt/X6nCw==
X-Google-Smtp-Source: ABdhPJygnowcodFXZOaiKLsuhj1pifUF4euGfkHh2D6F5h/eVvxnLUIj1WXdfjnIqQnnoNzXQAzqtQ==
X-Received: by 2002:a17:903:22ca:b0:14a:15ab:ba27 with SMTP id y10-20020a17090322ca00b0014a15abba27mr10061732plg.128.1641797742079;
        Sun, 09 Jan 2022 22:55:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id j8sm5955231pfc.11.2022.01.09.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 22:55:41 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v4] clk: sifive: Fix W=1 kernel build warning
Date:   Mon, 10 Jan 2022 14:55:36 +0800
Message-Id: <20220110065536.11451-1-zong.li@sifive.com>
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
of fu540 and fu740 doesn't use these variables, but they include the
header files. We could refine the code by moving the definition of these
variables into fu540 and fu740 implementation respectively instead of
common core code, then we could still separate the SoCs-dependent data
in their own implementation.

Fixes: 487dc7bb6a0c ("clk: sifive: fu540-prci: Declare static const variable 'prci_clk_fu540' where it's used")
Signed-off-by: Zong Li <zong.li@sifive.com>

---
Changed in v4:
 - Rebase on v5.16
 - Modify fixes tag

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

