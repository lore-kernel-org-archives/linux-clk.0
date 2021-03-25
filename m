Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067CFC43446
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4B9060240
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhCYLMj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhCYLL6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:58 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFD3C06175F
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:57 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b4so1912802lfi.6
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlFFAnWw2oQS6KQuBOzl9VFGrwAtxCUu1GQdT8KGelI=;
        b=Q2FtlHyq9lCVdHB+T4AqLf/mTjSpxlXIr0Rc/L+21g/h7G+nEvOdtIMpx25bRMHr1G
         9WXvA9DxBkt08b0v0pANFJ1I9aqjStDMtW6FuLd0isoGXZCkWV+mZXaSyZKglPtRHdpf
         sZQk9iwB+3ZjhdTGZxbYBHFOs4Q3YveUEnLg+VsTXtQwZBxSRlijMVJ1bOsfHjcrZvT5
         cEDTTSq/MwYVdFh8j4K5cnDRPIT/E6oRNaoKGRBfjOGuaFQOSEbFBS0hu7rAgvCmlW/N
         avYXyQSL3nj5T1u1hmBUkFas36VXOQl4VMDggc04TwCCrsQcP4XnFwFhDutVINrbB9/I
         m+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlFFAnWw2oQS6KQuBOzl9VFGrwAtxCUu1GQdT8KGelI=;
        b=OGrJznBs0dn4+kClLJYP3GGBNhMEYpQcDIk76bpXfM3dGxAzmJmNftzzqOAnMnpAHY
         dHg8nWxDfmH8KBNWJWfuE6gRU072vUHLMzhLBBkgr8TiKu6cay8AVqU0FTP0LstIf91y
         +BpWrkxpc/2HjMZUbhq7QGA7cRYZY983Ip2pf5TZvPYQz+sT8tYBX9ATrNf1eHJKDLdB
         MLrdGl48ds7Wlrzjg/Uwaio593rgFvFDQ3xUG8YiudyApf7bRisaCcHtQBnuGTgUI3o9
         ku39xrPEPyELMFDT50Kjd7j4nEc1sslfnQiKy12RqncKYEmYFS8gSWiUFfVgVmFvWpHU
         tuvg==
X-Gm-Message-State: AOAM531lp9U2uPY7ZcAxrbp14twcN67fn3LA9RouvgCxfUu0O4GIqJsP
        dr/0SBBB/+kz5CA9YMlE/IKBTw==
X-Google-Smtp-Source: ABdhPJwFyaqfQ4UJ+nmevJJOzQyffkAN9YmU1D0QLJdQeSETcUP20X9ctJfJXW48kYJkddQhUSUybw==
X-Received: by 2002:a19:6b10:: with SMTP id d16mr4949784lfa.540.1616670716160;
        Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v1 12/15] clk: qcom: dispcc-sdm845: get rid of the test clock
Date:   Thu, 25 Mar 2021 14:11:41 +0300
Message-Id: <20210325111144.2852594-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sdm845.c | 39 ++++++++++++--------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index bf5e8a4a0230..195cecf9f294 100644
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
@@ -125,7 +114,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -140,7 +129,7 @@ static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte1_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -160,7 +149,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -174,7 +163,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -187,7 +176,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -201,7 +190,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel1_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -215,7 +204,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -235,7 +224,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -249,7 +238,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc1_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -276,7 +265,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -290,7 +279,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -305,7 +294,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk1_clk_src",
 		.parent_data = disp_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -329,7 +318,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -343,7 +332,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.30.2

