Return-Path: <SRS0=1QlQ=6M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19067C83000
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 20:49:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0FC0206D9
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 20:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588106988;
	bh=4dLZQyIls8SsFJA/GvURbExnwU39K7JZqw86OU67TbM=;
	h=From:To:List-Id:Cc:Subject:Date:List-ID:From;
	b=hyYNH6xDfnSjvarm/FuaQD52wJ4Y/VZtLoFKLvAB70mZNzPzKdb6LuCpyevCdVl1d
	 HGCWA8HCoJGwTenOxSfDVqZp7qQ8ZnY1LqUb86Y94v+HDwwwq9K4V5eUZp3bDGDeiq
	 QVIT1THsavrm1Tv4Kyfp6b2TzEoj6kEWuQBJQa1A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgD1Uts (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Apr 2020 16:49:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33909 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgD1Uts (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Apr 2020 16:49:48 -0400
Received: by mail-ot1-f67.google.com with SMTP id 72so35257584otu.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2020 13:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6EeJQUcQx1ZUEC6Sz+HmpaKf0KrWlHRUUSnQJGXOOU4=;
        b=KbQWiTwy54Uhju4tW4J+XKFNnulKmANTtJ61RSbe3h8+Ei7z6/om/oplL2Kk7e/FY/
         QGUeTrSGtVNPma3/WBSQxcTmK126PUgK3Chqy2aiGpXUKOZwSF8Ok8EriK//qOCqE17u
         xGOMHL11EzcsYXoI25M1UjCiA1FAMf89fgMqH3VVJMQGSDCTNnw6/1kcalHsYbtzmNAa
         YMBZX81LgPR2GbnhsfxTdnFjA6oe3j9RarVrja151hoTVkh1j5xxA5zpgU2PS/AxTewT
         Sr94hGOMtqlh5w1eKoeOZO61eoELbQQVytiUKB1+0WVNvVj26bqWlBjPqepTJu/kETwr
         0BuQ==
X-Gm-Message-State: AGi0PuYoA9v4J3JcRutAZLQaPr6dir57TP9AKJvJqkGUaKAXE1oOu9Cf
        YJUncy0WNiWQz7gfoTQMcQ==
X-Google-Smtp-Source: APiQypImciVBBbDsKwb7MoERjDQFaLAa6CEeYV+23Ln+YWTVS91K0H71jB579oSoRpkXUBz4Xdp2+A==
X-Received: by 2002:a9d:7414:: with SMTP id n20mr25652200otk.61.1588106987239;
        Tue, 28 Apr 2020 13:49:47 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id r67sm5109606oie.19.2020.04.28.13.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 13:49:46 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc:     soc@kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: versatile: Drop the legacy IM-PD1 clock code
Date:   Tue, 28 Apr 2020 15:49:45 -0500
Message-Id: <20200428204945.21067-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that the non-DT IM-PD1 support code has been removed, drop the clock
related code from clk-impd1.c.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This is depends on the pending IM-PD1 DT support Linus has queued up. 
Perhaps apply on top of his PR '[GIT PULL] Versatile changes for v5.8 
take 1'.

 drivers/clk/versatile/clk-impd1.c            | 121 -------------------
 include/linux/platform_data/clk-integrator.h |   2 -
 2 files changed, 123 deletions(-)
 delete mode 100644 include/linux/platform_data/clk-integrator.h

diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index b05da8516d4c..95129d39a44b 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -8,7 +8,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/clk-integrator.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
@@ -20,26 +19,6 @@
 #define IMPD1_OSC2	0x04
 #define IMPD1_LOCK	0x08
 
-struct impd1_clk {
-	char *pclkname;
-	struct clk *pclk;
-	char *vco1name;
-	struct clk *vco1clk;
-	char *vco2name;
-	struct clk *vco2clk;
-	struct clk *mmciclk;
-	char *uartname;
-	struct clk *uartclk;
-	char *spiname;
-	struct clk *spiclk;
-	char *scname;
-	struct clk *scclk;
-	struct clk_lookup *clks[15];
-};
-
-/* One entry for each connected IM-PD1 LM */
-static struct impd1_clk impd1_clks[4];
-
 /*
  * There are two VCO's on the IM-PD1
  */
@@ -80,106 +59,6 @@ static const struct clk_icst_desc impd1_icst2_desc = {
 	.lock_offset = IMPD1_LOCK,
 };
 
-/**
- * integrator_impd1_clk_init() - set up the integrator clock tree
- * @base: base address of the logic module (LM)
- * @id: the ID of this LM
- */
-void integrator_impd1_clk_init(void __iomem *base, unsigned int id)
-{
-	struct impd1_clk *imc;
-	struct clk *clk;
-	struct clk *pclk;
-	int i;
-
-	if (id > 3) {
-		pr_crit("no more than 4 LMs can be attached\n");
-		return;
-	}
-	imc = &impd1_clks[id];
-
-	/* Register the fixed rate PCLK */
-	imc->pclkname = kasprintf(GFP_KERNEL, "lm%x-pclk", id);
-	pclk = clk_register_fixed_rate(NULL, imc->pclkname, NULL, 0, 0);
-	imc->pclk = pclk;
-
-	imc->vco1name = kasprintf(GFP_KERNEL, "lm%x-vco1", id);
-	clk = icst_clk_register(NULL, &impd1_icst1_desc, imc->vco1name, NULL,
-				base);
-	imc->vco1clk = clk;
-	imc->clks[0] = clkdev_alloc(pclk, "apb_pclk", "lm%x:01000", id);
-	imc->clks[1] = clkdev_alloc(clk, NULL, "lm%x:01000", id);
-
-	/* VCO2 is also called "CLK2" */
-	imc->vco2name = kasprintf(GFP_KERNEL, "lm%x-vco2", id);
-	clk = icst_clk_register(NULL, &impd1_icst2_desc, imc->vco2name, NULL,
-				base);
-	imc->vco2clk = clk;
-
-	/* MMCI uses CLK2 right off */
-	imc->clks[2] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00700", id);
-	imc->clks[3] = clkdev_alloc(clk, NULL, "lm%x:00700", id);
-
-	/* UART reference clock divides CLK2 by a fixed factor 4 */
-	imc->uartname = kasprintf(GFP_KERNEL, "lm%x-uartclk", id);
-	clk = clk_register_fixed_factor(NULL, imc->uartname, imc->vco2name,
-				   CLK_IGNORE_UNUSED, 1, 4);
-	imc->uartclk = clk;
-	imc->clks[4] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00100", id);
-	imc->clks[5] = clkdev_alloc(clk, NULL, "lm%x:00100", id);
-	imc->clks[6] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00200", id);
-	imc->clks[7] = clkdev_alloc(clk, NULL, "lm%x:00200", id);
-
-	/* SPI PL022 clock divides CLK2 by a fixed factor 64 */
-	imc->spiname = kasprintf(GFP_KERNEL, "lm%x-spiclk", id);
-	clk = clk_register_fixed_factor(NULL, imc->spiname, imc->vco2name,
-				   CLK_IGNORE_UNUSED, 1, 64);
-	imc->clks[8] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00300", id);
-	imc->clks[9] = clkdev_alloc(clk, NULL, "lm%x:00300", id);
-
-	/* The GPIO blocks and AACI have only PCLK */
-	imc->clks[10] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00400", id);
-	imc->clks[11] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00500", id);
-	imc->clks[12] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00800", id);
-
-	/* Smart Card clock divides CLK2 by a fixed factor 4 */
-	imc->scname = kasprintf(GFP_KERNEL, "lm%x-scclk", id);
-	clk = clk_register_fixed_factor(NULL, imc->scname, imc->vco2name,
-				   CLK_IGNORE_UNUSED, 1, 4);
-	imc->scclk = clk;
-	imc->clks[13] = clkdev_alloc(pclk, "apb_pclk", "lm%x:00600", id);
-	imc->clks[14] = clkdev_alloc(clk, NULL, "lm%x:00600", id);
-
-	for (i = 0; i < ARRAY_SIZE(imc->clks); i++)
-		clkdev_add(imc->clks[i]);
-}
-EXPORT_SYMBOL_GPL(integrator_impd1_clk_init);
-
-void integrator_impd1_clk_exit(unsigned int id)
-{
-	int i;
-	struct impd1_clk *imc;
-
-	if (id > 3)
-		return;
-	imc = &impd1_clks[id];
-
-	for (i = 0; i < ARRAY_SIZE(imc->clks); i++)
-		clkdev_drop(imc->clks[i]);
-	clk_unregister(imc->spiclk);
-	clk_unregister(imc->uartclk);
-	clk_unregister(imc->vco2clk);
-	clk_unregister(imc->vco1clk);
-	clk_unregister(imc->pclk);
-	kfree(imc->scname);
-	kfree(imc->spiname);
-	kfree(imc->uartname);
-	kfree(imc->vco2name);
-	kfree(imc->vco1name);
-	kfree(imc->pclkname);
-}
-EXPORT_SYMBOL_GPL(integrator_impd1_clk_exit);
-
 static int integrator_impd1_clk_spawn(struct device *dev,
 				      struct device_node *parent,
 				      struct device_node *np)
diff --git a/include/linux/platform_data/clk-integrator.h b/include/linux/platform_data/clk-integrator.h
deleted file mode 100644
index addd48cac625..000000000000
--- a/include/linux/platform_data/clk-integrator.h
+++ /dev/null
@@ -1,2 +0,0 @@
-void integrator_impd1_clk_init(void __iomem *base, unsigned int id);
-void integrator_impd1_clk_exit(unsigned int id);
-- 
2.20.1

