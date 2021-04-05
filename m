Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BF8C43616
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27E2A613E2
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237722AbhDEWr7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236097AbhDEWr5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:47:57 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E71DC061788
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:50 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v140so1867821lfa.4
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=NNMB1AsJvbhXX2sZZK5f+e9Zei02x+RZ5Al3PuhsHIleGLw5uqy4trGtpE6ddoNZR5
         jVVeYSwMjeiHayP1qBvEXKb1ceVlLCacGqB5A0+M4Restz4Bg3IGZXZQJN7GkSV7vD7f
         nJW74ogaj30FeBW6Fp0syMepcD9NZodtvdO4cMkabaZX5cPlokit0kYk/1KoDqfTmq7O
         Yeb5seMfH3+Wei8or4bxak0x80Wyeh9UM5Y3EQY10sf0G+Rjni++xxspUjLqfiIDreF1
         YAftgAnsh2v9Ksdh6bBW2SMKO9TwwkulfTFLA5SxdMyHSxFD5U7RQ9Lf8X5QiNx9bt1I
         ZwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=HPltBcwX30RwGilexWAvg04pEVqB52jm33xSCakjIrBQfXcwQFxJzNcBYCSdbA9Y+S
         F8EP2nts54JV2PdTiWfUUwMwadXuFiIHi0ztcD76/n67SGj5/PKSO0yW9jyP7GOTARdA
         JwJ1mWiZX9o+ArnULBkXkuQmlgg9lOsQZtN3I4d3nW1jjixf3K3l+Wt46cZIB+5t0Okk
         vcm0JGoJnO8/lMWJNOB4bZiurVifygGm3QAUJFwAuw8yHJpVdY4oCizcT4GsXmaaOOny
         3APec5/0mpsotGMYfzacZJm7YG4qW4gCwqkFT0DGB+crgvzgiWiopgyHj9TsdpIxtuCg
         ICoA==
X-Gm-Message-State: AOAM530S5s3WXtT6gIgv4NdO0JVkPOhhflY7NzPA35WT/xVs6jNS/3Gv
        GeuLyVTdAAuZfSCgmG7BKhDfQw==
X-Google-Smtp-Source: ABdhPJyFGrljJZuPaDjS6lZx2bWAO1iEV6FR2bIa9jDUtcxlo9VQ4yaeN1HlYSbtwehv3kaB45XRNQ==
X-Received: by 2002:a05:6512:3aa:: with SMTP id v10mr19384898lfp.308.1617662868701;
        Mon, 05 Apr 2021 15:47:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 05/33] clk: qcom: gpucc-sdm845: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:15 +0300
Message-Id: <20210405224743.590029-6-dmitry.baryshkov@linaro.org>
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

