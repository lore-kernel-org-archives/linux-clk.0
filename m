Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20913C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 02:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhLHCH7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Dec 2021 21:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhLHCH7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Dec 2021 21:07:59 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79558C061574
        for <linux-clk@vger.kernel.org>; Tue,  7 Dec 2021 18:04:28 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id b13so551426plg.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Dec 2021 18:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QGhWCkmSzao6PeC0Ex225wGHRUhhH5KgwhKdqzOJZvA=;
        b=YZ27ixf9+XfQMtQ3uXE/cQP2Ma/8qg0/QKNM7Pw1EEZ4KgvbcWAob75HGFNVic8Se+
         zNrzhRkgISSv/Gegh3+EmZ9gKCXC6G+wVDeJ6vOaeM4Vf/zcuSUhGZpqLy0swwJQzayE
         3uR6ZR0LLj72hednCXZyC/kXJ8BF8lud+pRbmyCJdcQ4PiPS1Ktxh/t20hvo4lMu1czi
         jeWj6XUtAFlthjBXPQtQ1wSm6OUDddAIV7arUAYx3PeyA0FK/n9WcWZCl3dpfa/pRVfu
         pVNjIXul/QWGJT8VHPLJ6YAeLLD5+BVlu3zy87t4lmMj/h4jwzDC8IKw2fRwaCPzyqJr
         Zo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QGhWCkmSzao6PeC0Ex225wGHRUhhH5KgwhKdqzOJZvA=;
        b=XI8a1gpo5oVZdXITH8GeQ6bPpoEcG+g2kndFDR2tSNjL7miqhrQ1Y9dhIdl1nc7u2w
         ko43xmtMOCzNKkmtYec6jg6LQoQ4jWtu/CGx/V/yB1ASTktU8qLL4f7D0ktR2hzrRNRe
         6aVm+iZvDwjMb40TmaDDkUCrwDonM17MPkeE5/f2GGpZLZE+BxtRJNGnyMBVcVOYj32G
         ndB2FW4/D3fB6KAzLah906AESa1lomra65SWRDbzVy8JlVNdMe3NZPqbqfVYA8ZlomuM
         7HYhsZorBpvsdSHOGL1Yk1vzDEuo5vU1xyCyxK3er0h/YnttRxlgWCdok7lbB0nbvYjv
         TfRQ==
X-Gm-Message-State: AOAM531Xbl16uYDNJ0EUu4QDtZATqQVArQkWCrLS3GoMMHng1kkosB1J
        cOpX8vDZPdyOQ5ndsvMMRNiA3w==
X-Google-Smtp-Source: ABdhPJyGdggtAdCqWtci3i/oqvpmYcZUjWvaBoYPUoaEGyTuTbkrXuissLCUqR4a4hphrmR7mezhLQ==
X-Received: by 2002:a17:902:c204:b0:142:2441:aa26 with SMTP id 4-20020a170902c20400b001422441aa26mr56090043pll.84.1638929068018;
        Tue, 07 Dec 2021 18:04:28 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b19sm1167929pfv.63.2021.12.07.18.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 18:04:27 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/1] clk: sifive: Fix W=1 kernel build warning
Date:   Wed,  8 Dec 2021 10:04:22 +0800
Message-Id: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
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
but not used [-Wunused-const-variable=], we should just remove the
header including in fu540 and fu740 implementation respectively,
because they don't actually use these static variables. After that,
we could still separate SoCs-dependent data in their own defination,
rather than put it in the common core code.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/clk/sifive/fu540-prci.c  | 1 -
 drivers/clk/sifive/fu540-prci.h  | 5 +++++
 drivers/clk/sifive/fu740-prci.c  | 1 -
 drivers/clk/sifive/sifive-prci.c | 5 -----
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
index 29bab915003c..40ee5ab1748d 100644
--- a/drivers/clk/sifive/fu540-prci.c
+++ b/drivers/clk/sifive/fu540-prci.c
@@ -20,7 +20,6 @@
 
 #include <dt-bindings/clock/sifive-fu540-prci.h>
 
-#include "fu540-prci.h"
 #include "sifive-prci.h"
 
 /* PRCI integration data for each WRPLL instance */
diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
index c220677dc010..c8271efa7bdc 100644
--- a/drivers/clk/sifive/fu540-prci.h
+++ b/drivers/clk/sifive/fu540-prci.h
@@ -13,4 +13,9 @@
 
 extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
 
+static const struct prci_clk_desc prci_clk_fu540 = {
+	.clks = __prci_init_clocks_fu540,
+	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
+};
+
 #endif /* __SIFIVE_CLK_FU540_PRCI_H */
diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
index 53f6e00a03b9..e1da4eec0786 100644
--- a/drivers/clk/sifive/fu740-prci.c
+++ b/drivers/clk/sifive/fu740-prci.c
@@ -8,7 +8,6 @@
 
 #include <dt-bindings/clock/sifive-fu740-prci.h>
 
-#include "fu540-prci.h"
 #include "sifive-prci.h"
 
 /* PRCI integration data for each WRPLL instance */
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

