Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0070AC41602
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9F04613F8
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242884AbhDEWsO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242887AbhDEWsL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCECC061756
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:48:04 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n8so895778lfh.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=totkdhpiKIF1Q8NIelblJdJ8yC3ccQXvmxBlzRWD17w=;
        b=YrXmmP1tWZqN72it1cw/PzYss+HuWqigue7rdA+S+N3SH+dmkG3oFEJCIQv++6OthJ
         C7DN7zMsPpX0omI6AvbtEvi6ZQQ59cUYI/bCzuCO8hP5PB5o0nP9IJmFf06yBIubcJMk
         Cxqn1CzkNJ1osnvyWcXmK91+yRJEO/IWWUOF2WmNknY2sC3h8DGyuUdix+rV2i+5kcPz
         xJeRGLfQcqWyxiFwMg40KtxeKug3/inZjC4+LM5I1f531Z3kCHX2BBL6Ui1v+l5IAZrV
         wiTRxav32mwfnvWp7DYk7zQDPKce+eNpFggvxpaMVg0eWDSXP2zeROaV/aIStnIhy/E5
         CiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=totkdhpiKIF1Q8NIelblJdJ8yC3ccQXvmxBlzRWD17w=;
        b=ZZjVoXRi+9/SLhf/q0UIoOjJdYCf7waKpZFGA+7YC2UdW0hKVow8QBRlxbKfj1Rb2b
         YdD0iF0sz0E7B07BiYlYvOhz4Xa6Tg8YcuzTDIkxTf19rWs3CitzVfUVRXvLymKh+cjD
         4SzJc6OPrf6qsHm9zqyMC5l0MwDg+kqbe4zuQdZENcSDH0LFSrigViSK0KMtrGTNU+oy
         iIOYJqgl6gCHKR9hVNxuru8dLmMfzPDPxUESy7ZTVQkDYJX6EGhuMu0LB0pY/OnqvVrK
         2H7GTm84kB+8gUZW6emSSJTgSOlvLZ49P1zp6XzlLB2Dpf8oey0rBCHhews9gKh5W5BL
         jPww==
X-Gm-Message-State: AOAM531f0r3Q+fFvH4VvuJcimu9LfnRJ/FxIYmB+BzJjkP/5O96mNv4t
        Z41g/UK4xeAJQNIIzSL616UdS8+/+C2ISg==
X-Google-Smtp-Source: ABdhPJyOMRm9I8DZD7jFwJKJDHzOMrMxa39UEnv0lSMP+UFSIQ1ySUc1pDSw/8+Ymr1TsAJ69iFt/g==
X-Received: by 2002:a19:f50c:: with SMTP id j12mr403678lfb.604.1617662882888;
        Mon, 05 Apr 2021 15:48:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 25/33] clk: qcom: gpucc-sm8150: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:35 +0300
Message-Id: <20210405224743.590029-26-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sm8150.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 2b952f561537..80fb6f73601d 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -144,8 +144,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
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
@@ -201,8 +201,8 @@ static struct clk_branch gpu_cc_gx_gmu_clk = {
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

