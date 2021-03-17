Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B54C4360C
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92EF764F70
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhCQOlf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbhCQOk7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:40:59 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D828CC06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:58 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s17so3479231ljc.5
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69KNFaVrTSr7S1ZZcdnbCwBqT6v2VtM4VG8+YzYsLCk=;
        b=rEqPe1YOskPqXoX+oSNqmbu3NcGqON3WXT0vUrO0nKdnc/UP9DlNDvIBDqGS40Kzqh
         sZwvfOwrj7+eH47Z/nWmYm0wGDQu4jTSc0vuhVbzsPib53VVW2YtgVmH1iEnIYNBiUcv
         16mJvEbNKpjkLmsIqgGw953ItPHV9TMinyV+sI/gRqaBDZRWzadlSHiOFZoBKvrmhb7w
         WLyT3KK1xyRWCcaFrGMKSNEdE5U24ANm1LOhvUpRLUw/0MikxpJzluBn1ddCksPZrOa/
         DKpzWoYAp1fe9b0GSpgOL5T8iOk6oUxTHh0JHQ2sZy5LJ1CryOBrlanGeVt7QY+8rm5N
         QLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69KNFaVrTSr7S1ZZcdnbCwBqT6v2VtM4VG8+YzYsLCk=;
        b=uFSslHh7p2kEupw4CETfWyEt1s8WscNa22qyHqWmA6jIiYKKcgCM75HLTvpplO4XVY
         GSbxHZVAz/kIcyD/xrMg9wz+rjW56eIwKOIIKCOmLwYrBGSGX4MOa5rHBAISDwWm/hFJ
         xMouiU46qGyMNF2tv8hi2MnCRQ/xP7sbroKwAWr0Dbkn74MpMSqurMLd/ccM4Xl2xMRA
         5tltnIliWZW5e40hpTqJvCHVCMVC6Bv5fnaDX2J8iHGvTzSLtn0EX2mXonQ84xJq3JOK
         5peCiT3S/LwvAX9GNod2FNEjXN1uhz1vkqaKJMjckNBgPEHYEK3VNGQUi1zfPCD64a5q
         I5pw==
X-Gm-Message-State: AOAM53199FXc+TVmwm5d7Y5T7AjTyJ3lL6VclkkoeEvm5pi0gYCTa8BY
        KqOVfGqZXegmS+cGDsyROyWepA==
X-Google-Smtp-Source: ABdhPJzW6HqYXbe0dc5bBaYJey1PE1XkHpQCvQt5qycNCjJYjMggZw++WMrvCE9y1+eJ6C40auP6tA==
X-Received: by 2002:a2e:b817:: with SMTP id u23mr2579427ljo.44.1615992057419;
        Wed, 17 Mar 2021 07:40:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 16/26] drm/msm/dsi: limit vco_delay to 28nm PHY
Date:   Wed, 17 Mar 2021 17:40:29 +0300
Message-Id: <20210317144039.556409-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Only 28nm PHY requires sleeping during the VCO rate setting procedure.
Rewrite sleeping for 28nm and drop vco_delay from the rest of PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |  3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |  4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 10 ++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |  3 ---
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 81ca0cf2a3ad..7533db8955a5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -96,7 +96,6 @@ struct dsi_pll_10nm {
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -768,8 +767,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_10nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_10nm->vco_delay = 1;
-
 	ret = pll_10nm_register(pll_10nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index c531ddf26521..023727623847 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -122,8 +122,6 @@ struct dsi_pll_14nm {
 	void __iomem *phy_cmn_mmio;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct dsi_pll_input in;
 	struct dsi_pll_output out;
 
@@ -1012,8 +1010,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_14nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_14nm->vco_delay = 1;
-
 	ret = pll_14nm_register(pll_14nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index fa96bfc21fdb..e77b21f0d3bf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -69,8 +69,6 @@ struct dsi_pll_28nm {
 	struct platform_device *pdev;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -209,8 +207,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->vco_delay)
-		udelay(pll_28nm->vco_delay);
+	if (pll->cfg->type == MSM_DSI_PHY_28NM_HPM)
+		udelay(1);
+	else /* LP */
+		udelay(1000);
 
 	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -576,7 +576,6 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll_28nm->vco_delay = 1;
 
 	pll->cfg = phy->cfg;
 
@@ -616,7 +615,6 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll_28nm->vco_delay = 1000;
 
 	pll->cfg = phy->cfg;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c6f0aca66fa9..d3fea4a2b498 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -96,7 +96,6 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -793,8 +792,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_7nm->vco_delay = 1;
-
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-- 
2.30.2

