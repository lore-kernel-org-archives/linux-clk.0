Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A725C11F6A
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 20:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E89A66108B
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 20:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235414AbhF2Ulw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 16:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbhF2Ulv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 16:41:51 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6665C061766
        for <linux-clk@vger.kernel.org>; Tue, 29 Jun 2021 13:39:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u25so17190965ljj.11
        for <linux-clk@vger.kernel.org>; Tue, 29 Jun 2021 13:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0DsRwiemWRcUIuwueb9Y8X2gyBHPUAig9IO+tLNZso=;
        b=DtQ968WYHX1WBnYz8tnoM7YDFgGL1mPoNpZYeuTd/coFfF3UD6xShQ2+4GR5W8m3ci
         XKjN3E0SxbtkK0ra/p03svxawz81nGTNFt5MLG0HjQjhsQlRjWrJ1DwLk2uTKQ0dBF/Z
         KqAZKBuWNfKBMUApUwtMZzla6xmeaJNNs/zobnrrhLWPq89ZWtTmf9Wctc9iBmxtNelI
         dOxj+RKU9XtYYC5hWixwF43MOQRn7qeDXyQ22Crk/8lq0LGEPrIqQJR9y2AlO4OyRYVj
         e4JYuxrDbVN8Jd94NbHPzfvYXHQFZnnh5vF1jCqsvzrt2W+cx5Ogby9+fHNejo1ZGJvg
         DoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0DsRwiemWRcUIuwueb9Y8X2gyBHPUAig9IO+tLNZso=;
        b=qDG48MGb5kZN36XuKieQVMP5Kc1VGt5w+Z1JkQX0l/W48GXRDOYbXsc9Z44/UqDW9a
         vqsiSKbuTxh3mSDKFkMc8dCicBYEPkimv5B/wo4AHEKvXLJtaNw3cLOYKwQXUqoJFd2s
         ywvHhbsnmX1jeDJSPhhmToZcQ/8deUDKFSci5JVdKePuXBFtDxn6UnIjHbtwWS2C2Nx8
         9mKvggip+CLBs4aj/01isoMqOcgTSi8TCPccrCWy6usPidBAKERG/OPupV7+4jiWKD4G
         ytp4Li+VJIp6e5X/mo5v5+J7RnmZPo75wj7ytf/Vj5YISvJOb7Snqq/7AyzxXCNgIcSL
         7w3w==
X-Gm-Message-State: AOAM530o0MnH5VUiEFWmiP6tKILc2YK5U/Z5O+6fc1CqRX0dSZ/vPcz0
        Hv3NGlWNziEUBmv6xwtirNJ8/Q==
X-Google-Smtp-Source: ABdhPJwMltQWIOc8puXrbBwyzGioF+Q0aXsF3Ul6Zxxt4IjH5Ynko0ec5cXz2G4lhXGsCJBjbgEKyQ==
X-Received: by 2002:a2e:a786:: with SMTP id c6mr5298466ljf.96.1624999161108;
        Tue, 29 Jun 2021 13:39:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp34sm1716902lfb.125.2021.06.29.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 13:39:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: fix error_path in gdsc_register
Date:   Tue, 29 Jun 2021 23:39:18 +0300
Message-Id: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Properly handle and cleanup errors in gdsc_register() instead of just
returning an error and leaving some of resources registered/hanging in
the system.

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

