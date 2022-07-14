Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB89FC43334
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 10:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237685AbiGNKEQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 06:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237851AbiGNKEA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 06:04:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93C9DFF0
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:58 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id w2so1564063ljj.7
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6sI+cun9sqvSMZVYqB1PbbtuHQ6v+tt2HHn2LrmcZhI=;
        b=BagQF/DTiIOVdYDZI5Z/Jk+XUpDAtmhS+vV3ZZQdULIk9UvwM6vvhyrWpmS3Jbbwfw
         WxWlp/bWu6i8I0JKaQGosdxYr++oGMIkkhuWup1JEQ4p95rbEzNW0gULFmuvyo/rUeh+
         rNaQJ6j7GvuuvaTLxjWMtKlP0/QQIGVF8cckDxNBZTeNUSpHPtNXQeYFqKNzDmQdx94M
         gSirvluErr8LUYAiBDNdfXRNKm4FZ52BEvmGrJ+KfaDwNldTpCGt2ckrzTKhC7EcpL0q
         4/pN12w9Gx0tWt94x41AxL5VlT7/IV6XyQsoj//nW0zFdDwvD0IQVuqjiv6Ih9e/Yie9
         +CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6sI+cun9sqvSMZVYqB1PbbtuHQ6v+tt2HHn2LrmcZhI=;
        b=B9rOiyQmhYormX0CW+ifmlSTV6dGohNd5k7u4DeMTF0Zeu6tTrYmzhVZNSEExczL8f
         6h/Ntst8HCQs2b5wh6/Omq/KJIA768G5xR9XDY/EZ3X67MACARJE3t2qhxco/f0KAoM6
         C2SkkWT3aMCC+EI5/MiAFnueSznsgMpo0J+5Nd88nECNDE4btzTXgQ71PK0WaopKcPbJ
         iKhQWEZ4hBtMKNa+Nd2urMaOTLGH0KyZxcwsMt4yT5pQoY0VhZxFcoxoSd4qBUf8J2g+
         GSiQKWK5h//Du/h31NLkIkhIRkqEOzp36BbOjU+uX4Uwa0cknfCkupzrfswwBPGkNE9K
         WN+A==
X-Gm-Message-State: AJIora+040pRkm184ipyZ39blRJZucCeD7ite3p8Pr+rB1Ctlmd5tuK9
        EWYPcpCH2jC6vzRzg1HnXJTj2g==
X-Google-Smtp-Source: AGRyM1uv4wkJ0EJPbrqRDeIOSoEQVjhxZTEn5xWzjWdOG/EatAuIuJz3tpKbbCGvVF59RzBWrkftwQ==
X-Received: by 2002:a05:651c:b13:b0:25d:8342:e11 with SMTP id b19-20020a05651c0b1300b0025d83420e11mr3928646ljr.266.1657793037064;
        Thu, 14 Jul 2022 03:03:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 5/6] clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
Date:   Thu, 14 Jul 2022 13:03:50 +0300
Message-Id: <20220714100351.1834711-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Don't store pointers to parents in struct clk_cpu_8996_pmux. Instead use
clk_hw_get_parent_by_index to fetch them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 5c5adcb533ce..0a336adb02b5 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -247,8 +247,6 @@ struct clk_cpu_8996_pmux {
 	u8	shift;
 	u8	width;
 	struct notifier_block nb;
-	struct clk_hw	*pll;
-	struct clk_hw	*pll_div_2;
 	struct clk_regmap clkr;
 };
 
@@ -292,15 +290,17 @@ static int clk_cpu_8996_pmux_set_parent(struct clk_hw *hw, u8 index)
 static int clk_cpu_8996_pmux_determine_rate(struct clk_hw *hw,
 					   struct clk_rate_request *req)
 {
-	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_hw(hw);
-	struct clk_hw *parent = cpuclk->pll;
+	struct clk_hw *parent;
 
-	if (cpuclk->pll_div_2 && req->rate < DIV_2_THRESHOLD) {
-		if (req->rate < (DIV_2_THRESHOLD / 2))
-			return -EINVAL;
+	if (req->rate < (DIV_2_THRESHOLD / 2))
+		return -EINVAL;
 
-		parent = cpuclk->pll_div_2;
-	}
+	if (req->rate < DIV_2_THRESHOLD)
+		parent = clk_hw_get_parent_by_index(hw, SMUX_INDEX);
+	else
+		parent = clk_hw_get_parent_by_index(hw, ACD_INDEX);
+	if (!parent)
+		return -EINVAL;
 
 	req->best_parent_rate = clk_hw_round_rate(parent, req->rate);
 	req->best_parent_hw = parent;
@@ -368,8 +368,6 @@ static struct clk_cpu_8996_pmux pwrcl_pmux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &pwrcl_pll_acd.clkr.hw,
-	.pll_div_2 = &pwrcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_pmux",
@@ -385,8 +383,6 @@ static struct clk_cpu_8996_pmux perfcl_pmux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &perfcl_pll_acd.clkr.hw,
-	.pll_div_2 = &perfcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_pmux",
-- 
2.35.1

