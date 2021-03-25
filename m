Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D566CC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA4D561A25
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhCYLLz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCYLLv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CB5C06174A
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b83so1885106lfd.11
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=OKL0kMbz00h0Z011f8bDng4Ulz2k1Q0UylW+myTy7tTUOn3u0xldXMO2FZNm/mr+UX
         4ertnJwbYPoszseq4rH4wNmKVRdaDdrvqGsvtTXbQ3Lz/d0kBnY50Kbe7haJndbbdg/G
         Op+YPsHOwuiuVYjiraIQaqYFlTdzwj3YffVSe6cug/EYbV6bQOWIz9R4ZtsFwN52giam
         D6s8FMwkVv0RHNZ0P0yuGumtEBI1QqbEB8C0zp6qa4pC+dw/AleUlp66TNFhQXEhylkR
         c9bCQRIQw9ouoWlUNnifiptImdOQWTIDbjSqLJ7RXxONZ/FfWtfV5sl6QmRy0K7ZpCOB
         PKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=Nqi67m+RcXmj9KLGshzpr6ND2heqXFsFEiJ96auXHjwQnjyobTfaAWbrfF6p3CTXIh
         +4nyZViR73fe0UQOOp4y0A7Kedi1nJxJgYhjr9k2vNHJIutxffCA0eajGambM4j+GcKQ
         ZgTEwdpndnN0Nuc10b0grMOhfL1+jplSNdAXNpPrKpj975cebKcK8J5vi9DQ6ZQQcMk0
         lZqAlF1/Hlp7AmENedf1UHoXESdjgLMO5xVzwkfnY/IO626TbEf4W4V4b4kbEWPLlCFH
         br+JJEsjIzgQ/Om4FiC6NRd2h5LUU6bu7K6K9GV848vq60APCM3nq0uFzBQO382CZtxM
         1WSw==
X-Gm-Message-State: AOAM531GBoUWa/O1Gf/kp1YfYoxtCtl5OyDU6rkGu9kuDKcVqJUgdpey
        y+qjC91kAIASEWVJpnjKTHw0iw==
X-Google-Smtp-Source: ABdhPJxH4oWb7M/hZSIblGO+zn8CN1vqhRAhGYR8yWRmbxhDB742nXP/jOhXDhE4QrmHlAUmjm/X0A==
X-Received: by 2002:a05:6512:31c8:: with SMTP id j8mr4651883lfe.288.1616670709358;
        Thu, 25 Mar 2021 04:11:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 03/15] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:32 +0300
Message-Id: <20210325111144.2852594-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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

