Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953FCC0015E
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 21:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjGQVEB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 17:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjGQVEA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 17:04:00 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D3B118
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 14:03:59 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-66f5faba829so3611521b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689627839; x=1692219839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIZEzHVxC1Fx70Cdkz+V0OVQ6Dog78uDmiwE1vZt2q4=;
        b=BPsBDwWrNKB91DqaWrNhpO/v4ykSqWSBCirIAnuxFvOs77l0rqsU8+TqkOv28d6dXr
         WmYVAVFOM9vjv+UHSWcME4r1ezRlHwg5UqohAqTvLNhkEnaX5Hcz/xICNS3d7dBZx2Iv
         GvTFOn4TF4Fw47/Bm6YeEH648hSZrlKW22TNiQ9ZRZR+GIbPaytAhRE0ZhEGwAnWSUOu
         yZ2+3zkaTUHT/MggTaWj1HOAknAkIdJCOfkXNZXkxX6lAcMXp3eJYHfdKdUaRY4p8sqg
         3GBwAf99mw6qFjNqVtSdyTeC8uhdwG9Wb9KnEINmXUoKYaNFsm+NslcdAJtzegeo08S9
         tp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627839; x=1692219839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIZEzHVxC1Fx70Cdkz+V0OVQ6Dog78uDmiwE1vZt2q4=;
        b=RJFM0uH+Jdi85s/Y4tXatK4AnSqoJcFjXuWfFqNqmC+5d8eJCWRxt1V2L5FKFZTBJ2
         f19vYHf2LOHC34uEuypcGKZ1NHNeNUJbgGQskCJnfpp0Gnm64OmB74NapbW9ZpMwZyG8
         EQ+l2yvjwlhbynETKxvKAm3GjVTwd0un7fpA9EUfFCAy1pKaUlraWklBgQOil8w/McIf
         pG0qXAfCPzI8KLZVEWUjYncLOI7URmwvRgoAvBVtBmZSpHG8k7tKQm14nkgrk7XRWnp5
         +rJ0SzyAmXq1qKNemW7LKQTWeOBJV+sqWiKYfkzHMFOujzuzP52nBWElellqG+rcZPWf
         l/hw==
X-Gm-Message-State: ABy/qLaVT+4o5YsKmA7HDj7BvXtxfWx6swj7/uyc4QPLo7Fp7/a45Y5w
        5yLObmuUgla1nSl65MoI+mIoaw==
X-Google-Smtp-Source: APBJJlGh2y7l4Mcb4h+KipYMEFcoZHbETqHgVjohsP4Fa5WcrLA/yfUSBTw5rEOHn+qg1Eica/L75Q==
X-Received: by 2002:a05:6a00:ad1:b0:67d:22a6:2f54 with SMTP id c17-20020a056a000ad100b0067d22a62f54mr790132pfl.31.1689627839264;
        Mon, 17 Jul 2023 14:03:59 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm191915pfe.213.2023.07.17.14.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 14:03:58 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Samuel Holland <samuel.holland@sifive.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] clk: sifive: Allow building the driver as a module
Date:   Mon, 17 Jul 2023 14:03:56 -0700
Message-Id: <20230717210356.2794736-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717210356.2794736-1-samuel.holland@sifive.com>
References: <20230717210356.2794736-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This can reduce the kernel image size in multiplatform configurations.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/clk/sifive/Kconfig       | 2 +-
 drivers/clk/sifive/sifive-prci.c | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

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
index e317f3454e93..8c67d1a7c8df 100644
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
@@ -618,9 +619,6 @@ static struct platform_driver sifive_prci_driver = {
 	},
 	.probe = sifive_prci_probe,
 };
+module_platform_driver(sifive_prci_driver);
 
-static int __init sifive_prci_init(void)
-{
-	return platform_driver_register(&sifive_prci_driver);
-}
-core_initcall(sifive_prci_init);
+MODULE_LICENSE("GPL");
-- 
2.40.1

