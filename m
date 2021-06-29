Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9572AC11F69
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 20:39:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71DD561107
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 20:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235365AbhF2Ulv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 16:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234874AbhF2Ulv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 16:41:51 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C83CC061767
        for <linux-clk@vger.kernel.org>; Tue, 29 Jun 2021 13:39:23 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d25so32807429lji.7
        for <linux-clk@vger.kernel.org>; Tue, 29 Jun 2021 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGGdhrQRxRIwpexQ026nf1QwSjPosmBJCMufHDMbnLc=;
        b=ZHes7vTF6ekSlCjtih4vBw3PMWUUnp5NLHqOUsSxFK/fKLA/GQCgT8SRgufgTC/sSn
         pNF9hu/hYIbDZH4Pu+lNgGmp0frywk9rtmmD1UDri+A0W1bOGhLWn6/deAbzOikj3Z76
         zzGfykPrcLYqtdYbk79HJarMA5emMrCH63C6rGYY2uxILrQk0ZqnzkXG5t+Mud+pEnIV
         hyd8t8tMPmbVkq7ej/thFDUM1gTer0YbIssINjQtu2oqRSbDlc1I4eIZpuu72TXGqU82
         BTzGraItHp0s3/FNZb6zjcXAVdfFmnKUYSLeHp/mfo9pB3qLLmx9RvlH92q3jVdj9mc6
         7M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGGdhrQRxRIwpexQ026nf1QwSjPosmBJCMufHDMbnLc=;
        b=XeWpPdyx09TRTZ71v5+YzpqsI74yuEGk/zAsk21vu25wjwHTgZ+HqmlMcdz3kA4W/Y
         mSW7WdXDpedpTREBhzq0S1FJ2QM0lGUVL0SFbroRrAveqAfZKIiIrurZ7joun1filv8g
         xbklfxN89KOnrsLcYSd1JSVQreJxtiHQ45ZQSqBMqGcRnZ2hqV0n1TUDODzYHCrowcaE
         1CcicfAqs4Q+5fAPxCXwT/1y0kePapH3sqngNbHXKh1dOf3xsIluyoYRIEb/RmZX19xx
         2xO41n1jQrJmPS7xAmWgiC7wGbB1q/i/hIZ/3+Oae/lwxUFoon065iH4ZN/ipbidRSML
         bygg==
X-Gm-Message-State: AOAM530xCZjbqDsULxxVyXK6D20/NwgADIod8V2BuOT/wpR4ZZPiZwP/
        2+lWQ+A0MKbBD2j06j55Fp9cpg==
X-Google-Smtp-Source: ABdhPJzROw9SP++u6Y10jdS/n6Cw2Qd6JTOh5rY7Mnsvp6UoXX48ZlDS4FLp1ChapTVgvLJsky8v2A==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr5392588ljk.112.1624999161861;
        Tue, 29 Jun 2021 13:39:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp34sm1716902lfb.125.2021.06.29.13.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 13:39:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: fix domains cleanup in gdsc_unregister
Date:   Tue, 29 Jun 2021 23:39:19 +0300
Message-Id: <20210629203919.2956918-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org>
References: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Properly remove registered genpds. Also remove the provider before
breaking parent/child links, so that the system is consistent at remove
time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 241186d9d08c..4b211dd1764d 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -475,6 +475,9 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	struct gdsc **scs = desc->scs;
 	size_t num = desc->num;
 
+	/* Remove provider first */
+	of_genpd_del_provider(dev->of_node);
+
 	/* Remove subdomains */
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
@@ -482,7 +485,13 @@ void gdsc_unregister(struct gdsc_desc *desc)
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 	}
-	of_genpd_del_provider(dev->of_node);
+
+	/* Remove domains themselves */
+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+		pm_genpd_remove(&scs[i]->pd);
+	}
 }
 
 /*
-- 
2.30.2

