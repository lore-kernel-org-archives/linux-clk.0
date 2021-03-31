Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF09C43459
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54C9361998
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbhCaK6F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 06:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbhCaK5u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 06:57:50 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9532AC0613D8
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u9so23279840ljd.11
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZzZotO+uxkFz3VvN1INWv46F9oImxt5pnat2lZqAPg=;
        b=KaSstsvjX91Uj7PPFFnGmijfjPia4g28ILZppMizp7EIr4B00yIhqJMjDtzJzmZReo
         JkBmuGxkqvNyi2vw8bcsgwdZOVMVnHxvWbW8dmxq4uXTv9wxA6a+WnSKLF1j+BajdysO
         L0p9/apSqJm6aDQU1ZVPEqF8trfacgWrMIw9VHftvQDqS4asir0QAHf0mBAM0qyco0SH
         C2O5gS1UEXGrfJF/go5/PYPC6VadhApB+9INR1CbE6UuDT0VxPKnJ/ofH3KkD3mFIIZn
         VicmDHVk3X+F6nlgehXfFUj7sHV7RkqICzrJeQp4/TL0AdPTkp4N3EawP/VRgS2bVx18
         TgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZzZotO+uxkFz3VvN1INWv46F9oImxt5pnat2lZqAPg=;
        b=L4T3BMROXBAzBEMXfL2hYtaaMGaNxiq71XTiNhdCUpiLS9fYHDh6+WtyI5liiIwpuL
         EGJPNfv0+L95WKxGGMCBghngM880m3H7hj3AwsWct8R7c0EsVcnrVnaWLChC753u/MwE
         PnxjNXV6I4lPHwN39tW4eGD3i1V9fQpQOfOrPSEdf329DetM5Wa/GfYLC652DMFq56eD
         1NZR0DvtzUSzd0cB3guoi6edhL7XHI4X2IX9psaybt2nrAjQNPK01oOyEyeUsr7DuPtO
         bSaNAhFDx6RDqLEslaH83y+QowUX3V4SStxA0s20dcR/pv83ZG0Yv6fDoLn6oc84BPHq
         XUQg==
X-Gm-Message-State: AOAM530veoG34CXGD1cEzkP0DvNEih0urzBptsoCzLbcjg8g5uXlV19w
        SQ8nsAY9kV4oqqmAH1N2wntXDg==
X-Google-Smtp-Source: ABdhPJxm936jSBRjZ+aiDrKoZpwHR+akLI3/lQNHKX6nSdCNk4oTTUssAk1MRLq6mkn5SqxfULjs5w==
X-Received: by 2002:a2e:810a:: with SMTP id d10mr1659590ljg.304.1617188265275;
        Wed, 31 Mar 2021 03:57:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 09/24] drm/msm/dsi: remove msm_dsi_pll_set_usecase
Date:   Wed, 31 Mar 2021 13:57:20 +0300
Message-Id: <20210331105735.3690009-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

msm_dsi_pll_set_usecase() function is not used outside of individual DSI
PHY drivers, so drop it in favour of calling the the respective
set_usecase functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/dsi.h              | 7 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 9 ---------
 6 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 98a4b296fa30..b310cf344ed4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -100,8 +100,6 @@ int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
 int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
-int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-			    enum msm_dsi_phy_usecase uc);
 #else
 static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
@@ -118,11 +116,6 @@ static inline int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 {
 	return 0;
 }
-static inline int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-					  enum msm_dsi_phy_usecase uc)
-{
-	return -ENODEV;
-}
 #endif
 
 /* dsi host */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 000e4207dabc..f737bef74b91 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -29,8 +29,6 @@ struct msm_dsi_pll_ops {
 	void (*destroy)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
-	int (*set_usecase)(struct msm_dsi_pll *pll,
-			   enum msm_dsi_phy_usecase uc);
 };
 
 struct msm_dsi_phy_cfg {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 5f9d0cfc4e03..7a98e420414f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -1049,7 +1049,7 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_10nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1109,7 +1109,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1136,7 +1135,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8e4528301e5d..bab86fa6dc4b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1190,7 +1190,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
 				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_14nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1231,7 +1231,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
@@ -1260,7 +1259,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 4831d6769da7..5acdfe1f63be 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1064,7 +1064,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_7nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1142,7 +1142,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
@@ -1170,7 +1169,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index e607adffe001..98ee4560581a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -113,12 +113,3 @@ int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 
 	return 0;
 }
-
-int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-			    enum msm_dsi_phy_usecase uc)
-{
-	if (pll->cfg->pll_ops.set_usecase)
-		return pll->cfg->pll_ops.set_usecase(pll, uc);
-
-	return 0;
-}
-- 
2.30.2

