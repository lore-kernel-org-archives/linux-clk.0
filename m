Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C238C43611
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D30B61154
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhDBCVX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbhDBCVW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD08CC061794
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:19 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d13so5659112lfg.7
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=WyOFnevHam6slUq80IQ+E2VUcEZiMzkK/5S4mUL461r3CjkTYQoP7zVY+AC4ygjm5c
         Yn6++nO8/OYkua1EtT/HKNI2xwOvynmBpYSBE2st9EldZG01w8BJEreZ09eFfmyFniwm
         o4ltsL7gtFhFMdFR/wfR89vwpcLdBA9w2d94r/ermjB1frU7YTWQRYMQ8GkfrvgrLtIG
         w/GIXFx6vE3jJ5mDiGbSW4Vmx5/7bbxV+r97ald1h6SsLCXmrKcen2JKp3FO5s0m8jdp
         z1o2IXe2AtcE9bQAv+L37cr0wwMS8k7uHmda+wFbvrjcaiSMMqw3LJ/1yTAzJTgick2G
         kEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=NbhCN1jNQyaLV4qN11aH12/Xt5Rwp3T1josJvhDA81iZlwM/2TqXotabY75dn2fBKt
         LIeLiL581hc0HHPzodRZbi/oRvhk8YVoYyRxDWbaZP2+VTlGu3YFKSBBNr76In7W0m9n
         kRDG6M+bKKlAvgvMOvfNAnAnE322YbaBRO+iN3aXhwXY+0EXTLPx0fRGIM35ksCjhhrA
         dqUulLH9ZZxZlkwgM8pNYiyTBPRa8eQ4D9vwe+K7hrR+iyQtL8y029vYE6hvl/2CRPRA
         Z+7H1kmUUK9usTjU0gZUv82g4X9kF4eA6eT5f+/5IgCBcKVFI9Swp9BZDYKnQJASCY3x
         DOAQ==
X-Gm-Message-State: AOAM5318XyktaPjQpolDNHqHFws2L0cZ5fk7nMXeeK7tMWJquTpJZgNl
        WOk7Rouf/gywtDtY1RrEEf31WQ==
X-Google-Smtp-Source: ABdhPJyJ5pUisbwrto5Yca7KraMYJp6dRVlD1WaRBWGW0wIAJ9TNqdKDAZTksIwIQTDg25XZNAzK+A==
X-Received: by 2002:a05:6512:33c7:: with SMTP id d7mr7048519lfg.601.1617330078322;
        Thu, 01 Apr 2021 19:21:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 10/16] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:21:02 +0300
Message-Id: <20210402022108.4183114-11-dmitry.baryshkov@linaro.org>
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

