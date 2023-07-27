Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0DDC04FDF
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjG0FiN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjG0Fhy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:37:54 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5682630E8
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:37:03 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bbd03cb7c1so3416335ad.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436160; x=1691040960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZjA/S5rkAI45EIQ8pwCaKfyj6nPmHrCItt9RJLE9cc=;
        b=nTtP8b9CSgkFgg32JpTd5UHEzmEllvNl41ff0GI36YGsZVfI3unXLhJLIfWPqssdfD
         jdyh/9kZ7JDeSIlZYrP+ViHnPDab+yF29x9F+0BoSRprtm7GLcATD59n2LpAg5+fyX05
         RAhZrJe6gy/RJ7pM+LD8SCXqw5xKJq4uiwmEqXvBPJ7zK5uoHuebdv5a0sLJl7oyf6YM
         MuPXrerqClkfQtsWkKFmtpoJ88AluPHl4mR09XuwWWu+Z+lidskXoYFVxW054tmzrVwc
         qFdeVFs5yZ55zdlhcnmPbfUN2gdQmRfuerF6raRQ9lQV5JlbgwjBQGzRKhVh43An3lY/
         9jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436160; x=1691040960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZjA/S5rkAI45EIQ8pwCaKfyj6nPmHrCItt9RJLE9cc=;
        b=mHIGOZqxDZeLRLfPmsY28Onu8BJrhOt9BNH8H2i8bAjt3+1kL079Nh7UrsJSAiHN/g
         BzuySHsFGSKAHpktUOOCCYy+alnHmThJSRhpOPa5EBXYJKb91Aa1x3ORGWJ4+1Jouj3R
         qzDqilnNEMRjIbpoN71oQbDn0/czfP9JDcmmk9Z42gAaCX2K5/YwHBcTEIKV7gpDxQy+
         EMtKglJ/lCGHzBFXGgJ0/rK0J6xCByrPUzeU3AGWflA5AdHuIs7QIUhqM3/2GJwEB8sd
         fR3vV8uYpsTRWFUPY+T8GXlnKLkXR++YbFhy4LSUjaqEUul6IvMI55DUJKfvhU1bny17
         ZG7g==
X-Gm-Message-State: ABy/qLaB/sKp32ln12/REtwR+P8Od8lFuTI5eZ2tslRCauWGRWbsVDi2
        UocTYSCX8/BPiFISzgQKpjU0Hw==
X-Google-Smtp-Source: APBJJlEnqTGNOQscpftBLsei9noqgRw7/LuMRVXVScuPebiJkYEppzbJfbM+vcPjAU02zFrFT8/1Pg==
X-Received: by 2002:a17:902:db09:b0:1ba:fe63:6616 with SMTP id m9-20020a170902db0900b001bafe636616mr3831454plx.6.1690436160099;
        Wed, 26 Jul 2023 22:36:00 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:35:59 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 29/42] clk: at91: clk-h32mx: remove parent_names support
Date:   Thu, 27 Jul 2023 08:31:43 +0300
Message-Id: <20230727053156.13587-30-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove parent_names support as parent_hw support is now available on all
platforms using clk-h32mx driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/clk-h32mx.c | 11 +++--------
 drivers/clk/at91/dt-compat.c |  2 +-
 drivers/clk/at91/pmc.h       |  2 +-
 drivers/clk/at91/sama5d2.c   |  2 +-
 drivers/clk/at91/sama5d4.c   |  2 +-
 5 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index d7cdade56454..0e139bf731ec 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -83,7 +83,7 @@ static const struct clk_ops h32mx_ops = {
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name, struct clk_hw *parent_hw)
+			struct clk_hw *parent_hw)
 {
 	struct clk_sama5d4_h32mx *h32mxclk;
 	struct clk_init_data init = {};
@@ -95,13 +95,8 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &h32mx_ops;
-	if (parent_hw) {
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
-		init.num_parents = 1;
-	} else {
-		init.parent_names = parent_name ? &parent_name : NULL;
-		init.num_parents = parent_name ? 1 : 0;
-	}
+	init.parent_hws = parent_hw ? (const struct clk_hw **)&parent_hw : NULL;
+	init.num_parents = parent_hw ? 1 : 0;
 	init.flags = CLK_SET_RATE_GATE;
 
 	h32mxclk->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 816a7ee353d6..058b65c2d88d 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -234,7 +234,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 	if (!parent_hw)
 		return;
 
-	hw = at91_clk_register_h32mx(regmap, name, NULL, parent_hw);
+	hw = at91_clk_register_h32mx(regmap, name, parent_hw);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 87ba2586d5e5..11f7ab4d1ad8 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -149,7 +149,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name, struct clk_hw *parent_hw);
+			struct clk_hw *parent_hw);
 
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 2d4bf9e1a79c..93c646e0b6ef 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -280,7 +280,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 
 	sama5d2_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", NULL, sama5d2_pmc->chws[PMC_MCK]);
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", sama5d2_pmc->chws[PMC_MCK]);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index ac7565b26dce..b4375cb1c3f3 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -220,7 +220,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	sama5d4_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91_clk_register_h32mx(regmap, "h32mxck", NULL, sama5d4_pmc->chws[PMC_MCK]);
+	hw = at91_clk_register_h32mx(regmap, "h32mxck", sama5d4_pmc->chws[PMC_MCK]);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.39.2

