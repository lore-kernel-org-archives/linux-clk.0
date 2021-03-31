Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A968AC433C1
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87001619CA
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbhCaK6G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 06:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235152AbhCaK5w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 06:57:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EB9C061762
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:51 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g8so28498080lfv.12
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=24LsF/6oW5HLhGbrMso4ghJ48YFWrYItlbxPNj/3ct8=;
        b=FI41BkrGLO4q6rZieS2DNj6k81jGZNIMnT/IPSCmqhtdmbO7wiS47zzDSPUB238Dca
         799v+OB9oylpukfAOOEXaot0DX/ah9WDKdmoASvLHkqOOHP52Bs0cBAANNFDygYwRJI0
         2shPNB6V3Z1nIJYHhR7dKNUI80kGZ54q65+OtTVjSxep8nNoV5TBqgfICScnOjc3zDUU
         6H+AilVOMVyV0ccDK+f1ERBFcKZeVKGtysK5aYZUMK+ZkxYIU2ypYS+Wix2o/WPVl+U+
         8oNNBy9dg5l84KLbn0WE+9UERVdjqkgrInLAAE/OBFdjV5P6IHBI+pKI2mLS2SwRimCb
         hhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=24LsF/6oW5HLhGbrMso4ghJ48YFWrYItlbxPNj/3ct8=;
        b=I9szo33upAwGnNQqSL9Iybzqmv52SUS+Rqnj3om8FVQbj7KM7tu/Zz3Yo4TU6wQMXM
         KXC6+QnPp9Df2ZEuCZ1bHUcHKFBNV2TUpu4BwyeT0p3L6/0s8T5De+Klp5DrdbWWHFCt
         AzYoGkDqyFUcklO5xWW3sxCACRNtAPQ5vTWoBBJf+k/wQkSlwPwb7TyTayQF4lm9PLOi
         jFqxkT3KYkJo/LSPq/uVQN7/scIwAedoPFn7yK97Owijll884P351PTyAD+RupLi5XrR
         oqFCbRlbPzK/hGmQHoCQbU9zrx51zH2+t82VIXoxYUs7nEmPuK+jHThx1xyenmA+jnex
         omcg==
X-Gm-Message-State: AOAM533QwJYvXYl9JSLh8boww1QGMEOXEn46un3IbJf2muoQuxnbONaA
        ohSA52UKu+hsn0vba2E9sIOh4fMjoZamfA==
X-Google-Smtp-Source: ABdhPJwXXeCYYRDmlGZqRDma+CSssOi6hZviTr7hkFQpI+vSdKCVp/3tvA5SRf9MtUaPtgiGinbcGg==
X-Received: by 2002:a19:8c19:: with SMTP id o25mr1883820lfd.547.1617188270370;
        Wed, 31 Mar 2021 03:57:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 15/24] drm/msm/dsi: simplify vco_delay handling in dsi_phy_28nm driver
Date:   Wed, 31 Mar 2021 13:57:26 +0300
Message-Id: <20210331105735.3690009-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of setting the variable and then using it just in the one place,
determine vco_delay directly at the PLL configuration time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 3e9b7949b038..ed369eb18e9d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -72,8 +72,6 @@ struct dsi_pll_28nm {
 	struct platform_device *pdev;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -212,8 +210,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->vco_delay)
-		udelay(pll_28nm->vco_delay);
+	if (pll->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
+		udelay(1000);
+	else
+		udelay(1);
 
 	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -580,10 +580,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 
 	pll = &pll_28nm->base;
 	pll->cfg = phy->cfg;
-	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
-		pll_28nm->vco_delay = 1000;
-	else
-		pll_28nm->vco_delay = 1;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
-- 
2.30.2

