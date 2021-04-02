Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6361DC43460
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 374F461186
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbhDBU6P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235241AbhDBU6M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034AFC061793
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id q29so9064689lfb.4
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=EdE4Uauelokt7xJ8GNSA/FafwJPDUu/E9F0/s6dQMveuzf9EbySyzJ1QZhasSeFGiV
         In1Oe6wWLt5pwak2dplQy/FGxFE7M1GZhX6ZrutCzP0NtM6RTKSjwEtMMyydBbtSy1Sj
         p+MfMAhpzFwdnYP0znf9m2h1zX02CTyNBatAGCKyN6A0mRWBxXD161eahDQzpXmYFVSe
         MSHP3KWvQTwLNXGDr+Bn3bz6Te0RsONWOuzRCKzTuDASqjZ22dUMAauuVAguILFSpjLj
         mfGqNxm2xTqHJC08SiEF3ON94hsGBMHgwXE+u/Fxh041fxyoc/OaChix72FdJFAYl5QT
         afrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=DELsGTH5UbXYP0YBD1IgkJl6R3QdfedIrvj1Q4Z62SOmZn31s8epNyWn59RBP/ZCPR
         OPp37GQLsPr9RVBZpHUCirIO2WSGZlnhF0BtAXjmttTPEx9hUxphkDI80VLhKKRD/SWw
         zCxw++4dEI1CgwHHxxtIoBS9w78J1VlBWTK46Zs38SoDD0/QqhcZwn7slJHsPJPi4gHL
         VcWARCEMtUadEyyjOJE8Moh9iZKwj1h7xdM+2zNEG9AdwjmunmJzxyNbv1+umr2pP57K
         rO6vbYPBRxbfNMRrxozFN8qQ/OxGldFa7dDQQJEJHE+J/Wm/WVQ18Bb6QfY0fOfiWiXr
         68XQ==
X-Gm-Message-State: AOAM532sdfkSyKlc9KnQYcdN21XPDj3QcQPZ+sMybao377wzZ4/md2Sb
        aweGJnA9cCZLDs4px0T9T0z8jQ==
X-Google-Smtp-Source: ABdhPJz9NqFHiFwIosV/uv8W0EuFsxZEE28rJBZatW4rJ+++4xXxZb/zm5HGE0G1t3vwGZCc1GOYpQ==
X-Received: by 2002:a19:8c19:: with SMTP id o25mr10009188lfd.547.1617397089547;
        Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 03/16] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:51 +0300
Message-Id: <20210402205804.96507-4-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index ab594a0f0c40..86626a027f6f 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -25,7 +25,6 @@
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
-- 
2.30.2

