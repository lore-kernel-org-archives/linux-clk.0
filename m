Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05300C43603
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CACE9613EB
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237861AbhDEWr6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbhDEWr5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:47:57 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816B2C061756
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:49 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w28so19610380lfn.2
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=NMuRiNSZllgAATLnw17z91QxWumR1kjjVnYQiUgzejOTTQRjTA3iKWRM4/mcfgi2iu
         jWpdXoTXBTg3udz7xdsjelWrxhH15owmv+68E5X9KS0vLkPSeO7hGU3/nBmchx6i6hbd
         Jk4h6Kf00WtQMqZ2ZSG2ltnA04MP/nRdzBG8YLrUmJc3tH2m/5/lAnNTP247fiNN+AiH
         wwH8sA3QfOEwo8mhm3JRo75E+pMqDG55oyjrFVxQIAv9MHtsLPxQ2HufyQhWcURh5m3I
         X3b0T7J/OTpr2viDM/blp2yHCPH0h15yrILdzy/uy8gQ/3eqt0O8po1K+7eNsgTCYs6J
         W/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=KNXv212+QtXBekoPd3Ejs6Ge9jZ+hEP1tNzRd+Aoyr6+6osyUqaUwF3HBQ9BOhAr2G
         /sfl/sB6uGOJcdgdBEa3+JQv1yMpeQaCwF3dbAMVA343Ppzu6lRZ7xnslGFYwcYlpyts
         Tp735vOn+E7yCOyFW+Jd1tbvOSemnEbqK7Up+vqFQtUoPYpALef08b/9oLx2SIsPabVS
         C8ns0RmXl5hnaNp9+wsNhxo6Le1EB90ytCARwya6uudm/E6rBWetf8UQTgkqa7gC490T
         klxj5nw6l9YSoOo0BNDbkBnOKYbwA1iQsHwvEktVdlQOwOyOcfuBg7SxGWxHLVsRhZNa
         Iv9A==
X-Gm-Message-State: AOAM53139lVFB72T8ZkyMseKH4WRdfsMVzl61zzx7xpiAn2w4n0wQ5F3
        VDsc2XYFjIOFfgpytJMY4WsstQ==
X-Google-Smtp-Source: ABdhPJw/a90wjnaMucwCovueCCJ3JB6JcriKkZAN6mT9hzibY7QqSNqTEz/subQY2mclbkP0AxdYKA==
X-Received: by 2002:ac2:5933:: with SMTP id v19mr18311541lfi.405.1617662867988;
        Mon, 05 Apr 2021 15:47:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 04/33] clk: qcom: gpucc-sc7180: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:14 +0300
Message-Id: <20210405224743.590029-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sc7180.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 88a739b6fec3..d738251cba17 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -26,12 +26,9 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
-	P_GPU_CC_PLL1_OUT_EVEN,
 	P_GPU_CC_PLL1_OUT_MAIN,
-	P_GPU_CC_PLL1_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2

