Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C518EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjG0FiK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbjG0Fhr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:37:47 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7F83C11
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:36:58 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bba48b0bd2so3393975ad.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436146; x=1691040946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8HhL8+T58fsNy2ml6XhMwevzcQUIPpdggE6E7sZkqw=;
        b=me5Ao9gm+3uVJoSHfhX5wwMlcbIWGAsrNYGUqwcb9jsJteHJRkJtXFIjvJC1J7c0Ol
         /FVWm+ZkPd/jxaG0hajJqqdwAeV6b5goie8TnBS0g7F8444cEUpG8tRk1gOjABySbYdT
         1CnCn1B1s33naPM4/j8dIO4R6DRy8+o5zMYe8lb9kbcwY/ciLL0sHiPR/ygX0q9Bp9Yc
         eSmsoYfVXm7nqEdO0sGaBR7Jko07FZ2Gdiq9LbK7iZ2swIrlAHw59Y30f9sAvSb+7hmW
         pTyHID27hUsSmVQoOAq/FqZsn/4wks8mqwGXy6pmS0nA3sBv+SWNc9v27/o3ILFPn+mS
         MM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436146; x=1691040946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8HhL8+T58fsNy2ml6XhMwevzcQUIPpdggE6E7sZkqw=;
        b=fkloq921ThhUmxlbwY7eHuXy+ASIQ5/+EesM+nXDyuM0jI74vkyHkHlkYP3x+vIAGm
         A+h2LCL5ELP3f1cdZAbPI+CcFfSu8XlULecRhdsAVL5vV/W4AXCWCMWeFzPJrGdVUlYx
         VPtdmOUlK1Okr5PgKWNkD0kfMU3Ih797S7vzRbFM7sJs0MhLMati1aNjsy6UZjyc2zAa
         dXEm37CFnP/uk4nLdo1nzJG6j7M8L5ixvy9wkRqBvZB3JErr5Xk54eveXGahw8WH59kw
         BwDO+bhdW08tvpIpuAzONPmz/KLQv9TIqoYyw4Hfis7PtXFh5pLtNfAGfRXUBCzWoMwm
         MSYA==
X-Gm-Message-State: ABy/qLblBCxRBUckaOetFRpQEoF4ZTH5d5yXHzafc5893KwBHHwgGzJd
        lpzBUzrRDhOSG7ayhUBmSPzHeQ==
X-Google-Smtp-Source: APBJJlHqUeH1XUuot+AZNE6uBAlVN8Awfh8eCBLXAKtzbHs/lj9/Md8g/aUqbAQ/0eOK3aM6rVdfnQ==
X-Received: by 2002:a17:902:8a88:b0:1bb:a7bc:37a4 with SMTP id p8-20020a1709028a8800b001bba7bc37a4mr3407360plo.24.1690436145769;
        Wed, 26 Jul 2023 22:35:45 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:35:45 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 27/42] clk: at91: clk-audio-pll: remove parent_names support
Date:   Thu, 27 Jul 2023 08:31:41 +0300
Message-Id: <20230727053156.13587-28-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove parent_names support as parent_hw support is now available on all
platforms using clk-audio-pll.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/clk-audio-pll.c | 21 ++++++---------------
 drivers/clk/at91/dt-compat.c     |  6 +++---
 drivers/clk/at91/pmc.h           |  6 +++---
 drivers/clk/at91/sama5d2.c       |  6 +++---
 4 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index 7a13af95d628..fc08ca53bfad 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -450,7 +450,7 @@ static const struct clk_ops audio_pll_pmc_ops = {
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
-				 const char *parent_name, struct clk_hw *parent_hw)
+				 struct clk_hw *parent_hw)
 {
 	struct clk_audio_frac *frac_ck;
 	struct clk_init_data init = {};
@@ -462,10 +462,7 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_frac_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
-	else
-		init.parent_names = &parent_name;
+	init.parent_hws = (const struct clk_hw **)&parent_hw;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
@@ -483,7 +480,7 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
-				const char *parent_name, struct clk_hw *parent_hw)
+				struct clk_hw *parent_hw)
 {
 	struct clk_audio_pad *apad_ck;
 	struct clk_init_data init = {};
@@ -495,10 +492,7 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_pad_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
-	else
-		init.parent_names = &parent_name;
+	init.parent_hws = (const struct clk_hw **)&parent_hw;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		CLK_SET_RATE_PARENT;
@@ -517,7 +511,7 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
-				const char *parent_name, struct clk_hw *parent_hw)
+				struct clk_hw *parent_hw)
 {
 	struct clk_audio_pmc *apmc_ck;
 	struct clk_init_data init = {};
@@ -529,10 +523,7 @@ at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_pmc_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
-	else
-		init.parent_names = &parent_name;
+	init.parent_hws = (const struct clk_hw **)&parent_hw;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		CLK_SET_RATE_PARENT;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 044e1fc821e2..91bc2fada6ec 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -50,7 +50,7 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
 	if (!parent_hw)
 		return;
 
-	hw = at91_clk_register_audio_pll_frac(regmap, name, NULL, parent_hw);
+	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_hw);
 	if (IS_ERR(hw))
 		return;
 
@@ -82,7 +82,7 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
 	if (!parent_hw)
 		return;
 
-	hw = at91_clk_register_audio_pll_pad(regmap, name, NULL, parent_hw);
+	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_hw);
 	if (IS_ERR(hw))
 		return;
 
@@ -114,7 +114,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
 	if (!parent_hw)
 		return;
 
-	hw = at91_clk_register_audio_pll_pmc(regmap, name, NULL, parent_hw);
+	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_hw);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 6816e350d6d6..711b55a6b0ab 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -130,15 +130,15 @@ struct clk_hw *of_clk_hw_pmc_get(struct of_phandle_args *clkspec, void *data);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
-				 const char *parent_name, struct clk_hw *parent_hw);
+				 struct clk_hw *parent_hw);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
-				const char *parent_name, struct clk_hw *parent_hw);
+				struct clk_hw *parent_hw);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
-				const char *parent_name, struct clk_hw *parent_hw);
+				struct clk_hw *parent_hw);
 
 struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index cdb578059449..3920de445eca 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -233,17 +233,17 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	sama5d2_pmc->chws[PMC_PLLACK] = hw;
 
 	audio_fracck_hw = at91_clk_register_audio_pll_frac(regmap, "audiopll_fracck",
-							   NULL, sama5d2_pmc->chws[PMC_MAIN]);
+							   sama5d2_pmc->chws[PMC_MAIN]);
 	if (IS_ERR(audio_fracck_hw))
 		goto err_free;
 
-	hw = at91_clk_register_audio_pll_pad(regmap, "audiopll_padck", NULL, audio_fracck_hw);
+	hw = at91_clk_register_audio_pll_pad(regmap, "audiopll_padck", audio_fracck_hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d2_pmc->chws[PMC_AUDIOPINCK] = hw;
 
-	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck", NULL, audio_fracck_hw);
+	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck", audio_fracck_hw);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.39.2

