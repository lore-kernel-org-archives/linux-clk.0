Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABF6C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACB6A60240
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCYLLy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhCYLLt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:49 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41542C06174A
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m12so1890132lfq.10
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=Fd4t2AI82MFZRpjsKagh3w4VdchAgmHAqZRJ+kK8+csQdxC70iXQcBFHlbjdZuENAo
         tbY8RhjWAn5w7ru6vI3qlzC6mAFaVi0sQmBRZAuZyHJJnLkmtw1PeSYeyhq48SzD25cZ
         58V8SvF9QnYCDo3JMcAcNbvX9qI8icOG1FXpvgpWO+HMQRZLVcaaNQWE3qyEyqQErSC9
         wfrPqxG3ebp8sXrC5UJsvTZHDfNnY69zqA2+V4uaVPh0TmC+LZWWK6aAaGrge68j+lMC
         8y0KaXyOXocd5S1tGjkuKE6oB9ibCx/+Kx4jlrgSlrQvYeYKMa9pltxR9ccfV2FDTRb2
         Q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=eNzT5BDGcaLwY5sj9NY3iQtVhFF4X4iV5rokcaMYYMOPGY8kK+ebCsBosGhRYeaRyL
         RVi/XsH9m8w871kYsFUm8eFR8udzk5U3cFFGJEYjAWkLCzsxqqn/U6rO3tNj40qM6QgU
         iTOtvsWiqfCJJRxzH3LNUTGydWGMAtsLcajP/N4hYMGls0szDy9YFL8npIV/s/en3Ggw
         /olpVvki3MC7JZn+MDAt1eigsqF2Cm9RWqmB1WjI0yjhGlcgse5OHPYTm+bfIgOWCxcU
         Xx65g2dlbeqn/ttA25WvkTAySSfNgWMFEQSMoqyPp8yyUHV+tMV0w1Avh8E/SB+F6O5C
         Xl3g==
X-Gm-Message-State: AOAM530Fn3d8qUQ1zU0ibTuR62MzZKbKja4f81VF3TGQja+5xjDXTUtg
        MR19i7a3fytdaLz0uebTgTnH2A==
X-Google-Smtp-Source: ABdhPJwypOEy5D8Bz433omGtjvYW8ORBqV/gDCJhaql+BU/gdzFeM0ULA8sBboa+Z4pekBZL5xJN+Q==
X-Received: by 2002:a19:44:: with SMTP id 65mr4929313lfa.104.1616670707778;
        Thu, 25 Mar 2021 04:11:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 01/15] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:30 +0300
Message-Id: <20210325111144.2852594-2-dmitry.baryshkov@linaro.org>
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

