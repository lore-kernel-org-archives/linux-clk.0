Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2572C43617
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B18861181
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbhDBU6Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235523AbhDBU6U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:20 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCD2C06178C
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:18 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s17so6712743ljc.5
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4rfoVHAT7dOrwGC4eft9E0a4rQB1P3qx5SzpVkr4yy8=;
        b=ZgWYNeOei8dR6f2gYFy20WGechPXfBjKkoGbcG7SY7P8SDBmEZByXdUntVBQDlfxbe
         7kNDA1XpVY68u9ABX6npo2O7rEmeS5onbGsulnlNU/YGjdU+b4ctkT8BldfXKBzay0Gt
         9biv6C8OqPEBlqWUhzKOlNNjE8IDE/+px8LYYJr5s4ilJsgOBUt409AlP41w0QiALjyU
         uG0wjjHAaWiyKecdGLjAq5dSEE0bzWY44uDcdsCIEzHOp+ZV6/I/SwnFgVEWUGzkAkbP
         RG1m3V4F4oNaMzozEFD/+tbPbVIxiP3hP9v6bkKJJsgIOPSUMZkqYHCmTCiEZjjtxrsi
         lgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4rfoVHAT7dOrwGC4eft9E0a4rQB1P3qx5SzpVkr4yy8=;
        b=PADtrWtceu4TZy46jsCXjN9ODjBj2IY7CbbbPG/qAtCYYEowAuQsA6NzkjOPd8Bdjb
         SZYUXX2T65ndjd0FxLzx8kYQrrt4bQEcWAgHHPAHY1EmALKNzrMRtDB69PiCZNNEp6mR
         8lr7VAVPIvP2S+7am5/AekVMjvsWjvxLpEDO7/FpYDwHRYadoI3WEmHqn7ubL70Dr4QA
         EgHB2rCPnKSJzyhgX1ONxUlr8XYahNHWrnKMV3PuT5LyUe4u4OHeeN8k/z1FIHO/4Wtl
         Bf3p8oHyy6VUiJkkiPJDHTh/HGqJMulhbmP1MSEhUFM7ldGAqw01MnGze1paILqfMFn4
         4GGQ==
X-Gm-Message-State: AOAM530BymAEhuPe4V7GEXtAD8H4g7t0wYd/00+Hq1jdzHSw7tkBPzvj
        9dpeZAsUt9KjMa8qndSp9XnYmg==
X-Google-Smtp-Source: ABdhPJxc9iuezwkpqtS/5Bqyjohb9O/rNetA3zN2XzGTzIiPUODWZCf/O/Xd8DiXZSa7wPYZCHClWw==
X-Received: by 2002:a2e:9715:: with SMTP id r21mr9314254lji.224.1617397096654;
        Fri, 02 Apr 2021 13:58:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 13/16] clk: qcom: videocc-sdm845: convert to parent data
Date:   Fri,  2 Apr 2021 23:58:01 +0300
Message-Id: <20210402205804.96507-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sdm845.c | 56 ++++++++++++++++---------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 5d6a7724a194..ac808ed859f9 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -21,25 +21,9 @@
 enum {
 	P_BI_TCXO,
 	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
-};
-
-static const struct parent_map video_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
-	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
-	{ P_VIDEO_PLL0_OUT_ODD, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
-};
-
-static const char * const video_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"video_pll0",
-	"video_pll0_out_even",
-	"video_pll0_out_odd",
-	"core_bi_pll_test_se",
+	/* P_VIDEO_PLL0_OUT_EVEN,
+	P_VIDEO_PLL0_OUT_ODD, */
 };
 
 static const struct alpha_pll_config video_pll0_config = {
@@ -53,13 +37,31 @@ static struct clk_alpha_pll video_pll0 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "video_pll0",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
 	},
 };
 
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+	/* { P_VIDEO_PLL0_OUT_EVEN, 2 },
+	{ P_VIDEO_PLL0_OUT_ODD, 3 }, */
+	{ P_CORE_BI_PLL_TEST_SE, 4 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+	/* { .name = "video_pll0_out_even" },
+	{ .name = "video_pll0_out_odd" }, */
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
 	F(100000000, P_VIDEO_PLL0_OUT_MAIN, 4, 0, 0),
 	F(200000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
@@ -78,8 +80,8 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.freq_tbl = ftbl_video_cc_venus_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
-		.parent_names = video_cc_parent_names_0,
-		.num_parents = 5,
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -158,8 +160,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec0_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -189,8 +191,8 @@ static struct clk_branch video_cc_vcodec1_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec1_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -233,8 +235,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_venus_ctl_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

