Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFC3C11F69
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 23:00:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4804C613EA
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 23:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbhF3XCb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 19:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbhF3XCb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 19:02:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9189AC0617AD
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 16:00:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d16so8140534lfn.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 16:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lPH2sT2kWyJ067X+i8qH7IKutZ8IRpZkl3/aR7wJJdc=;
        b=emPuOvHntGovS+gGBec8JXp3MFU3Fqi64Tat79stxSN9pfzFwJZqYAYafN42s302Gf
         xiZXXQGLinDFP0+CV0NnGCypjPPOe4tQS2ztvaSxA3LiR0lunHuAmnfaI8VmfyWQVddq
         3ibrZdLam7hT/lY70r8jnF0ZZ3BNCKjWrKhtfEu6kK5m1ZrZ88gAIkEQd7ly5XXMHNnN
         UzF9U/xEBi1QXuoEPkymcsgedTOBRLJLcJZN/A1CpTyYjrsb8M1OF812ozi/T0QvvHS2
         wp5YZaBtBjl+XasmpQGHlG2M7K9BLyeRtBaqTQQgyC2OOvU+MUy9Y/XEvI7cvR5u4HRA
         8Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lPH2sT2kWyJ067X+i8qH7IKutZ8IRpZkl3/aR7wJJdc=;
        b=lMYle+iHVYBrs4yVXRFCbwVExSg3Y9Z0bB4U9ffmAPMt1ImjzNR4jOtYUzjTABOMNQ
         fyq51k+Yvy44i2bFiN+WZgPr8/Nmgc6UBFJhMpqDQxEjGZMaycf+qUSgdGoDQC3DC1vZ
         Qc3NyjYf3Zqso2GB6dAkJDQIzNqjgSlgvS1ZXKCz4Q4vCMUpZZfYR3MSYe5Wf9vZnlQL
         AamjU6jqCU8WapN/Af67cmt3hh1b1qePfnaZTye3sHv9hn5oo2uOFiS7rSlQesnJD2ur
         8X3VnB5I6JkQPnkWDNDE0dQPFFGqQ73Y9uihqCkr0b54ahwr7fscdhwM5oAn2BvXbfL/
         GL2w==
X-Gm-Message-State: AOAM5324I/1MNHWu36LLQayRsGyNr9OeXFIjrOwUt3yNGIZYJ2Oubeav
        2kLEf0Jg+gKer/IOlO/uXZWYbg==
X-Google-Smtp-Source: ABdhPJwrP+ghEFtOvcsuemNx4/DWA2qkmNkP719AjUF73C9tkQDeYBUE6lM9cBkiHoleUeLVtcn0+g==
X-Received: by 2002:a19:f11a:: with SMTP id p26mr888825lfh.113.1625093998965;
        Wed, 30 Jun 2021 15:59:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm2324444ljn.125.2021.06.30.15.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 15:59:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 1/2] clk: qcom: fix error_path in gdsc_register
Date:   Thu,  1 Jul 2021 01:59:51 +0300
Message-Id: <20210630225952.3337630-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
References: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Properly handle and cleanup errors in gdsc_register() instead of just
returning an error and leaving some of resources registered/hanging in
the system.

Fixes: c2c7f0a47493 ("clk: qcom: gdsc: Add support for hierarchical power domains")
Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 51ed640e527b..241186d9d08c 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -429,7 +429,7 @@ int gdsc_register(struct gdsc_desc *desc,
 		scs[i]->rcdev = rcdev;
 		ret = gdsc_init(scs[i]);
 		if (ret)
-			return ret;
+			goto err_init;
 		data->domains[i] = &scs[i]->pd;
 	}
 
@@ -437,11 +437,35 @@ int gdsc_register(struct gdsc_desc *desc,
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
 			continue;
-		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+		if (scs[i]->parent) {
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			if (ret)
+				goto err_subdomain;
+		}
 	}
 
-	return of_genpd_add_provider_onecell(dev->of_node, data);
+	ret = of_genpd_add_provider_onecell(dev->of_node, data);
+	if (!ret)
+		return 0;
+
+err_subdomain:
+	i--;
+	for (; i >= 0; i--) {
+		if (!scs[i] || !scs[i]->parent)
+			continue;
+		pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+	}
+	i = num;
+
+err_init:
+	i--;
+	for (; i >= 0; i--) {
+		if (!scs[i])
+			continue;
+		pm_genpd_remove(&scs[i]->pd);
+	}
+
+	return ret;
 }
 
 void gdsc_unregister(struct gdsc_desc *desc)
-- 
2.30.2

