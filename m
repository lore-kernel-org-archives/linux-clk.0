Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D6EEB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjG0FgG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbjG0Ffs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:35:48 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45633AAF
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:04 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bbd03cb7c1so3412975ad.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436087; x=1691040887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/6KrvhXqa5iLUixbjzuBMiv5UYsjXjQw1Ru7hJmwyo=;
        b=p7tqgkwFoLsNlG4MKl0lVbtVdD+bXOGOQxOh6qFvDVQ71iCs2xwdGom9AGn/uqw8l3
         uo/Ts0xEX36uzQgg8NN28OubEeAM+X41hXn52DW/S/pNFHiIKFKDN1VolkzW0MkY8UHf
         TFVdbFpTVlsPy0vYRQ+qZcQHSONLtM3/qxZ94DiudPxmDxfeUPDw/fbOGW9Z1gavoavn
         E66e3X8MNL2EhipQO5qxbTepxclX8z1Monf/djmATYpDtnCVuYWiwdKfde7LrVuakRsR
         4aNS2WZIqB+hUeYktFBs7F50JstPJzh+HGoH1R9nXSSj8+wd2MqNmN6XdKqG8PWv2tyI
         KVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436087; x=1691040887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/6KrvhXqa5iLUixbjzuBMiv5UYsjXjQw1Ru7hJmwyo=;
        b=ifWMifmCSryMtnjNOr5QqOyN9/XPCmEISLWN0P2TObIxOghsmJz07HjAXDyTez/sfC
         ITKTQsm3v/4rJarSAuLKXTAnmpysyc09UVrRVImtmE6TjESKl0Oyc0FEoTFDls2VVddz
         X6l0oK6OcolpZIWDb0HW0EYsRqexaCcXnHivdq0qMGD3hVkmxzMI/wWUNCjdU+++o4na
         7uKrpyCRHTP61ChIGzuFUar1exLKW04k4cKvNros/J7U/K1h2w3RvFSlHVzuamquqrAf
         A7K60Rrw3tED8VaG790lvxtoG6HwvFHw3KkUKBkvJm9tmlnlCLbWpJg1skFxq5Hl1rSY
         /Gpg==
X-Gm-Message-State: ABy/qLbJRx5n34exjtzFpjdqmP83QIvpJ4txX1U4CW6hgcwLMY8No6+x
        xs3O8rMCJZiBf8HJ9yKB/NVOZA==
X-Google-Smtp-Source: APBJJlEVCaNJ7OenwzA/7lBAkzFCqELwzJ48BMLT8HbMb1NI9Bu9mnwabvkhELC4Ad8laFZ98RKiFw==
X-Received: by 2002:a17:902:b60a:b0:1b6:80f0:d969 with SMTP id b10-20020a170902b60a00b001b680f0d969mr2928961pls.11.1690436086872;
        Wed, 26 Jul 2023 22:34:46 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:34:46 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 19/42] clk: at91: clk-slow: add support for parent_hw
Date:   Thu, 27 Jul 2023 08:31:33 +0300
Message-Id: <20230727053156.13587-20-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for parent_hw in slow clock drivers. With this parent-child
relation is described with pointers rather than strings making
registration a bit faster.

All the SoC based drivers that rely on clk-slow were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9260.c | 2 +-
 drivers/clk/at91/clk-slow.c    | 8 ++++++--
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 1 +
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index f39deb3ec00a..55350331b07e 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -385,7 +385,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		parent_names[0] = "slow_rc_osc";
 		parent_names[1] = "slow_xtal";
 		hw = at91_clk_register_sam9260_slow(regmap, "slck",
-						    parent_names, 2);
+						    parent_names, NULL, 2);
 		if (IS_ERR(hw))
 			goto err_free;
 
diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
index ac9f7a48b76e..bea66216ed82 100644
--- a/drivers/clk/at91/clk-slow.c
+++ b/drivers/clk/at91/clk-slow.c
@@ -39,11 +39,12 @@ struct clk_hw * __init
 at91_clk_register_sam9260_slow(struct regmap *regmap,
 			       const char *name,
 			       const char **parent_names,
+			       struct clk_hw **parent_hws,
 			       int num_parents)
 {
 	struct clk_sam9260_slow *slowck;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (!name)
@@ -58,7 +59,10 @@ at91_clk_register_sam9260_slow(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &sam9260_slow_ops;
-	init.parent_names = parent_names;
+	if (parent_hws)
+		init.parent_hws = (const struct clk_hw **)&parent_hws;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 	init.flags = 0;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index f464e125c9fd..dbc59ac44828 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -822,7 +822,7 @@ static void __init of_at91sam9260_clk_slow_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	hw = at91_clk_register_sam9260_slow(regmap, name, parent_names,
+	hw = at91_clk_register_sam9260_slow(regmap, name, parent_names, NULL,
 					    num_parents);
 	if (IS_ERR(hw))
 		return;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 541d2ba2fea5..6816e350d6d6 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -244,6 +244,7 @@ struct clk_hw * __init
 at91_clk_register_sam9260_slow(struct regmap *regmap,
 			       const char *name,
 			       const char **parent_names,
+			       struct clk_hw **parent_hws,
 			       int num_parents);
 
 struct clk_hw * __init
-- 
2.39.2

