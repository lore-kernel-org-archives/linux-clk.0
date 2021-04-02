Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEA9C43600
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 600D061152
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbhDBCVW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234240AbhDBCVU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:20 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C31C0617A9
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:18 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id n138so5666889lfa.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=usAekJAwSkmBZDHWsOi1sqnqHBdsp1rJX6Xkno0GWC7pi8dpXdz+mr/IOfa8h7FYiG
         P/INQSrQRXZQSCfQv8j7u/K9ybFUoqS0hyJaDmtQBfz68WejWU+ef2sSrON6OLmEQRb5
         EuCzJmepn8Aezw732MGjOnu9pfvxWjF+pYtm2SavCLz/t+UsFZxHKvBvTs5GWyHp2wHU
         Lq/y3+Yhv31YloBGzfd09mCRwg4gQKSUJYYeCOKU2TOuHJUUMRuZXpzhBR7qXdbhus3N
         QS9AbcZdKKEeTXPaN62JIkxr4wD/ikfdpaIa4Ikky7+q6ve4dbKVU9GDgxpe11CBYNTc
         8XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=UBs3kmp9q3ED6CoxShQQ0ETBbWNY2CSbyxXcqKEMSpjv7XGC6+hVvY+ozZK02hUuMS
         tmQgylj3QSF2Ld7GcswrmujHSrzKqUhy+M2tbYakIJaiwnObihS8FD4jtsNC11ld0lJM
         xBhIoDRgNmunk+RxnczCGckMe/TRHoxjf3x0XjeswJcj3G4NSJAVv4C4Sl0+APiEfi1D
         J8FyJ02rMrDkJt9cWorYNHGvP9oo/qi/bBbllOr3rs44A9R/SXeCf3HjCC9t+EdviYih
         k2v0hI00l3jzxPoMARcPD22PdPcpGNlu+YXQoSuRNyce4duMpt9WF6hVpO+c7KP87eK9
         /14A==
X-Gm-Message-State: AOAM533cCHbbMQ+ABoW1Xc3Ll+qn4jNa3iaPVWwelced75ihLm6QXpv2
        DuCEMET9OVqjmcbqj8veXp08Yw==
X-Google-Smtp-Source: ABdhPJyTMmoEn34HKQB9KVHGOQRoNE4A4gHRObee+l/8g/JO0vNoF80/c177hW459nJQDvJiQVk7/g==
X-Received: by 2002:a05:6512:3c9a:: with SMTP id h26mr7249716lfv.112.1617330076852;
        Thu, 01 Apr 2021 19:21:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 08/16] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:21:00 +0300
Message-Id: <20210402022108.4183114-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
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

