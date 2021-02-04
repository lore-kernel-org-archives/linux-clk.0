Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC6CC433E0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 15:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6000F64E02
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 15:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbhBDPD3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 10:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237011AbhBDPC6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 10:02:58 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185D5C06121C
        for <linux-clk@vger.kernel.org>; Thu,  4 Feb 2021 07:00:14 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id c12so3846082wrc.7
        for <linux-clk@vger.kernel.org>; Thu, 04 Feb 2021 07:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nc9gnI1H6fzB+6K5saFm3Jx2SbTp7zcViLcj0vH0QAE=;
        b=xBjDITC5+tezp6ASj1W9SEEL71cDN31GmI49V3hP97Rkk6ld15hKRtJKVVAPCVz0RS
         frD+50Kq8BJmGeSUuzcO/DBk+Wu0xBCBMLZBDlXz+YABc2vTATvWxndg0Ok3M9cze3du
         29bAsbA805/uqhI35bvccRBTyEjm4L72ZetX4YTE8Z2sBLUNdzBLO1pMn4HHLn7oiV0Y
         xw2eYDCFrjr7duA+Nh7lIOLkEt9lScz8dxnwARKiZeMLa0M5/NDPYSGMSrWRBGhKVESj
         N3NEkDPJ3jU8+A6bmhUZHqb9ddeDbAZ24nrlBUokDAwiNtyDB2nN891sbpmwq2lLZlTa
         4kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nc9gnI1H6fzB+6K5saFm3Jx2SbTp7zcViLcj0vH0QAE=;
        b=f0bYosQnnD4q5GBeVaJnTNUMxnB0UihKphHy8csOwgZgsopXzr/gQbuLUiOmDk72J6
         c+nXz47x/txTv0EFMKEKf0SCkopOc/o0rw0bGdfgeYuqxzPSDRONCTrc+YxslUCPOtnV
         BBzMhRmgEhptVJ3JGWQSlhaSSBRbnqtiHFh3IHxnUKKt+XIoYbC1dH6C2hmqmPS72rqF
         TCHugMtcyDudqtqo1NlOW9kTqul/I8OEtJQ4S8th86Gj/hYO+TPR93IavJvul6wc7+uV
         Tw4mUNCLFPamjMff59F2S6L1LxHyIH7tSmF1SHyG01Miho6zCU2TP9bjlNL0ewme7wEr
         ozDA==
X-Gm-Message-State: AOAM532QGvKWaw4Z4w58f3FvIgXpd+QoKwOgjtQuG7/ilifawHhRJSoy
        /GqC/TV4DRoUiYqBVlr3AcsicEJgQYJ0bA==
X-Google-Smtp-Source: ABdhPJyKcEmxw1PwIBgjDPjRNrIOrtemhNiOF5VcPU6CotGo8z9YXhwc1/u4P6Sf/bYE34OlFCnruA==
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr10252537wrt.248.1612450812483;
        Thu, 04 Feb 2021 07:00:12 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:11 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 4/4] clk: qcom: videocc: Add gdsc mmcx-reg supply hook
Date:   Thu,  4 Feb 2021 15:01:20 +0000
Message-Id: <20210204150120.1521959-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This commit adds a regulator supply hook to mmcx-reg missing from

- mvs0c_gdsc
- mvs1c_gdsc
- mvs0_gdsc
- mvs1_gdsc

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 3ade240bd49c..b0efadc19634 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -278,6 +278,7 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -287,6 +288,7 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -296,6 +298,7 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -305,6 +308,7 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.29.2

