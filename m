Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33D1C43461
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 05:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D50D76139A
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 05:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhEDF36 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 01:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhEDF36 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 01:29:58 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A24C061763
        for <linux-clk@vger.kernel.org>; Mon,  3 May 2021 22:29:03 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id p12so5716490pgj.10
        for <linux-clk@vger.kernel.org>; Mon, 03 May 2021 22:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gIUTD/xcjRZwD9lqPa/K9njfq+3aHSwHrSeb5ACE0xU=;
        b=QIVCAcQd/JmeV2I5FJybb+PlBKZFa6WoZXs9qKR9SoOX0cOuvd70hAfpHS6zJnaQw+
         mpW9xcgkSFs4bvFVpT7ahwP+JULNBJNcPnsQIzYEjv+wz5Pd5I3lXunFyCrdxECtJ7Qh
         4IzsL/AIUfpW5xwzPyymI8DaRI9m2Fq1j3V+FhsB+WSjt7//BH+EdX5pRvgJVuDd5FEP
         tuGjtf0D62t1jmE6wtzJZiq6FnlZbEqBQGUXwBH2MUWAD1aJe52hFs4q9+ccEo003AV3
         mz5Gc/NfqSeb1ywBlFtHLpAOP//ILN3O0imX/qUtGIrve/RXMjrHpyEyuwbeK9qHB4pY
         tR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gIUTD/xcjRZwD9lqPa/K9njfq+3aHSwHrSeb5ACE0xU=;
        b=hl8qCtOQDV0afz+cJovPED1zr+MF8ac8M7agUX9B5S4JON8fyABybFwMtVpkqKpVbe
         rQjmfROsafCygTNPy7O8Zz3Ex3pBmp6zv5DktakH4wPnD01D0bzmegKxi3xolyc+fiz5
         nV+XIoPpKMNYgBkZ42FzrMWx/1OJc0+BuA/0x62Zs3cTYK7q651XTBfJTpNKsqUOgAhK
         IVyRccPtNfOnrekGG8lWug4O0shncJNvsxeYTPwpJMgOoSf/pr0BOz5Hop4pn/QNHkVw
         uWbY1ptS33bpigy5mMDnVJmhTubZ94LdtkpRmmcBVYER4j7L30nSCc5TV4Mwe7KXbIqW
         iYCQ==
X-Gm-Message-State: AOAM530OUKe8vfQXTWYsqw0TMZUtzRcBY1YCVt53KypIzzM49ne/K+sw
        kiJdGrBcQaiDDtK/s0f3KhDP4w==
X-Google-Smtp-Source: ABdhPJzZvHBUBCfAVvV9pWsMlraYAleSxgnTSS6GWTWe14yvWwccpwZ9dW0mGzGVRRFCKg/euHdO3g==
X-Received: by 2002:a65:5083:: with SMTP id r3mr21706072pgp.231.1620106142718;
        Mon, 03 May 2021 22:29:02 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:29:02 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/5] clk: qcom: apcs-msm8916: Retrieve clock name from DT
Date:   Tue,  4 May 2021 13:28:42 +0800
Message-Id: <20210504052844.21096-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike MSM8916 which has only one APCS clock, MSM8939 gets three for
Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache Coherent
Interconnect).  Instead of hard coding APCS (and A53PLL) clock name,
retrieve the name from DT, so that multiple APCS clocks can be
registered.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c      | 5 ++++-
 drivers/clk/qcom/apcs-msm8916.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 8614b0b0e82c..964f5ab7d02f 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -42,6 +42,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	struct clk_pll *pll;
 	void __iomem *base;
 	struct clk_init_data init = { };
+	const char *clk_name = NULL;
 	int ret;
 
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
@@ -66,7 +67,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	pll->status_bit = 16;
 	pll->freq_tbl = a53pll_freq;
 
-	init.name = "a53pll";
+	of_property_read_string(pdev->dev.of_node, "clock-output-names",
+				&clk_name);
+	init.name = clk_name ? clk_name : "a53pll";
 	init.parent_names = (const char *[]){ "xo" };
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index d7ac6d6b15b6..b8bbfe9622e1 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -49,6 +49,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct clk_regmap_mux_div *a53cc;
 	struct regmap *regmap;
 	struct clk_init_data init = { };
+	const char *clk_name = NULL;
 	int ret = -ENODEV;
 
 	regmap = dev_get_regmap(parent, NULL);
@@ -61,7 +62,9 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	if (!a53cc)
 		return -ENOMEM;
 
-	init.name = "a53mux";
+	of_property_read_string(parent->of_node, "clock-output-names",
+				&clk_name);
+	init.name = clk_name ? clk_name : "a53mux";
 	init.parent_data = pdata;
 	init.num_parents = ARRAY_SIZE(pdata);
 	init.ops = &clk_regmap_mux_div_ops;
-- 
2.17.1

