Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780D9C433E1
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E633619F8
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236548AbhCXPUN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236566AbhCXPT1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:27 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C566C0613E8
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b14so19284039lfv.8
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+G6RajVDTexx6T3+eLMEAHUipQEnluOhy+kbnsltVko=;
        b=rG6mF1kw7DwvEo3ge82WEUpCo3/YQYrxkzIu/d/vWrD6/xqfc54tbh518JH7NukZH8
         KordxQoeI1MU7UPM/qhqc813hk0gO1GCCBmgHWUHjWT4SWuCZ88R7zWohro6K8QrCKwp
         PwSNy0LQtQ8G94ynwfXi5Xd0cyIDgfO1HlivQGLeqlgQSx358uLoILh0T5VRl+vKdDL6
         dEWAhSupdiHbgpmSEqsqSMRm38fKgkGqGB7H/RplOO49vvlRyivf6RWaRGm5dFqr+DUr
         qnZcNps7BEMkXhL5VgWc2NyoWPkX7FZG0mMQAFEXcDO4YMxGoUeWVhm0jg283zmp+h+J
         FaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+G6RajVDTexx6T3+eLMEAHUipQEnluOhy+kbnsltVko=;
        b=gHjpn+3BFEaqZyTScRY770M7MWW/q7uIFPcfm5V6lXihHdaYOxN9KzTqBkN8y7NKBc
         O3rEYAmNDUfp6POrafJa8UvnU33ErXGVLb5858Wq4AxbboJw6eaGfqsO6zDOf0HEgCn5
         fBKcZJ+QDjcDmAqB5LuJ8VSty+5NNYP2PjpcRknSn936nAsmF/gcFjWeRkyjcATzWf7S
         OplALdKhstgSm3fRc4MOuIWgen5SNouG2f+JcCwatj6Vz2//hGnb9AkoSnQFJvdus8w+
         rE96gEp8l0r2BbaYaVgQohVX2W1Cqumk+p6oZ7qCnyREJuJCXLZLUSGq6ay0cCF2UiBb
         1IDg==
X-Gm-Message-State: AOAM533IdoD3aln3U0KBaXGx+AamRdhAqiBeBX+LPz9uJelN1ec/vTib
        BbOoshb0CIicMkip/PFH5clnpQ==
X-Google-Smtp-Source: ABdhPJzBoelMtrVQqw/rpTJkSNi4aQwxGhbxsuouDF2xrXjUisu8T3n1yy/C1moizfLPQMQ7ZgOcDA==
X-Received: by 2002:a05:6512:1108:: with SMTP id l8mr2343371lfg.592.1616599155725;
        Wed, 24 Mar 2021 08:19:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 06/28] drm/msm/dsi: drop multiple pll enable_seq support
Date:   Wed, 24 Mar 2021 18:18:24 +0300
Message-Id: <20210324151846.2774204-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The only PLL using multiple enable sequences is the 28nm PLL, which just
does the single step in the loop. Push that support back into the PLL
code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 23 +++++--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 65 +++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 +-
 5 files changed, 42 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 6a63901da7a4..4386edfa91fe 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1087,8 +1087,7 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 
 	pll_14nm->vco_delay = 1;
 
-	pll->en_seq_cnt = 1;
-	pll->enable_seqs[0] = dsi_pll_14nm_enable_seq;
+	pll->enable_seq = dsi_pll_14nm_enable_seq;
 
 	ret = pll_14nm_register(pll_14nm);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 2f502efa4dd5..760cf7956fa2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -311,7 +311,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
 /*
  * PLL Callbacks
  */
-static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
 	struct device *dev = &pll_28nm->pdev->dev;
@@ -386,6 +386,19 @@ static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
 	return locked ? 0 : -EINVAL;
 }
 
