Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E44EC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E5CE64E30
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhBKFYE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 00:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhBKFX4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 00:23:56 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C4DC061797
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:39 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id b8so2721251plh.12
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yf/rno8iZl7FiboO52D+Z5FCjHSUrFGjrs6kb9VfxZc=;
        b=QQaYk92R9MSar5LbEY4Jz089WlCH6zJeIBpW8S733JOJGnjcFWJrEGr0M/A8U9M/A1
         dEDNAK4kp66DRXzpc1gzgQDmyeR7Hf0RraVqbWZloY45Qi2EbgsDtk/T4hUxN0G2teON
         /mWjK76kl02w6Yq5LcTtqGFIP4nc9SC7AOAz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yf/rno8iZl7FiboO52D+Z5FCjHSUrFGjrs6kb9VfxZc=;
        b=MlxWwNnmWbhuYKuG6atwOgWWGrS8sy1u8Q61aGg71f5URwin4tJ+9ULSZnYuvcQQGe
         QelE3bZ2Skj1gLjfitVSgvMeehQKLnAdRULu1ScruM3j/m47VXnvSIJud5308QV7S0NQ
         oRAkaOUNpV9fRE1u0W1bxEdrr/hUif0RaS8zsa+1zt6b/g7fRZwM4ByD24velv+yKmd5
         MRMX5ZVAL7RljRa+/J79eJwen6FKxTBrJDrMTU+4UCjRdxajS2kqjp7d8ZX9Ec+pOllG
         X4F0xhvWMT6EtG95uYgYxkbB3H0gxMu+nIh6BBOa/gpDV2lBf972PAXdMUU/7EswR3KK
         Bviw==
X-Gm-Message-State: AOAM533yGzyyE8WQwDZgK+4uXC3t9zi15ynptepS+T1ErnPyS+1en2a9
        nu3P6GHmcnoPJDI4p/4XKFcgHd6M3OgCqrFd
X-Google-Smtp-Source: ABdhPJyECE81mEOyMfrxozkhKJ8viUwa7YTWL+FWSQNlzFlE08xfRgbmMzRYgQT3Za4w3olp7HaKcg==
X-Received: by 2002:a17:90a:b38b:: with SMTP id e11mr2441170pjr.214.1613020958643;
        Wed, 10 Feb 2021 21:22:38 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id o21sm3493511pjp.42.2021.02.10.21.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 21:22:38 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        devicetree@vger.kernel.org
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 3/7] clk: fixed: add devm helper for clk_hw_register_fixed_factor()
Date:   Thu, 11 Feb 2021 14:22:02 +0900
Message-Id: <20210211052206.2955988-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210211052206.2955988-1-daniel@0x0f.com>
References: <20210211052206.2955988-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a devm helper for clk_hw_register_fixed_factor() so that drivers that internally
register fixed factor clocks for things like dividers don't need to manually unregister
them on remove or if probe fails.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/clk/clk-fixed-factor.c | 39 ++++++++++++++++++++++++++++------
 include/linux/clk-provider.h   |  4 +++-
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 910e6e74ae90..4f7bf3929d6d 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -64,10 +64,16 @@ const struct clk_ops clk_fixed_factor_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
+static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
+{
+	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor *)res)->hw);
+}
+
 static struct clk_hw *
 __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name, int index,
-		unsigned long flags, unsigned int mult, unsigned int div)
+		unsigned long flags, unsigned int mult, unsigned int div,
+		bool devm)
 {
 	struct clk_fixed_factor *fix;
 	struct clk_init_data init = { };
@@ -75,7 +81,15 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	struct clk_hw *hw;
 	int ret;
 
-	fix = kmalloc(sizeof(*fix), GFP_KERNEL);
+	/* You can't use devm without a dev */
+	if (devm && !dev)
+		return ERR_PTR(-EINVAL);
+
+	if (devm)
+		fix = devres_alloc(devm_clk_hw_register_fixed_factor_release,
+				sizeof(*fix), GFP_KERNEL);
+	else
+		fix = kmalloc(sizeof(*fix), GFP_KERNEL);
 	if (!fix)
 		return ERR_PTR(-ENOMEM);
 
@@ -99,9 +113,13 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	else
 		ret = of_clk_hw_register(np, hw);
 	if (ret) {
-		kfree(fix);
+		if (devm)
+			devres_free(fix);
+		else
+			kfree(fix);
 		hw = ERR_PTR(ret);
-	}
+	} else if (devm)
+		devres_add(dev, fix);
 
 	return hw;
 }
@@ -111,7 +129,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		unsigned int mult, unsigned int div)
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
-					      flags, mult, div);
+					      flags, mult, div, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
@@ -153,6 +171,15 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
 
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
+			flags, mult, div, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
+
 #ifdef CONFIG_OF
 static const struct of_device_id set_rate_parent_matches[] = {
 	{ .compatible = "allwinner,sun4i-a10-pll3-2x-clk" },
@@ -185,7 +212,7 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
 		flags |= CLK_SET_RATE_PARENT;
 
 	hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, 0,
-					    flags, mult, div);
+					    flags, mult, div, false);
 	if (IS_ERR(hw)) {
 		/*
 		 * Clear OF_POPULATED flag so that clock registration can be
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index e4316890661a..58f6fe866ae9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -941,7 +941,9 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
-
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div);
 /**
  * struct clk_fractional_divider - adjustable fractional divider clock
  *
-- 
2.30.0.rc2

