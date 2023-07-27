Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA23EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjG0Fow (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjG0FoZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:44:25 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22C43ABB
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:43:06 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bba54f7eefso11597005ad.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436196; x=1691040996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ByePe5DbQDlx4lAkxeKpmFm+qeO1gWfKXQQMnKlrww=;
        b=jOsuR1pJ6p+T0RXaWm+bg+0pSTTcoYNwaUJJ7b6ofHkn/FvRS6BvSv/U8dU5ZyVo4K
         uw26yqnLwmNcjgB+iEO/l5cGtkrjDbdpFfIcgOP4Dc7zS0+H1ijaX/WWd5Fcui7Yj+RZ
         LcD2cDWYdTv7Rn9Kmc6t/R7r7VnUumQFa4T9T4EXfRYP6K268dKKpka/spxSncyvONQs
         vvoyv7pRCotPkGypQFga2Mm0ufvIhwZ/C6nvL/WyMxiDVimTWoKA6/hI3b2P6XjRN8p2
         5ZBsUGEcDi7LfqAslqvZjyfA8vg1xXcRCjdClPjlqPh/SxQiYEBF/16yGv9Fs0XQHjh+
         G8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436196; x=1691040996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ByePe5DbQDlx4lAkxeKpmFm+qeO1gWfKXQQMnKlrww=;
        b=g00ujx8TO6pOVCHJgm0Nh8V8bJtwLyQ8H6S7QM6YC8cmp6JtVvjnpqEr3km/jYkXBh
         w0aqzmaGG62mKRRrwdCu/XIn2l8dVmwdKLwytg1jbW65eB0JZXmzcigpCY374l5qUtPl
         E1u+bijha9UWMJYg/yaphpyCOeS6KtcCa9i4fXmuda/0fhk4s1gKKlCeclPGN61yUu3Z
         e6NTlql26Dj5fCYmMlBTfkw0FnH5YTRXUIGrSWuhqeRYt5JoI1tGow5PXNfJQ23aYeiM
         YgTGJXXFwqOnQB8fDwU8tBuz25jimhh1ZVGHD28pwBXXpaHgAH042sp0lFgH8TRHFmiV
         Jj2Q==
X-Gm-Message-State: ABy/qLblY7auy69RpfYfj9OiiNxOorApZ8npzFuobU+8mo6pxBE4x2i5
        lsy6MV8ecRb0dT2Od3E3LYCj5AnR3K0a/QDKg14erKUZ
X-Google-Smtp-Source: APBJJlEe+63OnRONr3wZoGDYR7Z2G7TPoO0Mvk3H1ayi9D/amEEYYcLJK00E/hIcMCjtsLvLG9xeUQ==
X-Received: by 2002:a17:902:d2cb:b0:1bb:b2f7:e075 with SMTP id n11-20020a170902d2cb00b001bbb2f7e075mr2143020plc.7.1690436195828;
        Wed, 26 Jul 2023 22:36:35 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:36:35 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 34/42] clk: at91: clk-pll: remove parent_names support
Date:   Thu, 27 Jul 2023 08:31:48 +0300
Message-Id: <20230727053156.13587-35-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove parent_names support as parent_hw support is now available on all
platforms using clk-pll driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91rm9200.c  | 4 ++--
 drivers/clk/at91/at91sam9260.c | 4 ++--
 drivers/clk/at91/at91sam9g45.c | 2 +-
 drivers/clk/at91/at91sam9n12.c | 4 ++--
 drivers/clk/at91/at91sam9rl.c  | 2 +-
 drivers/clk/at91/at91sam9x5.c  | 2 +-
 drivers/clk/at91/clk-pll.c     | 7 ++-----
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 2 +-
 drivers/clk/at91/sama5d2.c     | 2 +-
 drivers/clk/at91/sama5d3.c     | 2 +-
 drivers/clk/at91/sama5d4.c     | 2 +-
 12 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 7cb90d71d0ce..be88279c3443 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -126,7 +126,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91rm9200_pmc->chws[PMC_MAIN], 0,
+	hw = at91_clk_register_pll(regmap, "pllack", at91rm9200_pmc->chws[PMC_MAIN], 0,
 				   &at91rm9200_pll_layout,
 				   &rm9200_pll_characteristics);
 	if (IS_ERR(hw))
@@ -134,7 +134,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllbck", NULL, at91rm9200_pmc->chws[PMC_MAIN], 1,
+	hw = at91_clk_register_pll(regmap, "pllbck", at91rm9200_pmc->chws[PMC_MAIN], 1,
 				   &at91rm9200_pll_layout,
 				   &rm9200_pll_characteristics);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index 9839bd4586cd..bd5e0ce432d3 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -398,7 +398,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		slow_xtal_hw = hw;
 	}
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91sam9260_pmc->chws[PMC_MAIN], 0,
+	hw = at91_clk_register_pll(regmap, "pllack", at91sam9260_pmc->chws[PMC_MAIN], 0,
 				   data->plla_layout,
 				   data->plla_characteristics);
 	if (IS_ERR(hw))
