Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B00EEB64D8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 18:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241096AbjFNSFe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 14:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240836AbjFNSFD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 14:05:03 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E0626A3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:57 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so9114239e87.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686765895; x=1689357895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSfPNWyiQLrjAB0czC11oTpbsDGKiNFbaeuQIkEjCow=;
        b=HvBWWY+/HlzjknLWa5HvxKUQeCiGy/YOMhx5xc54cn2tLIBMBXD36tuq9BCiV8Tdkq
         obo4I+Lk9hQY7rznljz4ze5SoEiqpS94REtIXwjNwCJIrL42Hc1Cp/1VasBF33b+hJyR
         rgANW/v+C1vV0EhAtm+xGsCV8DSwl2EOuVvu1AKfJIK9/vLhnIdYCDBfSR1QXOUeVsph
         CrndO4z7hWH26yg0p6dO8YMcxHHdi33Wfk4lw9oWKDT3irklp0scN4Hz4xRFagOylUkI
         NaQpbx/O3sV31DEjHwO9mk778zDvPsXas1pwk5hzkCy5q6dyfutk5kez4wB+SuxGG6/u
         SaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765895; x=1689357895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSfPNWyiQLrjAB0czC11oTpbsDGKiNFbaeuQIkEjCow=;
        b=LaBVEeMFsXDaiQD3VOZO+Rck1HX4+2esClczce4UgjL40sMO6FmfjrfcLhQVmD2AZO
         4RY3Qf7iG+thdycpFYyu+jAyZ3ai+ZAatKd3jDwhElBW/kem7TVmEny+Pyk/w4VzTrXo
         lZ6nANwHe73VaQpzH162siPuEsukxWbFlSBMS+vdTdvR8XRd9EECUbPdu7i8vOBRoAfc
         Q+t2QBEy7Sje+cg+EC9VrgyTpeKuRXP/SxX0jhbt9NUKGAzqGR/Hewq6HB6sHcYHx4C+
         nhZpx2rtsSxnOgAq3AhqvaMslsbq6MnzGfmUighYc64G5Y9+T1yOgnSNK/3HdjAkFLKZ
         5swg==
X-Gm-Message-State: AC+VfDwzfZ4ykt1aLavrMkyBo++ToR7BIsYy9cz4Davua8rG+QapgcuU
        F2NsI+zRuM7kGqmXj8H4cKhI/Q==
X-Google-Smtp-Source: ACHHUZ4GIII34ty0ViBahS0gjNN29+tcbBSiGWCqQhmeI21a+n3skTMwh/qm4H6/m/sQD6Y5K/fj0Q==
X-Received: by 2002:a19:5f11:0:b0:4eb:c85:bdc2 with SMTP id t17-20020a195f11000000b004eb0c85bdc2mr8172808lfb.2.1686765895207;
        Wed, 14 Jun 2023 11:04:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id l18-20020a19c212000000b004eff1f7f206sm2224053lfc.9.2023.06.14.11.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:04:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 20:04:33 +0200
Subject: [PATCH v6 14/22] interconnect: qcom: msm8939: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v6-14-263283111e66@linaro.org>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686765872; l=1734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ptXNaQOaty1z4TDLkDcxe3GA9UIR7yqJkXzhnEP9xnw=;
 b=zW7ImhAlheC//FuwEf4n0YToyLVvVx+0R5GHfoYXlaiG0pIf/XLFlz2zpFeYNEBn8b8nKAz+B
 LLu5dSXNePHAYEmBqGh4QucTkyzi3l+8caBBqGqcvU61bow7MrjQbj9
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
 drivers/interconnect/qcom/msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index b1005dee4e38..6732eeeb8158 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1283,6 +1283,7 @@ static const struct qcom_icc_desc msm8939_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1303,6 +1304,7 @@ static const struct qcom_icc_desc msm8939_snoc_mm = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1331,6 +1333,7 @@ static const struct qcom_icc_desc msm8939_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = msm8939_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &msm8939_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1402,6 +1405,7 @@ static const struct qcom_icc_desc msm8939_pcnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
 	.regmap_cfg = &msm8939_pcnoc_regmap_config,
 	.qos_offset = 0x7000,
 };

-- 
2.41.0

