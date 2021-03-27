Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADCCC433EA
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 11:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 514C661A0D
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 11:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhC0LD2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 27 Mar 2021 07:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhC0LD0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 27 Mar 2021 07:03:26 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CEBC0613BA
        for <linux-clk@vger.kernel.org>; Sat, 27 Mar 2021 04:03:25 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u9so10261447ljd.11
        for <linux-clk@vger.kernel.org>; Sat, 27 Mar 2021 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZkwV78IuNtmaq0h8QhjzXk9W9vQ8jeXGP9lM1kXR6HE=;
        b=QTtcaSVah+rbfN+Qnd0J+Q5bLs0dBTq9uo7X154/qJxzyy2b1+MyaRmQMO3z6Mwnr2
         pPb7VZIPP+8EWiSurElVOZqte/qwPAcVYQH6ckmoS1pMSld+x70zMqckhe4JatWb2HQd
         2N19dl4FlFZwQFHcp3xEQmaq2yZwIi+hWFrmHdXzs4InVAMnRFt087ZlS/CZqtN0d7Gy
         tnSR63Rc4OkSABeI6tEVlqS8M9Cn/NSs6V4zGrKRTnqaA28GTH5nUzrS2bgjpDjfgqwI
         j9bQq4VvaiOdEORXZsVWSacMoP79op+z1X1uadlsCNDGtK1vPzbU/Vb3SNz6hZ2f63lD
         463g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZkwV78IuNtmaq0h8QhjzXk9W9vQ8jeXGP9lM1kXR6HE=;
        b=Zs+raME3bA9MoZyMhUvi2PLOu43MqK7hfZkbEEpA8EGzFGrNw9W/StejCjOt3G50I7
         c6aX7mXK0XKUO3uXsJ91PzjitC4zz3aepSIQ2bU3fJ9aP8Zcjb2xgEshLcXV8lMZuiLm
         6UEdY6NuTsjeWCGsVWEDW8V8Xeas76GwVhMBS+lLoxOE+qbSpx+6NIBFoI6KcMeftRps
         aN1hgjBz5vNmlyqv18Y8ik+80a9CfDkIWoOZVpxWAYSINHiIJ800NyBND4Sa2iFKPGq9
         e3ohUAwNfXiPnFnNMk2SvJ3uPpp4u9hpyqitdPwH7ejl/J0xm5apfvNbqUeMMEu8tcJS
         Xw4Q==
X-Gm-Message-State: AOAM530HLoJIqjcnySAh7V3cPgjyaSaiQHfx57CNtCx5xytjEwdp0zjQ
        pA5VDAN8NgZMp0tP6qvwMd/rMw==
X-Google-Smtp-Source: ABdhPJy6cxgJgkqHEz5K2a5c2Hisa3T67LBUvKtXYR1b053qI1iND+HEEsL86Z4S/GB2Od6gIwjifA==
X-Received: by 2002:a2e:b051:: with SMTP id d17mr11497736ljl.255.1616843004098;
        Sat, 27 Mar 2021 04:03:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 16/25] drm/msm/dpu: simplify vco_delay handling in dsi_phy_28nm driver
Date:   Sat, 27 Mar 2021 14:02:56 +0300
Message-Id: <20210327110305.3289784-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
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

