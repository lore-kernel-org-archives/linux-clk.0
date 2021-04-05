Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84C7C43616
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC033613F8
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242861AbhDEWsG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242865AbhDEWsF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A19C06178C
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:57 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b4so19659937lfi.6
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g4vbVz3Vk/y5LMIP+O851E+3rxiE7C1EatYKf4qKoes=;
        b=DSI4a8/A09U7zHzntdDinnCff7dlHOEu7M4lKDQixQmuB98geN/Qklq5IR3MzwoGHy
         JElltdemSoCq06FDyE13DTBNeTXcqJlYDnLQ7oJWXH++H8/Z9b8YNTycOeISPbUsFKqR
         VYqRIOf5ptKejUL9NkYxZCIZ35C1Il2aMMr8+UpYkuSdHcetO8Mx0kZgG5gupFBJ2uIZ
         zKfr3x9yK3qMvkbd8HlIUYlld5Xju6j115+HwLjWqROBouG/ME6z22qng3xDxjXSCodb
         xdGmmBFhS6dr6OxR7l6IDSTw9IvOOC6KIOrb2RA5+DI9tLcxxsCRldIFDaYZGC+FhXdN
         btJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g4vbVz3Vk/y5LMIP+O851E+3rxiE7C1EatYKf4qKoes=;
        b=qdA2upZzHYVv1mIiOL17x/5zQLty4H+VgHCyYoUQbqN+hLpDTIcs2Uh4XW2lO5DyoE
         Ft9zTmz+Kf0mvxpF9RQOHpHG3jSFzZk77lDq4HIrzvUVnRmxhmBmGl+eqFc0rDIR5lW6
         c2FE3jdFaTLGCHQo7SqfSsCmiaGCilIYMHUP/MEDU606AY7VXvhLJMntgn+nBvn5pkOZ
         YffDEKUjSoo8p/C4yPy6aMpxw78lJCKmwn2oAm5zk5MqhkRoKDa52xCxz/VWRb2dJSrn
         xuT4XQNpXWmLOizQ9Gwf4OgJdmtzNeJczkpu0eXyLO8DGrSx0If9w73FbBCFliwPN/f0
         eQXg==
X-Gm-Message-State: AOAM531iPiSriSluqA8DlyPoGUUVjCYGjG9JVmSXodNQoKuyVdMnU56t
        h4w/+KOw9OxUJaXaROuN2WiN7w==
X-Google-Smtp-Source: ABdhPJyqBfKJUziw3CU4TUbktJeqLhsyABpevXqWHnaV3BAMuS+MA21Xc4tFow07nqYEaHPzRfufag==
X-Received: by 2002:a19:242:: with SMTP id 63mr1107348lfc.0.1617662875716;
        Mon, 05 Apr 2021 15:47:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 15/33] clk: qcom: dispcc-sdm845: get rid of the test clock
Date:   Tue,  6 Apr 2021 01:47:25 +0300
Message-Id: <20210405224743.590029-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sdm845.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index aef1024c5318..735adfefc379 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -21,7 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
@@ -52,38 +51,32 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
 	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_byteclk", .name = "dsi0_phy_pll_out_byteclk" },
 	{ .fw_name = "dsi1_phy_pll_out_byteclk", .name = "dsi1_phy_pll_out_byteclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DP_PHY_PLL_LINK_CLK, 1 },
 	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "dp_link_clk_divsel_ten", .name = "dp_link_clk_divsel_ten" },
 	{ .fw_name = "dp_vco_divided_clk_src_mux", .name = "dp_vco_divided_clk_src_mux" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -91,7 +84,6 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_MAIN, 4 },
 	{ P_GPLL0_OUT_MAIN_DIV, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
@@ -99,21 +91,18 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .fw_name = "gcc_disp_gpll0_clk_src", .name = "gcc_disp_gpll0_clk_src" },
 	{ .fw_name = "gcc_disp_gpll0_div_clk_src", .name = "gcc_disp_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
 	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk", .name = "dsi0_phy_pll_out_dsiclk" },
 	{ .fw_name = "dsi1_phy_pll_out_dsiclk", .name = "dsi1_phy_pll_out_dsiclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 /* Return the HW recalc rate for idle use case */
-- 
2.30.2

