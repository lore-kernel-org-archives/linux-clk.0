Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968E0C43462
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8065C61A16
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhCXPUV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbhCXPTu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:50 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19A2C0613E3
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o10so32556215lfb.9
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFHW0LdlrmaF7YDk0vokBt8XF/nut54+Ls9k+Au93LE=;
        b=znoqwLJm7izb5lBmvfQwSvrc7kAZkwlBIOkIwe1r2FpSKUwHYcNd2RvOtQBv6rjHes
         idvTjUKowrFuKSzrhG6PTGe55Ftzt/KlSBbbsAYEhSNYfYL7DuGeV3Co1ak+2rlZtuGq
         u/53FicoWS8BniYtKaiPTNj1qvuO2hjzj5iNJVqxelDgGT7KwWMZWAP9biyyWEkjPYl1
         XsCOz0nQfNaBe3oN0/wI5tYgkyu/k0RO+07V4WOT3Dpa79QLxUG2cNuPIMpBSSfljBdQ
         7/doPKIxu+z//vNI/5vVkaYIi5RmBhggCZzSscdDEJ6pv3SXyHuxko/n4wuKffA2fePS
         t/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFHW0LdlrmaF7YDk0vokBt8XF/nut54+Ls9k+Au93LE=;
        b=LP0SQlclASplc8TctUaFYT8WRRDxVJQEZZq/sUbgMAlcGFX1qag/kaQfbz37BhfRou
         fnmlHfuCNjJj65dpyq16OYzhzHlYqDvhbjDDd1BtmHj+GvUSAYzSES+fL3lUfDG1bMd3
         nFYWzCjEfYuPCHIDsFJZoUC5sLQd6o8ECLOFXv52MURzgyfHmuWgN7AzsbUlgGPZpauY
         qtZOBHV9+NOsD20FPmoiQryIFGd7Vvim8TB41oQqaJIEl9mH9mXxQbE0FYtzxwR9RYc/
         qZWOg3V8kGaAMuT6pl122dduEm3GUTPbQeDD0AEgc5JmH1FVZuehfFRGPFWqOLrbz3sl
         TtRA==
X-Gm-Message-State: AOAM532RBEv4CujuujXMQpnjX+YRje3SRCLNR1lTB8wE8K+49GEvrlOF
        eONE0DBq5qrlXfO56A6jXJGjFQ==
X-Google-Smtp-Source: ABdhPJzWQcwJvCfTtwbapc57LbykfrinjAf0yupRWqNHinRXX5Af6AkUjr8v2aftNoYW6OjSTLrQ1w==
X-Received: by 2002:ac2:5146:: with SMTP id q6mr2347257lfd.441.1616599172213;
        Wed, 24 Mar 2021 08:19:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 19/28] drm/msm/dpu: simplify vco_delay handling in dsi_phy_28nm driver
Date:   Wed, 24 Mar 2021 18:18:37 +0300
Message-Id: <20210324151846.2774204-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of setting the variable and then using it just in the one place,
determine vco_delay directly at the PLL configuration time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 3e9b7949b038..87d1aa4114e4 100644
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
+	if (pll->cfg->type == MSM_DSI_PHY_28NM_HPM)
+		udelay(1);
+	else /* LP */
+		udelay(1000);
 
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

