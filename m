Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C955CC001BF
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A61E9613FE
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242888AbhDEWsR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242893AbhDEWsQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:16 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83462C06178C
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:48:09 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y1so14246067ljm.10
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0PAbQanyJUEXE+devqq1YjV6tdY5uPF46DkyZDKBuVY=;
        b=FX5xkcuh7C3G56DL1ANobTt33coXwl+DePIWA51aMcfHygmRjerrSVroCmFKuLk2Za
         PxAxLurj0pnWU7fryywjUSHvEWZ8nui7etkQPDeStDdud2nJ8NzLb3vmBidD7BcO/8x4
         X/qrg2DIU3cvK0nrBlTqputGh7pcnrmYqQUKn5YZ2Q8q4sooQJZh5r0Kqzwlb4B24Qo1
         biVWjGBAbmz7+anNM27bGHCfg40AB6wnXMi7oo9GMBWNDKJvWgI86RNlchRr/fIH4luj
         oUREW1xUu36BVLCj27u3Zq+eBTuGBivIqHAiihS/triGbwm2Q6TDGodKs0uSJxIYkL1e
         KVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0PAbQanyJUEXE+devqq1YjV6tdY5uPF46DkyZDKBuVY=;
        b=pC09yw+xKSYNKyfrfa5/gKXufLujTKDbqL2I5HRiWIc5ASrXa1hYRscOUqdHKK+dWE
         +ICuZ4nlrTsRYGo+0SUkpZ9TIiY2346sk0WZy6kgzsTAawJOXpmZqKwsxr+awaangI6o
         QW2Q7KfLPBYrnJRSBoL/NkadMGs99XIaZNlwVhNTV/udGei27rya+huaJXjzvuFHJ/Zp
         tClsLVKh4uOcVcimMWZ3IhdiYtn/3IBaET0uIIyTOIWCaIuwN62/cq3qhqDtz+BZbGpW
         2ASMgGCSBN+cBEDp6I9S0W1mIrBeyulZ2XYvSItA/3MV09NUXn+hH0hWnkVmBGnYBdNo
         kKHg==
X-Gm-Message-State: AOAM532Qla4WRCfvgRPRv+vKjzq/qD6TLhxXG7YhRsWaB/XoaV0daEHO
        0GYLNxEziXiVtS0cQYrVcJ35pQ==
X-Google-Smtp-Source: ABdhPJxhZu7SZHQrK/LjIpanewFOJOFRX1AL8aNP2D72+RuSra6LP01THRGPRz+OxJ5ufyYgLJBETw==
X-Received: by 2002:a2e:9809:: with SMTP id a9mr17052747ljj.323.1617662888004;
        Mon, 05 Apr 2021 15:48:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 32/33] clk: qcom: gcc-sm8250: use ARRAY_SIZE instead of specifying num_parents
Date:   Tue,  6 Apr 2021 01:47:42 +0300
Message-Id: <20210405224743.590029-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 92 +++++++++++++++++------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 5ceadb35289f..9755ef4888c1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -199,7 +199,7 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_cpuss_ahb_clk_src",
 		.parent_data = gcc_parent_data_0_ao,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -223,7 +223,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -237,7 +237,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -251,7 +251,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -271,7 +271,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_0_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -285,7 +285,7 @@ static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_1_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -299,7 +299,7 @@ static struct clk_rcg2 gcc_pcie_2_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_2_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -319,7 +319,7 @@ static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_phy_refgen_clk_src",
 		.parent_data = gcc_parent_data_0_ao,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -340,7 +340,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -368,7 +368,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
 static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -384,7 +384,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -416,7 +416,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s2_clk_src[] = {
 static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -432,7 +432,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -448,7 +448,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -464,7 +464,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -480,7 +480,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -496,7 +496,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -512,7 +512,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -528,7 +528,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -544,7 +544,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -560,7 +560,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -576,7 +576,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -592,7 +592,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -608,7 +608,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -624,7 +624,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -640,7 +640,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -656,7 +656,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -672,7 +672,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -688,7 +688,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 3,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.ops = &clk_rcg2_ops,
 };
 
@@ -720,7 +720,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_4,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -743,7 +743,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -762,7 +762,7 @@ static struct clk_rcg2 gcc_tsif_ref_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_tsif_ref_clk_src",
 		.parent_data = gcc_parent_data_5,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -784,7 +784,7 @@ static struct clk_rcg2 gcc_ufs_card_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -806,7 +806,7 @@ static struct clk_rcg2 gcc_ufs_card_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -825,7 +825,7 @@ static struct clk_rcg2 gcc_ufs_card_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_3,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -846,7 +846,7 @@ static struct clk_rcg2 gcc_ufs_card_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -869,7 +869,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -883,7 +883,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -897,7 +897,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_3,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -911,7 +911,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -934,7 +934,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_master_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -948,7 +948,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -962,7 +962,7 @@ static struct clk_rcg2 gcc_usb30_sec_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_master_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -976,7 +976,7 @@ static struct clk_rcg2 gcc_usb30_sec_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -990,7 +990,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_prim_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1004,7 +1004,7 @@ static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_sec_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.30.2

