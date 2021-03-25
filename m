Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B03C433FB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F4B260240
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhCYLMk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhCYLL7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:59 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0823DC06174A
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 15so2663687ljj.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VMEzD124xLe49unMX5TAa2m3h8cRgc8nhb5nDmCHgWc=;
        b=od2V9W8WMehTnlpv3xp1+rc9+o5fiSdd+AGGpMR66JMdTdc38hIaNljA2QAjrujtZx
         cKWugaOBlb6aNmd9ytX5jsZXKrMp1LwL/Th6VBDccTa7cQJSkqY2oZgNjvFACVxgU0zK
         Fn37qMcsU6mAzUR4Epo93kodjJ8/RIwBM6txgopi14LidSvLyBUY6WxrzyJuQthPaG1+
         ahBOAPSaHNzzVs0SC3ZdTzlyTO2mh4HFGMM5y0AJBGHH+SlV9wGZ/uQTwZW2d5kMombn
         byZu+Le+6QDQk0aVNnbTKSoDGRtwnX8Aijd5YqFsgcODXzLz5cUyuQaMxxPQU6LQBzQP
         f5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VMEzD124xLe49unMX5TAa2m3h8cRgc8nhb5nDmCHgWc=;
        b=FAzEAUDu8P8NbcONLpkl6yMKeqgY1jnb5t8uCcfi8ftT5uQuQMTS3jlUba9fIa65sD
         DOFIZZ486vsEWUMCO3BN5w3ktkjAXk30Ik6+zX2Odop/OUA/p6DZWAMFYHg+V4mPyBRi
         UCPI0U1tiJePinprwhj8/P3+1eOs5E4S3q9fj6MVYO0nkhoyoOK9gV8FeGT1p2JcpjJw
         ZygiX+ls8SgPWYTSX8kL+K5TZhNHREL2LXlCRk9v6+snY/tZoEcxSVJzRO0CR1T/LT6K
         gHvbU4r7sjqdX0IlVwVMQp5Mf5fIAEHRAliNFa6i1jrvlmwibMi5BS+4CnGRZ4vmzCOG
         f0oQ==
X-Gm-Message-State: AOAM530IwQIuYuoDbNODMluAjo/sRtnwAfl2dG+FXFgpTw7f0MvN59vI
        Q+L6+hqX6CxtiidoUZa1/YpTIw==
X-Google-Smtp-Source: ABdhPJwF4Clp37GdK38ES6MK0kpJRny74LG+Nf9x+yVMPWS4XWnoNQD1VOsENP7DuvLGaYTndxL0lg==
X-Received: by 2002:a2e:9c50:: with SMTP id t16mr5340767ljj.102.1616670717561;
        Thu, 25 Mar 2021 04:11:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 14/15] clk: qcom: videocc-sdm845: convert to parent data
Date:   Thu, 25 Mar 2021 14:11:43 +0300
Message-Id: <20210325111144.2852594-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sdm845.c | 42 ++++++++++++++++---------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 7153f044504f..c8e9a4153b74 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -24,18 +24,6 @@ enum {
 	P_VIDEO_PLL0_OUT_MAIN,
 };
 
-static const struct parent_map video_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
-};
-
-static const char * const video_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"video_pll0",
-	"core_bi_pll_test_se",
-};
-
 static const struct alpha_pll_config video_pll0_config = {
 	.l = 0x10,
 	.alpha = 0xaaab,
@@ -47,13 +35,27 @@ static struct clk_alpha_pll video_pll0 = {
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
+	{ P_CORE_BI_PLL_TEST_SE, 4 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
 	F(100000000, P_VIDEO_PLL0_OUT_MAIN, 4, 0, 0),
 	F(200000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
@@ -72,7 +74,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.freq_tbl = ftbl_video_cc_venus_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
-		.parent_names = video_cc_parent_names_0,
+		.parent_data = video_cc_parent_data_0,
 		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
@@ -152,8 +154,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
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
@@ -183,8 +185,8 @@ static struct clk_branch video_cc_vcodec1_core_clk = {
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
@@ -227,8 +229,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
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

