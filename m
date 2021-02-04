Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2C3C433E0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 16:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DAE164F4E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 16:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbhBDQ07 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237004AbhBDPCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 10:02:54 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18976C0617AB
        for <linux-clk@vger.kernel.org>; Thu,  4 Feb 2021 07:00:12 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id u14so3894746wri.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Feb 2021 07:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g/PBuY8B4LXNYC34z8jQVbK8y5NFUz4tvBI8DdIY53A=;
        b=M9BCIDzcktZjQecTpiVhGDYOkUGUHa/rmdy2ilwUXyNji5zUInq9f2kxQO3n8NumnJ
         Pnh5bwYj8Q/5dVQvWkY/0WG7hWPm+xDy4yrfTAo7YCH/8xvVd9Ejf40bKqR39jqq/uwr
         pd87GC5wyEme21xX0DANlh3sZOi1r+NS+B1OMfP8ovTZhXr/t8bXBKpJqCApO9ws3tp3
         KsZAmItJUURxLox3vo9QtxiU/1jc6E6w1F7jHw7N0IutFc0Zd7ZsbEHXI63YahVyTuqs
         bUS6joHC9mEVmozx+aetuQBV/adxpvt9oqGsxHhXVz4oaZ1JCuS8HWV/r7y5pq2Q6fDo
         b4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g/PBuY8B4LXNYC34z8jQVbK8y5NFUz4tvBI8DdIY53A=;
        b=OZxduDAmHI3BSpkBgAod3IDcW6rlw5OMe5JFqA0s7pa9q6K7JEarWeSsG+lhR0afIj
         uYSWKcZiIS2a4ABDiZ7o5QBofGXavZBpD78zflHqIbeW3MqhjMbnU79YZJLPxF4nd43N
         sdozT8+4LqhSUi7GlS2HGwECe13u/Ks5yP3C7cb4fybrf2k9mXw8J/aIM4NnsrfnAEBl
         t0oFE1ZpR6TLXyfCRIukHKyK4+b6HcmOOlkkG8Ryd2iC79wmriTLjcW1f/p6gYCsrhOh
         YbJaGlQwM9t/u1weMReCpo6TUhMsD0wMGK/etvM+rXSvRzFZhrAA9xsPXR22VA8a4t+w
         QDrQ==
X-Gm-Message-State: AOAM531gHR+6jHBpezlODPhV3826hIJBqcg1x2HlFCXH3VaLTZJ90xPw
        WCvHSX+Gpwg2ohcmAxyUj0QD/uotntGdoA==
X-Google-Smtp-Source: ABdhPJyANz9+onWs56zbNEa8fiYd8RlFkVZ7GbhoMud5mHLN3TMDIvOySStd+OGB1xGnTX47kyFTuw==
X-Received: by 2002:a5d:44cc:: with SMTP id z12mr9703806wrr.7.1612450810456;
        Thu, 04 Feb 2021 07:00:10 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 3/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
Date:   Thu,  4 Feb 2021 15:01:19 +0000
Message-Id: <20210204150120.1521959-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the missing video_cc_mvs0_clk entry to
videocc-sm8250 replicating in upstream the explicit entry for this clock in
downstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index cc84963ced40..3ade240bd49c 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -217,6 +217,24 @@ static struct clk_branch video_cc_mvs0c_clk = {
 	},
 };
 
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0xd34,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xd34,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch video_cc_mvs1_div2_clk = {
 	.halt_reg = 0xdf4,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -290,6 +308,7 @@ static struct gdsc mvs1_gdsc = {
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
 	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
 	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
 	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
-- 
2.29.2

