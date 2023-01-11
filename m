Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEE2C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbjAKUFs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239489AbjAKUFN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:05:13 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921904435F
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:39 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bt23so25160544lfb.5
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgOPg4fRkjBDBW6pz+cWiQpA7do2fsqbbXH7WC6lHjc=;
        b=SC0bmkvlcrmQFlJoNE3AVxRjZGYxvAeX5Cz3UcSnpq0oHqQkELvXNRxwgEu2+s1VhQ
         ZdUe1aGKW/TxagxBHojFxkxDoloFQbKJMIJelO3M8wCpaCpuqVugb1zboCO2bpW4/Gvo
         eX7NMQnAjLk9rBN0lmFQl/GcKb861Sh84tJthVzZhGAykIU6yYUlqLrGPVZsyGG7V49L
         HffdMStmXDOblMdAXhBGcBjUPxKzN22omOHanSflNd+bVQHg3ogy87DmyUm3UyroBhbn
         /6BtzOFXsKMHJ3YlOsQ6u9890058kgJlOB4T0AGh0NQUmIjq2OhRqqkJcqpAJh95CJGI
         l6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgOPg4fRkjBDBW6pz+cWiQpA7do2fsqbbXH7WC6lHjc=;
        b=5IJ6QvpH6q0uMT2Ep2Mqdn/Ltpcby5PqTVeiQ5jCnJtpgPYMwOBypPU2uka/ltlOPL
         V95Zayak8wDf067jzGHzePpQGaf57tYSJHi11I8+7cdc4xBGtlCLHC7p+ED4/g3VH0l6
         e7RmfPymSB9pBekw7K0NFtxzPa2iETJiMxnQFx16BJscT364Wq6RhXQ6JAnzHyju8ado
         EE8drniaK/nfgzj5taf85LwOfFX7M/EeOXZ2bcsaSoT/8pUV85zQodLGEKJb0mhCkBqv
         dV4ikIAdL/6zw+MIPDSuAEIwpImJ1O1H/zho+XTIv2N1gMXdF7G2LLBZoePuyIo9TTNL
         7qug==
X-Gm-Message-State: AFqh2kqzzD22YX9GYIF9RpLNGvefiMYtwuESH8k727hNljqvQERPt9Cz
        9c16/m2lyHvbUbMF7uoaz0xZ2g==
X-Google-Smtp-Source: AMrXdXtSBFEHW+eMub0M4UwA8HKR4bsmd5jRLvfu4VynS1NDdCXyWO15ZhHFo3fixrCD/SS4xzgHKA==
X-Received: by 2002:a05:6512:695:b0:4b5:2bbc:e119 with SMTP id t21-20020a056512069500b004b52bbce119mr35500827lfe.65.1673467297961;
        Wed, 11 Jan 2023 12:01:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:37 -0800 (PST)
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
Subject: [PATCH v2 13/14] clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
Date:   Wed, 11 Jan 2023 23:01:27 +0300
Message-Id: <20230111200128.2593359-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing register writes to CPU clocks setup procedure. This makes it
follow the setup procedure used in msm-3.18 kernel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index b53cddc4bca3..78a18b95c48b 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -76,10 +76,16 @@ enum _pmux_input {
 #define PWRCL_REG_OFFSET 0x0
 #define PERFCL_REG_OFFSET 0x80000
 #define MUX_OFFSET	0x40
+#define CLK_CTL_OFFSET 0x44
+#define CLK_CTL_AUTO_CLK_SEL BIT(8)
 #define ALT_PLL_OFFSET	0x100
 #define SSSCTL_OFFSET 0x160
+#define PSCTL_OFFSET 0x164
 
 #define PMUX_MASK	0x3
+#define MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK GENMASK(5, 4)
+#define MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL \
+	FIELD_PREP(MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK, 0x03)
 
 static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
 	[PLL_OFF_L_VAL] = 0x04,
@@ -439,6 +445,14 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Ensure write goes through before PLLs are reconfigured */
 	udelay(5);
 
+	/* Set the auto clock sel always-on source to GPLL0/2 (300MHz) */
+	regmap_update_bits(regmap, PWRCL_REG_OFFSET + MUX_OFFSET,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
+	regmap_update_bits(regmap, PERFCL_REG_OFFSET + MUX_OFFSET,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
+
 	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
@@ -447,11 +461,24 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Wait for PLL(s) to lock */
         udelay(50);
 
+	/* Enable auto clock selection for both clusters */
+	regmap_update_bits(regmap, PWRCL_REG_OFFSET + CLK_CTL_OFFSET,
+			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
+	regmap_update_bits(regmap, PERFCL_REG_OFFSET + CLK_CTL_OFFSET,
+			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
+
+	/* Ensure write goes through before muxes are switched */
+	udelay(5);
+
 	qcom_cpu_clk_msm8996_acd_init(regmap);
 
+	/* Pulse swallower and soft-start settings */
+	regmap_write(regmap, PWRCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
+	regmap_write(regmap, PERFCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
+
 	/* Switch clusters to use the ACD leg */
-	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
-	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x32);
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x32);
 
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
-- 
2.30.2

