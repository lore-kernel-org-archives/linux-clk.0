Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F58DC0015E
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 18:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbjFNSFg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 14:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241051AbjFNSFH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 14:05:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C343226B7
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:59 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so8646426e87.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686765898; x=1689357898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3iwd6rHqsg8HTsIHqkjHpgKU8rjtKazN66jALoshMs=;
        b=fOaETqmNSknr4iw3nOx579ELaw/iyBGPoamIHwC7mQuQYj+c7Ln+7h5TYT8Qj3vlvQ
         gdOBlkGdpLMJQKdSGBSGs7lRXQe01SxAgMk7QXxipBY5TBlgne3kyqZ4jsKcwsnPR+VF
         gOeTJSYOSEzx5rwhBe8T5SD2f1S0JFx6Vo6qMMNIy5ctyzm3y3AeCnH70cUexUcP7p6y
         dXSbP4yTEt9hCIstLnV9boARGrbQ7XCkV8ZMy3mIVYZmC7vpibH+BydsR4XiWJRdZ4sZ
         KCCujrkgm1jZwVaACJE6//4Otiiuhl3/u01qqx6KveQVmBUJQwJrPTFaoLteMvZknUFU
         WSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765898; x=1689357898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3iwd6rHqsg8HTsIHqkjHpgKU8rjtKazN66jALoshMs=;
        b=LEEadh1MmaQMJsEO4uXEh+O0rRuXt1RawOBqsWA4kF+EaAupr0ZhAz+UlGvYrfowA/
         HqjIk+BhaEKm6JK5hqts7GWV65vzVB5j+mMIWG91of/1xt0gQAKKtq8coSGURkppvTZF
         ltGC6blzzxCL+QUYfSIkLHIh15LA/l1EELqufZoeDhK/R2OJ49nL0XkdXPoqe5yBw1fH
         MVo0Lazeau9zMPFUuKZqGqjQH4ZaioQWsbEvBfWG88ED+VIlJRxLuanZeYJ4dsxn0W8t
         BqoseMC1tsG4LL2UhALHIm6CcU/Bxhu2irnmzy6juENnaMBuqxC3RTh33EI0+Zh8Fwcy
         uGEw==
X-Gm-Message-State: AC+VfDx0Z6mymp42/V8I9ucd5TTnFbz7jOz65U7pwkYj+KXPdE91cPSk
        IVCczcg9ZNaX9RdWKlmzzNvwtA==
X-Google-Smtp-Source: ACHHUZ4uSgnQ3VWqMFR8CLCkS311qnUzYC6MQ2efLCvipThNIl7spvvPZEYd40Pkh915fByY1ADWoA==
X-Received: by 2002:a19:6554:0:b0:4f1:3be7:e1d with SMTP id c20-20020a196554000000b004f13be70e1dmr7638434lfj.62.1686765898105;
        Wed, 14 Jun 2023 11:04:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id l18-20020a19c212000000b004eff1f7f206sm2224053lfc.9.2023.06.14.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:04:57 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 20:04:35 +0200
Subject: [PATCH v6 16/22] interconnect: qcom: qcm2290: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v6-16-263283111e66@linaro.org>
References: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686765873; l=2388;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Y5vzxfTOafvaW8mPCP2rmWXwcfrcZgL9XrNa/4uLTOM=;
 b=c8St70MdxSL4ETnKqVrqwwneypoqlc2/65u/cJgwHt+IG4LQkzORMvmLaBkRk0jZwCVG+XT0/
 BRBb8UbqS8gAFSRIHCdklVuzS+x9oZX9EUDo/38umtszqxEEmd2xlk9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Assign the necessary definitions to migrate to the new bus clock
handling mechanism.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index 36a53add866d..8fc4acc4220b 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -1195,6 +1195,7 @@ static const struct qcom_icc_desc qcm2290_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = qcm2290_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &qcm2290_bimc_regmap_config,
 	/* M_REG_BASE() in vendor msm_bus_bimc_adhoc driver */
 	.qos_offset = 0x8000,
@@ -1250,6 +1251,7 @@ static const struct qcom_icc_desc qcm2290_cnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = qcm2290_cnoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_cnoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &qcm2290_cnoc_regmap_config,
 };
 
@@ -1291,6 +1293,7 @@ static const struct qcom_icc_desc qcm2290_snoc = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_snoc_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	/* Vendor DT node fab-sys_noc property 'qcom,base-offset' */
 	.qos_offset = 0x15000,
@@ -1305,6 +1308,7 @@ static const struct qcom_icc_desc qcm2290_qup_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_qup_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_qup_virt_nodes),
+	.bus_clk_desc = &qup_clk,
 };
 
 static struct qcom_icc_node * const qcm2290_mmnrt_virt_nodes[] = {
@@ -1318,6 +1322,7 @@ static const struct qcom_icc_desc qcm2290_mmnrt_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_mmnrt_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_mmnrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_0_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
 };
@@ -1332,6 +1337,7 @@ static const struct qcom_icc_desc qcm2290_mmrt_virt = {
 	.type = QCOM_ICC_QNOC,
 	.nodes = qcm2290_mmrt_virt_nodes,
 	.num_nodes = ARRAY_SIZE(qcm2290_mmrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_1_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
 };

-- 
2.41.0

