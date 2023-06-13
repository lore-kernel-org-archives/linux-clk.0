Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D37EB64D9
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 14:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242798AbjFMOED (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242741AbjFMODn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 10:03:43 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C331FCB
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:30 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b3424edd5fso2488541fa.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686665010; x=1689257010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/J5ZhP262QYGYmarLd4yzENGlRt7ikJiCOlHTeoidM=;
        b=HBZr1xEVtVCKzGgx7VoWYpP27lnRRF4Cm2c2qa9Bdrbj3TJHPjm1RFQvkif9nScF0j
         QqjSsPpQC1Ugig5HySeVDyIs6VdE5jS+bOFM8yTWC81lkpcDYbJ1LvtPwApBLAbHBR5i
         FS/q7GfeO7TSLbQ+bEFXn5kXg9GO9mXWHy7qeOsHbZYXomfXsChC9wYwyJDgLiY6mY98
         rwYSgB0NTwMCALLMsEFGqo5tYvKNvhf2hNxcnQpLFEueLaSk40QBqRt1xHYhSOL+kzNC
         HudYABbibLwRIoSjLux23DPaf1CJor7Fdiwn1slSEl+wYlKXBV2GBSl3TNU3ITp3kYvy
         Vkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686665010; x=1689257010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/J5ZhP262QYGYmarLd4yzENGlRt7ikJiCOlHTeoidM=;
        b=TX3fb4dren2e9rt5FwexweJg/uWJ3JPcb6o1VN0TzMWbgYbxeH0Ss2f1xhr0BG0E/C
         xTm1Rurlff845X36wjXzKCWyxdzHdvLe9P8kz8OS6GNb4q2ZHsM7EOvSX9JSoeDme1sD
         LL5LgpMNa4/3jwr66O9KmlIIicP3g2o2l/s9v8+N9qblWIfWsqTE0fSIqc6KobPivR8l
         fGa09WrvcY6lbQX0JC7oVLoSql93ULwR81PjJyEexBlPs7RizRhP87xO2HCw9T+P4OJq
         JkZgsnfl/r2150Y3J3hOuHr2XBrGCSJeaVq359qr3IYQgjCuYIu0vQTQ5ddgOU5Q2ebY
         i6YQ==
X-Gm-Message-State: AC+VfDwACwlM5GxhKYyVOwtNxRRaHEMSi3J5z4K833gKcVQEXnTG/22k
        Oea53A+VZ4v0z5MQIf0v7DXkFg==
X-Google-Smtp-Source: ACHHUZ7qOiKHWmJiQwiSRhLbGz1oVxQPzRwh2a8x0cf1b4a2c54nRYDxFLeR1UizZ2xNUT+Qcy6vug==
X-Received: by 2002:a2e:8695:0:b0:2b1:b11f:1f2c with SMTP id l21-20020a2e8695000000b002b1b11f1f2cmr4403917lji.25.1686665009921;
        Tue, 13 Jun 2023 07:03:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c011200b002b32af2e9c6sm901490ljb.116.2023.06.13.07.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 07:03:29 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 13 Jun 2023 16:03:11 +0200
Subject: [PATCH v4 11/22] interconnect: qcom: sdm660: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v4-11-5ba82b6fbba2@linaro.org>
References: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686664985; l=1986;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Krc2Kcr5fnOQoU3m0Y+nr01slcqtM3Q1E0UfX4Ye6Q4=;
 b=h/vFjS2RkjwGjbyfVZTY5NBsEUcOtRgs5tixL3/9Bz1YX2e0yb+7tBtjv7HueiK0GqqXu4dQW
 Y8Dxxr9eEDMA8xyaLNxjXceeJX4jAph17npNbVr9rNG/bGcsFp9uuYR
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
 drivers/interconnect/qcom/sdm660.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
index 003fc7d110a7..5743ed680e8e 100644
--- a/drivers/interconnect/qcom/sdm660.c
+++ b/drivers/interconnect/qcom/sdm660.c
@@ -1511,6 +1511,7 @@ static const struct qcom_icc_desc sdm660_a2noc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_a2noc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_a2noc_nodes),
+	.bus_clk_desc = &aggre2_clk,
 	.intf_clocks = a2noc_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(a2noc_intf_clocks),
 	.regmap_cfg = &sdm660_a2noc_regmap_config,
@@ -1539,6 +1540,7 @@ static const struct qcom_icc_desc sdm660_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = sdm660_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &sdm660_bimc_regmap_config,
 };
 
@@ -1593,6 +1595,7 @@ static const struct qcom_icc_desc sdm660_cnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_cnoc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_cnoc_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &sdm660_cnoc_regmap_config,
 };
 
@@ -1655,6 +1658,7 @@ static const struct qcom_icc_desc sdm660_mnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_mnoc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_mnoc_nodes),
+	.bus_clk_desc = &mmaxi_0_clk,
 	.intf_clocks = mm_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
 	.regmap_cfg = &sdm660_mnoc_regmap_config,
@@ -1692,6 +1696,7 @@ static const struct qcom_icc_desc sdm660_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &sdm660_snoc_regmap_config,
 };
 

-- 
2.41.0

