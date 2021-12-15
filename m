Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAAFC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 19:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhLOThQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 14:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhLOThP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 14:37:15 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A858DC061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:14 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id v15so35008249ljc.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8zDJuFAB6ivuAS+uf6JiKzMo1RVDElQqHj5rLSQodM0=;
        b=R9sXMd70zB+l98KzoZUVll8B/eD5LtgS8aAxrCUKw681kAXEm7dWz6IwV7k1c+q3Hv
         tEPzescru7tUEklPiBOOA7n6HPxKhqGXJ5FV69zeuFx4Po8TYjDSr3J+oVXmOogYfnQY
         zedeLSz7+UjkxuD7j6pJKXI+ChcG1YFVFZ29uvpJAp7IM6V5d4TClAUua2XCje/niYaF
         IU5asecIltBgyofUxozvNCfOHazCZbMJNp54+UwAe9sI9Lr4KA8b4ryQb+iAFPNFIQ+g
         zzl5Uq+Ocl+KfCvJzN/Q7fGdr+haF0Sy59CD2yc8O86NFgehZzCIiDKc7qRjkLrHA1bj
         Iu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8zDJuFAB6ivuAS+uf6JiKzMo1RVDElQqHj5rLSQodM0=;
        b=VNObInv3QGTbVFw0O8Kdop/edbWidkT6nsu14nBf7x1Xl5ISeaAbHIUD40wVqPakPu
         +NAXSFvkk7Sb9iYGloOJJL7gQqHmXSPwvJYvNmph88n3A5GioKyxGemGsYuEm0Pv8pjC
         15iMDTuAoNCag+lMpDT5xqd3O46Wm0Ah4WZ3ng5OT29zLf21um+Potn3Sp5uyQUosPEU
         kUKTVbB4eh+6SD6cvr7AY9/1/ROFOisEIHbMl8+5Q5FWAkUad8alRkmqGJVtIRd3u/s7
         b/tazXGk3T1IdchygLj7rJ8Ho0mWVdHX4PM51sw7jgK/rwKxkhC5QH+3EvW4LOPaXpqW
         rjXg==
X-Gm-Message-State: AOAM532bBMFqlejLtUvimj+5uunh/kX1JOWaseMCmkgBjwx6C1NzvcGu
        mQlp3SLa0d9XgE4sCKvSuw7BHcMGCl0uqAH7
X-Google-Smtp-Source: ABdhPJxdZjPQzNjIGtBf9O2H7S5YCkcB0ar5LtrXs8dRyYz/sMKoklKEWWdlgkFsSS3+Jfvie/qWmg==
X-Received: by 2002:a05:651c:169c:: with SMTP id bd28mr11525209ljb.186.1639597033007;
        Wed, 15 Dec 2021 11:37:13 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 01/16] clk: qcom: gpucc-sdm660: fix two clocks with parent_names
Date:   Wed, 15 Dec 2021 22:36:49 +0300
Message-Id: <20211215193704.2821775-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Two clocks are still using parent_names, use parent_hws instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 41bba96a08b3..d170353eccf6 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -204,8 +204,8 @@ static struct clk_branch gpucc_rbbmtimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_rbbmtimer_clk",
-			.parent_names = (const char *[]){
-				"rbbmtimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbbmtimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -222,8 +222,8 @@ static struct clk_branch gpucc_rbcpr_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_rbcpr_clk",
-			.parent_names = (const char *[]){
-				"rbcpr_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbcpr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0

