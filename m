Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79064EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjG0FvA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjG0Fu4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:50:56 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F40030D7
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:50:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d075a831636so545083276.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690437029; x=1691041829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MZ4Kp4lF1KjxsdE0fjXbxu2hcT01qgittw8+AX1ais=;
        b=h+bfSdmuJcHGq81HAm7CZNjALa9Q7lGYF9j8vT7GIusjy5EQpcq2nyAQHS9d9otB75
         R8fotq1ObojKhLjCKd2GR8KvPcK/LGU29G6r0azDMC8d8et5vjU3JSMnb2ulpdwyQvuk
         145gJq13njrZ3PVSOgrPlWAz479/8zeYpuNLzS8SL1SDQ8CaWwcrXuQQU77kFTEWVo2F
         onhWNdF5TqjEl1zQC+SanObeOZD06220z7djStSraWtyy+ecE8/83+zKQNVWpL6DvM3J
         ST1VeH7sFGuu41FmCAUcNr3G3fxTAzw9Tm94lqyHku5pUXAbfA31uv/oe5y69Qtqb+mB
         5j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690437029; x=1691041829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MZ4Kp4lF1KjxsdE0fjXbxu2hcT01qgittw8+AX1ais=;
        b=OfzEeu/Ik/XPOqNZ8Sa5vXpjiiNSwVHK+11aytX7wlctVid91015T+uoU28cmlgwOf
         kv89ANfC7WJhZMEGmZ+qKtWlBeKv5qusSNZUC45e//i3o2j2FXoKOi3K7ECvX0Ldpp3C
         +RetvoZFBukwlR6xDVRMYRbpWeTpPZAIN84hqpxmkmhzN14hV1cQluRx5ZEPcL7gwgU2
         RUM9ozgqTx3Ggl49PBjWjUMat1tVANJHVNwkJjEC9fDpYUjXvgBDAhaGhfvU6Nh6h3uL
         CjKxXHjX7YMozCNOgFsesnfdlI/4wfZxYmDGPe/X7LTx7NeBX4kBFGT/LWrQB71m3qyq
         9HAA==
X-Gm-Message-State: ABy/qLbVqqrQ+DCI8FZxBZQ1Ztc9mNz9GAJyBgGet6pPdIAxbVINvkTD
        YITT6bLkW/JO4ry+e9fUhTU38y7b8va0Au9EeauUF8qa
X-Google-Smtp-Source: APBJJlEIhpktItHVR8GLsrBTfxaptzEbAomzADKwH8ieh3QikL6C736GamLQQJ60kN7bcb9GVJvQGQ==
X-Received: by 2002:a17:902:ec92:b0:1bb:6875:5a73 with SMTP id x18-20020a170902ec9200b001bb68755a73mr3655798plg.2.1690436240057;
        Wed, 26 Jul 2023 22:37:20 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:37:19 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 40/42] clk: at91: clk-system: remove parent_names support
