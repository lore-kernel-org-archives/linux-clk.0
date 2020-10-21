Return-Path: <SRS0=09nf=D4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF10FC5DF9E
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EEBF21D7B
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lPxbJARn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409018AbgJUQi5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Oct 2020 12:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503031AbgJUQi4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Oct 2020 12:38:56 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E1AC0613D2
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:38:56 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id t25so4124933ejd.13
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4bmUTvMmlGLQ9tv2GMEVx5tSGz9QfWz+dgoSRCgpsLM=;
        b=lPxbJARnZj8JhrahTb3CjQMfx4CZRZOYvvm8mjwTYwa8kdX0yMwbt7TCZZYwkXfp6d
         4uBWD01DtroiklOaL04FsnIhXq4U0IbcH3ijPSWYpFKzVXi12Lhkd9zjFHa6ED8pLTPR
         1NENAgPG0doUEG1O3YMt7Zs2Lp1qruYCDiwG8Gq1E4r0cy9SsKTjud5/ALTHjvmhe7Eb
         PB2EK9lVlIcQBRYJLyqBdXf6AeRZVc794I1sMVm5D1kY8amgYLr9VIMe1kDGRgucd+tD
         jt3dHTd0k5W1YObSv6pV2AOK2KKBTXZ0ClPwkJ4AMOaGrLUaGrXlRgqrccLQec9IXSNg
         k0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4bmUTvMmlGLQ9tv2GMEVx5tSGz9QfWz+dgoSRCgpsLM=;
        b=oUGS8G2aUXTudAOCjRM6Eyxb0V9FOgF3QXYPAx4u4bzf3CmKN1v54ScYFxV51IhYEH
         /693a4oKE1QB1vu4KEATWNWmwOrPyjJEI4w+JpwqUS4ahjCIDer+9blR10bbyjlxQfrK
         C8IZbNU5fQbAYce6e4k9/RdynMbx0ipeW/bkPsosOTBBEIDL+7R6p6oyKBiR/t3RjSnk
         VGIbKT14+ayZYHHxgP3m+n4DxqXEPUrK57pgGrLskmdh2mOcDRjzlBS7/FusOtpmAzXS
         UReCwnWHZtXOR3lt4bV4V89vKVvlODWEmXcKig3lkchnNWYJ4L5qlVr23Iu6mO3IBYVB
         mxRg==
X-Gm-Message-State: AOAM5318t0gf/PSgHmFiaYaZVnVX6MyyMmJfDEFLQCnwjaS0HZFiaRp/
        cXjfpeEa+rKke/CpsI90vjqYqw==
X-Google-Smtp-Source: ABdhPJziCr8SmylxJQYZgyuvCkU84PCcMSnmPqhvy6/7Z6BFqIqIijfs88QhRpuWwaRtfMv4imMi6A==
X-Received: by 2002:a17:906:5594:: with SMTP id y20mr3928287ejp.196.1603298334729;
        Wed, 21 Oct 2020 09:38:54 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id f26sm2549747ejx.23.2020.10.21.09.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 09:38:54 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] clk: meson: g12: use devm variant to register notifiers
Date:   Wed, 21 Oct 2020 18:38:47 +0200
Message-Id: <20201021163847.595189-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021163847.595189-1-jbrunet@baylibre.com>
References: <20201021163847.595189-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Until now, nothing was done to unregister the dvfs clock notifiers of the
Amlogic g12 SoC family. This is not great but this driver was not really
expected to be unloaded. With the ongoing effort to build everything as
module for this platform, this needs to be cleanly handled.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This clean application of this patch depends on
 https://lore.kernel.org/r/20201021162147.563655-4-jbrunet@baylibre.com

 drivers/clk/meson/g12a.c | 34 ++++++++++++++++++++--------------
 include/linux/clk.h      | 10 +++++++++-
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index bbb75541dad9..bb4fa19442be 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5171,8 +5171,8 @@ static int meson_g12a_dvfs_setup_common(struct device *dev,
 	g12a_cpu_clk_postmux0_nb_data.xtal = xtal;
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_postmux0.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12a_cpu_clk_postmux0_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_postmux0_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk_postmux0 notifier\n");
 		return ret;
@@ -5181,7 +5181,8 @@ static int meson_g12a_dvfs_setup_common(struct device *dev,
 	/* Setup clock notifier for cpu_clk_dyn mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_dyn.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk_dyn notifier\n");
 		return ret;
@@ -5207,7 +5208,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	/* Setup clock notifier for cpu_clk mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpu_clk.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk notifier\n");
 		return ret;
@@ -5216,8 +5218,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	/* Setup clock notifier for sys1_pll */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_sys1_pll.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12b_cpu_clk_sys1_pll_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12b_cpu_clk_sys1_pll_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the sys1_pll notifier\n");
 		return ret;
@@ -5229,8 +5231,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	g12b_cpub_clk_postmux0_nb_data.xtal = xtal;
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_postmux0.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12b_cpub_clk_postmux0_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12b_cpub_clk_postmux0_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpub_clk_postmux0 notifier\n");
 		return ret;
@@ -5238,7 +5240,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for cpub_clk_dyn mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_dyn.hw, "dvfs");
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpub_clk_dyn notifier\n");
 		return ret;
@@ -5246,7 +5249,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for cpub_clk mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpub_clk notifier\n");
 		return ret;
@@ -5254,8 +5258,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for sys_pll */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_sys_pll.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12b_cpub_clk_sys_pll_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12b_cpub_clk_sys_pll_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the sys_pll notifier\n");
 		return ret;
@@ -5277,7 +5281,8 @@ static int meson_g12a_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for cpu_clk mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+				    &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk notifier\n");
 		return ret;
@@ -5285,7 +5290,8 @@ static int meson_g12a_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for sys_pll */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_sys_pll.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_sys_pll_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_sys_pll_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the sys_pll notifier\n");
 		return ret;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 79fb52f93053..db113495d315 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -117,7 +117,8 @@ int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb);
  *
  * Returns 0 on success, -EERROR otherwise
  */
-int devm_clk_notifier_register(struct device *dev, struct clk *clk, struct notifier_block *nb);
+int devm_clk_notifier_register(struct device *dev, struct clk *clk,
+			       struct notifier_block *nb);
 
 /**
  * clk_get_accuracy - obtain the clock accuracy in ppb (parts per billion)
@@ -196,6 +197,13 @@ static inline int clk_notifier_unregister(struct clk *clk,
 	return -ENOTSUPP;
 }
 
+static inline int devm_clk_notifier_register(struct device *dev,
+					     struct clk *clk,
+					     struct notifier_block *nb)
+{
+	return -ENOTSUPP;
+}
+
 static inline long clk_get_accuracy(struct clk *clk)
 {
 	return -ENOTSUPP;
-- 
2.25.4

