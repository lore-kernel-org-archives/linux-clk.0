Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84720EB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 00:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjGYAnB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 20:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjGYAnA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 20:43:00 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F511999
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 17:42:52 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-56352146799so3493861eaf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 17:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245772; x=1690850572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb3Vvpjv1LmFtv57q/x9jijKmz7uqCPq02odS2uEdoE=;
        b=NJz5PqvzKA92Zx6p/keou7qhR4dQjMQTGZKceWN2gyyZABNNExi9h9o6AsUcaoHajk
         l2JHilIUtr+3NvwhkDMJHlH7sAUJQRGdWWLCPwhZWey4RMvp8ksoxj3Q+7fb6fXuQu2S
         FIlXGfZFfparRohpUUi7z8Aa58ncz1lz0ihykjLa8mM3fdx9rBxIei/vy4OcsRc0OxRz
         Nbpp5bkxj6JFCFYct3COrH2sM7Lh8rrWSATU1tzBP0K7o3qOO/YomOpvn6ExEeKE0DBh
         0V4ipv7rGgmC2k1QtEcavM2waIfEj41z2ths0NsmFwxUs2TlDUXssTL2sG+D8vkbbGNH
         ImPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245772; x=1690850572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cb3Vvpjv1LmFtv57q/x9jijKmz7uqCPq02odS2uEdoE=;
        b=akaXvKjlUCaOGnYbpStHuk058SMDrbnE2KjW1CiHT3Kw0hB5wpGsOQnfrggFm1Vlun
         h8NFAEsCjGxvX4l8JL6wVNlmADTV/rQcBtBNt1awEZ+PJHEq9t9mKCviYOk8iZwpubha
         ROHHfy87ycJYF/aXoSGXJlI8llZ36WhtoXvNZW6Lqtp5+kZnraOTZJ1/WKlkX//ooTPd
         /1SGE+wKWWnrqNsmwemMsPEL7kVy5oZpQkaHQrNT0HbDJqYNzQNN8jmurmgpK3BqhRW0
         /nIq1/6V7ooWHN3rA/XzfvKRhEeSzw4IJnQnfXcloLw7kq5K9t/BAxi8nzAq+m9mWmhp
         mZoQ==
X-Gm-Message-State: ABy/qLYY4rH566a2u5k5JRZYnOr2MmoZb7Hk00rA0T8LQhtS114J6wZn
        9lQNYDnQoVUbax9FucuUrYv44w==
X-Google-Smtp-Source: APBJJlEx7Lam5DEiLmiCEtXu/zND0jtP2cw7V2ldx1yMXL+Jl9Vp1s5OuX0uRGjreEk9+0xSHerGvQ==
X-Received: by 2002:a05:6358:52d0:b0:132:d07d:8f3b with SMTP id z16-20020a05635852d000b00132d07d8f3bmr11668726rwz.28.1690245771818;
        Mon, 24 Jul 2023 17:42:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id u135-20020a63798d000000b00553b9e0510esm9042655pgc.60.2023.07.24.17.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:42:51 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] clk: sifive: Allow building the driver as a module
Date:   Mon, 24 Jul 2023 17:42:48 -0700
Message-Id: <20230725004248.381868-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725004248.381868-1-samuel.holland@sifive.com>
References: <20230725004248.381868-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This can reduce the kernel image size in multiplatform configurations.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Add MODULE_AUTHOR and MODULE_DESCRIPTION

 drivers/clk/sifive/Kconfig       |  2 +-
 drivers/clk/sifive/sifive-prci.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 2322f634a910..49597d95602e 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -10,7 +10,7 @@ menuconfig CLK_SIFIVE
 if CLK_SIFIVE
 
 config CLK_SIFIVE_PRCI
-	bool "PRCI driver for SiFive SoCs"
+	tristate "PRCI driver for SiFive SoCs"
 	default ARCH_SIFIVE
 	select RESET_CONTROLLER
 	select RESET_SIMPLE
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index e317f3454e93..09a76248a710 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -7,6 +7,7 @@
 #include <linux/clkdev.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include "sifive-prci.h"
 #include "fu540-prci.h"
@@ -618,9 +619,8 @@ static struct platform_driver sifive_prci_driver = {
 	},
 	.probe = sifive_prci_probe,
 };
+module_platform_driver(sifive_prci_driver);
 
-static int __init sifive_prci_init(void)
-{
-	return platform_driver_register(&sifive_prci_driver);
-}
-core_initcall(sifive_prci_init);
+MODULE_AUTHOR("Paul Walmsley <paul.walmsley@sifive.com>");
+MODULE_DESCRIPTION("SiFive Power Reset Clock Interface (PRCI) driver");
+MODULE_LICENSE("GPL");
-- 
2.40.1

