Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFC3C54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 12:14:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbjAMMO1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 07:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241112AbjAMMMt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 07:12:49 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB4E80980
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:07:16 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y25so32817087lfa.9
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWtr3DFJJQf72yrPQBzeCk1JOA6Sdo54gcc/AJ5i2xI=;
        b=wNCH57Vpt+VmsKwMJVSCoVfxPB2PDmHFoSocF7TPJXm+IZIKsAvlF1Z+9UYhaFSH3W
         zYC2wcAiWzU09RCNZHVVLepcwjOO1c6a3tJkaUIWBiaic/YlShJOc3daO8G4yEYh4Qcu
         2YKfNw5gHest9GRIqMGI+00BchO0o07jQ5BNStQESSXARRqsCWgntMEPloahpMnyWMrq
         bSNG87qZHtNjXuY8tiVFs8T7cUA8kjq8NXQxaxcyCnfV945ogU5vXGlM2Av3mbHkHCCk
         kmFP4Lqp1fL/9vU21gk52+jbofSx5cGqrXl6p+u/9EBBafnOnVX8kp1MzRlNMn9ccBWM
         FSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWtr3DFJJQf72yrPQBzeCk1JOA6Sdo54gcc/AJ5i2xI=;
        b=mGWq16KLTx2KxIrHkXT7eRoSPdK3wBWPgwdc4No3odcxMfvsNgZQbJlL4Y/Ah9Gron
         hH9oqg8ztpmqcqlrA5kJqvntg2b1lHnDjWtrLTHHNz46bV1ohVLIssW/KOg3o6dTEPyk
         WP6AqOSxmcFk+wl9lWi3+ZOJqDhqFDsqpjsVQB++y2ngKTD/Yje+GL+ujwbc2p12k8CS
         Fkwd5Eh0dbi105oL4R8/hTTFdRUezHKzGycyRLEXQ45zVzPynNP4yslNTGW8h1lMqExO
         sUrZAO1PFAvl9Hf9CJr8FkCIglTqzutVxq8xTTRTCzltOpdpZFHcXmb5lVWKKNSgkTpQ
         gXbg==
X-Gm-Message-State: AFqh2krOSKshAIM5fDyJ+xuQtpPTU59tzO0vnNKw+9cc0uwuAIybh0G4
        NLu3bmYzhTbDAsSm4T9AERM8qqlLKc143ivXCrRRhA==
X-Google-Smtp-Source: AMrXdXtScgOx3kkDaM3ITnGgRWVDsxCcYVL+GeOnvCsPpYeyVcnoUraqid+4g3meWGSAx4Zq7dY9vQ==
X-Received: by 2002:a05:6512:3c97:b0:4a5:42ba:d827 with SMTP id h23-20020a0565123c9700b004a542bad827mr24756052lfv.14.1673611634707;
        Fri, 13 Jan 2023 04:07:14 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 09/14] clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
Date:   Fri, 13 Jan 2023 14:05:39 +0200
Message-Id: <20230113120544.59320-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Initialize ACD configuration from qcom_cpu_clk_msm8996_register_clks(),
before registering all clocks. This way we can be sure that the clock is
fully configured before letting CCF touch it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index e390f4aadff1..571ed52b3026 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -425,6 +425,8 @@ static struct clk_regmap *cpu_msm8996_clks[] = {
 	&perfcl_pmux.clkr,
 };
 
+static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap);
+
 static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 					      struct regmap *regmap)
 {
@@ -435,6 +437,8 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
 	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
 
+	qcom_cpu_clk_msm8996_acd_init(regmap);
+
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
 		if (ret)
@@ -467,9 +471,8 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 #define L2ACDSSCR_REG 0x589ULL
 
 static DEFINE_SPINLOCK(qcom_clk_acd_lock);
-static void __iomem *base;
 
-static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
+static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
 {
 	u64 hwid;
 	u32 val;
@@ -488,13 +491,13 @@ static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
 	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
 
 	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
-		writel(0xf, base + PWRCL_REG_OFFSET + SSSCTL_OFFSET);
+		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
 		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
 	}
 
 	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
 		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
-		writel(0xf, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
+		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
 	}
 
 out:
@@ -509,7 +512,7 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		qcom_cpu_clk_msm8996_acd_init(base);
+		qcom_cpu_clk_msm8996_acd_init(cpuclk->clkr.regmap);
 
 		/*
 		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
@@ -538,6 +541,7 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 
 static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 {
+	static void __iomem *base;
 	struct regmap *regmap;
 	struct clk_hw_onecell_data *data;
 	struct device *dev = &pdev->dev;
@@ -559,8 +563,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	qcom_cpu_clk_msm8996_acd_init(base);
-
 	data->hws[0] = &pwrcl_pmux.clkr.hw;
 	data->hws[1] = &perfcl_pmux.clkr.hw;
 	data->num = 2;
-- 
2.39.0

