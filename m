Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635B8C43333
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34F6164F6C
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhCQMWs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhCQMW0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 08:22:26 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406BEC06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 15so2950449ljj.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=cSWO7D85nEOKoiFiK71NcT3e6QL5OQUpf6zQ3BI1w6r8nK/wj3xwyv3fm9ngbtDVDB
         iyPSk4QU/6LMtp3fwZqssTLhtnxutG8fuJdypB7Y1sVegWOenj88JjwI/1jQ4S1BwSS2
         TXyUS6V5U4PAf3Jcquc3Bo8liX9VAYQkb1sYP8EV2U9pSkE55prkMvPoYW8HDjKVAzLR
         YoyE1DKB8l3FwZYR92Y/synYJn8zQ4uoN7VhaBS91m0BtxnmArCZhpbMlkF7HDnRDtQI
         90L1/ndYG2WtHnGXeKjnSAxczCIWulrqOrbqc/KgjqpJmtAlSR/M0n5ZE4Isg4O3CNJd
         sUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=HJ28fCWzmAGxO3tQEZwAZs0x4/OPv43bXk2CiiNvlQHjxtGND6CxSLZEiim9pRZbax
         TFOmEFKMpt3fuQJVvItx0NGDH+Sy2UXYD4pMSdKvpWWHI9Na/bH6zKD31TWOzGmtAQH5
         QN62PAECZrhk/PRti8ZCiidVI8ybrgnLCubWHg8w45jHDirTK00fM5I0tzTNL+KTDfP2
         zATmiRO/udk1HD6A0sgazrJefdR3oBoCvi5ICxdMGuJhjf2Qjh6sHjmCfhvdP6nkPpqZ
         NlNtS4WSFDpsLlHTmAfyz9A2vZf+L3yaqIFWTzlxqfnx59VpPcG94WBNw0WFqjZFZ5dI
         EKng==
X-Gm-Message-State: AOAM5322PGYWlEJrRrAw1xUcTHIxerlaKSd8yZAWwKyzdcQ8i8XfUiRu
        zYJVkxvYkAtrZdpUkbbAJi43HA==
X-Google-Smtp-Source: ABdhPJwpqNNd4MDEAIv3ArfUoqrIUA/5IxgUgKTewjqOPs3v6cUem/PJrQqKIksQr2LLXhEPFLjhsw==
X-Received: by 2002:a2e:bc0a:: with SMTP id b10mr2375652ljf.6.1615983744750;
        Wed, 17 Mar 2021 05:22:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 3/8] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:16 +0300
Message-Id: <20210317122221.439105-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
References: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index ab594a0f0c40..86626a027f6f 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -25,7 +25,6 @@
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
-- 
2.30.2

