Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D71C43462
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A85CB61107
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbhDBCVS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbhDBCVO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:14 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67720C061797
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:14 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u20so4227442lja.13
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=F9JfnSruyG9bfx0EiX92NJ/xb6mtfovTEVnuKHvgUZD4MlSBbLJY93dWUsRElMeFDC
         xdspI2lfzuzkFMTC7YbhKs5nE3AmU1w9OqMgmlblkkkz0sLqbABtMtnCuuAhRn9m+4Pc
         ggs8wNEpfoFCIaun5g2R0Nrw93LnTgQkKtCnpfooqpo3PB4DjOBVwdiqbrjFl2Q4LCaq
         9N8TlPWPHMjPGTBVhmfQfc5FTx5Kj6zuwUXPWvUg9dFmIGRVTu06p/LGsal8S2KoIYf9
         tMVbrl1TXswQkHm6r64wTwcypHhTAVjP2H63K6atX7ypOh70SPTykT5wuvGCdH2lVGbL
         gxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=hIq+px4JDhORFOmp7IHubd6wMfegM50BTc4T1phByy3TGNAlXJsicwUA47J1faHwrV
         fZYeWJriT66ha0LuMf+eo5EgMp4jaQeWYgT6gXbZd3tJJ8r2MSwof6kjGpr5m484cIj7
         Nq7e4XoL5lSdZxEas19w6dx9l9wGHbcAOD3tljd9wIstQr5JGJ9YHATMiqvYfLSsLETL
         cQmYFf1QMjIx50N3Q+OMc7GmooIN/CiD1agaTSVIonOXyR0w1iRtgYUPw6/MLGwq1w+2
         +tpQRq5LFiXWQh9ObMN3VezK9jZQE6SgoCcqypTJH0elfOaaP/Awyvf31zoyXNOTVSK2
         9e9A==
X-Gm-Message-State: AOAM530sqh/1ydVolqvrn69dla6/rfIVIQWTCHx4flHxWxq4qF4TE0P2
        QB1VUuShSZ2U1va7XJK5efsh4g==
X-Google-Smtp-Source: ABdhPJz5wnijXZs+821/KVGqrlpnLdiNb08tnuwyD4dAJbmw5AtUs4ogpdVMOI6kcjF5qG+PPPEKOA==
X-Received: by 2002:a2e:9857:: with SMTP id e23mr7169891ljj.78.1617330072920;
        Thu, 01 Apr 2021 19:21:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 03/16] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:55 +0300
Message-Id: <20210402022108.4183114-4-dmitry.baryshkov@linaro.org>
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

