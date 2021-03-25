Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FA9C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A837761A32
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhCYLM0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhCYLLx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:53 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C69C06175F
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o126so1975087lfa.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=hs9teXZEtIGL+cI04QxqH76lI2tolC5L6VTmabcYqdW7E2G/L/y4RDAQ5jD6G9ntNt
         5gq0KFRCPkkgR9QDkSVkAhj4r7Bb7UqPvwj0b7oNgMiiGnWe/QulA/wMDgVOK7G6avNV
         QtN9/MkjGxdCwQGtJeS6yzfnL87tkY0dHCjdeoSqfLE5JA5h/of+MSJkLMYH6kQt1Ia1
         U3brCX3xAJ2fcCr1dVCf9LKpC9RtVsmHmgLMz8TGtRHkYdC+zJREGbEoNnXkRNlJEiGK
         E0/EY4sX2G+Syfsl8wqo5Ykv2GYxNDlm7IZDfRyHCjsoPDAA/SZL7F6edg2XzksRyuQj
         g4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=KQ1y6Prntuk9JHgAbzrV/HWivay5OznkolcYUFaKcm8gGEzqCUGwqSKuC9GRP3jFNq
         l5unD0f6wbB/3s7lULN5Q51XxZMR+03QXl480KPc2tEpxDQPGNLMbUEdjk/muxbkA97m
         tu7nLe1VIvvOXV+wTXmaS890MQ1vMU6CndvLtWNEL3WOVWir/VRV4FxD4Yx6Ys0xXVly
         g83VUZ1HUyB5ej0eYLcoKPXE2wil6ulZxx1bKR5waM+i11zAyVzFmkj2IfPCZbakHumw
         fqWYUZl5eOXXCgC95cG9m6mG14rPkF4UGiC8rXYow1i9a7xFUYg8w8YS8F/xdzTdcxsL
         7bXA==
X-Gm-Message-State: AOAM531ldxxX35Yv3ID2wDY705NKorBvENfgpbMw0aLDtLmCzpa7RZzJ
        ltDNP9Q/j3oaaOyIoDbJYNDH7Q==
X-Google-Smtp-Source: ABdhPJwxhvqE9iL/EsXxGt/q5BG1lzgY0Ujxe2wgUDB1FVOsIXTzteMOvr2RAlZjL38p1aId3Vyx+A==
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr4718751lfo.303.1616670710844;
        Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 05/15] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:34 +0300
Message-Id: <20210325111144.2852594-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 3fa7d1f9ff98..67c136a77efb 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -26,7 +26,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL0_OUT_MAIN,
-- 
2.30.2

