Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791F5CCA481
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 14:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382905AbiFQOr3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 10:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382906AbiFQOr0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 10:47:26 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DD356B02
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:22 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c30so4965786ljr.9
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jBMiZ5n8BJY+cCNJKWjEq/LIN5KyB8obYQ76cG0oR6M=;
        b=QX1SdyhYqSQQyEA235l6WXIjM+AWBocedFoESFJCReVGH1A6L9PfqotqNeIOHibK5e
         wSli/6t7a3YFWskPuZL3B6DLq+Ycsx0iVn1NGAdqMQb8I1Bk1PNWWsNbjDHo2fECMU3/
         YEdRSwMk8CfcLDjHIXxNoLWDLa20NMk9LvpmhgjtwMudIAg5xTZ5l3dC4mU3SsXx2RCo
         JHwhQiYzI8Ydr/+v7AuFmByi9xPrVVeszLRfQAM/3bTrpOoif9np7erxrLqgcrHZDuB9
         EzCT3Gf2rSClW27PZUT2qELsU2J67/JUg5PPVwBxO0HOtxopzPH2TVakzO1ufYxZMiqJ
         lVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jBMiZ5n8BJY+cCNJKWjEq/LIN5KyB8obYQ76cG0oR6M=;
        b=BnrAhyMI1vJU4j8gp8oGY9+RJ7zOIxYP5mlSmsRT2cgX8x5TRjCFbY9yvGGhDYuLsr
         jddvGb8iVFnFvRNS7/Ntj+HBy1bvjBYzhdXQyNt/YlrJ64Pj1rgTEKNcVyJb7s8LoUaT
         Oli61dQe+9gB7al06lieJSBXXQnXYVKO5L0bd5DgqcyXCnOfN+A/3Xr8g6lOyDEggkE0
         Yl06oHjAwgZcnq5wXuJDNV1GbL2RyITBizLiw6JoajZRFdlXMk3CNKREFTUThUE+TRAY
         +/7bhEOC38Xp1TVqYKxBf4ymgbC0sQfd0g49KiLMNWQNatTY4LbQm/Hn97BxlyJtiSlS
         NqJw==
X-Gm-Message-State: AJIora/aOGV7+vAV0s0w4udLRynskck8f6ozaE8tvsyNCJRm59ZhFlXS
        CRcCTawk0r70fQxCtL4RnnFVqA==
X-Google-Smtp-Source: AGRyM1tLbVU+/wGUimerYF1vbQ4FdwIkdnIEnAkmYr2M6+P6n68W8gan+K3Tfg1gxI7kF6bZ6dhWcw==
X-Received: by 2002:a05:651c:981:b0:253:b87e:ba6c with SMTP id b1-20020a05651c098100b00253b87eba6cmr5347620ljq.530.1655477240920;
        Fri, 17 Jun 2022 07:47:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 5/7] clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
Date:   Fri, 17 Jun 2022 17:47:12 +0300
Message-Id: <20220617144714.817765-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
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

