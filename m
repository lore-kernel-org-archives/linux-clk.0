Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2434DC07E9B
	for <linux-clk@archiver.kernel.org>; Sun,  4 Jul 2021 02:40:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8FF861936
	for <linux-clk@archiver.kernel.org>; Sun,  4 Jul 2021 02:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhGDCnZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Jul 2021 22:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhGDCnY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Jul 2021 22:43:24 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0146DC061764
        for <linux-clk@vger.kernel.org>; Sat,  3 Jul 2021 19:40:50 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id a2so14585020pgi.6
        for <linux-clk@vger.kernel.org>; Sat, 03 Jul 2021 19:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SJ6mWKBojJfVdE79tK2x9bM0KQ+BiVthSv3BXWqHjkA=;
        b=aCFrfva8wFoCWLRwo8eKYLEdNKeqnJuogWU0ePmKz+CrEJIoYiNVa1G1lfCAj2bH6r
         fDWc2EWpHYaAbvjaRBdcjXDdlJ0Zy8vW12pP86Mtyj58l8GuNZxzj4lrCTTMug3ml7XB
         26h9lYHdQMuqyqrz4uX5Xxs6YTLRgGgH3c4QXuwePFVS4gGTib7w3ngck8BfOHaC39if
         mrAWQVjW3LUAFa8cFStyfKYBZhwwD35muKPPZuoQKonbjai3pEm/w52tYGya0lKNxdmw
         22ORKfmPqqiLsGvUnIyWayhLvYN0lxviZxTMQO3+J1w6j/aQn3+lAfzOxx9DoqqA6ZAy
         tyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SJ6mWKBojJfVdE79tK2x9bM0KQ+BiVthSv3BXWqHjkA=;
        b=a7E1A3OcgxnsS7X5ces//iMj1V/N53nRazxtxBNB+2py0QYMS9EeR4oECKgt/4PsTy
         qTgXFVdZFqSDZHqxLxduDjX+yb9IpehRH0xJW4lEXU19VPx8cDUm+g5D6kSVfk2qJ8dC
         XWqrsYwpdVor9F0T3CmY804hZakd1hkUfkeENqAzkp9MjPiWqvyiZWMmSoqr97It5WlA
         xIyxPaKwb9cSxy+Of+vO4DmGW4pqh62hdHkjyaiJbXEGzZlgc83T2Ib5HkrC5LvSfcKN
         +VL9q9cyIhdLiqGqTpyHbuOUwABUJc7ad8Bc8Z9fOiE81e30KUxI0GvKMhR3BafZpzm9
         44sA==
X-Gm-Message-State: AOAM531i+SL59y31AN0IZbnGuV2gNYvG5FlQv6oP/p1xDz58NVVzts2r
        gG/KcQYnCrLcZiU8VgfmhSCVQQ==
X-Google-Smtp-Source: ABdhPJwVZjknSowvP1KPgjYS6i71VgkhYhJCfSnpQN6uLbbERr6blxgt9xjDrYhh+GgXgBRj29RYvw==
X-Received: by 2002:a05:6a00:1508:b029:30a:2b2:b2ea with SMTP id q8-20020a056a001508b029030a02b2b2eamr7762189pfu.30.1625366449541;
        Sat, 03 Jul 2021 19:40:49 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g17sm9394624pgh.61.2021.07.03.19.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 19:40:49 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/4] clk: qcom: a53pll/mux: Use unique clock name
Date:   Sun,  4 Jul 2021 10:40:30 +0800
Message-Id: <20210704024032.11559-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210704024032.11559-1-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Different from MSM8916 which has only one a53pll/mux clock, MSM8939 gets
three for Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache
Coherent Interconnect).  That said, a53pll/mux clock needs to be named
uniquely.  Append @unit-address of device node to the clock name, so
that a53pll/mux will be named like below on MSM8939.

  a53pll@b016000
  a53pll@b116000
  a53pll@b1d0000

  a53mux@b1d1000
  a53mux@b011000
  a53mux@b111000

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c      | 8 +++++++-
 drivers/clk/qcom/apcs-msm8916.c | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index d6756bd777ce..96a118be912d 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -37,6 +37,7 @@ static const struct regmap_config a53pll_regmap_config = {
 static int qcom_a53pll_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct regmap *regmap;
 	struct resource *res;
 	struct clk_pll *pll;
@@ -66,7 +67,12 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	pll->status_bit = 16;
 	pll->freq_tbl = a53pll_freq;
 
-	init.name = "a53pll";
+	/* Use an unique name by appending @unit-address */
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "a53pll%s",
+				   strchrnul(np->full_name, '@'));
+	if (!init.name)
+		return -ENOMEM;
+
 	init.parent_names = (const char *[]){ "xo" };
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index d7ac6d6b15b6..89e0730810ac 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -46,6 +46,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device *parent = dev->parent;
+	struct device_node *np = parent->of_node;
 	struct clk_regmap_mux_div *a53cc;
 	struct regmap *regmap;
 	struct clk_init_data init = { };
@@ -61,7 +62,12 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	if (!a53cc)
 		return -ENOMEM;
 
-	init.name = "a53mux";
+	/* Use an unique name by appending parent's @unit-address */
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "a53mux%s",
+				   strchrnul(np->full_name, '@'));
+	if (!init.name)
+		return -ENOMEM;
+
 	init.parent_data = pdata;
 	init.num_parents = ARRAY_SIZE(pdata);
 	init.ops = &clk_regmap_mux_div_ops;
-- 
2.17.1

