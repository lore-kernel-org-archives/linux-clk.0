Return-Path: <SRS0=09nf=D4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D807C388F9
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E74822283
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="atuMiwpU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444557AbgJUQWG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Oct 2020 12:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444544AbgJUQV4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Oct 2020 12:21:56 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36268C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:21:56 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id ce10so4107565ejc.5
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NbaOJdOhMnQWRBlP6WkK3ZzL8S9aIykVLGSDrM3lt1Y=;
        b=atuMiwpUbK1Yyl/B+DN8Fvaeg7nklmy8ZUDhvZaHpqL3qGMMtDhAgYWiCLlPwGc7a0
         UWcyK0DKuTDlS7j8AaLrgmldLACb/cy4kdThvmBt4G+mQ3GYNmxb3DxcuRmsFFB+kFfb
         aKWAN5esyrKSvQ5jR0PboxYNxDKwD7TqTonHG+wftLNZSZsGNJyWk4ENFO3/50k/JVez
         r5OB2AuadXu66MOzxx8U4SKqtWCa3dKWL7BD4m6+2IiUOBDcJ6NrVCR6atVzig7IKpP0
         MMZGk97bygy33+2y61VJ0HLaLwl8bcqZvbmWWWPejek+4j5u8RWC6DMI6OURiV/HfyME
         MFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NbaOJdOhMnQWRBlP6WkK3ZzL8S9aIykVLGSDrM3lt1Y=;
        b=jl1AEy6qVPN26CIRJXboPlyLSDjghdpHSDJMO5gSlVb1rSp2to0afvJ2rTGDd3gvJP
         IcblgNXu9xRZXVWEWo6DAEdkVZh7D3vyvWpuk7SXzGBaHkUIG3sZ5xEOYq+7FKxln8ah
         Ernk3y6J9Vt1DW22SAtaSWwmLdCP8PVgNXy1EGnbkb3C1fUEvWBPr/jUqbzWzMU/3xBa
         d8Wg9zuE3rYIF3i3V0R2cWi6tg8lxAIqIfyc2cCGAP4mFV51cBsu/FToONbysaC1r109
         WfjZZF1uFuhecMLs20FOBhkhs8yQdD/v0BqDl9NmKJOwxtFDosjWxgtf/uvhUyGkBb67
         mjNA==
X-Gm-Message-State: AOAM531cUlSZkUA5KEnt7ZpHjUN9eXVX0iEvAQwBDjaj1ljs/FqLQGM9
        ccRo3KmWcj9+2TeWqWK8SzqUnP4HjM2LGQ==
X-Google-Smtp-Source: ABdhPJzgn7NLcmefXgPTla5nK9XVbWc6TU9L61aXbeTJFTr26tzoKCNwiKGKQ9Yo08mn74gsn+j8sg==
X-Received: by 2002:a17:906:2b83:: with SMTP id m3mr4213435ejg.456.1603297314846;
        Wed, 21 Oct 2020 09:21:54 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id 11sm2566667ejy.19.2020.10.21.09.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 09:21:54 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/3] clk: avoid devm_clk_release name clash
Date:   Wed, 21 Oct 2020 18:21:45 +0200
Message-Id: <20201021162147.563655-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021162147.563655-1-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In clk-devres.c, devm_clk_release() is used to call clk_put() memory
managed clock. In clk.c the same name, in a different scope is used to call
clk_unregister().

As it stands, it is not really a problem but it does not readability,
especially if we need to call clk_put() on managed clock in clk.c

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0a9261a099bd..88e5797bb6b4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4068,12 +4068,12 @@ void clk_hw_unregister(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister);
 
-static void devm_clk_release(struct device *dev, void *res)
+static void devm_clk_unregister_cb(struct device *dev, void *res)
 {
 	clk_unregister(*(struct clk **)res);
 }
 
-static void devm_clk_hw_release(struct device *dev, void *res)
+static void devm_clk_hw_unregister_cb(struct device *dev, void *res)
 {
 	clk_hw_unregister(*(struct clk_hw **)res);
 }
@@ -4093,7 +4093,7 @@ struct clk *devm_clk_register(struct device *dev, struct clk_hw *hw)
 	struct clk *clk;
 	struct clk **clkp;
 
-	clkp = devres_alloc(devm_clk_release, sizeof(*clkp), GFP_KERNEL);
+	clkp = devres_alloc(devm_clk_unregister_cb, sizeof(*clkp), GFP_KERNEL);
 	if (!clkp)
 		return ERR_PTR(-ENOMEM);
 
@@ -4123,7 +4123,7 @@ int devm_clk_hw_register(struct device *dev, struct clk_hw *hw)
 	struct clk_hw **hwp;
 	int ret;
 
-	hwp = devres_alloc(devm_clk_hw_release, sizeof(*hwp), GFP_KERNEL);
+	hwp = devres_alloc(devm_clk_hw_unregister_cb, sizeof(*hwp), GFP_KERNEL);
 	if (!hwp)
 		return -ENOMEM;
 
@@ -4167,7 +4167,7 @@ static int devm_clk_hw_match(struct device *dev, void *res, void *data)
  */
 void devm_clk_unregister(struct device *dev, struct clk *clk)
 {
-	WARN_ON(devres_release(dev, devm_clk_release, devm_clk_match, clk));
+	WARN_ON(devres_release(dev, devm_clk_unregister_cb, devm_clk_match, clk));
 }
 EXPORT_SYMBOL_GPL(devm_clk_unregister);
 
@@ -4182,7 +4182,7 @@ EXPORT_SYMBOL_GPL(devm_clk_unregister);
  */
 void devm_clk_hw_unregister(struct device *dev, struct clk_hw *hw)
 {
-	WARN_ON(devres_release(dev, devm_clk_hw_release, devm_clk_hw_match,
+	WARN_ON(devres_release(dev, devm_clk_hw_unregister_cb, devm_clk_hw_match,
 				hw));
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_unregister);
-- 
2.25.4

