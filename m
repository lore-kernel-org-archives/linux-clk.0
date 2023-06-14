Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375C4EB64DD
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 10:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243581AbjFNKXY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 06:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243712AbjFNKXE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 06:23:04 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDB41BEC
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 03:22:38 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b341f83493so6917101fa.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686738156; x=1689330156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHA+43B3syu0x2pUChrYAxljP6/us7hNfim2x8e+Qms=;
        b=LhF9JfwYoasG2xSpkjZWfq4/yC/z1fPR0v+MNL+WLcA5scjxpd6i9uL6Smyz62+dYi
         xWQhPv7aVT3EgSVVw+S6omNcilDAF9tWGAwq1TiGIB/e+K10N5Hm5XDfZciT7KgMhqL9
         eQzucKUU55kvzwtpdvTXM/I2chpIbzJ5uXrZ9MVLbaGZyyic2mCPjCyhfWyFtHZYSkOQ
         JKmHiejHpEL84LcYDu/jU++wI0roYr885B31tPgg5rpE7OuCBSp4Sq1wXFrL0Gmf4LC0
         jAHJ90SmXscX71zKBHm5I0dD8/H13R0TpbCaeZR+TI2OEsA63GkHhZ218g8e5QAaeFga
         eRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686738156; x=1689330156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHA+43B3syu0x2pUChrYAxljP6/us7hNfim2x8e+Qms=;
        b=Nj7b+wNt/fkbPakQNOjlD1gNJ4PoG3gLLd+5UwkMI+KL4jN55NM7YJ+zVh/ez38VaT
         1g1BFD/CCuto8rpxG8+Z0k3qQmHpLa8e6Psjh/p7440CMvR5+lbDwkvD4hQGuhCgsQqB
         +XPzT640ePASHuNQlrWHdDflP0apcYsuLML89EQZt//7WNj9LRrRPHYRs7m2/ScSqTE9
         YS7+0GPQjhRWHQlGFw+xDCVX5zLA8fxeuchkm+IjklfwpS2H1xnSZ3u5VM/nZUHFBnzV
         VQicaoOWXSqmUV6u59cpuxi8J1DXFpFAgEm8y8oO6Z5d/Pd05igriNJBw42FKW88CHl1
         75cg==
X-Gm-Message-State: AC+VfDxOCOkBqeoorKec1BBe2EHbiSZsEhdnnkd5xi9lIYxWfEq/m6As
        kX8A3uSEL/GROMeuUR2F47EyQg==
X-Google-Smtp-Source: ACHHUZ4UNF7FLI/hVvUOxY9syYRQZiuHDhmcM0HLrXRhUggNujzLBWljC3fEus0PzZmMZSMygZOJ2A==
X-Received: by 2002:a2e:9f14:0:b0:2af:1dce:8efd with SMTP id u20-20020a2e9f14000000b002af1dce8efdmr5695334ljk.36.1686738156731;
        Wed, 14 Jun 2023 03:22:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id m2-20020a2eb6c2000000b002b20d8f270asm2520057ljo.74.2023.06.14.03.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 03:22:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 12:22:25 +0200
Subject: [PATCH v5 14/22] interconnect: qcom: msm8939: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v5-14-eeaa09d0082e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686738135; l=1734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1B8WtVx3wEojfY5dydOVxe8YjeFJXTMa40iYBVHPUpQ=;
 b=Met0Kae1s5RLP9+M9BfdGznvXHnPuLG08YkXG0Spv2rJprr0RE4/aaZsY2S14jHlE/lf4fMAD
 jGJaigdRu9ZAw9NEoA44TFDdVLKPWkQ2XsDg71T5heSzDFtRiKbKHNV
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

