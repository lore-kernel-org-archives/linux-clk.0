Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CF5C433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:55:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 397CC64F74
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbhBCLzB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbhBCLzA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 06:55:00 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7ACDC06178B
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 03:54:04 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id c4so21180933wru.9
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 03:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jf1oKzKtxHAKQjrR3pGFqCZX0fsUjZbCoIA88THXekk=;
        b=Shk0cV6btl9gr5pEyJZtgYebo+d5vN5RwINBxKhE7wmLymPrvjDAKRhnqQ6wHZybeb
         +NrWJuMCuAGgcMLMRIhYk0ViYNLprGtVxyAvHS+PPbWJds5Ki2O7YVmqCSK4en/Vq7Xo
         ZQkf2QRAbL8R2D9Dakvtbtx56cDg/Qx3dZFpB4mO85tEHe6DxcHDqJ/vUvv+Z5/awBLQ
         LmHWx/zKMSHJSoI5aM4lZHOVJzpKRrtZfcgIeaiuCXvlqkEcY4/i2UIoZGJrc0bUFHSQ
         FCmi4W7WZT/Ja+ZHhFmgiVXldusxX502U7YYl4CCqLy+53zSjPXtqXEaZhIJ0GjdJMbz
         HesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jf1oKzKtxHAKQjrR3pGFqCZX0fsUjZbCoIA88THXekk=;
        b=oyqU8TbPsUHYzufido4BHnR8eGIdgmCugZ12UXb4Ashc/OMnWUfLVrU/wTs32YMvDV
         iTVNeMzcZg8rJl4i+jUezZ4HTaEILrG8WuJVL9gR5AeqYQHZ4BVu4rhDe88I/czUyLCD
         TpCnK9robxsA42cYasVeF6pPkuumg/VQpYWfegt04Bkmn2HNVRviDdyqvwwXKT/JuJnP
         LoijqZsT0Kw0sMV6xhqndi3OxcXH04ZbQczj4GWux2awMNd28seZgkkYPTn4kSsIq1Y7
         +Zdf5f5Up1k3Kmc78eiGIbxizl0Sb+hUTKKYoP6MuBE52l5OBYjQZStOQHuRyiYeUN6j
         Yxtw==
X-Gm-Message-State: AOAM530QNX8DZdR9n34C2xdfbjqKk32GMCnHkonO3EnUvqi9FQLXGlaK
        BF0lCaHT7f7Y8y1F2bg+sm59DZPc+2bMeQ==
X-Google-Smtp-Source: ABdhPJyHSSkRWTMSPrSItAmTMJjB8yCJKvK6Do48JrGtA7VjTEVlfcZWmuMEM1BlJHeyIcJO/1Qnng==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr3110968wrq.76.1612353243293;
        Wed, 03 Feb 2021 03:54:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 35sm3687362wrn.42.2021.02.03.03.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:54:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH 2/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
Date:   Wed,  3 Feb 2021 11:54:54 +0000
Message-Id: <20210203115456.1072975-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the missing video_cc_mvs0_div_clk_src entry to
videocc-sm8250 replicating in upstream the explicit entry for this clock in
downstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 2797c61f5938..cc84963ced40 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -169,6 +169,21 @@ static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
 	},
 };
 
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0xd54,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
 static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
 	.reg = 0xcf4,
 	.shift = 0,
@@ -276,6 +291,7 @@ static struct gdsc mvs1_gdsc = {
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
 	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
 	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
 	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
 	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
-- 
2.29.2

