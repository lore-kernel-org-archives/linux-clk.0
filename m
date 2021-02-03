Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54B2C433DB
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94B7164F72
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhBCLzY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbhBCLzX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 06:55:23 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BE7C061794
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 03:54:06 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d16so23861148wro.11
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 03:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZoHRe0oO7IftEQfLmg/yx1mkw4FkCtrh+GE++AIrCc=;
        b=u3XAjlYNYmjzlJxUQppwkvVqWd7kcBoC30eIuieD1Y8q09r6B3fpTSQviYGRmkpW8Z
         n/geiJLSM1ia+F2DRAJW0QMHJiDI7xVOTZ56Kv29X2gccblYjL39Gb4xotDf5WfjMsF/
         vtzekBfUXtvp9Vgsc8AwB0xMuYM2iBvBFMhIeIFg+wn1J5bPHoLnfw5hdUiWNGfEXVSN
         sNSeHuTvA8eVzvU3V0U9PDWwZtSDgyt6rQ883SyCUe6/36DoiUoE2+tVlB5BwH/Hm5gP
         IbHEabGULmvpNiPcimD4QryJZGiXIDMYyWnNm/UCOjln85YTaZlFpOFTo3U1Zx/4vm0Q
         ZYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZoHRe0oO7IftEQfLmg/yx1mkw4FkCtrh+GE++AIrCc=;
        b=QvnbCLxAL5G/YXoN3YAWLdkIhOdXgKlPrEPON9HsVulDKhA9BSFtnp+2xFRI+6sXpQ
         sBTlmqhmBO3Jvjju8UJPKOikACNSNQwk0rAMUsqzfvM9v49hxC8x+lNaveQxj6AOMI4z
         /3NgasVTDDIcGMhIO/0kHQfj/UqLwFguQDByg5WU+6OWJTXtdA2MSgbIHNKq+iod+Rks
         ofylj3SwPYOz0icwh5cdVO46k9xzry1bpCSFqQZBORn8IZ+F6qttdUsaat4D8dP9/9y4
         GDsWO3ch2s1QT+LuPXeGO+k7jkNXtmgJLhDVVL2vXubmOcQOvbggr4GcJ4lw1Ic803X8
         HjhQ==
X-Gm-Message-State: AOAM530PpRnza/JLNDFwggwnRjPAYsO2hJQQAH9pL2yNJwIcDYg61ms0
        aCGsJ9qoGNTYAJ1Xg6XfbvBHbG7jhAHKKw==
X-Google-Smtp-Source: ABdhPJxIeFT5/SrsDDha7OHssDFScuymihxrUN4tcMXuSd7bu8/f+uccLVBq+HHl+T9yM3Hq+huawA==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr3155889wrs.38.1612353245130;
        Wed, 03 Feb 2021 03:54:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 35sm3687362wrn.42.2021.02.03.03.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:54:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH 3/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
Date:   Wed,  3 Feb 2021 11:54:55 +0000
Message-Id: <20210203115456.1072975-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the missing video_cc_mvs0_div_clk entry to
videocc-sm8250 replicating in upstream the explicit entry for this clock in
downstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

