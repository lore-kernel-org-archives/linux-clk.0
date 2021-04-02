Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24015C43470
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF5CC611AC
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235327AbhDBU6Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbhDBU6U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:20 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9A5C0613A8
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:15 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a1so6730487ljp.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=UIOLlYXeFyxFtjRSPDEczkGhOllaHblgAqT4THkZaXkXL5s9Gm8dMqX7NJ/9fiV9Id
         vXmQ3Q9iwMdi87XWgsWr0/6xTNtdIjKU1gOCtp6xvnHIG80YzJjfsc4Lci91GodQiVA5
         tlSRG8JPLVtkuW/o3lBVrFJUDBPDT0Lf+4QURxBvmIqzL7dztbW0za5bh745ygopmvaP
         X313s/Wkj1s0uUGtqMCqLqH8DbZifxc7t1++/D7DsPV6ZM2wiV7Axaqvo2kOJ4jbHNCc
         tUhTa0KCUukgZUo+s2UVs328zfZnXaPgBBdp/iC2gHj/Y9Z2J9/HwqzIZ6s9E+zgx1zy
         WK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=muIWLGMHuwIJO7GivZ4n9C9gnBmqK0cyZihF8EKNhSjLhF2V0rWMz1b2nyes6hLcdE
         29OCf9Zsr4/LEf4JjaDKxGESTIX+uNvuYd8rRrSYG2Ade609rUYsEE2YcLu7yJBGErG7
         XHxyDm1O3worYlbRF1sXmvo53kGuKaXE9wCn3u4dbZJYl5zCFOxUAum82n14eud9PU/+
         CSszncIPHzj/gHCarX4X2ZQzBmLchvMsCue5Hxlo/35tXGIVnxh5NKCRNS1DssPAMH9r
         5lcIJIXp6YPV2wIRoQpXm/WyCPaGfOzdUh7nkD3pOQT7Qmd2fieuVEpJhyrZAWppv9/6
         /PYg==
X-Gm-Message-State: AOAM532RcoJkVP92UzStqPGG3zJWcvHnfQpavtEdEHKbA+Vxw7wBOjFP
        n4G1uw3fqd0AzgGD8Xpo+0kPcQ==
X-Google-Smtp-Source: ABdhPJx/24DfvVJKchpFN+553z9kdzfdaeZz8uLYhYLdq4Ou7U4b2c9pNdmjSiMR5jH1qcYC7snVsg==
X-Received: by 2002:a2e:5753:: with SMTP id r19mr9171487ljd.126.1617397094319;
        Fri, 02 Apr 2021 13:58:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 10/16] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:58 +0300
Message-Id: <20210402205804.96507-11-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2