@@ -406,7 +406,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllbck", NULL, at91sam9260_pmc->chws[PMC_MAIN], 1,
+	hw = at91_clk_register_pll(regmap, "pllbck", at91sam9260_pmc->chws[PMC_MAIN], 1,
 				   data->pllb_layout,
 				   data->pllb_characteristics);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index e7f2173ff6c1..ca585440c54f 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -141,7 +141,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	at91sam9g45_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91sam9g45_pmc->chws[PMC_MAIN], 0,
+	hw = at91_clk_register_pll(regmap, "pllack", at91sam9g45_pmc->chws[PMC_MAIN], 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index 2d26c202b257..2109b8cdf4ad 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -167,7 +167,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 
 	at91sam9n12_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91sam9n12_pmc->chws[PMC_MAIN], 0,
+	hw = at91_clk_register_pll(regmap, "pllack", at91sam9n12_pmc->chws[PMC_MAIN], 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
@@ -178,7 +178,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 
 	at91sam9n12_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllbck", NULL, at91sam9n12_pmc->chws[PMC_MAIN], 1,
+	hw = at91_clk_register_pll(regmap, "pllbck", at91sam9n12_pmc->chws[PMC_MAIN], 1,
 				   &at91rm9200_pll_layout, &pllb_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
index c7fc4bcf4e5b..4ae8028600d5 100644
--- a/drivers/clk/at91/at91sam9rl.c
+++ b/drivers/clk/at91/at91sam9rl.c
@@ -104,7 +104,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 
 	at91sam9rl_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91sam9rl_pmc->chws[PMC_MAIN], 0,
+	hw = at91_clk_register_pll(regmap, "pllack", at91sam9rl_pmc->chws[PMC_MAIN], 0,
 				   &at91rm9200_pll_layout,
 				   &sam9rl_plla_characteristics);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 8da2732a73fa..4cbb72a29f14 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -189,7 +189,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 
 	at91sam9x5_pmc->chws[PMC_MAIN] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, at91sam9x5_pmc->chws[PMC_MAIN], 0,
+	hw = at91_clk_register_pll(regmap, "pllack", at91sam9x5_pmc->chws[PMC_MAIN], 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/clk-pll.c b/drivers/clk/at91/clk-pll.c
index afd48cbaa6db..2ba068718f83 100644
--- a/drivers/clk/at91/clk-pll.c
+++ b/drivers/clk/at91/clk-pll.c
@@ -310,7 +310,7 @@ static const struct clk_ops pll_ops = {
 
 struct clk_hw * __init
 at91_clk_register_pll(struct regmap *regmap, const char *name,
-		      const char *parent_name, struct clk_hw *parent_hw, u8 id,
+		      struct clk_hw *parent_hw, u8 id,
 		      const struct clk_pll_layout *layout,
 		      const struct clk_pll_characteristics *characteristics)
 {
@@ -330,10 +330,7 @@ at91_clk_register_pll(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &pll_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
-	else
-		init.parent_names = &parent_name;
+	init.parent_hws = (const struct clk_hw **)&parent_hw;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 8f67a7a94c54..13e251e59853 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -740,7 +740,7 @@ of_at91_clk_pll_setup(struct device_node *np,
 	if (!characteristics)
 		return;
 
-	hw = at91_clk_register_pll(regmap, name, NULL, parent_hw, id, layout,
+	hw = at91_clk_register_pll(regmap, name, parent_hw, id, layout,
 				   characteristics);
 	if (IS_ERR(hw))
 		goto out_free_characteristics;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 54088c6d4de4..5fd1e76b3ec7 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -202,7 +202,7 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_pll(struct regmap *regmap, const char *name,
-		      const char *parent_name, struct clk_hw *parent_hw, u8 id,
+		      struct clk_hw *parent_hw, u8 id,
 		      const struct clk_pll_layout *layout,
 		      const struct clk_pll_characteristics *characteristics);
 struct clk_hw * __init
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 809926c63078..b99a8bb9bf9a 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -221,7 +221,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_MAIN] = hw;
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, sama5d2_pmc->chws[PMC_MAIN], 0,
+	hw = at91_clk_register_pll(regmap, "pllack", sama5d2_pmc->chws[PMC_MAIN], 0,
 				   &sama5d3_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 4453f47798b7..35a9dfd0e66d 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -168,7 +168,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (IS_ERR(mainck_hw))
 		goto err_free;
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, mainck_hw, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", mainck_hw, 0,
 				   &sama5d3_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 9f6ad0699702..ae76c59c7d42 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -183,7 +183,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_pll(regmap, "pllack", NULL, mainck_hw, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", mainck_hw, 0,
 				   &sama5d3_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
-- 
2.39.2

