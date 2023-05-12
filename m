Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CECC87FDD
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 21:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240455AbjELVSM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 17:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240415AbjELVSK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 17:18:10 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4ED69EFA
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso11780211e87.0
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926255; x=1686518255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWMNT07qFC9FaIB+soq8G5lluprlR23tOWvaEOZLetQ=;
        b=cIPaom3wezsX11bH/sBVZ2pG7UEB3pQFipRO3osb/jJxblZ3uFbEP/3fQTloCb5qQS
         qIKNk9YS1UefS1feMFgWSnWGdnfXHRc5M/3qAQuZ+ereZfzR2S3+4yrujd/eebC7Dkgq
         FLTmkHNtW7NZG8ipKfG7hbWbyYGu6Y60S8HQz/NbQXy4VnPd0dLhOChC2Bzjt1tse28S
         LG5HoNWX8n/1if1UOdOU6E7kIUpaMVK217/ysJquhxJMawQH5ARSOoLgdk94410H15x2
         RuQToiVhFn3hwlHd8Wqo/fI2dUiC4fT1+KxmKZtZ7RavlwB4rFI0Mb9fvMa866wo9WVo
         QfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926255; x=1686518255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWMNT07qFC9FaIB+soq8G5lluprlR23tOWvaEOZLetQ=;
        b=WKRZXaCdqTjeJbRb+Tc+y2AR/qg0AvTyIOq+ur7twyTAYjn17Z2Uc9XYr3V23EIjuz
         YyxnC7tay6slOixEKp8fJraRnm7fImZya8idv7gbCTvksTxjjOf4Q66jZsaZSHveuqpV
         hpUgGC9KRXt3LM7glIWSOHYDDpGVcB/GlM8OearE29kOwMvaOg1XiCpH+4nu0j9CA+7+
         Su3tqNRuqMF11JwE8/nk9DwyCPaFBA/+6FggsDDW/9+nJX/qdYEgkX3Jz2zGAQACSsZp
         qmAPBePXMll7ItyFM5bpmrUw25KLHSOUrJP4xQ44r3clxTD/9OkeEkRj5wJvOKX83gm9
         zOkg==
X-Gm-Message-State: AC+VfDz39uVd5fLVYGWwWf3IXIGtbZ/yNo1QCW56jJfYn1VQQhQ9jpDH
        0GiCVPSlGLtEixaCu2Uvrehmbw==
X-Google-Smtp-Source: ACHHUZ5zrLF+O/LpG2j37bluYQcdJUzTojWzv2VX0mN4f2ln7RSXN8FFUz5mLA7bn9yLm4apZ65wqA==
X-Received: by 2002:ac2:546b:0:b0:4ed:b329:5d85 with SMTP id e11-20020ac2546b000000b004edb3295d85mr4006830lfn.15.1683926255710;
        Fri, 12 May 2023 14:17:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Date:   Sat, 13 May 2023 00:17:25 +0300
Message-Id: <20230512211727.3445575-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gcc and lcc devices have been switched to the DT-defined cxo_board
clock. Now we can drop the manually defined cxo clock.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index 458c18b639db..64d4f508e43a 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -26,17 +26,6 @@
 #include "clk-branch.h"
 #include "reset.h"
 
-static struct clk_fixed_factor cxo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "cxo",
-		.parent_names = (const char *[]){ "cxo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 enum {
 	DT_CXO,
 	DT_PLL4,
@@ -1623,10 +1612,6 @@ static struct clk_branch ebi2_aon_clk = {
 	},
 };
 
-static struct clk_hw *gcc_mdm9615_hws[] = {
-	&cxo.hw,
-};
-
 static struct clk_regmap *gcc_mdm9615_clks[] = {
 	[PLL0] = &pll0.clkr,
 	[PLL0_VOTE] = &pll0_vote,
@@ -1736,8 +1721,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
 	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
 	.resets = gcc_mdm9615_resets,
 	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
-	.clk_hws = gcc_mdm9615_hws,
-	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
 };
 
 static const struct of_device_id gcc_mdm9615_match_table[] = {
-- 
2.39.2

