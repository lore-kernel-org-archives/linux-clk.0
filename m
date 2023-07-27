Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10036C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:34:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjG0Fe3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjG0FeN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:34:13 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8AF30C6
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:33:43 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8b2886364so3406785ad.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436007; x=1691040807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET3auG+YOLxA4Kz/fjW90vjtO8YNjKzJmKaIU71PEwg=;
        b=Qky0ouzrEazF7OV6EacrIQAM3rX40oemivrHJMql2tdK1nPdQkUqW3UsotdaVdtp1O
         utQ/MHsxc2TDqlW3sNgwqjIBhxQu5qqeKeY26RZ53DY6jPwCHs0W3F1/4EDiUpEAJDdk
         lU2WWR6bDv5AFIvQ4U1eoprq93jq87qlJ0v/PSGYsgOpYWz5W6W3om4khGaePa48odAp
         KVCwwcG0OXprw/mPnCjw3X0EylLgiRU6usjob8l8R1O+/WAX5Y2eg4Z3tBdN6zz7RV42
         iDSIAbqpMLiPWekaaUPDt3ktUQvfxwzAUxuTg1GYsVsZVIQgx4NMk2WGg1vs90+DjJpk
         OroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436007; x=1691040807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ET3auG+YOLxA4Kz/fjW90vjtO8YNjKzJmKaIU71PEwg=;
        b=HjMTRO6h2G5sa5klDYy89RzkaIbIGWh0ShugMxlf+RVqq5jgEjSNWEKYF+IYIKIZue
         YT/7mkcCy+/c9ii+0kR4MWdS+OHy+nNQxzCNRebX71K2A9FIdVx93t7uZCgJCeIuLxPt
         GYjvAo4bHCW4lx1bcQvu2Iovf1EUfFSC+w9lWI1nsilyvNLnWT+1eaOn/r4raQ1dmp4q
         gc9Gv4T1mRDXXnXTlcB8bTrWpEO+Wz2sYSorGr9gM9r+dh8crOc21q1nIg93BSzVn78J
         KXNQFXKUlQdQPXjzTwgYgACgQ2itJs2BglZeiRMOLtb52K6vYXImiLFD/sdUE3+neYDD
         arLg==
X-Gm-Message-State: ABy/qLatzjfRZkZzBKLJsJLALi+Fi8p5fKCUbxTvwENX7Q3b4CnOYgb6
        A/4Vbtd0KOooITgpsJ8dnAlUrXo+QiJSXj2eXyj0/dr/
X-Google-Smtp-Source: APBJJlF5djb+zVDVYWi+jQX6mFMN3qj/+EXFOyxmNMw6sHbNTiuDfY+nvggI6LNZBReVZGkB9Hq9xQ==
X-Received: by 2002:a17:903:22c9:b0:1b8:30d8:bc45 with SMTP id y9-20020a17090322c900b001b830d8bc45mr3989756plg.47.1690436006998;
        Wed, 26 Jul 2023 22:33:26 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:33:26 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 08/42] clk: at91: clk-h32mx: add support for parent_hw
Date:   Thu, 27 Jul 2023 08:31:22 +0300
Message-Id: <20230727053156.13587-9-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for parent_hw in h32mx clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-h32mx were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/clk-h32mx.c | 13 +++++++++----
 drivers/clk/at91/dt-compat.c |  2 +-
 drivers/clk/at91/pmc.h       |  2 +-
 drivers/clk/at91/sama5d2.c   |  2 +-
 drivers/clk/at91/sama5d4.c   |  2 +-
 5 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index 1e6c12eeda10..d7cdade56454 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -83,10 +83,10 @@ static const struct clk_ops h32mx_ops = {
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name)
+			const char *parent_name, struct clk_hw *parent_hw)
 {
 	struct clk_sama5d4_h32mx *h32mxclk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	h32mxclk = kzalloc(sizeof(*h32mxclk), GFP_KERNEL);
@@ -95,8 +95,13 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &h32mx_ops;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
+	if (parent_hw) {
+		init.parent_hws = (const struct clk_hw **)&parent_hw;
+		init.num_parents = 1;
+	} else {
+		init.parent_names = parent_name ? &parent_name : NULL;
+		init.num_parents = parent_name ? 1 : 0;
+	}
 	init.flags = CLK_SET_RATE_GATE;
 
 	h32mxclk->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 6e010b5cb435..8540234e9d89 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -201,7 +201,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_h32mx(regmap, name, parent_name);
+	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 3f7ad79db4db..1604b44f2945 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -150,7 +150,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name);
+			const char *parent_name, struct clk_hw *parent_hw);
 
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 7904f2122ed7..8c7ff0108b41 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -276,7 +276,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 
 	sama5d2_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 7cda8032653e..04c848cd7001 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -214,7 +214,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	sama5d4_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.39.2

