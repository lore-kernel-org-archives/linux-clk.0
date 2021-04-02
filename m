Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD73AC43600
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7643611AD
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbhDBU6X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235327AbhDBU6S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:18 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F0FC0617AA
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a1so6730442ljp.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=bePA6RO1OZIY3HlqEldY8LVPU4E1F8ZZzLP1g20N5i6ScvUNQ4TM1sm1tYSG9fvBfu
         +lYX5udgLksql6CmfXExqKJbHeaubPYNVUkkq4GgjjkpRlUlkAhQG0R/MxyZJyHGoAS/
         6cR+5k1ci5pVUCxhjOBWQKlbAxMrbRrUkQeIlKOQwFZz6MqXnQtQjKrzW6bf1vuAj2mL
         2cIiIjJvzAxdDfKjcd+oYFskjukSAjcFjrPY1Tqk+wCC8tnSds0DJDZa0wCupZEu/e8s
         CDzs9WpArm1e9XXlO48bCJVsTPlOBwIiP9MyFg0DGgMeaVumoVKhpgqinMSMyYP3RePG
         YMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=pCLX0j2BRqZaETMudlkWaAunSfg1qIa1XVzAVnuZO5cQ4TcC9KPOvGR6lgSkwU0qEy
         gTMwJDOF2GZqBn/OVvwgN9XgmyvvYu744f2J803CWUvge6/GAv1HNex6Lk8rjg53P+36
         hnBH9r92Gd2nYQtUkPSQdNnxTwmxotELKRMXEHriaPNzbL9OPfLII/kqXgZ2d+0vEkNA
         e9za5bFD79s9o0qYhv+mBK6jxXOW/9qllLOgiYGcjtQlfEKAA57DldV47xNS1ezd/UKO
         kkvHMMFdOxiGB41zlPTy9azpzn0KmiMnJwE5ZMTQFBAY8RdISQ/3ruQ2HB012WnYZkXy
         H6mA==
X-Gm-Message-State: AOAM532rs6FMVvfL2rQGz/vKpA3CQDsgUJ/uIO4YTdJIuecfAvAMIHgF
        RRi/1VSLb3S42JGMLfBxcOXQJg==
X-Google-Smtp-Source: ABdhPJyq2OGLGnGv0e79GjQ9VYL4kbGeVhm8RuNArUgdaLimaSrkaI44wWYookmV76uzAhG7gg+Y3g==
X-Received: by 2002:a2e:80c4:: with SMTP id r4mr9452152ljg.87.1617397092960;
        Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 08/16] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:56 +0300
Message-Id: <20210402205804.96507-9-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 276e5ecd4840..ed57bbb19f88 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -19,11 +19,7 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2

