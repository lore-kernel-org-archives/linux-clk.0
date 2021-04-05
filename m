Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E195FC43462
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEA14613EC
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242853AbhDEWsC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242860AbhDEWsC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA0BC061788
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:55 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id o126so19731312lfa.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DaWp0NHwWVhMQXj54MQyVZ232ey0ZCPqOyojKd3YT+Q=;
        b=Fcgk07fcvO/NpcGoNov8WrGXnkVEHs/jmaKG+quI6CtkPai49Z6E0vkznpZ4tb6xns
         LPt0wHvyfmQk9J9r7sCJOFm3maP/28knZbigyfnzkKubYsvIc93blFgm7gZIY8OI+epn
         m8lQpgerY1agIa8Bau5kz/B1Q+dDCt1Inmr1j07f+s2VlItrXrF4+yk/L7y8UTecwZ/a
         wuntz6B5o9BEIg32/qSJxHHkYT1f6R6fz1XZbRV7gBBZ5gQCwotyp4uOMwy5NgNzSwid
         tShG8CWfmdTlbaqTWwjN2Xp2tYLkCz443s+F70lh+21b5Ooc1fZ1bjKEsfA1AbGHQbOj
         o6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DaWp0NHwWVhMQXj54MQyVZ232ey0ZCPqOyojKd3YT+Q=;
        b=cXDdXhhFFZDnd53TmOalwfHgOnWpRr+7otP57YPucoXoK9ZSWxxTgLBf9ieAWPK06D
         Jroi61DbP50DeyqorIXks6VqbW63eEH3BI3uH9GK6+ideK28YDQ8NCxHNfZ94aME4YP1
         V3872zGn1U2+1vN6PoaGAImsH6SxyjByKuNgLKg3kRih6BKduUbg5s782tM3ezmh7Kqc
         EAnC0mKky57of516afBMyStilg+kx8wGJ5Q7Eho8EtpfXGfhP/0vJ/az5PlTnGCGm4vJ
         dN4tHnCx+FF13nCp31Wie3pBtcbbumcSCrwBIAfeiKWbwaEoKXilu01WAw8hjhO9hCnq
         8HSA==
X-Gm-Message-State: AOAM530sP7ekReIX54iTrM9EqN65tyKddnpdrrnmdi0NQuc7BwSY0ZRC
        skOPIalsYh762k+t2t+gKJVELw==
X-Google-Smtp-Source: ABdhPJw56v3HGWUtIRhJqQON/qFGsmYOABwBk3ICt5x8SUYbum1R+RcRbATZC0OaSAVbGeW4MXNTgg==
X-Received: by 2002:a05:6512:3d20:: with SMTP id d32mr20007009lfv.9.1617662874162;
        Mon, 05 Apr 2021 15:47:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 13/33] clk: qcom: videocc-sdm845: convert to parent data
Date:   Tue,  6 Apr 2021 01:47:23 +0300
Message-Id: <20210405224743.590029-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
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
index 5d6a7724a194..f1dd97032a4b 100644
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
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -158,8 +160,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec0_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -189,8 +191,8 @@ static struct clk_branch video_cc_vcodec1_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec1_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -233,8 +235,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_venus_ctl_core_clk",
-			.parent_names = (const char *[]){
-				"video_cc_venus_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

