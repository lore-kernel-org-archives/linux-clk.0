Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD8BEB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbjG0Fjw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbjG0FjM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:39:12 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5A630CD
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:38:00 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bba54f7eefso11598865ad.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436225; x=1691041025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhTcRhK2gQ4jMW+59NMw/SaH7OUANNH6Zo/DOVN6+as=;
        b=DlLGy8hlTRIK/ljo4LGFmrYRfDnd+QvQ7CtqcZrNfjWPSXrFxRQi4Z/7shGMIDLqvK
         QMxlty1Q+Ma232hFEwGF3lSfAQZnxtK75Nl+GkFtlZdyjV9SrCAZ3ISwTHQG+d0kY6Je
         6K23ojczKRZIwqOXOP6JDy0YnX/XKf5gw4HwYQzvozTh8SdcIHYR50rxel58D5NT0z5M
         +nIvynHPLNBsZazi/zhoxTG+w1CTN6hhSm4au62rRvn2iCdeEkKFQYg+zHUO19m/9i0w
         kktYtXExlIRmASejBBzkcI5Rzz+GA+4qm4gj7hKF9obMZeKSDSaWMQQlwCQ+Iyx4BVe+
         YVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436225; x=1691041025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhTcRhK2gQ4jMW+59NMw/SaH7OUANNH6Zo/DOVN6+as=;
        b=TLhVMKlh4kGUiGvHPL5o79OeSR4Q2VzXZ0O2mJ6U/zfpsIehZYnN/MUfRjzkCVPfWs
         R72J8ZVsf9+ns74iygyzVQFmDkZmUYuf99EwVU37itmtXgzxZcUz8YavcTFlpxT4AHyw
         zqY2HVpEV/UHlf/s9hSJPHKZmpNqnySEhtFGB8QX2eTmfkN2kmTX5R6VHreC6mxHU8Yv
         W0b3T+LoXt67Od67vAREdacVrI+JXRfIKa3WbuFWGyCBAU9gHC5eGBB64ph08ERCoeEO
         xpoa2sm069uFbtVJefkyPuBjRm67t+b7URaSUUyipoG5AJ1qqG6/AY0OVQjGYwqGrIWA
         YbNA==
X-Gm-Message-State: ABy/qLbRMmhN1y+Hpknsapj9FR9IKLwvJmYqY1poYV8Lq3SakRZL70Cr
        TU3mSUSQ2vtQsT7ipX7ANnTqmQ==
X-Google-Smtp-Source: APBJJlGfluXGrnux48EdeGE9eNFdWvTPEzEfURqjbaC5EvOyWGXSriaNT9nM7vumitgl8/c6QopSTQ==
X-Received: by 2002:a17:903:1d1:b0:1b8:5bca:8256 with SMTP id e17-20020a17090301d100b001b85bca8256mr1971040plh.31.1690436225650;
        Wed, 26 Jul 2023 22:37:05 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:37:05 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 38/42] clk: at91: clk-slow: remove parent_names support
Date:   Thu, 27 Jul 2023 08:31:52 +0300
Message-Id: <20230727053156.13587-39-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove parent_names support as parent_hw support is now available on all
platforms using clk-slow driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9260.c | 2 +-
 drivers/clk/at91/clk-slow.c    | 8 ++------
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 1 -
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index c118ff23548b..97efc39a7e2b 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -390,7 +390,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 		parent_hws[0] = hw;
 		parent_hws[1] = slow_xtal_hw;
-		hw = at91_clk_register_sam9260_slow(regmap, "slck", NULL, parent_hws, 2);
+		hw = at91_clk_register_sam9260_slow(regmap, "slck", parent_hws, 2);
 		if (IS_ERR(hw))
 			goto err_free;
 
diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
index bea66216ed82..ee2dfc44d29e 100644
--- a/drivers/clk/at91/clk-slow.c
+++ b/drivers/clk/at91/clk-slow.c
@@ -38,7 +38,6 @@ static const struct clk_ops sam9260_slow_ops = {
 struct clk_hw * __init
 at91_clk_register_sam9260_slow(struct regmap *regmap,
 			       const char *name,
-			       const char **parent_names,
 			       struct clk_hw **parent_hws,
 			       int num_parents)
 {
@@ -50,7 +49,7 @@ at91_clk_register_sam9260_slow(struct regmap *regmap,
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
-	if (!parent_names || !num_parents)
+	if (!parent_hws || !num_parents)
 		return ERR_PTR(-EINVAL);
 
 	slowck = kzalloc(sizeof(*slowck), GFP_KERNEL);
@@ -59,10 +58,7 @@ at91_clk_register_sam9260_slow(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &sam9260_slow_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)&parent_hws;
-	else
-		init.parent_names = parent_names;
+	init.parent_hws = (const struct clk_hw **)&parent_hws;
 	init.num_parents = num_parents;
 	init.flags = 0;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 11fdbca8ee83..90d92a410097 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -920,7 +920,7 @@ static void __init of_at91sam9260_clk_slow_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	hw = at91_clk_register_sam9260_slow(regmap, name, NULL, parent_hws,
+	hw = at91_clk_register_sam9260_slow(regmap, name, parent_hws,
 					    num_parents);
 	if (IS_ERR(hw))
 		return;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index fe86cca2776e..a0b49dd3749f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -232,7 +232,6 @@ at91_clk_register_programmable(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_register_sam9260_slow(struct regmap *regmap,
 			       const char *name,
-			       const char **parent_names,
 			       struct clk_hw **parent_hws,
 			       int num_parents);
 
-- 
2.39.2

