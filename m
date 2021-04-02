Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5504C43460
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DAE56115C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbhDBU6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235113AbhDBU6S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52304C061793
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:12 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u10so6707573lju.7
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=fR7Mm9cVuPmMP5v1q6Pp/dphkK+g/XQV1yztsGuqWZTq1NXtdadTyvbY9t+iPOpW+w
         s4q8lzJTTxFpkwaq1KO4rBXhNEhW/KXMXqjXlxftUsXmjjRzT9qArdDw3bfXqltNpheU
         r1qMSi17HcF97dkNzt5jQrpgm6w2gBr5sZ9s6aR8xtw0fBMzhev9hCi5XxvsDFJFo9IM
         tFKBphpwjbP3+jYwyem9gHW08Uhfm3nFOKEEGRYRj2tHu39nJRsm8rTKUPBC2oxQqXnr
         8nH482MPV6VfKQm7l0FRsio33LTFpBr+JwYBoGNpbqeemsotD3xzTS55nNna3DayNUAQ
         g8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMkSpD3OcWTd6f37s3IGkgZFUGHa0Z/7pX7Q5b4doiI=;
        b=hwm0RifsbvI40AeTj0xFECmaB+n6p5GG50VRTTB/wf4nP+l4VJbKWNxjq2IA6NM+U3
         Mozo/SAo32i1xioQOmg90tt1rUcPl2PVT8G0zZQ+gT01yHXFDAjJxMK7loH+UkcAIiZv
         9R9dCSOVKvitcGhhvYvgDTiclxLqYudDpFIK4/LDZzM4LR+DZi1d2fJhTs3ehL5/L0qA
         M3fBOBKOLSMYrS3ojbMxhShJoa0gzrdUfzuQGX4u6b3Oqs9AhJ5rCBz49rd7aGnfx99R
         /WJ3odDOac3NyvHTdYcDl0WLLVKHS1fkOq7I+UtX1QSYj4WrRqkLiDCCTScWYM4ctRJ7
         AO7Q==
X-Gm-Message-State: AOAM5317k1ANyoC5J/jfYSxUKL33HM6Gtc3eKMrTf7ag7DpiGHe19W/N
        K8oJ2MDp8ulpTy8xRASOLK3yRQ==
X-Google-Smtp-Source: ABdhPJy4/ZJzj8R9VznoGbAYPGHqfPoFTzNrpcKPbqGx2EXsIbRi2ZiKhDut2J/vuO4ScL6sO6GiEQ==
X-Received: by 2002:a2e:7604:: with SMTP id r4mr9766410ljc.60.1617397090893;
        Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 05/16] clk: qcom: gpucc-sdm845: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:53 +0300
Message-Id: <20210402205804.96507-6-dmitry.baryshkov@linaro.org>
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

