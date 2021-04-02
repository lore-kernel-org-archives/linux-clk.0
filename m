Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0516CC43470
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE7A6611AD
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbhDBU6U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhDBU6S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2A7C061794
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d13so9096544lfg.7
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=V9QLJFr5fQWMhJH5WuavJKVYfSnmSIwkP1PlQp2A6l5uFoboYj9Av9ZTySsZT0yW27
         iPFDws8p4y6JWSYGG5N4eDpMAabB2iPSAjEgRzBL4iXj0jG6E0dMs6T7PrWX5LAR6B05
         QDZQzfjoFiYfVQMx5jKRl8Rh61OJz6COHx9nLZzv3fcfbsQ7VZV1Na/0SceR64+e+1d/
         Pbm/Zp+N0WkaPY2WyV8B2wvO+IbXOe5czr1noTCzGfw9LfvZVco5C7pBILosGf78LKcB
         xTJNxD49CwaRxfMAfYznXO1WYib80JOIV6JsKoOgAPxJffICM1nAuwRfqnJVy9Yl1dNY
         bGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=EO8xiLkGjgskP1ZWz/g3X/g2OhQHYs1Kq+pq5gmz3XZbWJT8su5wWcLehxH+YDkwfq
         uayYnMXE/ZIt4xXbhPjLG8fufhm6E4pQtyJz0mO1coctujWWlPPCRr4ISrwOqn76MaJ2
         zO/71N2VCFnMoMvhWvHTxKNU/E8YWtVmezodTLKwuQjo7Kt5JQty6KFCeBVSnRrV8cJU
         xOQrxcW5gu00SePqe20kpZWC8A6FUCCcpvYkJj4awMEnLQajvaYZfPll/TDNyqUVqip3
         2HdDDNFCwMDrtnOhXxRnqotCNHheVDwDoC877omweo+JTQINFCVzYXh6ZWKExcjmzShr
         4QEg==
X-Gm-Message-State: AOAM533Se6R28ONdtNDgECyJfsa1uQexBDD7nrQSnE6xTGI0MRhtDrRZ
        9Q3aI1BwWer5uvwJPVNod29Y/g==
X-Google-Smtp-Source: ABdhPJzmSf69w37D4Qe0K4na2g0j82BWteJ8vTN+fKPXbyu/9R8LuDp3eGNhHaoY3jSxderDFCYs5A==
X-Received: by 2002:a19:548:: with SMTP id 69mr9818855lff.465.1617397091570;
        Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 06/16] clk: qcom: gpucc-sm8150: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:54 +0300
Message-Id: <20210402205804.96507-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
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

