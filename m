Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DAAC4332D
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D40EC64F6A
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCQMWu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 08:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCQMW1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 08:22:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E180BC06174A
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p21so2617288lfu.11
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=QV17L0CuSv21h41ZZLYFFvZ/Aq7kNY4uDNv/3Ree2xgxa21qwFlO7Yp4vpyZXNJNnA
         dY/w2XejUvIEa3ouw+foRC06MSggS60cNHCrOMr9DmlCUCtIbZfAiGVBPLLqstZqdmRm
         H9vaEQGNItfXdu/RKu2aA4kQkIuLbXayo1DT7n6J1hS+Z/T5lUNsARKLpy7sGYuEoy0J
         q0WtiPqqnRVTXuoou7bWKvLxZjsZSgVI+MtxjYS1Q7qdxE8Zo9ov+EIKFCEyJCmvZpig
         FLANnOvX2uRs1dE5n8+xkqLzuUXn3SqEtPLEaCZKtWkVWOAIFjOVUR3YHtXbvdsuUU/u
         A9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=Q5WDeOu4O71x4VlkzbpBUOSdDzm2K9pT6uLrPKUhXw5tB0zHMA4BgOfpFCuFFMyJSG
         9fc6JIUsw8DxfMXOn9whKqqfjceN55A6rz6hS9p0nzPfkeOEwKEabH3NSwkdg54++FaH
         X5wGugF6h1cSsexP/NKl2AH3JnGN8akM9paBMayn2G/l/nI9y7e+MHR2O7lwivI/tnGA
         aGPGrNSqeFJ50SkdGqKwYMBz/6mUXNaBVEogcbIKYJOvkkFD2w/hOk13KZjHfwvI6QhA
         WO87xj7oCRUd6t4hrtO82M1Ds9fqRanpK69f8eSV03jWgy1qP3qW5nw+KawHROHfjrVg
         CBjg==
X-Gm-Message-State: AOAM532t7rMWxC3ppl7ZO+JoFAtiOGQ+L2ih8lvEAi9j9MKC26vs4gJ0
        tMirWYof59/L5KLIle+ZPDmAFQhoD9xQnA==
X-Google-Smtp-Source: ABdhPJzKbB9rDc35vLLblDQuP7CIB7xkCBWbJE1yXJq5oss2rMCxMO9l7oIExX/br1l8thHbx0Z1Dg==
X-Received: by 2002:ac2:43db:: with SMTP id u27mr2323868lfl.115.1615983745461;
        Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 4/8] clk: qcom: gpucc-sm8150: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:17 +0300
Message-Id: <20210317122221.439105-4-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sm8150.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 27c40754b2c7..2b952f561537 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -21,7 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL1_OUT_MAIN,
-- 
2.30.2

