Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9976DC001E5
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F74A61401
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242897AbhDEWsP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242889AbhDEWsM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BC5C061788
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:48:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o126so19731847lfa.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rg/duZw0gU1onjIcDsIMU1JUbVdlmgsLzC71USqejBA=;
        b=jwAdRFq43r/sbrOg2QdAQED3w/1Tdb3l6/ijlBR8t7pbRuikgZdOY9PT4vyEQPaLVA
         4Pv/YSBRAUBuBIY90cOI25l/kJBu/U9+xSGcfdoPRf9o4TazslY06JiHhjuj1pi0K+eU
         ct88MP7cG3SPyhkeOQF9VQa2Guw/hPw2i4xZ+cBdCETcNI6lbL0lGUfojXjo8mxwDkbt
         cZqPtSOL1Tuj1M/LKoQoH1jzamEquHjVs2JNVflP0JWX/e4jKblUuQcUz/hokMVQHDnn
         tQT0o4AURSABAxeaGkKS8yWBVvZYoi0iD69L58i/LHkRvtyGjjkwfqCHT3g2KCLwDaL4
         pqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rg/duZw0gU1onjIcDsIMU1JUbVdlmgsLzC71USqejBA=;
        b=LdF5nR4MHcAOBmvmzCBGGcW6Hz+l1YxXhoYsfcAudYNV5WJuK117QQqbu8wsrvJJW+
         ec5WwHUqwUTWMOJwad/xDgjQB3b+8Vq/51YMNiNMYIDncYQji78jqGmyicbEoEWx7Fk5
         NfzFAq1zt/tQJ6LFTN7gySy6KWZhLmqxTF6nm/VHW8mkKUr0daRRY2IbEtOByzdhwtO3
         o/9OMADkGj+4XyC/KIGrrCqxvMKYquj+lIY5V2UPr75MUnuumjuV+0OTHasXoDPwKkiz
         VzxLU8flK8tm7hFbCgYsy9xS/bV/XQr/xejqGAMxo44WE0ridMCZOX9vH2BAoD7ojO9a
         ptMw==
X-Gm-Message-State: AOAM531UvHqjUCwvKJ0ieYgdDWWXA2cTMrA+i3FrsJQ5GCn6i3ATV94x
        lP2UOjpehOPuAMgbLotr/6vGDA==
X-Google-Smtp-Source: ABdhPJy4U5dVHYNAi6pUQZbuPnHqyRFssuf1JZaj8Lcovw0m7Auyu0XihDmmKMvyqwhzdwc9DXIVsw==
X-Received: by 2002:a05:6512:3091:: with SMTP id z17mr19077045lfd.84.1617662883799;
        Mon, 05 Apr 2021 15:48:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 26/33] clk: qcom: gpucc-sm8250: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:36 +0300
Message-Id: <20210405224743.590029-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8250.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 67c136a77efb..9c1f8ce32da4 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -147,8 +147,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_data =  &(const struct clk_parent_data){
-				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -204,8 +204,8 @@ static struct clk_branch gpu_cc_gx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_gx_gmu_clk",
-			.parent_data =  &(const struct clk_parent_data){
-				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

