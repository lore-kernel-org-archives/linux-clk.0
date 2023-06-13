Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4ABEB64D9
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 14:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242710AbjFMOEe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242747AbjFMOEF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 10:04:05 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A7F1715
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:43 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so6520227e87.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686665016; x=1689257016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHA+43B3syu0x2pUChrYAxljP6/us7hNfim2x8e+Qms=;
        b=rt0ZocgtbHYC4DBNsHw1jDT4FYxyZzCNwo70S5UtvicDdeVmJzFsMK3BLZ7jbBvAo0
         qd5HPHJq+67Q9pQvd9t669m1wC+xDzyC2flxj7ovnuqxtP/0UWlHtnjcE/B4Uzi4OVcx
         cACQwyLbCm9A20oKRiRBsSTr8yA4Re/M5BlbeK7F0P+ghxOHl/QakvGeNqdwaspqcG+e
         xzAVm59RVPX57vC7JmNHNil1I9KsWYbuHQRyUhF4BUlA9VGwdBs+MfPKQpGvuE/n/gOI
         lA+xfAftiU6RFBTnwXfPdKHSwXFI16srxHjaOO32nK/wlqrEO0p1BcKlOhXHfHDSmOML
         dSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686665016; x=1689257016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHA+43B3syu0x2pUChrYAxljP6/us7hNfim2x8e+Qms=;
        b=Xphhz6WMlfhk0SIfKIRuCOrRDnby5vYFas94Eyaj1KDa7hz5kLhUzdzbugjVzniC5/
         LmyaXYMu6EH8Rvz+IXRtX4J5wIkNVBoMg60INPumbr5tJQv3weKuA1UyBdYuv7FkVVgI
         rYglfkYaynvFqfjLLb+fER272q9cDDk+uvzzk6GLSqzBv9T6Kd+kAz0eUl6y5LaWOI0f
         2gTddEbwjzAM+/lBIzPzRDSecXCoIK4xChIsJeQ46oxUUR2jFPhu6EpSYIBrWI/d+kxn
         z6sa/zUByzdh/uZkdQkF52yi1Ko9YcleUYT7NyB77qDWq1RfiPDWUEzD3ZJrGtW22vWG
         dM8w==
X-Gm-Message-State: AC+VfDzR/4kOYb+AfKCBZo0KQxXGC8veI7hb2fdjnjaFoZ6a+j0FE3J9
        RFUwoO8Eigx8lWydLCcyuwxCoA==
X-Google-Smtp-Source: ACHHUZ4jdL41KnGvhzMP2sQAmBD896vnZ9nJByapAdSsNqzBCUDPgsbl39KVJyAQAbR2F83ubDWqXQ==
X-Received: by 2002:a2e:6e17:0:b0:2b3:3d05:c31c with SMTP id j23-20020a2e6e17000000b002b33d05c31cmr933005ljc.33.1686665016164;
        Tue, 13 Jun 2023 07:03:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c011200b002b32af2e9c6sm901490ljb.116.2023.06.13.07.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 07:03:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 13 Jun 2023 16:03:14 +0200
Subject: [PATCH v4 14/22] interconnect: qcom: msm8939: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v4-14-5ba82b6fbba2@linaro.org>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686664985; l=1734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1B8WtVx3wEojfY5dydOVxe8YjeFJXTMa40iYBVHPUpQ=;
 b=tVA39a2RTRmERFIiNFwQlOh7Br/XSsHXLHwXqLrjEWxQ3QPKeiaWRg5ANhfUGck6W7woRwxwP
 oA5SUvtJ+sADTsZ31MK+jb6zARPAUF3+IiwNrSvx64JZkwULzFr1IG/
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
index 639566dce45a..94b11b590a8e 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1284,6 +1284,7 @@ static const struct qcom_icc_desc msm8939_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1304,6 +1305,7 @@ static const struct qcom_icc_desc msm8939_snoc_mm = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1332,6 +1334,7 @@ static const struct qcom_icc_desc msm8939_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = msm8939_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &msm8939_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1403,6 +1406,7 @@ static const struct qcom_icc_desc msm8939_pcnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
 	.regmap_cfg = &msm8939_pcnoc_regmap_config,
 	.qos_offset = 0x7000,
 };

-- 
2.41.0

