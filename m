Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FC8C43461
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3086C61994
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbhCaK6G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 06:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235149AbhCaK5v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 06:57:51 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08407C061760
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:51 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s17so23314308ljc.5
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DoN9UpXQ+NxJdISiIfI85ZTjA9yvZFQNixNYauSwkTY=;
        b=kHXzHoBxp7/kwIYvnjBIfuEsrWBN5VFjk9BBVo6/uDJsVuzViCMj3blXMRh/uj63GX
         D7MrWMHKGYySdx9MhtVlrQii/AfWUoRRYOQK69g3fYIBZsCVuGvGANMbEIJ7JRXrAAB1
         PN1qzHCPLok1BX1bDzvTbEwDCQy6lmQeBE1us0ilVjGicRgtEc3fuU++mlhmzTuThTdB
         RRi3hkHLUh5fSYObqINSzit/NrKcTequlFcZTWdxyNCBqcMvYMyVzAw261rrIpbSr0T9
         8An5VLmyhWRE8UjMmCxRaKfGWoL6DCkmyhguOgxIWvE/MRztay9WD9grtfjzk86PHYGA
         Z1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DoN9UpXQ+NxJdISiIfI85ZTjA9yvZFQNixNYauSwkTY=;
        b=TyFbtwuHMwu5NNDAAZd0q8m4ewv1LOPuUZB4aoDJWlMknoTtC3Lc5BRGOO/nOwDA6O
         MbU0yFsp7EgX/SycYZ1RzHEDcePtvoZramQgGyqE0huYuRW8MBvTla0OxPDYfudnmw3Z
         VnXnBwMoHM8a0BpyFtdStYopDBTuJ7MFBPPYE1PgscCsPxAgRYXuomkHB1N+FN+owiW4
         dSKrrzQKRNK1xnhz2UgnjeQg4cIUEJ6++/x3b+A8NGOgUEICeD5sjFVoNcIMlWuoYvkx
         z6V6AONXza1+mVy/A5p+GGBFgOcXFhS0IkriLanWE4jN3e8WraisT7zr1sV3qliT6Tj9
         7Ldw==
X-Gm-Message-State: AOAM532Or1hNed7S4o0Nu/f5yaqX7cz6m3zTvg152yzt6sPz3FVK63en
        LmF+lv997r/1bbuokZaYv7EXbg==
X-Google-Smtp-Source: ABdhPJxXiBsz+spDV6S2bGwneZukT2StbCr+06xUStC3SMsp1wU9HXFy8EEXMxwW2LVNff+J0XHPdA==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr36205ljn.286.1617188269493;
        Wed, 31 Mar 2021 03:57:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.48
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
Subject: [PATCH v4 14/24] drm/msm/dsi: drop vco_delay setting from 7nm, 10nm, 14nm drivers
Date:   Wed, 31 Mar 2021 13:57:25 +0300
Message-Id: <20210331105735.3690009-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These drivers do not use vco_delay variable, so drop it from all of
them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index d81cea661f5c..91ae0f8dbd88 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -99,7 +99,6 @@ struct dsi_pll_10nm {
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -771,8 +770,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_10nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_10nm->vco_delay = 1;
-
 	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 7fe7c8348b42..434d02ffa7fe 100644
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
 	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index d725ceb0b90c..321d23b3ed18 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -99,7 +99,6 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -796,8 +795,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_7nm->vco_delay = 1;
-
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-- 
2.30.2