Date:   Thu, 27 Jul 2023 08:31:54 +0300
Message-Id: <20230727053156.13587-41-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove parent_names support as parent_hw support is now available on all
platforms using clk-system driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91rm9200.c  | 2 +-
 drivers/clk/at91/at91sam9260.c | 2 +-
 drivers/clk/at91/at91sam9g45.c | 2 +-
 drivers/clk/at91/at91sam9n12.c | 2 +-
 drivers/clk/at91/at91sam9rl.c  | 2 +-
 drivers/clk/at91/at91sam9x5.c  | 4 ++--
 drivers/clk/at91/clk-system.c  | 9 +++------
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 2 +-
 drivers/clk/at91/sam9x60.c     | 2 +-
 drivers/clk/at91/sama5d2.c     | 2 +-
 drivers/clk/at91/sama5d3.c     | 2 +-
 drivers/clk/at91/sama5d4.c     | 2 +-
 drivers/clk/at91/sama7g5.c     | 2 +-
 14 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 9305cb6eaef2..4b8a9c27cc9e 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -196,7 +196,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	at91rm9200_systemck[5].parent_hw = at91rm9200_pmc->pchws[3];
 	for (i = 0; i < ARRAY_SIZE(at91rm9200_systemck); i++) {
 		hw = at91_clk_register_system(regmap, at91rm9200_systemck[i].n,
-					      NULL, at91rm9200_systemck[i].parent_hw,
+					      at91rm9200_systemck[i].parent_hw,
 					      at91rm9200_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index 97efc39a7e2b..71002ada33dd 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -475,7 +475,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	}
 	for (i = 0; i < data->num_sck; i++) {
 		hw = at91_clk_register_system(regmap, data->sck[i].n,
-					      NULL, data->sck[i].parent_hw,
+					      data->sck[i].parent_hw,
 					      data->sck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index a5bc6f5c8173..bf5951097fca 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -213,7 +213,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	at91sam9g45_systemck[3].parent_hw = at91sam9g45_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9g45_systemck); i++) {
 		hw = at91_clk_register_system(regmap, at91sam9g45_systemck[i].n,
-					      NULL, at91sam9g45_systemck[i].parent_hw,
+					      at91sam9g45_systemck[i].parent_hw,
 					      at91sam9g45_systemck[i].id,
 					      at91sam9g45_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index b4dfe2d1de8a..fa7daab2793b 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -241,7 +241,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	at91sam9n12_systemck[5].parent_hw = at91sam9n12_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9n12_systemck); i++) {
 		hw = at91_clk_register_system(regmap, at91sam9n12_systemck[i].n,
-					      NULL, at91sam9n12_systemck[i].parent_hw,
+					      at91sam9n12_systemck[i].parent_hw,
 					      at91sam9n12_systemck[i].id,
 					      at91sam9n12_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
index 48d79189fc98..eaa757f6670a 100644
--- a/drivers/clk/at91/at91sam9rl.c
+++ b/drivers/clk/at91/at91sam9rl.c
@@ -164,7 +164,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	at91sam9rl_systemck[1].parent_hw = at91sam9rl_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9rl_systemck); i++) {
 		hw = at91_clk_register_system(regmap, at91sam9rl_systemck[i].n,
-					      NULL, at91sam9rl_systemck[i].parent_hw,
+					      at91sam9rl_systemck[i].parent_hw,
 					      at91sam9rl_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 93165263502e..994010f1cf03 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -265,7 +265,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	at91sam9x5_systemck[5].parent_hw = at91sam9x5_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(at91sam9x5_systemck); i++) {
 		hw = at91_clk_register_system(regmap, at91sam9x5_systemck[i].n,
-					      NULL, at91sam9x5_systemck[i].parent_hw,
+					      at91sam9x5_systemck[i].parent_hw,
 					      at91sam9x5_systemck[i].id,
 					      at91sam9x5_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -275,7 +275,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	}
 
 	if (has_lcdck) {
-		hw = at91_clk_register_system(regmap, "lcdck", NULL,
+		hw = at91_clk_register_system(regmap, "lcdck",
 					      at91sam9x5_pmc->chws[PMC_MCK], 3, 0);
 		if (IS_ERR(hw))
 			goto err_free;
diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
index 90eed39d0785..3f626a65ce9c 100644
--- a/drivers/clk/at91/clk-system.c
+++ b/drivers/clk/at91/clk-system.c
@@ -105,7 +105,7 @@ static const struct clk_ops system_ops = {
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
-			 const char *parent_name, struct clk_hw *parent_hw, u8 id,
+			 struct clk_hw *parent_hw, u8 id,
 			 unsigned long flags)
 {
 	struct clk_system *sys;
@@ -113,7 +113,7 @@ at91_clk_register_system(struct regmap *regmap, const char *name,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (!(parent_name || parent_hw) || id > SYSTEM_MAX_ID)
+	if (!parent_hw || id > SYSTEM_MAX_ID)
 		return ERR_PTR(-EINVAL);
 
 	sys = kzalloc(sizeof(*sys), GFP_KERNEL);
@@ -122,10 +122,7 @@ at91_clk_register_system(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &system_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
-	else
-		init.parent_names = &parent_name;
+	init.parent_hws = (const struct clk_hw **)&parent_hw;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_PARENT | flags;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 294e3b0e8a9d..dc8eb6036643 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -1020,7 +1020,7 @@ static void __init of_at91rm9200_clk_sys_setup(struct device_node *np)
 		if (!strcmp(sysclknp->name, "ddrck"))
 			flags = CLK_IS_CRITICAL;
 
-		hw = at91_clk_register_system(regmap, name, NULL, parent_hw,
+		hw = at91_clk_register_system(regmap, name, parent_hw,
 					      id, flags);
 		if (IS_ERR(hw))
 			continue;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 131ef55d3e47..bdb2dfb8fa86 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -242,7 +242,7 @@ at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
-			 const char *parent_name, struct clk_hw *parent_hw,
+			 struct clk_hw *parent_hw,
 			 u8 id, unsigned long flags);
 
 struct clk_hw * __init
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index 68abd0fd47db..f344cbbc9c25 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -335,7 +335,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_systemck[4].parent_hw = sam9x60_pmc->chws[PMC_MCK];
 	for (i = 0; i < ARRAY_SIZE(sam9x60_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sam9x60_systemck[i].n,
-					      NULL, sam9x60_systemck[i].parent_hw,
+					      sam9x60_systemck[i].parent_hw,
 					      sam9x60_systemck[i].id,
 					      sam9x60_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index c64b79b44ba6..0fce17af769e 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -324,7 +324,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	sama5d2_systemck[7].parent_hw = sama5d2_pmc->chws[PMC_MCK];
 	for (i = 0; i < ARRAY_SIZE(sama5d2_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama5d2_systemck[i].n,
-					      NULL, sama5d2_systemck[i].parent_hw,
+					      sama5d2_systemck[i].parent_hw,
 					      sama5d2_systemck[i].id,
 					      sama5d2_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 239806dcd03d..c00380ed0000 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -246,7 +246,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	sama5d3_systemck[7].parent_hw = sama5d3_pmc->pchws[2];
 	for (i = 0; i < ARRAY_SIZE(sama5d3_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama5d3_systemck[i].n,
-					      NULL, sama5d3_systemck[i].parent_hw,
+					      sama5d3_systemck[i].parent_hw,
 					      sama5d3_systemck[i].id,
 					      sama5d3_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index f193460495c0..0d2a834a5903 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -269,7 +269,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	sama5d4_systemck[7].parent_hw = sama5d4_pmc->pchws[2];
 	for (i = 0; i < ARRAY_SIZE(sama5d4_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama5d4_systemck[i].n,
-					      NULL, sama5d4_systemck[i].parent_hw,
+					      sama5d4_systemck[i].parent_hw,
 					      sama5d4_systemck[i].id,
 					      sama5d4_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 0d81a955e686..61f7027f1033 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1183,7 +1183,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < ARRAY_SIZE(sama7g5_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama7g5_systemck[i].n,
-					      NULL, sama7g5_pmc->pchws[i],
+					      sama7g5_pmc->pchws[i],
 					      sama7g5_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.39.2

