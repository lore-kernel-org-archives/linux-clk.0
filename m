Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F31CCA481
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 21:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiFSV1p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 17:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237404AbiFSV1o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 17:27:44 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211B7AE54
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id g12so3878911ljk.11
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jBMiZ5n8BJY+cCNJKWjEq/LIN5KyB8obYQ76cG0oR6M=;
        b=mvXEtpwxCAZYrbvYgVJNzNuxStr4zrs8dgdh5zR1pLc5xSumbizhD+K2zCocQXz7JZ
         UeSKuU1KQnnFotqL8gif+C4pnH67dRO5l0yX4e1Jj/pl6st4deDCaj3AjAQcB9UCjI7i
         yB0LZEPrlIz/30UOI8Ykud3kcZFc8OJpCHAyoVtt143JlMuP2Wyxcbmuiwpl48X/ysnS
         Do98N2d/0dppH6rXQiSM2UykJP3fWHoPS5wfYmQx5qTZFFyg00KL61d3IiElyNWPsMIJ
         bw0Ku8rChDCMeg+5+qENhrjF2kW3IiN+MR72lEAXAr78Y3quIWQr9BixZl6jvNWgiX0s
         61Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jBMiZ5n8BJY+cCNJKWjEq/LIN5KyB8obYQ76cG0oR6M=;
        b=Pjw7nnURCOZJE8lq4JYSdmucp6yBmK8+NlcOT19+5l7/mjYzvVFWfZKJlI0096srDr
         fCqlKfmejM21606oIi2fHyQoPgb0H0caWUyTxTT0xkGZfbSDpoF3JV5ZXhSdUXMsmVbc
         LwNpXkwMXtNmjoF1+FXTJkNHxS4tkcnKcKpzVpm+m6wpg1TSNHJQaVosllOA3krhEFMW
         Q8UyrANnQdh5K2Vy1JHmReqpoQCScIgvDWuTWdLmMdKmV73bAWjXZSoVZ9/3gfqrlsYG
         YA1A4PKmpblLjUg3EfHcjIOX1KUxMKmA85YXfhGAtIX9s1uIWk/wOm7fXBFAg1N8FYAl
         SJhw==
X-Gm-Message-State: AJIora+GYWODmXQu6CHFJT6igQZSY3J6W9MqVr/64beYXmk43CXE4xeZ
        X3UZSwTczN4AMcDWxa1DymHhaw==
X-Google-Smtp-Source: AGRyM1sRlWQb099YIOt0N81daj6qUtyoQ/MHpqwqZfOm6AH0Vva9bw6JPNa+8poaRhSLMvJarfVKYg==
X-Received: by 2002:a2e:a54e:0:b0:255:a378:732e with SMTP id e14-20020a2ea54e000000b00255a378732emr10224972ljn.0.1655674061527;
        Sun, 19 Jun 2022 14:27:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004796a17246esm649078lfr.252.2022.06.19.14.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:27:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v3 5/7] clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
Date:   Mon, 20 Jun 2022 00:27:33 +0300
Message-Id: <20220619212735.1244953-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gcc_mss_q6_bimc_axi_clk clock depends on the bimc_ddr_clk_src clock.
Move it down in the file to come after the source clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 7962edbdbcf6..4d726ca4b0da 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2594,23 +2594,6 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 	},
 };
 
-static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
-	.halt_reg = 0x49004,
-	.clkr = {
-		.enable_reg = 0x49004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_names = (const char *[]){
-				"bimc_ddr_clk_src",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_oxili_ahb_clk = {
 	.halt_reg = 0x59028,
 	.clkr = {
@@ -2860,6 +2843,23 @@ static struct clk_branch gcc_bimc_gpu_clk = {
 	},
 };
 
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x49004,
+	.clkr = {
+		.enable_reg = 0x49004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_names = (const char *[]){
+				"bimc_ddr_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_jpeg_tbu_clk = {
 	.halt_reg = 0x12034,
 	.clkr = {
-- 
2.35.1

