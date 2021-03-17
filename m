Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E6AC4332B
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75A5E64F4F
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhCQMWs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCQMWZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 08:22:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26243C06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 20so2615065lfj.13
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=FWz+gXprZDWwj8E4AwYCfi6w2YoZNLDHLmwIFmcPtRxPTKv9GSYqksHSlBb4QUH7rf
         ZTrxzoEsVHi8VYUFTbtzPojGlqEdg+sAOUDXlMwFyjkBTr6WhDO6AbKehtkoG3h4XYis
         8j3kXrsTMALCX/liNOBFUecCNSQIIlRqPAvTPbHEUVVHug3BUhAze8SplYrgXB4ity8T
         V2bIxtnF7L5tvxvM+4Vm2DgVOkQA1jz6NNRugTyxpgXMpJljiB2B3aehQjAnCMoiOKPE
         WN0thEigRm9q9TtwQLjhJgRyaScS5o9MiHGsV3MirFstgTEZy+Ik9sZ5cEb/ibZfiMOZ
         c2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=lMFfQzTnXWLcpZV0Y6+8EduXQmQQ+fXQya19r77VL80HND6vptxllDCyADKSqD2AE9
         Qsv0lMy1NvkkEma8MXj+Li+kzgG3qDM/+M7gyR4lyCiYvMXAOPcH/v7WeqLNXiOmWg1C
         nqHUqONp+u5I4O6JTsGsIGnfDpfVwz+o/FK0IOXz8XCQ7DC/1wB/oFJWcJXEqhb083sV
         MtpzL/akYt7KveHYS6O15u+R7Meaw/ZxBgJ9jNjpN7J063Al0iGiO3ANjMQmKOHHCTm5
         qOHwU5YvKUyillWUvZl7IZk9H25fJcVG6a2aM/YNRpBBaI7xTBXs9Ihh8HjnyR3wNZrx
         IS1Q==
X-Gm-Message-State: AOAM530GXnEtk0KV9g2IVt/9eHQkb/r95b6+/oAXbwzyVQlVhjdcOFuW
        RvlQ1WHdvmsNoZ79uLw4hIj4tg==
X-Google-Smtp-Source: ABdhPJzQJBhN2GTjZgaBxFNJOnqvHLrkcK2vp6pL7F5CJaIQuwtZLfXiAELGI01bqtQpcn+lFZKnjw==
X-Received: by 2002:a19:5e14:: with SMTP id s20mr2271307lfb.110.1615983743025;
        Wed, 17 Mar 2021 05:22:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/8] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:14 +0300
Message-Id: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

