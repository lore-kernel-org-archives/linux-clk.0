Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA9CC433E9
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9C6E61A25
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbhCXPUR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236576AbhCXPTi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:38 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03141C06178A
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:21 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v15so2360293lfq.5
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKmMzx9L+pGHn81TOLWWWuWPME7Tz9WZtHz+YDj8zLw=;
        b=aDGANL1opzNfRT1/KACZZ0pojd8tblP3uWWXcZvtJU3DCbO7x5g+x0jPbew2p/cK4p
         d7kZgMxUYpIU883gCoyXIDY83Gxi+5nglewjHgmMlPJyTatvsj8GJ/TJ5//K0CZeuia+
         6ME2VVW28N9fApCE+eBbp916zqqrFYqGVP/ScijRx7mYZQCtT9k0F8LCaexqX/9ZTcIA
         2gALPqxsmyiRAVy2C9jgJqPU1WEUdaID5aKpgc99WdnbLod4iPXUHQs/TRTPlLUNBgk5
         eUs0MjCON6sFEJ2pfdqxSS5IsOn7RrBOpR3WhqfZFRsO3lknn5+N04adR7cP9YkSCfK/
         M+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKmMzx9L+pGHn81TOLWWWuWPME7Tz9WZtHz+YDj8zLw=;
        b=s+znYduiQ5O9ldlNDFVf+cI7bfaP6Pn+M/pLrv67fiNYUiOKqcWgFIl+Stamj8BRVA
         r1D3YR/cQjH5mukRCqTns8rSUjhLvnPCztZRp+l/uFyQ/eLGqB6GNYp8pmZVK1qagfhk
         tfKaoOkrQgOzImp5cWi4GFEhH7rfD7kuqgTIrk4JZ8JnLX1V1yFEaZhImtYHgUrRxaiH
         e/0fwM0S4ZYYguE7agrHz84ET9fdQ7mkfdECI+LYj9b5wDKiSvYX1DH1wvwwJmp9K+N6
         D/52J0p/5XpveinW+nIMdxb8Zvk0QEDuvgxBlMWmm3NUeejICpGW6HWG0BDLWa52bfmF
         w3xw==
X-Gm-Message-State: AOAM533ENfLoGp7F6E30XOrc/Lg6IMadqwQF3QN/sgXyHRX8FjbeM0t+
        FcJvE0Ud+CXsmGz3vXSnrjZh+w==
X-Google-Smtp-Source: ABdhPJxDZ2tPM4djZhhnQjvfkc919RzNSEUpYJzXSa3CUOAeiy5MIzaVWOZKgXcQj8DFUy8+XpzGcg==
X-Received: by 2002:a19:f614:: with SMTP id x20mr2215089lfe.229.1616599160025;
        Wed, 24 Mar 2021 08:19:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 09/28] drm/msm/dsi: move min/max PLL rate to phy config
Date:   Wed, 24 Mar 2021 18:18:27 +0300
Message-Id: <20210324151846.2774204-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  3 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  6 ++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  6 ++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  8 ++++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 12 ++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c           |  8 ++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h           |  3 ---
 8 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 39abb86446f9..000e4207dabc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -38,6 +38,9 @@ struct msm_dsi_phy_cfg {
 	struct msm_dsi_phy_ops ops;
 	const struct msm_dsi_pll_ops pll_ops;
 
+	unsigned long	min_pll_rate;
+	unsigned long	max_pll_rate;
+
 	/*
 	 * Each cell {phy_id, pll_id} of the truth table indicates
 	 * if the source PLL selection bit should be set for each PHY.
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index dc8ccc994759..5f9d0cfc4e03 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -864,8 +864,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_10nm->postdiv_lock);
 
 	pll = &pll_10nm->base;
-	pll->min_rate = 1000000000UL;
-	pll->max_rate = 3500000000UL;
 	pll->cfg = phy->cfg;
 
 	pll_10nm->vco_delay = 1;
@@ -1113,6 +1111,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.restore_state = dsi_pll_10nm_restore_state,
 		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
@@ -1138,6 +1138,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.restore_state = dsi_pll_10nm_restore_state,
 		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index d78f846cf8e4..8e4528301e5d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1078,8 +1078,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_14nm->postdiv_lock);
 
 	pll = &pll_14nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 	pll->cfg = phy->cfg;
 
 	pll_14nm->vco_delay = 1;
@@ -1237,6 +1235,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x994400, 0x996400 },
 	.num_dsi_phy = 2,
 };
@@ -1264,6 +1264,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index bb33261d606d..d267b25e5da0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -625,8 +625,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		pll_28nm->vco_delay = 1000;
 	else
@@ -811,6 +809,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0xfd922b00, 0xfd923100 },
 	.num_dsi_phy = 2,
 };
@@ -837,6 +837,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
 };
@@ -863,6 +865,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq_lp,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x1a98500 },
 	.num_dsi_phy = 1,
 	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 79b0842a8dc4..31e7910c6050 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -508,8 +508,6 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 	}
 
 	pll = &pll_28nm->base;
-	pll->min_rate = VCO_MIN_RATE;
-	pll->max_rate = VCO_MAX_RATE;
 
 	pll->cfg = phy->cfg;
 
@@ -711,6 +709,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.disable_seq = dsi_pll_28nm_disable_seq,
 		.enable_seq = dsi_pll_28nm_enable_seq,
 	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
 	.io_start = { 0x4700300, 0x5800300 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 44ae495e8fca..4831d6769da7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -889,14 +889,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_7nm->postdiv_lock);
 
 	pll = &pll_7nm->base;
-	pll->min_rate = 1000000000UL;
-	pll->max_rate = 3500000000UL;
-	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
-		pll->min_rate = 600000000UL;
-		pll->max_rate = (unsigned long)5000000000ULL;
-		/* workaround for max rate overflowing on 32-bit builds: */
-		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
-	}
 	pll->cfg = phy->cfg;
 
 	pll_7nm->vco_delay = 1;
@@ -1152,6 +1144,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.restore_state = dsi_pll_7nm_restore_state,
 		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
+	.min_pll_rate = 600000000UL,
+	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
@@ -1178,6 +1172,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.restore_state = dsi_pll_7nm_restore_state,
 		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
+	.min_pll_rate = 1000000000UL,
+	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index c7ff0eba0e8b..e607adffe001 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -14,10 +14,10 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 
-	if      (rate < pll->min_rate)
-		return  pll->min_rate;
-	else if (rate > pll->max_rate)
-		return  pll->max_rate;
+	if      (rate < pll->cfg->min_pll_rate)
+		return  pll->cfg->min_pll_rate;
+	else if (rate > pll->cfg->max_pll_rate)
+		return  pll->cfg->max_pll_rate;
 	else
 		return rate;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index 4fa73fbcba52..8306911f8318 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -18,9 +18,6 @@ struct msm_dsi_pll {
 	bool		pll_on;
 	bool		state_saved;
 
-	unsigned long	min_rate;
-	unsigned long	max_rate;
-
 	const struct msm_dsi_phy_cfg *cfg;
 };
 
-- 
2.30.2

