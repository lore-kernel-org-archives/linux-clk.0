Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2AAEB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbjG0FpZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232461AbjG0FpH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:45:07 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C85430F2
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:43:53 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-267ffa7e441so437644a91.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436256; x=1691041056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGj8fnk95YF2UgdI2+UIkZtkwoXa64ISRzxRMHwyox0=;
        b=Ywm0o4powSfA2UBaRTJ5e3QOp6qBwwzYfKaQmkfZK/cBIgZdByQLZqDG7g9hldVmrK
         LKfjfKHmR2IiQ/fRAOkdCtHvT7hGVEOHfPjw4z9qJcpoQaDxBaO/lVEoftBYH1QZoagv
         3M+aB/7QeDbpipvYgJez7zdvLG8usjeXwsWeIKaeRK6hdfC3KFeCrk/iU4R1VLMw+22r
         cKNyIA0EtTZrh6B9awVPGuC7Gn+GnvldlKxwprAE6+FGOuZIOVr0TikSguzyb0A9/F3f
         qdnIOg2GLQRDiVojDSeSbSUN1kOm8vQ9QO6+wrqu0NBtZhomZyHr/pKAKCvp22T3a00q
         1smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436256; x=1691041056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGj8fnk95YF2UgdI2+UIkZtkwoXa64ISRzxRMHwyox0=;
        b=Vxa5QSwCpBRUq2Funh/yk5gaafiRrb69XiFX0K53rTM4Rhn2IfWIolUTnFXKlwN+Z1
         krAGKGk56UT6WHl0pcbGng9UTUPHelMo+xBOskXoWF/1RlSGp0VV7lnvjxG8grIIrJfX
         AUqGtXbHwsFEku1iZDITg0AWjsw2L0t+d8Opu5WV3uc+JHM2F7QBU/oWV8X/kYBOVHFh
         4S0i2143Tzs5iSi/NjmMAUByq3bhKhmnI759wqsIs7P+4Cn2+qc8L5qftW64Sldkq1Iz
         JYUy07eXYfjuoNq8JoKOUZ2JNkIBaEjciSxICs61xOyZ6SjrKDTKsKmSW6R0/LRKQ1sy
         n4Kw==
X-Gm-Message-State: ABy/qLbvZrLzt2D00TRn95urE22ytN6sbEqbe0bzh5ewTUlNLR+ID0um
        hBk2JpME3WVP3d+aRawi+Ozgkw==
X-Google-Smtp-Source: APBJJlFvFb4k1Z2ecpW1EVwDrhqZYgAuvp4+vjV9Qd1lMw5gzgmBXW6LFcQ6J7aI7tCDRnM60zb36Q==
X-Received: by 2002:a17:90a:df86:b0:267:f99f:492f with SMTP id p6-20020a17090adf8600b00267f99f492fmr3348479pjv.48.1690436256696;
        Wed, 26 Jul 2023 22:37:36 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:37:36 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 42/42] clk: at91: clk-utmi: remove parent_names support
Date:   Thu, 27 Jul 2023 08:31:56 +0300
Message-Id: <20230727053156.13587-43-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove parent_names support as parent_hw support is now available on all
platforms using clk-utmi driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9g45.c |  2 +-
 drivers/clk/at91/at91sam9rl.c  |  2 +-
 drivers/clk/at91/at91sam9x5.c  |  2 +-
 drivers/clk/at91/clk-utmi.c    | 23 ++++++++---------------
 drivers/clk/at91/dt-compat.c   |  2 +-
 drivers/clk/at91/pmc.h         |  5 ++---
 drivers/clk/at91/sama5d2.c     |  2 +-
 drivers/clk/at91/sama5d3.c     |  2 +-
 drivers/clk/at91/sama5d4.c     |  2 +-
 drivers/clk/at91/sama7g5.c     |  2 +-
 10 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index 1e5262b678f5..1a20ce75201b 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -152,7 +152,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	at91sam9g45_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, at91sam9g45_pmc->chws[PMC_MAIN]);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", at91sam9g45_pmc->chws[PMC_MAIN]);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
