Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EC5C2BA4C
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CA9364F50
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhCQOlB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhCQOkw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:40:52 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8815FC061760
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:51 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u10so3470781lju.7
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3sKM29iK0JcTNurlQ+5eK4qtMVgf23VKGxyH/JDZ+DA=;
        b=DIQH0dkcn6nOMEkYbrum4rs02hsLV8LWwZT01erSRvx+KOedcDSN6COWiA0sAaWGfa
         XPax84ZuA8Dzqc4DGvqjpou0tGsBYmFQ9bRD3Qm7ygIbZX/fZt5MzAKG64M61MSmUwQL
         4jffDG5DSCnImvsZFOUZ0+z7ldKZbfA1SnEMHJgw/RqScd751/enyABsKig5zxnKAhaI
         A29fox6J9oLuOCrGoUTev/ox3KXaDTb61j5PGeZ0FaDbaERBpzrWgWJp8yQiL8Pa/BFt
         eDJ1m8t6uU8ZbXGzKvLNBb2gd0zhB/rW9hdoH98+C+T3dCkb2V60OBuF1Kweibau9+tg
         YBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3sKM29iK0JcTNurlQ+5eK4qtMVgf23VKGxyH/JDZ+DA=;
        b=E3ZuP9r2VzX4yVM57ILP6qt4AQkFe4C4QNhwRKI7EJs03LXZlokx0vY2JnFiVTy/Hn
         CfZ9jYT7x0nandqyYVoe4vDiidt1QwQNmqG3bRIyuVYVEboHXcyaMxtw2yHro+WutPIb
         6pM6HVAXYKaVulGocBEbZujjBodO047ZKpAuD6MNmQqyGmWi40TmqqzP4A++ycYXPMCw
         7xfT2Ny55+ChTB59Bb/NLR6tXdgxpBP/Atkt6SkdBSUES4+p90/4e/O45qg3LQcVHYR9
         jsRCi+mT0n/m6hIcXJhLQNRNy/5+KocetzsLEMzYO0ntdgqSLXhAAaHNsKu33y8VatK3
         4wUw==
X-Gm-Message-State: AOAM533PhPudbDIpJV4H4d05Qo0DIrcz8x3BLr3rktgVKys6jSb9RqHl
        Nx8oWqbIKh7+A7UoMcdatxghyQ==
X-Google-Smtp-Source: ABdhPJz3gQxreuKmTH05jXI9A5joh15KFQ9L/TlfqMLsj0pAAn8uyZxsBYER15IAZi261yCveF1+hw==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr2667497ljl.127.1615992050048;
        Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 08/26] drm/msm/dsi: stop setting clock parents manually
Date:   Wed, 17 Mar 2021 17:40:21 +0300
Message-Id: <20210317144039.556409-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no reason to set clock parents manually, use device tree to
assign DSI/display clock parents to DSI PHY clocks. Dropping this manual
setup allows us to drop repeating code and to move registration of hw
clock providers to generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h                 |  9 ----
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 51 -------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c         | 12 -----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  3 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 19 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 17 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 18 -------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 16 ------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 19 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 11 ----
 10 files changed, 175 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index a130330b97b6..da59f8bc8d2c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -108,19 +108,12 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 struct msm_dsi_pll;
 #ifdef CONFIG_DRM_MSM_DSI_PLL
 void msm_dsi_pll_destroy(struct msm_dsi_pll *pll);
-int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
 int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
 #else
 static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
 }
-static inline int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
-{
-	return -ENODEV;
-}
 static inline void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
 {
 }
@@ -155,8 +148,6 @@ unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-			struct msm_dsi_pll *src_pll);
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
 void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 	struct msm_dsi_phy_clk_request *clk_req,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ab281cba0f08..bf3468ccc965 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2225,57 +2225,6 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 	wmb();
 }
 
