Return-Path: <SRS0=ATvf=UH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95735C28CC5
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 19:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73587208E3
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 19:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WaL7D/rJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfFHTxr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Jun 2019 15:53:47 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39062 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbfFHTxq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 8 Jun 2019 15:53:46 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so2090886plm.6
        for <linux-clk@vger.kernel.org>; Sat, 08 Jun 2019 12:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=83a8MoLcEJiG177cdK9PZRkYinryGGyKPXFycKJosaY=;
        b=WaL7D/rJC7D65LYWj8NEGexxrwXKI6tDAcL/sPB5lIlAPrDTQq/rJPqVXrqxsuQO/5
         s5LYiCX3KAJImUAWhIcUtCQvKmhSvwjvfsYKV7629GpfDEqN+O7gnSyjKWdoEAm3WAoo
         hSns9rM0WAhBvFiH1yqncIKN+kITrQB9h+g1vrzvS37cz/RZ1eRsgTv+fKqt1rPuz0Jl
         yMMNINDh8FHhcVGvkcMBO8aXn9Vdv9+QXPkpUwSaYm68BbAVZfpkJr1/Ok9DnQOfYus1
         k5IdIjOE86acO7FP3iSBBWsTcFl/0JQaD5GBDET/1PkxBFMMRzSbUSDzslILD3iH7iwD
         Sp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=83a8MoLcEJiG177cdK9PZRkYinryGGyKPXFycKJosaY=;
        b=a57ruOkyZZy+zWx4fdhdkdLQTTTp7oPL//Hfp7JxBTZpVOVFRDQuy75wxjNS4rBBPm
         m0kWjsSkaJnCb643kVrf9OhZZc3NZfVU9s4PtsjCbWdh2D4uJq2lOxBcjDw67J7BewxO
         BmT/UaHSAbj/db+A3G2/UpLnBiBtFq4CTkE6px1g5TrnfnRHVW9WeN0YUenBHeGJOoNn
         uT9W9Sm2/cRwfRVbp9s3EGSB+59lR3iHA1AluO4lU8SxYf22pEP+/uUgmYd2sqcvz0tn
         pZMflKEo+irxuxeZ8TDEHjxw+xRsqzlzvY9eXUfXEdceWrngP5aSWESkyRYe8YxgCr7D
         BgKw==
X-Gm-Message-State: APjAAAUvvzAmS+Kaqy3FNld7+Sm/9wBXn5CnnxXKJ9cEIItxtZcgvo7v
        FQzTMUP4yNKee3wkghwBaue7/BZ1Vw==
X-Google-Smtp-Source: APXvYqwPmW4XJFkm7kpSpG6iMAz/zpA/DnzV/RQNKln8On0igjyTQEQS6Gz7hejp40XFUOdg8C0OMw==
X-Received: by 2002:a17:902:bc3:: with SMTP id 61mr4289938plr.324.1560023625983;
        Sat, 08 Jun 2019 12:53:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7185:fba9:ec1e:ad07:23ac:d3ee])
        by smtp.gmail.com with ESMTPSA id b35sm6034377pjc.15.2019.06.08.12.53.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jun 2019 12:53:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/7] clk: actions: Fix factor clk struct member access
Date:   Sun,  9 Jun 2019 01:23:11 +0530
Message-Id: <20190608195317.6336-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190608195317.6336-1-manivannan.sadhasivam@linaro.org>
References: <20190608195317.6336-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the helper "owl_factor_helper_round_rate" is shared between factor
and composite clocks, using the factor clk specific helper function
like "hw_to_owl_factor" to access its members will create issues when
called from composite clk specific code. Hence, pass the "factor_hw"
struct pointer directly instead of fetching it using factor clk specific
helpers.

This issue has been observed when a composite clock like "sd0_clk" tried
to call "owl_factor_helper_round_rate" resulting in pointer dereferencing
error.

Fixes: 4bb78fc9744a ("clk: actions: Add factor clock support")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/actions/owl-factor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/actions/owl-factor.c b/drivers/clk/actions/owl-factor.c
index 317d4a9e112e..f419dfdd334f 100644
--- a/drivers/clk/actions/owl-factor.c
+++ b/drivers/clk/actions/owl-factor.c
@@ -64,11 +64,10 @@ static unsigned int _get_table_val(const struct clk_factor_table *table,
 	return val;
 }
 
-static int clk_val_best(struct clk_hw *hw, unsigned long rate,
+static int clk_val_best(const struct owl_factor_hw *factor_hw,
+			struct clk_hw *hw, unsigned long rate,
 			unsigned long *best_parent_rate)
 {
-	struct owl_factor *factor = hw_to_owl_factor(hw);
-	struct owl_factor_hw *factor_hw = &factor->factor_hw;
 	const struct clk_factor_table *clkt = factor_hw->table;
 	unsigned long parent_rate, try_parent_rate, best = 0, cur_rate;
 	unsigned long parent_rate_saved = *best_parent_rate;
@@ -126,7 +125,7 @@ long owl_factor_helper_round_rate(struct owl_clk_common *common,
 	const struct clk_factor_table *clkt = factor_hw->table;
 	unsigned int val, mul = 0, div = 1;
 
-	val = clk_val_best(&common->hw, rate, parent_rate);
+	val = clk_val_best(factor_hw, &common->hw, rate, parent_rate);
 	_get_table_div_mul(clkt, val, &mul, &div);
 
 	return *parent_rate * mul / div;
-- 
2.17.1

