Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A55EB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 14:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242821AbjFMOEO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242686AbjFMOEC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 10:04:02 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437092120
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b33176880bso23111271fa.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686665014; x=1689257014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxwAlvsxTG2NJKirdi7L920nJWliszLcfh8qb5HaEiU=;
        b=l86A2/DeidhXXCVE0OFO1+tAK0PhiqQKAvISrx4ORGB7VYwPAnUWctRkF0ml/Jg764
         av8j5sOjQr29PyeB4sVBVDgwxmYjGPNGIIBb3gfnQn5gq7mQs/kDPdK204dYJePbMWnt
         jy7/7fyDWiBObciCgvTxpnWt9pf2XpbxeDJ6d1/6Dcw8pqXggRAnF4Thpsq/AQSqVuGQ
         4wfXUKgqpHChGsxKqseAgBEe5ry3323xbNgInol9jpFOkGQP7IadRM3HLEpVRv84Qs/V
         nUOyq9flLFUBRykwH1eyyWq/Hee1fo2XuapTC7hIXsYdh3NmUbXUaqOetCL/48VIJjYi
         yvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686665014; x=1689257014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxwAlvsxTG2NJKirdi7L920nJWliszLcfh8qb5HaEiU=;
        b=iHkhwF7qWzBF2WsiC9bLONtjlvfg0lx+c5zFG0gxLXwUaVZ0BJixZY3mOBU4snC93c
         l/P+2WZ9hisNp/C/ldrTmBfjj/TBUoomIaHM2z3u30ol5RCeshrQRFL10/ewDS5bPctj
         EAyW3h7L2heKgdkeLZKKdqw+V603eRXHu+QGNHVwv6quunPxYnhnFkKrUxV7kXfqtW3H
         bu0TktDkOrQfFwj6dwCA7Xvpx7rO5vlX9kL+/SgJhAOOyR/+t9wroqVMDgvSDGstv9Y7
         uKc6rEE3g2IiosKWvIORhiMQj7pPPEgfcBnsvQsOccRG1HYxJRtmlszatkj6SrdWP61g
         SC/Q==
X-Gm-Message-State: AC+VfDzMHWm5C0xQJ2q7RQ34Q6oZxJPeavwECDxHUDB0hjygjzxNb7Yx
        yrGwdlQZ+TlrmzaOZQ1ZLQVq2g==
X-Google-Smtp-Source: ACHHUZ6LZtEIkySCKrRX/wcpwAJJdp7PAdgyFajtX8OPbh8/QN135ik/jV8NePVJf/89dVJLVg9NGA==
X-Received: by 2002:a2e:7d0d:0:b0:2b2:14f1:1c3e with SMTP id y13-20020a2e7d0d000000b002b214f11c3emr5533506ljc.12.1686665014107;
        Tue, 13 Jun 2023 07:03:34 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c011200b002b32af2e9c6sm901490ljb.116.2023.06.13.07.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 07:03:33 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 13 Jun 2023 16:03:13 +0200
Subject: [PATCH v4 13/22] interconnect: qcom: qcs404: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v4-13-5ba82b6fbba2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686664985; l=1291;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=NibH4RmX92w9jFbYbYmeVzyLtbX9fV3dfXE9S9JnGAI=;
 b=oLowyV780o5KdIma9Y0EGc/2QejE4A13WBwPntTdii4GiEqu1LMljknf8y4c/NpdYsysK+fAV
 EuGG5AYGoE3BVFaYwUVNYTxRzFA0huNIMH6skrMZ9gZO9wyOX8Sv4DX
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
 drivers/interconnect/qcom/qcs404.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
index 938283ddd0e3..9deb4d81104e 100644
--- a/drivers/interconnect/qcom/qcs404.c
+++ b/drivers/interconnect/qcom/qcs404.c
@@ -984,6 +984,7 @@ static struct qcom_icc_node * const qcs404_bimc_nodes[] = {
 };
 
 static const struct qcom_icc_desc qcs404_bimc = {
+	.bus_clk_desc = &bimc_clk,
 	.nodes = qcs404_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(qcs404_bimc_nodes),
 };
@@ -1038,6 +1039,7 @@ static struct qcom_icc_node * const qcs404_pcnoc_nodes[] = {
 };
 
 static const struct qcom_icc_desc qcs404_pcnoc = {
+	.bus_clk_desc = &bus_0_clk,
 	.nodes = qcs404_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcs404_pcnoc_nodes),
 };
@@ -1066,6 +1068,7 @@ static struct qcom_icc_node * const qcs404_snoc_nodes[] = {
 };
 
 static const struct qcom_icc_desc qcs404_snoc = {
+	.bus_clk_desc = &bus_1_clk,
 	.nodes = qcs404_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(qcs404_snoc_nodes),
 };

-- 
2.41.0

