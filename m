Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4102C4361A
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E29764F72
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhCQMWu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 08:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhCQMW2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 08:22:28 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F6BC06174A
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:27 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u4so2868969ljo.6
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=w2Hs5aq6/HvAPcpbfrqsRDWUL8f/HaGjF8xaUxdLDvPZcvE/ZoIiXeKOUzH3jPZHCM
         QJNUh4yvJgJf6AO8i9C8Mu4ElsSQURLLz1GHil8b/WGuL85j2yoYg8F/lr5WfyeIV64w
         d1kkHpKAvtGuaQwJzirFdfpxzOmuCQ22TerhjZkmxLoqy3Vl5KDzmT68UZtCluMWcDAF
         cUKFmOF98qpkhMc3llsLJ6Y/A8lAqS05a37w7p4oiFH14S29zVXCZpHKQ9z2hR60C4Iu
         m2OVUuesgVIurMp19Z02LLxhjnC0oCdk0YU+wCzLZ5pdr/7CzQcq5GeJ2IEwoCawMX0e
         NLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=sz/sIz/Y7u1felYwHAWKgszaFOt2TSDutE5j3tixDdLBsl9HSybTohnnVxHRHHCLL1
         Nkagxd6lUvFxNa9JW6XqWHw9B2cOSW9HeGdWngAJ6bh4dFIFFUs1RiZx57o6oeVo3HT6
         arZEBt/oh8AKM4k3fkVoXk0d5DsHtRaVO+xrqQwSYkuFpCNWmihTjf5aeN/BpkYoNUAB
         KrkDtm3RDQM3w2vf6Cx1kuYMKTjsbSOT8d9AwBhNcOBTq0xdIP4OOfB+OyK5TYSQmk8M
         KXyoTDblQ561RuX/2kM9D+CrPqj4eUolptIdCRFbQgaOsMybm3bOc8Vm/0+d+5q4W3NI
         kBtQ==
X-Gm-Message-State: AOAM530TfHeLR9RJnPuJX17jKLEP6wn4tFmDycJvC/DtdW6HpAMhIW5l
        KE5RBNotran1y0Sb/B4rU4ZFDw==
X-Google-Smtp-Source: ABdhPJxR/RBogg+piwOAVSpqiN6MYjaz8HGYCtMeREezCYfJlfT58FFuG6Lrbc3k7CUcZbTWBKxCAA==
X-Received: by 2002:a2e:3a17:: with SMTP id h23mr2324461lja.158.1615983746143;
        Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 5/8] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:18 +0300
Message-Id: <20210317122221.439105-5-dmitry.baryshkov@linaro.org>
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

