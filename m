Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD93C28E85
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3870864F91
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 12:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhCQMWv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhCQMWj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 08:22:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49391C06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id n16so2660255lfb.4
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=qCQE8+3hnAgJsBiRiBaIsizH+y5898e98B/mTgWIVcOypjP9KlCFHbeh5p2TWVKSK8
         HJjA9j0xFM473Be7wwSV8H4+fHSUlSlFoLfKzxvbtRimolVVulNse8Yn+FQtLIN4422U
         HnDOoLx42BgeKpnYHGv9/RSdgQWgEwaaCcljBfc3siVqeZsHlRdXNNjVbvDdUcsIFdDy
         4bUDRZKvDML5OZR9EFLW8q5u5lABEG5MQRoKKjFYfGZm5Pk7hpFouxlGPND9S7Gq0fOJ
         F6Udd9qvoEeaCH02jhupccG9UD83BR83ANM1wcMhB0GlrPFtKLiWrhpncr1E4BfH4fCG
         zN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=Mo0DtDDIyD5y+dguUHkyHtC+uiVa9uuQQSI8rw0Nhf9VvKOrUToBopXiG0rqwRRETx
         MF3CybJ5cXNK/0L+QOk4R8x7faRR6gmxeCGsBgrJweH00acl9/sDsx3eIDwRDQitRAlY
         KS7R1CmTEPengt2UfdLesNKJiDdZtMfLU4yXCSQRrg2bum62bUx07ggtvXm1C3RSaSmN
         L6yod56SagH92ytE+O/8gxxlcdPKkc6dLtoO/qnh0bxcO+VlPy0iHeg8PSloVi/qBnAC
         AD/GGHXYCWW1ZleRiRYHi+vKA/dkqlM7nnzcAKztKMIhbzyN8hjaxDZcIklj01DPfOHF
         6pFA==
X-Gm-Message-State: AOAM533Lyox57Fxkov9Md4DJHOCiBn5MeZoML25RDXYo59wAXCeNmWcv
        ooLEwkCIeHoo9PfPKHLUn9qorQ==
X-Google-Smtp-Source: ABdhPJyzGqwxAkD33MjaTXFFhZYgzUkDbED19+BhftJhj4CsP4XLlWvUQvniJUkjGep3Bw+YHxkxdA==
X-Received: by 2002:a19:5008:: with SMTP id e8mr2148974lfb.571.1615983746829;
        Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 6/8] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:19 +0300
Message-Id: <20210317122221.439105-6-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sc7180.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 276e5ecd4840..f5d04791a3cd 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -19,8 +19,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL0_OUT_ODD,
-- 
2.30.2

