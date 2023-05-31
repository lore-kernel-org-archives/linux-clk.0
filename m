Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62427C77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 31 May 2023 09:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbjEaJBk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 May 2023 05:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbjEaJBe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 05:01:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29FCC0
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:01:32 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af1e290921so57520501fa.3
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685523691; x=1688115691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yzn4m2H/FTJRfB6bL/ET9uNQCruK8cNknsLXsMEBu2E=;
        b=ROrn/OQ80wrgTm1WTNqqnPiEHuLEDkI0JODJbZ1ec7jx2JPoLm5jeP/VoCbaSGPqtd
         zCisK5VEiJuxY8FIDnLQStny+QIu5xosh2X3f1g9gGx1O76QXPRzCnqYRDTRQVWP67nx
         LTcjetWRP+UdP8lwt536SsagLUsDsYCq+PriKUhcIV0GKmwQKkCxAcuFwDiaX+FXMqGL
         ZrV9r2TSkwUs4iVB47w3PcemwSYSsIy0Ln4AWl5ChIkjGgv7T9TNRjtlcs3fI6d23Wdd
         QBTATxzzbnsmaxHlfDN623sKRNDhflTPKwOiD26/l9barwljGDvXFh1KK83HnakqIGbE
         sxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523691; x=1688115691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yzn4m2H/FTJRfB6bL/ET9uNQCruK8cNknsLXsMEBu2E=;
        b=EQ2/bdW9xLmLt48j4T4seX8RaK8koS7BOB1LLkzc1mSOkq9HWb/5Ih5YbK8OnpZgtx
         Xx0YxlTVoo2YcHPbl3Fpp9my7qBe28ZWyAKh8xw4kz79e/tgVwc2p2MsAhnkqJyQDf8c
         oPyM3SAwcMh7XqoHw5YiiEqjh4COfpSgxM8zawnlnC5u13/FRi3YX7neNrbtmTQEKNaS
         m5ho1MVMTnhnIF3MTSMhfdQxWh1xO04uDlNmVsiA0iAuftxW+Ee2fstZ+lgvsseHfVRj
         R+zEshcW68mxbuY7iBCQx7M0spNQ7S4vUA49mMrqlw0UuWle6eIerQMduNnylSUbsuiJ
         NzYw==
X-Gm-Message-State: AC+VfDwISymnvT02/+XmfMobCAMRFhvuW4jwTw5ImHHrhzP5+SA8KD33
        p5vZL7/VdjLQ8BM67NmbBmIbfQ==
X-Google-Smtp-Source: ACHHUZ6eAO4MLkWKSzQ1EWOX6goASrvWTAshO8u2qa5GJ5XpLI20XqQHeTybKLJ5NCy67gNHZnv59w==
X-Received: by 2002:a2e:3e01:0:b0:2af:1262:e917 with SMTP id l1-20020a2e3e01000000b002af1262e917mr2085788lja.25.1685523690859;
        Wed, 31 May 2023 02:01:30 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e9184000000b002adbe01cd69sm3217446ljg.9.2023.05.31.02.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 02:01:30 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 31 May 2023 11:01:21 +0200
Subject: [PATCH 2/4] clk: qcom: gcc-msm8998: Don't check halt bit on some
 branch clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v1-2-2b5a8fc90991@linaro.org>
References: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685523686; l=1575;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3hJNNh4/9lwYUqpHcPuPz2a/mPNaOro7+/PxaHyFiI4=;
 b=D1cKQbxl6Xtd1J+LgAXmgHxu0Ctd1287EHb5ahT81jhB+8oir0bvlwKU/9Yd7q9zlcE9kYHd7
 LbEi/VMCfCUA4ssNg9vYIWFjz1hEtBchnbksdUULcaB26XqQFz2Sv07
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some branch clocks are governed externally and we're only supposed to
send a request concerning their shutdown, not actually ensure it happens.

Use the BRANCH_HALT_SKIP define to skip checking the halt bit.

Fixes: db2c7c0a04b1 ("clk: qcom: Add missing msm8998 gcc_bimc_gfx_clk")
Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index be024f8093c5..c343bdfc3cc1 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2061,7 +2061,7 @@ static struct clk_branch gcc_gp3_clk = {
 
 static struct clk_branch gcc_bimc_gfx_clk = {
 	.halt_reg = 0x46040,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x46040,
 		.enable_mask = BIT(0),
@@ -2074,7 +2074,7 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 
 static struct clk_branch gcc_gpu_bimc_gfx_clk = {
 	.halt_reg = 0x71010,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x71010,
 		.enable_mask = BIT(0),
@@ -2100,7 +2100,7 @@ static struct clk_branch gcc_gpu_bimc_gfx_src_clk = {
 
 static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	.halt_reg = 0x71004,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x71004,
 		.enable_mask = BIT(0),

-- 
2.40.1

