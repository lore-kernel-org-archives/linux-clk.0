Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA188EB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 10:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243723AbjFNKX2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 06:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243590AbjFNKWz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 06:22:55 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB701FF9
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 03:22:35 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1b30445cfso6703111fa.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686738154; x=1689330154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfWaXpFcH3gkTKoNeoEghs9YVVozZ9w4ELuAa+IL8Vs=;
        b=WX0YIArbA+d8cpHlR88BAXEPFalWZYD1m+Qp0La8ZA3oVpZZXwiJSCQQm2LeQmrRTh
         vImgK181LNw5BJWjeMBYS3ZyFcgQVgejUO9L770bPYqbeJBbThW7S64mbuAvz2CVNwP5
         sfyvyR4l5aUObbDwR9PyML+NO6fog2TCMxe3Yo0zvO20Oj1H4O5exVg9Pog3VRpv9D8t
         z3Fs0bfA0BdB/mqRGUrj+2KR51NfvmK2uZaJd3P+CnQbgSL25hL0+Xz9PZYE+ooI+1qh
         9YPWXiToXselmLcRigKF3hrr6cuZTkmrvuGPBRSjwZAnUv2Tu8owFKeAHFXEqqAJ1Jif
         ZGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686738154; x=1689330154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfWaXpFcH3gkTKoNeoEghs9YVVozZ9w4ELuAa+IL8Vs=;
        b=FSF59413YyBF+5egrjon4TEQjxgxIlV17VY1/Oak9GWGwyNLlnvdX7L8j4k7eW77ZO
         d7l2+etGayY15LvBF+ydpCr9vRzlA9Av2t38OkczCMak4Zvf8OcOUrYmnYrt8aSI/7Gl
         Dsn/MUoFkbPfXJqOFS5REOXNFH4okIwct3L0xcEl99lcBZMfL2gfoQ/R0YhlDsnTjUQm
         n/DJj9HV9j805h0jB866KRlqP87CJbGsoCc+Amvh8Q4XrNnn0QuWEVh4dsgTQwja82h6
         dOt5GKuSVX9E8SWUx1sd8zJSm7KuxJf1qL1gl5If8K0bEIEpbnGNNsdv9k/o4i/4H9XS
         zflQ==
X-Gm-Message-State: AC+VfDwZGv4VErWdCz/AO7EyjNFZhV4M76L3TiuYf0H9u6maC1vojaln
        3yE2eCVpYuJD7j54ll+iM++PcQ==
X-Google-Smtp-Source: ACHHUZ78hUEHITyXgqGwvNlHUqN36cIC+/knD+KP5dTMZNRJBjVZzaW17fcLvzQSZOcUBZ0pbcIdTA==
X-Received: by 2002:a2e:9012:0:b0:2a7:8150:82c1 with SMTP id h18-20020a2e9012000000b002a7815082c1mr6376610ljg.38.1686738153787;
        Wed, 14 Jun 2023 03:22:33 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id m2-20020a2eb6c2000000b002b20d8f270asm2520057ljo.74.2023.06.14.03.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 03:22:33 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 12:22:23 +0200
Subject: [PATCH v5 12/22] interconnect: qcom: msm8996: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v5-12-eeaa09d0082e@linaro.org>
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686738135; l=2380;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jls2pE5wAdO3X2AaNe/A0wroCOxxq+TCympGtPIPMpo=;
 b=fSdqvZiOy5ixH448JoCfdWi9iAt1IbIuyVVO1AKX13yGNhYBq3T3SFlHDv0oFVHynwJzqhY9u
 r3ScPfaC5kICEhklW5p5gjXqQxpSFc3WGzLzIdmbJe12k6cm11VD+eB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Assign the necessary definitions to migrate to the new bus clock
handling mechanism.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8996.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index 1f7e88a37acd..a596f4035d2e 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -1840,6 +1840,7 @@ static const struct qcom_icc_desc msm8996_a1noc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = a1noc_nodes,
 	.num_nodes = ARRAY_SIZE(a1noc_nodes),
+	.bus_clk_desc = &aggre1_branch_clk,
 	.regmap_cfg = &msm8996_a1noc_regmap_config
 };
 
@@ -1861,6 +1862,7 @@ static const struct qcom_icc_desc msm8996_a2noc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = a2noc_nodes,
 	.num_nodes = ARRAY_SIZE(a2noc_nodes),
+	.bus_clk_desc = &aggre2_branch_clk,
 	.intf_clocks = a2noc_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(a2noc_intf_clocks),
 	.regmap_cfg = &msm8996_a2noc_regmap_config
@@ -1889,6 +1891,7 @@ static const struct qcom_icc_desc msm8996_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = bimc_nodes,
 	.num_nodes = ARRAY_SIZE(bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &msm8996_bimc_regmap_config
 };
 
@@ -1947,6 +1950,7 @@ static const struct qcom_icc_desc msm8996_cnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = cnoc_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &msm8996_cnoc_regmap_config
 };
 
@@ -2000,6 +2004,7 @@ static const struct qcom_icc_desc msm8996_mnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = mnoc_nodes,
 	.num_nodes = ARRAY_SIZE(mnoc_nodes),
+	.bus_clk_desc = &mmaxi_0_clk,
 	.intf_clocks = mm_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
 	.regmap_cfg = &msm8996_mnoc_regmap_config
@@ -2038,6 +2043,7 @@ static const struct qcom_icc_desc msm8996_pnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = pnoc_nodes,
 	.num_nodes = ARRAY_SIZE(pnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
 	.regmap_cfg = &msm8996_pnoc_regmap_config
 };
 
@@ -2082,6 +2088,7 @@ static const struct qcom_icc_desc msm8996_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = snoc_nodes,
 	.num_nodes = ARRAY_SIZE(snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &msm8996_snoc_regmap_config
 };
 

-- 
2.41.0