index eaa757f6670a..05ea2bf3c73b 100644
--- a/drivers/clk/at91/at91sam9rl.c
+++ b/drivers/clk/at91/at91sam9rl.c
@@ -112,7 +112,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 
 	at91sam9rl_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, at91sam9rl_pmc->chws[PMC_MAIN]);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", at91sam9rl_pmc->chws[PMC_MAIN]);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 1968dd69fbf7..b3a7d5803168 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -200,7 +200,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 
 	at91sam9x5_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, at91sam9x5_pmc->chws[PMC_MAIN]);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", at91sam9x5_pmc->chws[PMC_MAIN]);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index 40c84f5af5e8..8e2cf4893609 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -143,8 +143,7 @@ static const struct clk_ops utmi_ops = {
 static struct clk_hw * __init
 at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 				struct regmap *regmap_sfr,
-				const char *name, const char *parent_name,
-				struct clk_hw *parent_hw,
+				const char *name, struct clk_hw *parent_hw,
 				const struct clk_ops *ops, unsigned long flags)
 {
 	struct clk_utmi *utmi;
@@ -152,7 +151,7 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (!(parent_name || parent_hw))
+	if (!parent_hw)
 		return ERR_PTR(-EINVAL);
 
 	utmi = kzalloc(sizeof(*utmi), GFP_KERNEL);
@@ -161,13 +160,8 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 
 	init.name = name;
 	init.ops = ops;
-	if (parent_hw) {
-		init.parent_hws = parent_hw ? (const struct clk_hw **)&parent_hw : NULL;
-		init.num_parents = parent_hw ? 1 : 0;
-	} else {
-		init.parent_names = parent_name ? &parent_name : NULL;
-		init.num_parents = parent_name ? 1 : 0;
-	}
+	init.parent_hws = parent_hw ? (const struct clk_hw **)&parent_hw : NULL;
+	init.num_parents = parent_hw ? 1 : 0;
 	init.flags = flags;
 
 	utmi->hw.init = &init;
@@ -186,11 +180,10 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
-		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw)
+		       const char *name, struct clk_hw *parent_hw)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, regmap_sfr, name,
-			parent_name, parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
+			parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
 }
 
 static int clk_utmi_sama7g5_prepare(struct clk_hw *hw)
@@ -289,8 +282,8 @@ static const struct clk_ops sama7g5_utmi_ops = {
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap_pmc, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw)
+			       struct clk_hw *parent_hw)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, NULL, name,
-			parent_name, parent_hw, &sama7g5_utmi_ops, 0);
+			parent_hw, &sama7g5_utmi_ops, 0);
 }
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 285ede5d6702..68211b36c8f6 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -1189,7 +1189,7 @@ static void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np)
 			regmap_sfr = NULL;
 	}
 
-	hw = at91_clk_register_utmi(regmap_pmc, regmap_sfr, name, NULL, parent_hw);
+	hw = at91_clk_register_utmi(regmap_pmc, regmap_sfr, name, parent_hw);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 5e65f5b59536..889230d29bf2 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -263,11 +263,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
-		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw);
+		       const char *name, struct clk_hw *parent_hw);
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw);
+			       struct clk_hw *parent_hw);
 
 #endif /* __PMC_H_ */
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index fa14c6f7d37a..cf1f34a69862 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -253,7 +253,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap_sfr))
 		regmap_sfr = NULL;
 
-	hw = at91_clk_register_utmi(regmap, regmap_sfr, "utmick", NULL,
+	hw = at91_clk_register_utmi(regmap, regmap_sfr, "utmick",
 				    sama5d2_pmc->chws[PMC_MAIN]);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 0713a6b21c8a..707e501b1a73 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -179,7 +179,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 
 	sama5d3_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, mainck_hw);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", mainck_hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index d0bd025876ac..542c7cccda46 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -194,7 +194,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	sama5d4_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, mainck_hw);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", mainck_hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 61f7027f1033..012e992ce14b 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1151,7 +1151,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
 	}
 
-	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL, main_xtal_hw);
+	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", main_xtal_hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.39.2

