Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFB0EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbjG0Fib (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjG0FiE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:38:04 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2B62D47
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:37:15 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bb7b8390e8so3292355ad.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436167; x=1691040967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeeIlCY0YkV9dl6D14N0gEidgFKUnfmPXMsUhAICJi0=;
        b=ccDxRKhV5iS27apESIGTH5S5TCn6nV4keOklEAis81F2zhY4N9inDuLRgxBE5iGomf
         M0bK11YSAQgCFbRKafhDBzlGQX0BvaNJYkD6BOnyHiZ/WMvvw3V4KcDjBrwXCFJaGFWx
         Xx1NdWp/31agRWMwF/Z+AhDx4fRgq38/9Jx+WJaUvb6gR5hJAe5MmTTOyCCdqKeqozpg
         2vh1qSTVe7WumG6hJuoNMchDXuCSmFE8Slb8zUGW6JPmNQKPHtiz76OEnmcdTB0+M/0w
         ktvv0TRJpNio/k249dPGioypgnnd0RFh1H90yCDBkXt1XRIlnXzIvk98ehbvntY/N9mZ
         7flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436167; x=1691040967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeeIlCY0YkV9dl6D14N0gEidgFKUnfmPXMsUhAICJi0=;
        b=jVpDuU2tI9CKUHMv24mhACVCqEPmOlTIF4F6n/5V/h4QrcAv+6Jse51tQGH/snfSiZ
         zURg2cFX24zGFmLN9m31kQJW8jjyi+a4Tg8MgdGeKIv/eg2WGE8H2usuE61zfdZVA7m2
         grV36N+HdlPn0VcNzeoJBYYy9YHcCLyqk801Vfcgx1+JuB/heOVaHVHpqQqWl46jbbEm
         5oPa0IiYi+lyUIs4bmIQ/BqkQsvqEnHC7tPNFVcEDk8cvC+AUH11EtLJJC8Q9b4jH4r1
         tAMxUFAo83/9oqeAR1OyYfFlV9DXtNKL3A3qGBjJCAeAQlptFw2jKvu/oM2UBDMgo8kw
         6+mg==
X-Gm-Message-State: ABy/qLYh8oDeHb4ej8YbOKS7j2oU50y5f21pQPr/ivl7nD+WKsP9cS4W
        eemfadqDdWxZJX2gKEZSFoubEg==
X-Google-Smtp-Source: APBJJlF/XwQZpd1LX1Lt4eTiYkh6jAVDh1H64Ef5bGckyVA4hPgK35Lo58LEqcGOZDq2Sh17vE+m1w==
X-Received: by 2002:a17:902:e5c4:b0:1bb:c87d:756d with SMTP id u4-20020a170902e5c400b001bbc87d756dmr4130989plf.42.1690436167186;
        Wed, 26 Jul 2023 22:36:07 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:36:06 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 30/42] clk: at91: clk-i2s-mux: remove parent_names support
Date:   Thu, 27 Jul 2023 08:31:44 +0300
Message-Id: <20230727053156.13587-31-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove parent_names support as parent_hw support is now available on all
platforms using clk-i2s-mux driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/clk-i2s-mux.c | 8 ++------
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 3 +--
 drivers/clk/at91/sama5d2.c     | 4 ++--
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/at91/clk-i2s-mux.c b/drivers/clk/at91/clk-i2s-mux.c
index f1981b8ee18d..ea84e8f5becd 100644
--- a/drivers/clk/at91/clk-i2s-mux.c
+++ b/drivers/clk/at91/clk-i2s-mux.c
@@ -50,8 +50,7 @@ static const struct clk_ops clk_i2s_mux_ops = {
 
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
-			  const char * const *parent_names, struct clk_hw **parent_hws,
-			  unsigned int num_parents, u8 bus_id)
+			  struct clk_hw **parent_hws, unsigned int num_parents, u8 bus_id)
 {
 	struct clk_init_data init = {};
 	struct clk_i2s_mux *i2s_ck;
@@ -63,10 +62,7 @@ at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &clk_i2s_mux_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
-	else
-		init.parent_names = parent_names;
+	init.parent_hws = (const struct clk_hw **)parent_hws;
 	init.num_parents = num_parents;
 
 	i2s_ck->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 058b65c2d88d..7ab116a6e701 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -279,7 +279,7 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 			continue;
 
 		hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
-					       NULL, parent_hws, 2, bus_id);
+					       parent_hws, 2, bus_id);
 		if (IS_ERR(hw))
 			continue;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 11f7ab4d1ad8..07f372abcfd0 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -153,8 +153,7 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
-			  const char * const *parent_names, struct clk_hw **parent_hws,
-			  unsigned int num_parents, u8 bus_id);
+			  struct clk_hw **parent_hws, unsigned int num_parents, u8 bus_id);
 
 struct clk_hw * __init
 at91_clk_register_main_rc_osc(struct regmap *regmap, const char *name,
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 93c646e0b6ef..17a40cedd7fb 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -385,7 +385,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		parent_hws[0] = sama5d2_pmc->phws[54]; /* i2s0_clk */
 		parent_hws[1] = sama5d2_pmc->phws[54]; /* i2s0_gclk */
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s0_muxclk",
-					       NULL, parent_hws, 2, 0);
+					       parent_hws, 2, 0);
 		if (IS_ERR(hw))
 			goto err_free;
 
@@ -394,7 +394,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		parent_hws[0] = sama5d2_pmc->phws[55]; /* i2s1_clk */
 		parent_hws[1] = sama5d2_pmc->ghws[55]; /* i2s1_gclk */
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s1_muxclk",
-					       NULL, parent_hws, 2, 1);
+					       parent_hws, 2, 1);
 		if (IS_ERR(hw))
 			goto err_free;
 
-- 
2.39.2