-int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
-	struct msm_dsi_pll *src_pll)
-{
-	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct clk *byte_clk_provider, *pixel_clk_provider;
-	int ret;
-
-	ret = msm_dsi_pll_get_clk_provider(src_pll,
-				&byte_clk_provider, &pixel_clk_provider);
-	if (ret) {
-		pr_info("%s: can't get provider from pll, don't set parent\n",
-			__func__);
-		return 0;
-	}
-
-	ret = clk_set_parent(msm_host->byte_clk_src, byte_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to byte_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	ret = clk_set_parent(msm_host->pixel_clk_src, pixel_clk_provider);
-	if (ret) {
-		pr_err("%s: can't set parent to pixel_clk_src. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
-
-	if (msm_host->dsi_clk_src) {
-		ret = clk_set_parent(msm_host->dsi_clk_src, pixel_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to dsi_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-	if (msm_host->esc_clk_src) {
-		ret = clk_set_parent(msm_host->esc_clk_src, byte_clk_provider);
-		if (ret) {
-			pr_err("%s: can't set parent to esc_clk_src. ret=%d\n",
-				__func__, ret);
-			goto exit;
-		}
-	}
-
-exit:
-	return ret;
-}
-
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 1d28dfba2c9b..6b65d86d116a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -70,7 +70,6 @@ static int dsi_mgr_setup_components(int id)
 	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
 	struct msm_dsi *clk_master_dsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
 	struct msm_dsi *clk_slave_dsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
-	struct msm_dsi_pll *src_pll;
 	int ret;
 
 	if (!IS_DUAL_DSI()) {
@@ -79,10 +78,6 @@ static int dsi_mgr_setup_components(int id)
 			return ret;
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
-		src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
-		if (IS_ERR(src_pll))
-			return PTR_ERR(src_pll);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
 	} else if (!other_dsi) {
 		ret = 0;
 	} else {
@@ -109,13 +104,6 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_MASTER);
 		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
 					MSM_DSI_PHY_SLAVE);
-		src_pll = msm_dsi_phy_get_pll(clk_master_dsi->phy);
-		if (IS_ERR(src_pll))
-			return PTR_ERR(src_pll);
-		ret = msm_dsi_host_set_src_pll(msm_dsi->host, src_pll);
-		if (ret)
-			return ret;
-		ret = msm_dsi_host_set_src_pll(other_dsi->host, src_pll);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b8dd8072d24c..ea1bd375b9ff 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -27,9 +27,6 @@ struct msm_dsi_phy_ops {
 struct msm_dsi_pll_ops {
 	int (*enable_seq)(struct msm_dsi_pll *pll);
 	void (*disable_seq)(struct msm_dsi_pll *pll);
-	int (*get_provider)(struct msm_dsi_pll *pll,
-			struct clk **byte_clk_provider,
-			struct clk **pixel_clk_provider);
 	void (*destroy)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 339f7a56e555..fee080677c36 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -618,23 +618,6 @@ static int dsi_pll_10nm_set_usecase(struct msm_dsi_pll *pll,
 	return 0;
 }
 
-static int dsi_pll_10nm_get_provider(struct msm_dsi_pll *pll,
-				     struct clk **byte_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
-	struct clk_hw_onecell_data *hw_data = pll_10nm->hw_data;
-
-	DBG("DSI PLL%d", pll_10nm->id);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 static void dsi_pll_10nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
@@ -1118,7 +1101,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_10nm_get_provider,
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
@@ -1145,7 +1127,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_10nm_get_provider,
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index a141c37d86ab..f43099ffa827 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -880,21 +880,6 @@ static int dsi_pll_14nm_set_usecase(struct msm_dsi_pll *pll,
 	return 0;
 }
 
-static int dsi_pll_14nm_get_provider(struct msm_dsi_pll *pll,
-				     struct clk **byte_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
-	struct clk_hw_onecell_data *hw_data = pll_14nm->hw_data;
-
-	if (byte_clk_provider)
-		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 static void dsi_pll_14nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
@@ -1243,7 +1228,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_14nm_get_provider,
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
@@ -1272,7 +1256,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.pll_init = dsi_pll_14nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_14nm_get_provider,
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 4ddb68f5a82a..353b91de7106 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -492,21 +492,6 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 	return 0;
 }
 
-static int dsi_pll_28nm_get_provider(struct msm_dsi_pll *pll,
-				struct clk **byte_clk_provider,
-				struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = pll_28nm->provided_clks[DSI_BYTE_PLL_CLK];
-	if (pixel_clk_provider)
-		*pixel_clk_provider =
-				pll_28nm->provided_clks[DSI_PIXEL_PLL_CLK];
-
-	return 0;
-}
-
 static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -838,7 +823,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 		.pll_init = dsi_pll_28nm_hpm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
@@ -867,7 +851,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
 		.pll_init = dsi_pll_28nm_hpm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
@@ -896,7 +879,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 		.pll_init = dsi_pll_28nm_lp_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index bd2582575a07..8af50c7ad2f9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -377,21 +377,6 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 	return 0;
 }
 
-static int dsi_pll_28nm_get_provider(struct msm_dsi_pll *pll,
-				struct clk **byte_clk_provider,
-				struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = pll_28nm->provided_clks[DSI_BYTE_PLL_CLK];
-	if (pixel_clk_provider)
-		*pixel_clk_provider =
-				pll_28nm->provided_clks[DSI_PIXEL_PLL_CLK];
-
-	return 0;
-}
-
 static void dsi_pll_28nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
@@ -703,7 +688,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
 		.pll_init = dsi_pll_28nm_8960_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_28nm_get_provider,
 		.destroy = dsi_pll_28nm_destroy,
 		.save_state = dsi_pll_28nm_save_state,
 		.restore_state = dsi_pll_28nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index d34ddf50c5ff..542526949347 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -643,23 +643,6 @@ static int dsi_pll_7nm_set_usecase(struct msm_dsi_pll *pll,
 	return 0;
 }
 
-static int dsi_pll_7nm_get_provider(struct msm_dsi_pll *pll,
-				     struct clk **byte_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
-	struct clk_hw_onecell_data *hw_data = pll_7nm->hw_data;
-
-	DBG("DSI PLL%d", pll_7nm->id);
-
-	if (byte_clk_provider)
-		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
-
-	return 0;
-}
-
 static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
@@ -1151,7 +1134,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_7nm_get_provider,
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
@@ -1178,7 +1160,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 	},
 	.pll_ops = {
-		.get_provider = dsi_pll_7nm_get_provider,
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 98ee4560581a..5768e8d225fc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -74,17 +74,6 @@ void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
 /*
  * DSI PLL API
  */
-int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
-	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
-{
-	if (pll->cfg->pll_ops.get_provider)
-		return pll->cfg->pll_ops.get_provider(pll,
-					byte_clk_provider,
-					pixel_clk_provider);
-
-	return -EINVAL;
-}
-
 void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
 	if (pll->cfg->pll_ops.destroy)
-- 
2.30.2

