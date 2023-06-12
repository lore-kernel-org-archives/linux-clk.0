Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1247C7EE2F
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 18:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238194AbjFLSZY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 14:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237897AbjFLSY7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 14:24:59 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94474E6F
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:24:57 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f63a2e1c5fso5589372e87.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594296; x=1689186296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfWaXpFcH3gkTKoNeoEghs9YVVozZ9w4ELuAa+IL8Vs=;
        b=XIsC1G2D8EwG8+1D/loBnHpn5UxIpqZb55NFbT+lEQRoG7kzsngHepGnW6+na08ORS
         5+sQ0GcsVIfunDM+PYnVk5iP/gFg9WUXB5xXTxjzhJTxQB0okVILgNyFkBZH9/hZgni3
         HgS5vk2hj0ifVQ9+r98qXt8H0jKtTEdtL98sG+91GNnszerrQtpHZrq+vgjeMoi/JsSe
         8hQvf6zNojIXyEuer11y3loE8+tk0mT0qyl66hnOx5HXgJCcRDZjuZKdHIoVG/BcPjGd
         6klgkmZoMMm/08lMry/b8cBE2RIKsFamHtAcrj0VL26pXrbeRuC64ujHG9KsVyNWrtza
         38gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594296; x=1689186296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfWaXpFcH3gkTKoNeoEghs9YVVozZ9w4ELuAa+IL8Vs=;
        b=dUsDuKurOfC5ScWnBFLpW+xCfjHd1ocPcgfzCTKQaLRWBDaf0qYsFloxgQqLjoyQaR
         e5+GiFkB2oRwypk2Fp00N/5bODsmruXirCQTPzcISsB/xxtIG8ExcRNSn7dvkfzdDupr
         Q1iAM34G1j2sv9imm0Vu6a8BWqFGY7ELD5IxRL7T22O0O0Mi5WnmespypUw9fSsXONhX
         qDZc1aZaSUz9bBYGLkYIJ6YMYOn/JkuKzF5yWtkKi5mrH3S4tp953Ysf8QCFi1W7PWsq
         kmYQvB+dt+7Wu4P576h6GJHXVV+W/DCYQ8KKzllC+E5ghdgWN3PWINEhcw62P4dlsl9c
         t+MA==
X-Gm-Message-State: AC+VfDwCgAgyZCGRQ2bnhG78/i60Kd2blv4U9PkTOTjCtYBmRmo6qT1B
        Ogd/nTRVguegZZA5Q54hWqtR5A==
X-Google-Smtp-Source: ACHHUZ5ll6OCUgGoYMYnj3//7aLRheOixkAcG6EMtsN6S46ln4xwpq5rsM5Idz1bJIRo7tVNtCfm8Q==
X-Received: by 2002:a19:3854:0:b0:4f6:2e78:e4ee with SMTP id d20-20020a193854000000b004f62e78e4eemr4056080lfj.68.1686594295784;
        Mon, 12 Jun 2023 11:24:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25938000000b004f64073a252sm1502035lfi.96.2023.06.12.11.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:24:55 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 20:24:30 +0200
Subject: [PATCH v3 13/23] interconnect: qcom: msm8996: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v3-13-5fb7d39b874f@linaro.org>
References: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v3-0-5fb7d39b874f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686594276; l=2380;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jls2pE5wAdO3X2AaNe/A0wroCOxxq+TCympGtPIPMpo=;
 b=TjBgCWvQqb8vhqBQkI/DzSJTFhkWboMLTMy6WoIygXL8SX16SGuUaCxZA+uOLSDD1R3WQWhDS
 hWHXP0C8xvFA+8WCbULhh61DTR1jNeWpJ9DDGDFB/Oc6Cpbi9lf2KzK
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

