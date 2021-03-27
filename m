Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B81C433EB
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 11:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21FC761A05
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 11:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhC0LD1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 27 Mar 2021 07:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhC0LDY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 27 Mar 2021 07:03:24 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555B5C0613B1
        for <linux-clk@vger.kernel.org>; Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z8so10244082ljm.12
        for <linux-clk@vger.kernel.org>; Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBY+9qD1ZXGuyQtqkYcuydo9Ohc05hbMC90j6qWFkmU=;
        b=Jqy6C/bJyTDxyFpUddfheGqkwv2uMvD4ASc2pcMh42Z2m6Zhixr6CYlu2MGKaBSYSs
         3roH0ZUvanZ6bu0+jkaRauoEHtsl2Z1BqFw1nAyeggc0mNlHZ0vl9j1trxRmXDJOjA8E
         usYPujvXIadwyARtc1dMx4I3UzMjkSBQN9o1kzB5GqTlz9dhv/64yk2r8F1rzt1YU7En
         ODVkx/nE9qRP0Z1VB2+1aGLeaVFTdCChzHbheR9yMbehqS5Kv5RYTAjTDNBOWcPAPPI9
         vs1iVw9HFIMyjlcCQ4NV5AdfiOGChkYdu6YTIXlAYK6HjwLTiPOsrp7M94805Qty0F+v
         7ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBY+9qD1ZXGuyQtqkYcuydo9Ohc05hbMC90j6qWFkmU=;
        b=e0vRfrxWoWkax1zOxjniz2QtoMO7mKocgB4OlhougBNgwnDal/gCZLopDTHrVCKl/d
         mk5KYQ9D4hG2MJo5WMYoTWnBFsDRg1/YKxCo5HGOassipp9HbQVDIoZ6cUMMCayFP0R6
         C85GZn0PUpLDscZiD+Pz5LJIesiqqPWENdHlxOz9AQ+LWPw1uJs5Et7xF64yemW052es
         GlL+xtJctInxRiveHQ9Z8PUk8JNfNLBa5g2kV6Z+wbTEKi8KwQVXZVAog4HIH0lZ9Lnf
         u+0fmcyPdTjbJlzrgQjPKq8T0O4biJ3ASGJtg8pdneU+r4uFhXcCQ8yjc0Amo2s7pspt
         cEGA==
X-Gm-Message-State: AOAM532lvAxH3c1Pha4K687K56ulMjDjo8M4EHN5LBYntHplGnC60j+A
        7bb93Z0ar6XF0g2cwDYIIMnpcA==
X-Google-Smtp-Source: ABdhPJzwdIoPnHdNXz+0PCobNaN44vAuRSGmGC2g/8GawSaPh1yXmbEnoua0ZdagfyC5G5VmUp4xWQ==
X-Received: by 2002:a05:651c:1135:: with SMTP id e21mr11746387ljo.151.1616843001918;
        Sat, 27 Mar 2021 04:03:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 13/25] drm/msm/dsi: use devm_of_clk_add_hw_provider
Date:   Sat, 27 Mar 2021 14:02:53 +0300
Message-Id: <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
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
index df3b91b0ea88..46561435a27d 100644
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

