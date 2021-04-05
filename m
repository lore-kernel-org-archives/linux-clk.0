Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EE2C43611
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A49661403
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242891AbhDEWsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242882AbhDEWsO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:14 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AABAC06178C
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:48:06 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n138so19675582lfa.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2GUMc9wPOUv+tfg455GAVwvWHenU8m+juwsP+KD2CJI=;
        b=HBkpckv6AmpuafrqLmYJkeadbYqaoEBLcN/4Dpxl6nks3U6rKCbyTOBWwNnfA9aQ0Q
         4g5QV0LqisFiKCjMR1Epi7kTAhFjCSXN9ZHl3eW8lSyZyVwbo/qQ3wn8p+qq4fG3g1yf
         nJMird5z+DeyF4n/scmNcaTvugLQIVLDl+yhDdfXpT3smo2wOphHfQD/BtUYtZI09uvg
         1g86DFvX49EMmI+bYJYThrUhpWx6r4dKbPBhnmImwb5uAmZwl9BGY13nujWGvCfS3+Hx
         l0LO6sEulHXOlqexKtdu5723Xbo0hbSJRdkcExPAaXr09GCKmv1aKVwMbPUnunmWDk16
         hOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GUMc9wPOUv+tfg455GAVwvWHenU8m+juwsP+KD2CJI=;
        b=adFFnqg57pADfg6TLffskJw9X09vOF1yyiVEurU2Iv/Fp89tniUgyiusKUAWgMoRbC
         Bjp3HVKFAr4oWQniYUW9UbX2PDnxD0uc7YmPh6LRx3K9gv2Z3I58bbCGXyNUOTzg/oy6
         beLFAFQsBRXzn4Fq9X7BBn8rQHAE76oIWfkR3qEaUHzXOTNd6/pUW+H//7S0WKsV618G
         TsxpA7RmL/q8hy291weXETu0p0fD5pMZAdnNIMhSJl2k1ASrBtjWNMH+5sAgCIswC5KT
         wjrhGoBX5sW3I4BDNBJiJNNjSwmdwr0wFQgfCxJEGpPoyu/BDsNF1JkxUPGubPXyK7xg
         fyYw==
X-Gm-Message-State: AOAM531y4qj3ftrjGByVZm+u8DO2N1U8HKqR5bd8hZsY1eSCwvfG7AKi
        I3MSM3y7ZRCjkE2iH/o5YWcj4Q==
X-Google-Smtp-Source: ABdhPJzEsGCRkPWk/sRJkvG2qCf3Nbj9bsd9MrpaKiVhJG0jUL61WZBCm3fI9vQVCbXG0J3WWg8v2A==
X-Received: by 2002:a05:6512:a95:: with SMTP id m21mr19006619lfu.59.1617662885185;
        Mon, 05 Apr 2021 15:48:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 28/33] clk: qcom: videocc-sm8250: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:38 +0300
Message-Id: <20210405224743.590029-29-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8250.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 06a8a2c98deb..7b435a1c2c4b 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -158,8 +158,8 @@ static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "video_cc_mvs0c_div2_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&video_cc_mvs0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -173,8 +173,8 @@ static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "video_cc_mvs0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&video_cc_mvs0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -188,8 +188,8 @@ static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "video_cc_mvs1c_div2_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &video_cc_mvs1_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&video_cc_mvs1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -205,8 +205,8 @@ static struct clk_branch video_cc_mvs0c_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs0c_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -223,8 +223,8 @@ static struct clk_branch video_cc_mvs0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs0_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs0_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -241,8 +241,8 @@ static struct clk_branch video_cc_mvs1_div2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs1_div2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -259,8 +259,8 @@ static struct clk_branch video_cc_mvs1c_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs1c_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

