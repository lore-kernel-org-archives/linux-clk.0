Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64DAC433F2
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9591761A13
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236499AbhCXPUT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236528AbhCXPTp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:45 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64818C0613E1
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:30 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so16652482lfl.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
        b=Tc25TD5+7Gwo1HO4vQj/3EiBeyJcsnhH7fA3aeCN5TNcqbP/oVU4HMDFXqOtqwP+P2
         Zdq93VMu2vCBVadNX3nvEKyzRcDkbHi5u2/7Avu8aDQtVOtDidA95usU5UlmTP+MJ/R6
         sVguu0bJ75WatTP8XaB3NJPDsLzgw/cpxzjobzcFr8p3kaQeKo57bqtNmE82PfYjpSy1
         ALGNzNRoBz1hiCw566AJcCM/S2N5vCB83Fk0QWPJT3VWfBIoZiTqvExohdsc93hFEM+I
         m2YFbOjtRW6ndpLOdLmt8Zb49bk/7dz3sjQR81yB/rfa3Un0WCyMj02Fn14szlge6Tfv
         vP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cjAMUv7MIhb1KdQ27o54N1t7Ve1qx874G712Y764Vm0=;
        b=kyXHmiTNgD1xrTlzt0KhkqFkpNdYr12S79sUhx1qFl1TfOHZMZaM64AadflZcI/aZi
         7MM+IMxDhRLyOO509IoZsXRGx6WFuEMj4+UzSRlfiHbwOtNWprHYfMC+sNuKfeP6DUpC
         bPzUN7YscDdZgoYUZQ0u8ofxAMxqb70guchiY/n+Ht9bDkHI6Qn7WVkoktz4btt+GTMr
         obiKzu3H1dm0Su1pRH/p0mkRcvz8VZx2ZYaLJ9OXLSlloik74wEy35SVd20vJk6yPKRD
         LZI8M5TJwkodf7sL71OgUVY7TpQtCTiUM4eJslxzjHAYmerEEgbMp7n8RGSobmUuP784
         9awQ==
X-Gm-Message-State: AOAM530q1DGz5x0enGpoXMPquq/X/HJd5noh4M5zo3p1kRvZLGM42rGp
        q33xy3kTigmDooU+3MjuY2hBiQ==
X-Google-Smtp-Source: ABdhPJwkT+pO34l6OqgP6jbUkA2UjX0bT6Qiqht5D9qWgnV/qsJJoLaKaul/Sz5nGrQya5lfmFU+tQ==
X-Received: by 2002:ac2:5fa2:: with SMTP id s2mr2232448lfe.486.1616599168652;
        Wed, 24 Mar 2021 08:19:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 16/28] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date:   Wed, 24 Mar 2021 18:18:34 +0300
Message-Id: <20210324151846.2774204-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use devm_of_clk_add_hw_provider() to register provided clocks. This
allows dropping the remove function alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4a8577a08f57..74a4e2daade8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -728,7 +728,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 				     phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
@@ -742,31 +742,11 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	return 0;
 
 fail:
-	if (phy->pll) {
-		of_clk_del_provider(dev->of_node);
-		phy->pll = NULL;
-	}
-
 	return ret;
 }
 
-static int dsi_phy_driver_remove(struct platform_device *pdev)
-{
-	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
-
-	if (phy && phy->pll) {
-		of_clk_del_provider(pdev->dev.of_node);
-		phy->pll = NULL;
-	}
-
-	platform_set_drvdata(pdev, NULL);
-
-	return 0;
-}
-
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
-	.remove     = dsi_phy_driver_remove,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
-- 
2.30.2

