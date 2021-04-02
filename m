Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456BEC433ED
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 127F66113C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbhDBCVT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbhDBCVS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80FFC06178C
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:15 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u10so4263292lju.7
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=b+VY2SLLr0PP3nXsCej5I0IGxlG4PB5OACJo1m9RJiN33yIyRPSuMm+K3L9nKiO04W
         ynWc1Tc9ft1dCH6oC37KIZ17y35aXrx549JPBr1IyeCkYKYx+8M0puKcC5biFxZ9q2Vy
         sp+RV2KBxOfQ4Ly2LoFWkjb6dc3i6lUs3cSr9u+QxaTAIirBlLo23KrEtAtKVlfw0Jbg
         Nqc3SNNLURmp8vPlh/c4RuAKVeA6R3xSIKMZBy6vIsQDpg55Vx3nUBa8Gh11qYq2ekQR
         Mm48JfehFSozGzppeuWYneKKM+pSTaH0cnu+oTSiaDgWCcgEXDwJZV6i7DESB27eurVD
         Miyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=ZjI3HTbVoFUgDusZ51VqD3t6Cvhm+ecPU2ZV30L4Yppw9pnHI1POUKqK2olp8wlt+J
         6tnmYq7KYPpE+jAFJWC1CDPR9hPsltN5uM5aUKpdxKnJooIkknXcAiFrhwdYtDV1ykGv
         A3rpgqaujyF8/Qbz4zbIXj8OKzhjaMkYToTzoCs3VzsBhthzFxJtvCOff3BFSuxOYh0N
         mThm3o/HKejFnLlXtGP+Bwm8JKzhrgfv800m6H22Ry+GboO+5BQO3w5+96Gdua/S0Ris
         JEm4uCaiXwkXq1x5SQNpljysMtpJAxibzkHV5GY1V+mcVkKtjTi3oEeH6tahzVfIoJPw
         aWOQ==
X-Gm-Message-State: AOAM5337ua3U+Z66ShQYqSOZBykKiVT1NEDP0vFIrTnojiCg838gVevi
        vic5iiPk+3gS+D0IbAljwCbNQw==
X-Google-Smtp-Source: ABdhPJy5I9ukgRwKB2vTC9R0++cYcZsgz0RcBNObcHotPeAvzLvYEVZBaQE7oshsxCUBgfxFuvIhIA==
X-Received: by 2002:a2e:9252:: with SMTP id v18mr6760780ljg.260.1617330074325;
        Thu, 01 Apr 2021 19:21:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 05/16] clk: qcom: gpucc-sdm845: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:57 +0300
Message-Id: <20210402022108.4183114-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm845.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 5663698b306b..2d7dc89915e8 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -30,9 +30,7 @@ enum {
 	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
-	P_GPU_CC_PLL1_OUT_EVEN,
 	P_GPU_CC_PLL1_OUT_MAIN,
-	P_GPU_CC_PLL1_OUT_ODD,
 };
 
 static const struct parent_map gpu_cc_parent_map_0[] = {
-- 
2.30.2

