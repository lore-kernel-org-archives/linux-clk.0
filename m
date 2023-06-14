Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7C2EB64D9
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 10:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243366AbjFNKXV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 06:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243748AbjFNKXI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 06:23:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F2D212B
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 03:22:40 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b1b66a8fd5so6795101fa.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686738158; x=1689330158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nc1+n/UQ2y64CZL44OODa51PjPBdbRWsiaTLI2r2o0=;
        b=mGUlAn/Z/odCMsTym3SxbUKJJRASL1s8APZM18fS/S5Eg7mNJdJDE7CGTn5OZ0AwoZ
         +tzAg3wvgvc4QNXkP1i8hO7/L1iQR+91hyesgqs2+U7/J5CmWiuYh98WH5b5U5BSkTen
         iMCfgvi6K1knyuxfiBHRxW9d5UqE2uP2dlLorJZV1am8NjK159VAIgud5IQsdxj43kWX
         +BMDQGKuYmQGppxgB4BqiqYSc4lfPwWokm13CcEJzwzDVFl3AjGWJMETGYTrnkC9OgVr
         em5jdDsRnD0SgByR+qcYuBUhJExlU1UcJYe2mJus8FJtfGVj6PXgtiEtB+c3qq0V4Ad1
         C7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686738158; x=1689330158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nc1+n/UQ2y64CZL44OODa51PjPBdbRWsiaTLI2r2o0=;
        b=YldLWcnnewkWDPRP8GMyDOL5wbNWtUmfeIfrpIGlb+6W9CPmmdEU3PgIGODcSa78gS
         mc3yn6Xn8E6v02IimEQiHcCUwCICxQBmyDJrKIrPMnnqN/smT70Eb6Bon1qso7HcW5LV
         JVNOKMUuI/T0hqfgc2r5jNv8pqEleu/OR5kVN9VFhpQ5V8wL05hNNwg4MO3wFrUb43HN
         FbqgWc++Uxe3gwTagmUJwXqdhTzP3LH1n3m5Pfwn2PlCv0QaxbQlhpDSluMMGnGOfFKE
         penbYNj9TrO2Hc1xDSQdCz1S09kf1k4uLPejSRKMrKMJmgjrCiBwF7olEWAxEua2xqj5
         yq7g==
X-Gm-Message-State: AC+VfDwEiNm5JT4AeCCGoyMupDHIyTovS/yeNsLFx9VMPGOjjXHFKLgu
        JFUUwFmZ+M8EKj9sEt4hrYdQ0g==
X-Google-Smtp-Source: ACHHUZ5kZqkQu5vYqdIr/8JI/Hp6M0ATsxUZouHMEb8AHaJHp5MIu/fl3x8ryrkznWTIDv2mJAQ5pQ==
X-Received: by 2002:a2e:9059:0:b0:2ac:7137:5f13 with SMTP id n25-20020a2e9059000000b002ac71375f13mr7099916ljg.9.1686738158069;
        Wed, 14 Jun 2023 03:22:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id m2-20020a2eb6c2000000b002b20d8f270asm2520057ljo.74.2023.06.14.03.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 03:22:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 12:22:26 +0200
Subject: [PATCH v5 15/22] interconnect: qcom: msm8916: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v5-15-eeaa09d0082e@linaro.org>
References: <20230526-topic-smd_icc-v5-0-eeaa09d0082e@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v5-0-eeaa09d0082e@linaro.org>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686738135; l=1438;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=U/V7/Y31OoJlewUp8cNNSi57yg1wtDegefv7cGiM7Cw=;
 b=tJmdTuo+ol9pDJEEfEDZvwAWaekcUATIiBCULUgvm5UYVj4XNbIhT1b/4LT/D/8VvAUWaXopT
 ZuYnMrLyhkYD+s42SjU+qoSFlMaqLe4z+bgNFQIgdQ+Q4f8fpgrvXZ2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Assign the necessary definitions to migrate to the new bus clock
handling mechanism.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8916.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8916.c b/drivers/interconnect/qcom/msm8916.c
index 196b05879896..be2a190a8b52 100644
--- a/drivers/interconnect/qcom/msm8916.c
+++ b/drivers/interconnect/qcom/msm8916.c
@@ -1231,6 +1231,7 @@ static const struct qcom_icc_desc msm8916_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8916_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8916_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &msm8916_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1259,6 +1260,7 @@ static const struct qcom_icc_desc msm8916_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = msm8916_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8916_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &msm8916_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1328,6 +1330,7 @@ static const struct qcom_icc_desc msm8916_pcnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8916_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8916_pcnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
 	.regmap_cfg = &msm8916_pcnoc_regmap_config,
 	.qos_offset = 0x7000,
 };

-- 
2.41.0