+static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
+{
+	int i, ret;
+
+	for (i = 0; i < 3; i++) {
+		ret = _dsi_pll_28nm_enable_seq_hpm(pll);
+		if (!ret)
+			return 0;
+	}
+
+	return ret;
+}
+
 static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -619,15 +632,11 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct platform_device *pdev,
 	if (type == MSM_DSI_PHY_28NM_HPM) {
 		pll_28nm->vco_delay = 1;
 
-		pll->en_seq_cnt = 3;
-		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_hpm;
-		pll->enable_seqs[1] = dsi_pll_28nm_enable_seq_hpm;
-		pll->enable_seqs[2] = dsi_pll_28nm_enable_seq_hpm;
+		pll->enable_seq = dsi_pll_28nm_enable_seq_hpm;
 	} else if (type == MSM_DSI_PHY_28NM_LP) {
 		pll_28nm->vco_delay = 1000;
 
-		pll->en_seq_cnt = 1;
-		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_lp;
+		pll->enable_seq = dsi_pll_28nm_enable_seq_lp;
 	} else {
 		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", type);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 4a40513057e8..2cfb7edf91d8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -515,8 +515,7 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
 	pll->save_state = dsi_pll_28nm_save_state;
 	pll->restore_state = dsi_pll_28nm_restore_state;
 
-	pll->en_seq_cnt = 1;
-	pll->enable_seqs[0] = dsi_pll_28nm_enable_seq;
+	pll->enable_seq = dsi_pll_28nm_enable_seq;
 
 	ret = pll_28nm_register(pll_28nm);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 3dc65877fa10..9e9fa90bf504 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -5,46 +5,6 @@
 
 #include "dsi_pll.h"
 
-static int dsi_pll_enable(struct msm_dsi_pll *pll)
-{
-	int i, ret = 0;
-
-	/*
-	 * Certain PLLs do not allow VCO rate update when it is on.
-	 * Keep track of their status to turn on/off after set rate success.
-	 */
-	if (unlikely(pll->pll_on))
-		return 0;
-
-	/* Try all enable sequences until one succeeds */
-	for (i = 0; i < pll->en_seq_cnt; i++) {
-		ret = pll->enable_seqs[i](pll);
-		DBG("DSI PLL %s after sequence #%d",
-			ret ? "unlocked" : "locked", i + 1);
-		if (!ret)
-			break;
-	}
-
-	if (ret) {
-		DRM_ERROR("DSI PLL failed to lock\n");
-		return ret;
-	}
-
-	pll->pll_on = true;
-
-	return 0;
-}
-
-static void dsi_pll_disable(struct msm_dsi_pll *pll)
-{
-	if (unlikely(!pll->pll_on))
-		return;
-
-	pll->disable_seq(pll);
-
-	pll->pll_on = false;
-}
-
 /*
  * DSI PLL Helper functions
  */
@@ -64,15 +24,36 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
 int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	int ret = 0;
 
-	return dsi_pll_enable(pll);
+	/*
+	 * Certain PLLs do not allow VCO rate update when it is on.
+	 * Keep track of their status to turn on/off after set rate success.
+	 */
+	if (unlikely(pll->pll_on))
+		return 0;
+
+	ret = pll->enable_seq(pll);
+	if (ret) {
+		DRM_ERROR("DSI PLL failed to lock\n");
+		return ret;
+	}
+
+	pll->pll_on = true;
+
+	return 0;
 }
 
 void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 
-	dsi_pll_disable(pll);
+	if (unlikely(!pll->pll_on))
+		return;
+
+	pll->disable_seq(pll);
+
+	pll->pll_on = false;
 }
 
 void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index bbecb1de5678..eebf90671eec 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -12,7 +12,6 @@
 #include "dsi.h"
 
 #define NUM_DSI_CLOCKS_MAX	6
-#define MAX_DSI_PLL_EN_SEQS	10
 
 struct msm_dsi_pll {
 	enum msm_dsi_phy_type type;
@@ -23,9 +22,8 @@ struct msm_dsi_pll {
 
 	unsigned long	min_rate;
 	unsigned long	max_rate;
-	u32		en_seq_cnt;
 
-	int (*enable_seqs[MAX_DSI_PLL_EN_SEQS])(struct msm_dsi_pll *pll);
+	int (*enable_seq)(struct msm_dsi_pll *pll);
 	void (*disable_seq)(struct msm_dsi_pll *pll);
 	int (*get_provider)(struct msm_dsi_pll *pll,
 			struct clk **byte_clk_provider,
-- 
2.30.2

