Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9EEC001BD
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF101610F7
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242866AbhDEWsI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242869AbhDEWsF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:05 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DC9C0617A7
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id n8so895447lfh.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXP1OsjpXzocu6LvhCmI9gD7bOxiAFr87tXTNPvxCeo=;
        b=iJ/V6z/nG2S84ZrTU9ZiFbKKXoG/s9AZRlcuEOgM/ITrMxx6b8wqMdE9Vky8AgEu9L
         almFfzZn4583EEfEn+S1i2Tav8SLzMEpCFPuJ82ISXsFq9vWqDFzqHjzx+CZzP9lVb0J
         5/189L9Up/kEba2yMOOl22b5ZmIOHdjipemLSVDc/uWl09+5Zt1TUetG54SqRLJ7Nrod
         9OT7Lw67BsGxj4HF0bLBXAhAMFQLKL+fZCUpyxFBg53TRaDAUvSXiryXIL92gZa/ex2B
         LVi0aWkcB/c091eDksE+7zu2gH337kP+bUBV4UzrlOKufmh8OW9QhKp4LCFS5r/5JWil
         6gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXP1OsjpXzocu6LvhCmI9gD7bOxiAFr87tXTNPvxCeo=;
        b=g2OjjkD8vXj22jCMDf+qSiTYQ4gtVUwdnl0xG+W/bUWG4agjuxwaaLSDeOz5AC3bpy
         EKM4oYmqasbZSKh/+vo4cMmt9QdWdP5usIBNQkqHKvJ66TDgVIYn+8yYsS9AZkxdCs1n
         c4xmdqyu7yhfabV6tpey2ajUIxdxoO/AihnhSMGofg8a02Nmg4r3prm0a0Z89J3XOXyU
         75aLLuU5JpKAejSGK0WaE1kDJ5frbkA5C/Vmr5gtlKjPJnrarigptjP7Gumf/oXhhWKD
         w9S1EWgxYZLHR2Wo8UWzDgt7GH+oe+zmDyJHwl89FHdv2c+tbeLN83dTRQOsO7cqxW/f
         KJ2g==
X-Gm-Message-State: AOAM531lN66aTXsbTgtOowwmDejAXtKJPHelmMYqyHd8dFKPrEGjV7wm
        Gj1W64PGvJ5ucjX3TpRKV7jA2Q==
X-Google-Smtp-Source: ABdhPJyYbzmziLzWg61y2j3FPyTZaTEIxKjVxNuRxY6+2H+n56wLTfwFQNYFUgP8l9Jx5IdpJbFiCA==
X-Received: by 2002:a05:6512:200a:: with SMTP id a10mr18155113lfb.564.1617662877042;
        Mon, 05 Apr 2021 15:47:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 17/33] clk: qcom: dispcc-sc7180: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:27 +0300
Message-Id: <20210405224743.590029-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 68 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 3334bf9cfb94..538e4963c915 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -63,8 +63,8 @@ static struct clk_alpha_pll_postdiv disp_cc_pll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_pll0_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_pll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_pll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -317,8 +317,8 @@ static struct clk_branch disp_cc_mdss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -335,8 +335,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -381,8 +381,8 @@ static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_intf_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -399,8 +399,8 @@ static struct clk_branch disp_cc_mdss_dp_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -417,8 +417,8 @@ static struct clk_branch disp_cc_mdss_dp_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_crypto_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_crypto_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_crypto_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -435,8 +435,8 @@ static struct clk_branch disp_cc_mdss_dp_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -453,8 +453,8 @@ static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_intf_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_link_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -470,8 +470,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -488,8 +488,8 @@ static struct clk_branch disp_cc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_esc0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -506,8 +506,8 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -524,8 +524,8 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_lut_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -541,8 +541,8 @@ static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -559,8 +559,8 @@ static struct clk_branch disp_cc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -577,8 +577,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rot_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_rot_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -595,8 +595,8 @@ static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rscc_vsync_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -613,8 +613,8 @@ static struct clk_branch disp_cc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_vsync_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

