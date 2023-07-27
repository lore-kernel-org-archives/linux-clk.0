Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5D9C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbjG0Fer (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbjG0Feg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:34:36 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04548272B
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:34:05 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55af0a816e4so300044a12.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436029; x=1691040829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm/m0e6p3OI9IQEk5rZymWEUT0ucuiLYWwUROUbSNCM=;
        b=LRKNwtfgw+/7uaq/ShJREdXltre+wvD8ytba7Jl1febDV3zkicZqG0LuPKUMz85FVz
         jh6TEBNC6CJjxz/svE8Ut6ZE0+eqIDy6oMGtIBrjnEhjtOyqM9TPUKpXxicgKkp+IAnG
         Bo1NhLeMPX9PeVPcpSrWpFCbCwHSeVMXZfTCNYbVCl7BAcDTRFa8GIbneaTFkBZQWyRy
         ZwhlFgS9//RYBu021feAcA7161D+4z+COoWXRPDKx9gCjX9rFzfr/RK+zihOhMqDoDK3
         P5wdxPxZfXsLb6j0dxB1qgH7SN25iXHTB+/8OMYKfcXvvmy+DYn9xuLVXWjRjjZXe0cg
         /7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436029; x=1691040829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm/m0e6p3OI9IQEk5rZymWEUT0ucuiLYWwUROUbSNCM=;
        b=M8BQ7/3ksYPCWz3j/AG1uzPGDuqbyuXmcTXtnL3nAJEgq6Lza5qXLIfnA68KKEvIG4
         lh6XDM8hos6wtOLDGzCpdtrSX5q57HqeZRQ4SS91GXYz7SsCz72S8pKuC3zloA55brL7
         bKgwynVET8ULL2neqP2u/vDFI8WpyO/MPtxx5qwk1mEjmCWmCgWunpNLRy4IvuOiK0eI
         va2BoBTdgkhBFnbBfImFjieuezwyEoV4YZKlmm6zmjTPaw98VMjgX/hY80CVelPinepw
         UUzbYzFA8DdajWfWALK8eI4aKgC6ZqK6vJ6g3tLrT0YacdFS3W64K+WjlzFv9hTqNzZq
         xtdA==
X-Gm-Message-State: ABy/qLbmd9h9POeYD+PzeJQayXFN5tYv4oDMw2ohKKwWfnQf5wQzjIWB
        yk0JEI0Qm73uOatvI6T0HcyPNA==
X-Google-Smtp-Source: APBJJlGHPnyfRyR77fjalSkvJheNxztCmO6x2PKs8UOpLJLblBDPwinyWiRD3cBOqRiVi72luo0YRA==
X-Received: by 2002:a17:902:c106:b0:1bb:8f37:dd0f with SMTP id 6-20020a170902c10600b001bb8f37dd0fmr3289035pli.45.1690436029073;
        Wed, 26 Jul 2023 22:33:49 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:33:48 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 11/42] clk: at91: clk-smd: add support for parent_hw
Date:   Thu, 27 Jul 2023 08:31:25 +0300
Message-Id: <20230727053156.13587-12-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for parent_hw in smd clock drivers.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-smd were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9x5.c |  2 +-
 drivers/clk/at91/clk-smd.c    | 10 +++++++---
 drivers/clk/at91/dt-compat.c  |  2 +-
 drivers/clk/at91/pmc.h        |  3 ++-
 drivers/clk/at91/sama5d3.c    |  2 +-
 drivers/clk/at91/sama5d4.c    |  2 +-
 6 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 37280852f086..13331e015dd7 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -226,7 +226,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
+	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index 09c649c8598e..2c8432cc2fe6 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -111,11 +111,12 @@ static const struct clk_ops at91sam9x5_smd_ops = {
 
 struct clk_hw * __init
 at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents)
+			    const char **parent_names, struct clk_hw **parent_hws,
+			    u8 num_parents)
 {
 	struct at91sam9x5_clk_smd *smd;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	smd = kzalloc(sizeof(*smd), GFP_KERNEL);
@@ -124,7 +125,10 @@ at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &at91sam9x5_smd_ops;
-	init.parent_names = parent_names;
+	if (parent_hws)
+		init.parent_hws = (const struct clk_hw **)parent_hws;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index f0498d9c269c..f464e125c9fd 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -858,7 +858,7 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9x5_clk_register_smd(regmap, name, parent_names,
+	hw = at91sam9x5_clk_register_smd(regmap, name, parent_names, NULL,
 					 num_parents);
 	if (IS_ERR(hw))
 		return;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index e1fd87aebd27..541d2ba2fea5 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -248,7 +248,8 @@ at91_clk_register_sam9260_slow(struct regmap *regmap,
 
 struct clk_hw * __init
 at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents);
+			    const char **parent_names, struct clk_hw **parent_hws,
+			    u8 num_parents);
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 7f2ac8f648dd..8326bb6a291c 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -205,7 +205,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
+	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 04c848cd7001..1ff9286148da 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -228,7 +228,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
+	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.39.2

