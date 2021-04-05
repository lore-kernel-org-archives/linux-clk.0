Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4D0C001BF
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA7A0613F4
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242869AbhDEWsJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242871AbhDEWsG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478F6C0617A9
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:59 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d13so19658893lfg.7
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h55djJcBDbzBFZQHOwu8fyGULCew1BNuM9HuxBxp9h0=;
        b=wrV5+b1dT/8ikZP1PYSR63VDyMOTKiJUqdXe/COVZE0/gdDPl6N9odk5VcwcbN23cz
         lwN32whV4YfgjDNT/xRM33hp5VnUMH6PNBxjQx8krKChIwwQUkew/yUOZ1qD1OMcKeX7
         r/N761ALQ1Vz75RzGuKGWXRAY5G9MQfXXYXflNY4UKx6LeaKhNBW8h99ry5qL+VZynBV
         G4JwL5ckFOzDnUrVPdS+FaXZros4CGTCWB9ldm7xDr/Tb+o2DirNjVLa1mPoZIkzaJpY
         W3MQRy6SrU2JwOtYNg+nwBhGro9rAfOzv8KhY2lUmBUDatbIwa9kRE1DGuYRe3RUtMcq
         cHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h55djJcBDbzBFZQHOwu8fyGULCew1BNuM9HuxBxp9h0=;
        b=ZfYM4DauhM45Q3LoHdOhOBaWoYWFG5XTy8xF6bZCUl3CuhBwlysNVmL1Uy0sZwx7hE
         HypSZhmz9kMaR/9PU76IAm2GD6v8/qmd8G3KUCZ4qWdo5xAk6n3eTH2BzJ/5+ia/2brw
         pSbnK1FNVInuaZgCPRnWX4mWiqb1zDVYnQ3FMWHfnuJdpH1mMeW/tWfTjBDbak/HliCx
         lH2nzEy6Zh1iKVdPTBzcG6qPAZHxLcvcsPowAsmVepylU9OdDpeXZVUIOD3+LROyUltu
         DOpGHc2ajqBirVKrWUjlg7NRVbEm2Lh2Tk/l+UuVxPjhhTfH9k+9M5kmfIs6JCmTy2jn
         76cQ==
X-Gm-Message-State: AOAM533O4cuUyidTeatD+uame/BAqNdTtEs4s0sf9GwgE54CorohNDhg
        rpAQoueBsPMDM1SFsIpZ4uCVjw==
X-Google-Smtp-Source: ABdhPJyf6O5wbbCxvFb+IkwzPAPsX4iJHdcs3VdAi9G4H5ZVg69Nrmm6PNuU7/RHDog4dyqWJWu19Q==
X-Received: by 2002:a05:6512:2083:: with SMTP id t3mr18295918lfr.590.1617662877733;
        Mon, 05 Apr 2021 15:47:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 18/33] clk: qcom: dispcc-sm8250: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:28 +0300
Message-Id: <20210405224743.590029-19-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sm8250.c | 116 +++++++++++++++----------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 86275814e055..de09cd5c209f 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -448,8 +448,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
@@ -463,8 +463,8 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte1_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
@@ -478,8 +478,8 @@ static struct clk_regmap_div disp_cc_mdss_dp_link1_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dp_link1_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_dp_link1_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_mdss_dp_link1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ro_ops,
@@ -493,8 +493,8 @@ static struct clk_regmap_div disp_cc_mdss_dp_link_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dp_link_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_mdss_dp_link_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ro_ops,
@@ -509,8 +509,8 @@ static struct clk_branch disp_cc_mdss_ahb_clk = {
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
@@ -527,8 +527,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
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
@@ -545,8 +545,8 @@ static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
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
@@ -563,8 +563,8 @@ static struct clk_branch disp_cc_mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -581,8 +581,8 @@ static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_intf_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -599,8 +599,8 @@ static struct clk_branch disp_cc_mdss_dp_aux1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_aux1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_aux1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_aux1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -617,8 +617,8 @@ static struct clk_branch disp_cc_mdss_dp_aux_clk = {
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
@@ -635,8 +635,8 @@ static struct clk_branch disp_cc_mdss_dp_link1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_link1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_link1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -653,8 +653,8 @@ static struct clk_branch disp_cc_mdss_dp_link1_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link1_intf_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_link1_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_link1_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -670,8 +670,8 @@ static struct clk_branch disp_cc_mdss_dp_link_clk = {
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
@@ -688,8 +688,8 @@ static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
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
@@ -705,8 +705,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_pixel1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_pixel1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -723,8 +723,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_dp_pixel2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_pixel2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -741,8 +741,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
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
@@ -759,8 +759,8 @@ static struct clk_branch disp_cc_mdss_esc0_clk = {
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
@@ -777,8 +777,8 @@ static struct clk_branch disp_cc_mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_esc1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_esc1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -795,8 +795,8 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
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
@@ -813,8 +813,8 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
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
@@ -830,8 +830,8 @@ static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
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
@@ -848,8 +848,8 @@ static struct clk_branch disp_cc_mdss_pclk0_clk = {
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
@@ -866,8 +866,8 @@ static struct clk_branch disp_cc_mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -884,8 +884,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
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
@@ -902,8 +902,8 @@ static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rscc_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -920,8 +920,8 @@ static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
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
@@ -938,8 +938,8 @@ static struct clk_branch disp_cc_mdss_vsync_clk = {
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

