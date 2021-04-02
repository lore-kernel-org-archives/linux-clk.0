Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489FEC43461
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 205FB611B0
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235241AbhDBU6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235357AbhDBU6T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:19 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A35C0613A5
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o10so9075013lfb.9
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=i4xIYRHXjTwa+eKHyeg0WoG4ZG8DBkTx7ex84k2msQd970qnFy1R+IxgmDz8WYTSIS
         VEh4314kHKrrTUx66eF+I6de7g30K4ABA+aN3WqR8GnTdBmRlUs2sc2TwJ9zxzEqSNZR
         2HNforJJkrYdJuv241L1g22dhw/fdi3ZDALS33MPfl45OMBHu0M6BI2QCoKknMtlTpga
         9Yv4SabyNYIu7d8Z+q94Wz52up9XwcqQHDTHUuq0iQEOh2bNouwpURbMq8AQ952l7aXW
         690nTsUpYR79fbgrWHlDPBFWXM21y79QLR4tXZviOfp7uCHjaD4VH2aAoyRc203aFFL/
         oKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=FaRT9aNW6qBaY9nJSsLvkgOkBSfjoqqVwDtKOCiRjmWUqLMX55Q+F6RABs8J+Up4TY
         Gc8O15ceRoNre2uhM8zqAmu9g70Hfg4MTyXAUJqWGI5H8IxccOF6rpR9EeEI2FynrVsh
         ks3w+mk83521JIE2FB6wwcvWZGRGre5jQ3YB2RPz7qIE1kRmSvqJEcjAaEBichkz2izv
         Vdg4ziWTQXn/wvY1KOQioxbUm30BjcwyNLksEkVDDNm259KoFwz1lkOBnGFeEawuWlhm
         XmU81rylf/z7PAbUesXe1H4RNnMKujhOjaDZGK3bMEASGMzBb2rzB3Wx9TR3kNFA/zSI
         sccQ==
X-Gm-Message-State: AOAM531+URTnoRMs2cG0rO+PbfOo0xxgGWU+jCBWs4OqjHO0gkTL8Cm/
        XvWfh5fbn1QF/x7IS1R157a2ag==
X-Google-Smtp-Source: ABdhPJwNZkQV1gZPGD+53p0ZHp3ghz8cuZnqmEuCdetcIrx0lDZvFElSNed79P5IJ0SNbIVLqoOpJA==
X-Received: by 2002:a05:6512:1044:: with SMTP id c4mr9740861lfb.198.1617397093596;
        Fri, 02 Apr 2021 13:58:13 -0700 (PDT)
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
Subject: [PATCH v3 09/16] clk: qcom: videocc-sm8150: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:57 +0300
Message-Id: <20210402205804.96507-10-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8150.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index 3087e2ec8fd4..85b0bbc2b151 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -20,11 +20,7 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static struct pll_vco trion_vco[] = {
-- 
2.30.2

