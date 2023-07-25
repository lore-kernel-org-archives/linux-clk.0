Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE5FC001B0
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 00:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjGYAnA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 20:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbjGYAm7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 20:42:59 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246BA173F
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 17:42:51 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3460815fde5so27656085ab.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 17:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245770; x=1690850570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMbfUxW794QAHn8O7xONypqcfryJoPheb9KV8GnOtDw=;
        b=fIFB8VFZKbD/dM3uNH3oQmbNNxhTAEUbQdntzDoVvNdgl4OZ87Xcb24w1eZw/2Crb1
         9P84i+uSNF4COjqedNXiWsezm2Lf+ypYM2ZKEm4g+4zufkNciK+1BnGXlQxpvocF7A1N
         TzwFrGNIpJRkjUhQkWCSO/k50PlZdU2rkclr4FvtU0A0g2cxkTUsLK+q/lVm7n5IBC/q
         uQVnpXtXdv6FYnCcaftbgNrAPHtopHfmubjBhW/thyh10ieXYYsY8DIVrbFQjFLMz1Fo
         QRtmHIBo9yWWeqVO98bF2Pu6Yh9bsV77uIekl2WGtTv7KbP0j2OOqE1Ftjz0J2nDfuqG
         P/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245770; x=1690850570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMbfUxW794QAHn8O7xONypqcfryJoPheb9KV8GnOtDw=;
        b=bsAp3k4N/u6stLHfuEY6p9eTD4R5TpgELrHpINFAdJZu++KvFHgAlKOc/iazHo9yN0
         9jGX9TBjncE5mhtTnwY5ghj79AC28u/76lhHpZ9a9r6SOaeK4c2NeoC+nmP6KUYxZDxy
         woFYPgvircxM9Nar6H3wwB9rcja6IzG91Z9UWF73XEVJ/HPTNhEoy1zBJVpgb4Tcfa3c
         bFqrnTvlT5QBOTSh14VwwrfZsQzfNwpgbv4Vr31I9AWNK69g8b/LXwRpNK3WC93OQlYI
         WufaC5uZP4soHL/YPUymy5JT1MEZ7KhQs9teSKCyt0i9DO5uSJqixdLNGwvU4rnfGJG0
         9NGg==
X-Gm-Message-State: ABy/qLaLVIiFpQ2ksHcUZC/Njk0rlLbWOFOcEnLJ+jojcx0H9lPIclmk
        GBlk1zcyhntrM8WxktT6ZBOH+A==
X-Google-Smtp-Source: APBJJlEtRPkgpTVNveS+DU2sHwiqbLYAX1gq+wxxyXTAj816C1YFo7Imtr9pSD1VToBMj3DAJvIphA==
X-Received: by 2002:a05:6e02:20c2:b0:348:d52a:8f8 with SMTP id 2-20020a056e0220c200b00348d52a08f8mr1499328ilq.25.1690245770327;
        Mon, 24 Jul 2023 17:42:50 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id u135-20020a63798d000000b00553b9e0510esm9042655pgc.60.2023.07.24.17.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:42:49 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] clk: analogbits: Allow building the library as a module
Date:   Mon, 24 Jul 2023 17:42:47 -0700
Message-Id: <20230725004248.381868-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This library is only used by the SiFive PRCI driver. When that driver is
built as a module, it makes sense to build this library as a module too.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Add MODULE_AUTHOR and MODULE_DESCRIPTION

 drivers/clk/analogbits/Kconfig          | 2 +-
 drivers/clk/analogbits/wrpll-cln28hpc.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/analogbits/Kconfig b/drivers/clk/analogbits/Kconfig
index 1e291b185438..7d73db0fcd49 100644
--- a/drivers/clk/analogbits/Kconfig
+++ b/drivers/clk/analogbits/Kconfig
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CLK_ANALOGBITS_WRPLL_CLN28HPC
-	bool
+	tristate
diff --git a/drivers/clk/analogbits/wrpll-cln28hpc.c b/drivers/clk/analogbits/wrpll-cln28hpc.c
index 09ca82356399..65d422a588e1 100644
--- a/drivers/clk/analogbits/wrpll-cln28hpc.c
+++ b/drivers/clk/analogbits/wrpll-cln28hpc.c
@@ -28,6 +28,7 @@
 #include <linux/math64.h>
 #include <linux/math.h>
 #include <linux/minmax.h>
+#include <linux/module.h>
 
 #include <linux/clk/analogbits-wrpll-cln28hpc.h>
 
@@ -312,6 +313,7 @@ int wrpll_configure_for_rate(struct wrpll_cfg *c, u32 target_rate,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(wrpll_configure_for_rate);
 
 /**
  * wrpll_calc_output_rate() - calculate the PLL's target output rate
@@ -349,6 +351,7 @@ unsigned long wrpll_calc_output_rate(const struct wrpll_cfg *c,
 
 	return n;
 }
+EXPORT_SYMBOL_GPL(wrpll_calc_output_rate);
 
 /**
  * wrpll_calc_max_lock_us() - return the time for the PLL to lock
@@ -366,3 +369,8 @@ unsigned int wrpll_calc_max_lock_us(const struct wrpll_cfg *c)
 {
 	return MAX_LOCK_US;
 }
+EXPORT_SYMBOL_GPL(wrpll_calc_max_lock_us);
+
+MODULE_AUTHOR("Paul Walmsley <paul.walmsley@sifive.com>");
+MODULE_DESCRIPTION("Analog Bits Wide-Range PLL library");
+MODULE_LICENSE("GPL");
-- 
2.40.1

