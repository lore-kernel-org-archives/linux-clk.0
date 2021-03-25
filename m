Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9F3C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD38961A35
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhCYLMh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhCYLL4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:56 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E98C06174A
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u10so2579013lju.7
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdrYj3VEfoKs37S4vt+lSgqRqm7gvPJV0IcgSzyglyQ=;
        b=oEj0Zs4IxYPZwOzPGZ+eGsE4Zonq3bbdebNNsWcZ2BzijNnQNiP4wULqi35ZLrMZZO
         /YrYqQvgrLUSw2EI/hxtCunTsmPLZbRhICiJB6AvFdiqoMrFasqXygk7u7Wou9La/kV0
         7BBCS/rm5iGlcHPb4Vvyns9986uiCNAztE66944+yVzUVxSoNEM8MDG42JOIQRskQvaZ
         Pq/z6TFgyhn3cxGTjr7t5xZ64q8Z4NF1SeJzpfefwmceY6Em9G8B78ip9UfywLaUcBNz
         7drAw/5NjZpURicfEikxdeDw77JRNxE391GHkh+tw1nKpTLdwOA3QGsz8nFeoiQ71QD5
         x9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdrYj3VEfoKs37S4vt+lSgqRqm7gvPJV0IcgSzyglyQ=;
        b=CUGTDOUgL6oJc2dKypXse3i25vzArnYcUnaKa+ieBtRoq1wwIQRpVHEIAtu08n0m0H
         aCgvP1oBoFC3lHmiyVRI5BYZ48Y/NQs1ndvIuysDrpPF2XnD4LXwoZgKOjBo++t6yRxS
         1VFD8M9R6bBHpuum00YPkVsjuJWHoZ0ZgaG6Ga702A1bB0+ZBXj2KlRmV2s1gQkAYUw5
         tHmLijNtU5Diz/ZLEs5MC1MO4YhOetAabaKCZeLDfU5/84LKaHieobLUsSbxFegjSCtz
         55oxJIFMFvSI5UmXUnGaDKrJd83I3oES3WMK+Ay2w8OicXHpGAFyive4bkFJaAeEdyKb
         7h8g==
X-Gm-Message-State: AOAM5322Y6dNfw7F9uqR/F1NIxuEnXaw4LI829Lwu0rykYSuy6zy5sWO
        8B+CliciNs3lxIzLvdZbbe3Nvw==
X-Google-Smtp-Source: ABdhPJzU9MYuP0h2wIB0XmeX6qEZMlG73fkwmeiQ3uPHFZ1vfXNlNlJaEpz0hbmmAz3s/FiFXscdbg==
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr5383545ljm.62.1616670714640;
        Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 10/15] clk: qcom: gpucc-sdm845: convert to parent data
Date:   Thu, 25 Mar 2021 14:11:39 +0300
Message-Id: <20210325111144.2852594-11-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 5663698b306b..2d637b113ac8 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -35,22 +35,6 @@ enum {
 	P_GPU_CC_PLL1_OUT_ODD,
 };
 
-static const struct parent_map gpu_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
-	{ P_GPLL0_OUT_MAIN, 5 },
-	{ P_GPLL0_OUT_MAIN_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gpu_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"gpu_cc_pll1",
-	"gcc_gpu_gpll0_clk_src",
-	"gcc_gpu_gpll0_div_clk_src",
-	"core_bi_pll_test_se",
-};
-
 static const struct alpha_pll_config gpu_cc_pll1_config = {
 	.l = 0x1a,
 	.alpha = 0xaab,
@@ -62,13 +46,31 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
-			.parent_names = (const char *[]){ "bi_tcxo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
 		},
 	},
 };
 
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
+	{ .fw_name = "gcc_gpu_gpll0_div_clk_src", .name = "gcc_gpu_gpll0_div_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
@@ -84,7 +86,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
-		.parent_names = gpu_cc_parent_names_0,
+		.parent_data = gpu_cc_parent_data_0,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -98,8 +100,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_names = (const char *[]){
-				"gpu_cc_gmu_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

