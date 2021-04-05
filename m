Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17528C43460
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E034D613E9
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241419AbhDEWr5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236104AbhDEWrz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:47:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE1FC061788
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g8so19612861lfv.12
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=pzZ7NVt3k18g/Da7oS0ipH4304krChCEwHQmuT9exB4EHdEFprI9RoISbuPdKX6WUo
         GEwSBpkTMkgoRvAct69XWjjjxi7LE7Bnda4eS20ejm6ZPnfzel7rM1zuAo/u2mAi1vtD
         1ur1iKb5Vf0rDQDDQ4oWeHKHpghwJHq9jFdqb4JYCCMHqdYRNx9XExmwBgxQBqafW+Qw
         0ey4O8Ar1kUS2QBOlshg6KrM86Uz6uTKVRG8RiEfUy2dWgC449vtwvFPxSMbSt6X3llm
         l+nKSQ4USE/zhTOC3qGOMC7BIYkmpyrGzWMOmRrrrNdcyr/PfMgHzhB01FlkhsNQRsuy
         6KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=MNRMwqJJmVJ8JNirpisrd0/VjMR9x8H9HAGmW4VnZ3COGxwiXglWFdxU3bOHqIb4ZK
         TJzpZsZ5EjAo2l0t6K5XdjHMeoKRuzl7lfg9KHNm7jzOtZtTkTPpQCOyKhCAFQZzkV5o
         nk2kA0XJnMFSehjizTpWsFtKiA2DbemKO+q5wBWnLRIXMaD9j8x9Lusy/V6i0PsfS7fQ
         3hRj8leJ2X/ANoFogryRW2B9MU/TeL3m7TD9Sn1vWXdzUmd8WX1OqvjaaOXapnizvMmY
         7Nk/Tn4dFB2i/VfR2k2SPQbFnHmgcuIJi5AqZpjjtveloCVlsD51N9zGs0PBdJAht2zP
         lAvQ==
X-Gm-Message-State: AOAM531BUbxo+8l692pPPjv6AWwU8uhpND8rEFaRqlMw4juQx4LGvWzy
        Kssir0RTzqqA3y8Wa6aV7fy0Hg==
X-Google-Smtp-Source: ABdhPJz1h/wmFMbL0fDrCefgx6exKVJ8Q7AMiJNyXfJNo9yURer6QJORT0BBku5I3voZY78mTXtHFQ==
X-Received: by 2002:ac2:4298:: with SMTP id m24mr19819208lfh.429.1617662866008;
        Mon, 05 Apr 2021 15:47:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 01/33] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:11 +0300
Message-Id: <20210405224743.590029-2-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index f487515701e3..3334bf9cfb94 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -19,8 +19,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_EVEN,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
-- 
2.30.2

