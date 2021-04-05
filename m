Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AB5C001BE
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DCE7613E9
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242856AbhDEWsC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242860AbhDEWsC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3ED7C06174A
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:54 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u9so14250142ljd.11
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M5Z3CmrtJqYjyCysAchxnacG6jL8cKLOXdM48UI1dE4=;
        b=GgmjPziNy25lzsSdfga6B2Z6FjGp8IARiwybppUsCJWZvZPMqGsi0UZrpJUrHuE9qH
         64bH8rqeXDGk6nFXmSj2HebsX6s2H216Wes7mjuc70lTuKkpuSPvxCIsJv0/v3AMOuu3
         PVMqT60q9uzF3o10jufHkiWhV1I2v3CkQjklsXHHAda9CnNKgFzjnQZTDo06dOxlzhb4
         AJJlA53Ah9hPlKP+N8ysnmVlWct+WbC7n7VW3JyuVXyl1s4ynQsQRY5nFIuGSt6PNEEs
         Ei6N9+Gcmay3lE9kwlE/TOC82bTYIXH62ldVPnXdO9XyaY4yTwVSynbBCi+UxP/rU6Ff
         EfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M5Z3CmrtJqYjyCysAchxnacG6jL8cKLOXdM48UI1dE4=;
        b=qo5fwnPbc/cgfrX+Xb/v+Cf/tG36PLlzL+cdwvRWcYEHK2X5WGNnXVYJq+3E+XRxX0
         2qhGXlN78KewkXUM/CJwugL4loAU53shFvr2y+WuYkorUC6qFoCTZLFFnFg7+Z2CAdPT
         LsfCVg3trDM/+8WufD0PBJQbTGdbiqvEZps4YY0TDMjXMtPAmdZ5Sm2DPCSLYkCMEHUU
         MRTMuP6uIiq1LPTw7C/5VxD756rHlnKBoNAjDR4A0uANfQD+BDexFwYR3POPxfqVBPFl
         fZNoQFeN2SFtSFl4k6+P1wNaZwt3dpyTW3wiQyzRNYgCIzerhZnJmNLZstKx/E/8gxKT
         Av4w==
X-Gm-Message-State: AOAM531Q6QT1J/mR7jMQBTivy32aMdcYfBhDT/5kPfuNUV9BU7x0Uvep
        moQGyJe3k4684x8LstdOCODQHA==
X-Google-Smtp-Source: ABdhPJxjvD4LAqZntM9Yygr2n6JlK/QkNc3COB2UCLmrHLDKVgu+k3krNjKP7DiLdLTO7paoTcxRZw==
X-Received: by 2002:a2e:5716:: with SMTP id l22mr17128357ljb.244.1617662873546;
        Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 12/33] clk: qcom: gpucc-sdm845: convert to parent data
Date:   Tue,  6 Apr 2021 01:47:22 +0300
Message-Id: <20210405224743.590029-13-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sdm845.c | 44 +++++++++++++++++----------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 2d7dc89915e8..b38a4bccdc96 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -33,22 +33,6 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
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
@@ -60,13 +44,31 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
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
@@ -82,8 +84,8 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
-		.parent_names = gpu_cc_parent_names_0,
-		.num_parents = 5,
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -96,8 +98,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_names = (const char *[]){
-				"gpu_cc_gmu_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

