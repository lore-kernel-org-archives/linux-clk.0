Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AD9C07E9A
	for <linux-clk@archiver.kernel.org>; Sun,  4 Jul 2021 02:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5663961949
	for <linux-clk@archiver.kernel.org>; Sun,  4 Jul 2021 02:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhGDCnZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Jul 2021 22:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhGDCnV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Jul 2021 22:43:21 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33793C061764
        for <linux-clk@vger.kernel.org>; Sat,  3 Jul 2021 19:40:47 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id j199so12820515pfd.7
        for <linux-clk@vger.kernel.org>; Sat, 03 Jul 2021 19:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LGTpZpcq32N1ry1LRLwc7jq58V/cDLzcGUvKzTqnKL0=;
        b=F83E1Q5H1nwJYdoExXJpnGKLhUHfJgiUg5f3KCJlnwZIHsFS8uG7I/BUOWqxbBHy7J
         nYJiJGRiVkVdtL4AuohjgJd7lg/F3Q8EstetwfzAK38CrFDd283EC15V9QFy+KwdU7tJ
         ThBQJlB1JEXY4gOygZw8BM/CEcbG/XwI3NVjG4rAnhthYRjUivKMWQY4U/WP0ErJ3VKb
         T5JN1AhNaByyK99PN3u0vowEkrEp0wCtCIWvzPVeZNIaeJAQcIGUTH3BVcLodQjTQzoS
         kwsGuO0qx9lEGiIqn2h50mYapkQpBthPZ4JhhLKySWs0R0RZ4oMVIoCbE8NIBb4yVJhY
         EJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LGTpZpcq32N1ry1LRLwc7jq58V/cDLzcGUvKzTqnKL0=;
        b=edXzwDOzWNxXYt1eTfCq2j6HYx9poKceXTBB1yvG/RzdNuN0ti/vs2m8TaZa7UwIUP
         QhVBvJi5LbRnJ/sUvlV1NqD+0t0cxUi5jKKN6YBHvmmoum3cOSx29dDpDCQsyIpF5QeE
         4pw60y622p7OQqRK6QZislUHpwUioUIvysR10HZgsOalnEkho8Zy/ZVZYZSLQad+VUbV
         tUeheA/lOIL6GYkagQ4x/d/vmBgkHewJg7eIXAuVzt4NLJ+dfcSpPR/yrZZyx+IfsR3t
         yY0dclX0yK3lLZ6/NfSBSdKsxkamZD7h1sEcCytimfHItpDEPNe8JKqdOpXTkWn3nY4W
         NyTA==
X-Gm-Message-State: AOAM530CRpaMEhsZO/Bl7TIGkWz3/CnvHI9iR/r/Eb4ZQ/XI5tritN2Z
        UMBFFWeZkt+INg4IbJoUcBtzYuc+BjJL7EuW
X-Google-Smtp-Source: ABdhPJzrv83//wTI/fTzoXpjitQYAV5M1F6hUvVBdBmSdECuMk27Pfe5cxAOWTBn0493YNNbjiRNNw==
X-Received: by 2002:a63:6cc:: with SMTP id 195mr8146533pgg.281.1625366446801;
        Sat, 03 Jul 2021 19:40:46 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g17sm9394624pgh.61.2021.07.03.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 19:40:46 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/4] clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
Date:   Sun,  4 Jul 2021 10:40:29 +0800
Message-Id: <20210704024032.11559-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210704024032.11559-1-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock source for MSM8916 cpu cores is like below.

                        |\
         a53pll --------| \ a53mux     +------+
                        | |------------| cpus |
     gpll0_vote --------| /            +------+
                        |/

So a53mux rather than a53pll is actually the parent clock of cpu cores.
It makes more sense to flag a53mux as critical instead, so that when
either a53pll or gpll0_vote is used by cpu cores, the clock will be kept
enabled while the other can be disabled.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c      | 1 -
 drivers/clk/qcom/apcs-msm8916.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index af6ac17c7dae..d6756bd777ce 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -70,7 +70,6 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	init.parent_names = (const char *[]){ "xo" };
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
-	init.flags = CLK_IS_CRITICAL;
 	pll->clkr.hw.init = &init;
 
 	ret = devm_clk_register_regmap(dev, &pll->clkr);
diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index cf69a97d0439..d7ac6d6b15b6 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -65,7 +65,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	init.parent_data = pdata;
 	init.num_parents = ARRAY_SIZE(pdata);
 	init.ops = &clk_regmap_mux_div_ops;
-	init.flags = CLK_SET_RATE_PARENT;
+	init.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT;
 
 	a53cc->clkr.hw.init = &init;
 	a53cc->clkr.regmap = regmap;
-- 
2.17.1

