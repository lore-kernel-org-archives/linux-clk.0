Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77E6C433ED
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E246613E2
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbhDEWr7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242844AbhDEWr5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:47:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B533FC0617AA
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v15so19657880lfq.5
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=wYP1Rg42CeLV8hV3/H3qsHkbdEui8ow21fPTRg1YJqrgCisoVCs6KJrUasHx55b5NI
         I21tZC4h5v3au2qXjHAuK8XVdQuXp2N2fDNdn2e+Wy02bbd0qgXAOQypkQpMJBVLQSw7
         7geu6bp8vESxFRzAQtHiKpkeBXw3JaOgJrxVFucIXSrIhjD386KGsA/YldMORD9oHadR
         U9DFa+p+lD58n701bh13jrgSSdzXWPI2oJD8UV53t0yNUI0AQBEiQ4qB7CEkS0hgW3iu
         XLJ7ZOgp5+nfekUksk6lM1dtdAtqRWeCDio3teL8AbbDNqmKw0su11KmIz3AmkNVruZ+
         hR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=TcCCXO25453IfrK0V5B5EekhhrLQ4Yn4A/+ClAP81Ech2ueOo6nV91s57UAZvqfEwg
         boBNP9UB+b9LY/NNe1xalAP8VXKkMndsnvqoMOE91gWXhp7wyXLZS+fst4D1FnfzZ8cm
         ALuBJT+MBbCn9mw3/g4yh0PJgqPXAQubpG3QQd8l4Yyy/kJYPdkuc8i3uFRxUlNJZwRo
         NLh87tPHE4Kp6VRd93sUGosftY11j+QKwWMuKWaoCm94T/cTVES0awriieMsvKhco9I9
         0tD3Vv/M47oHybj/V0y/KsIjg0qcV1E9/5iTPK8szyNBRrcN4tHU8x0sgDfRf7chqgQA
         Y/GA==
X-Gm-Message-State: AOAM533Ebdwn5mwWPytece4YItFRpOecTRj8MlVvhyRHYprbVwgW+VZA
        hKzcchJlmPofggVxL2DZXboeUg==
X-Google-Smtp-Source: ABdhPJx08woCFqYotvYKIyfZfrbOktho2R292oUhNXmgxFX/3rSl8uheNbCswGGh4hBOFLXuK2GCPw==
X-Received: by 2002:a05:6512:2090:: with SMTP id t16mr19935365lfr.514.1617662869315;
        Mon, 05 Apr 2021 15:47:49 -0700 (PDT)
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
Subject: [PATCH v4 06/33] clk: qcom: gpucc-sm8150: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:16 +0300
Message-Id: <20210405224743.590029-7-dmitry.baryshkov@linaro.org>
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

