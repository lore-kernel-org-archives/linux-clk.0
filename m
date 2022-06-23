Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E28C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbiFWME3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbiFWME0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:26 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2FC496A7
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:24 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c2so32987081lfk.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UiJAIQH+L9+uN6VGb9S2vDqkLLCLa8YUEqig3NBbRlk=;
        b=aAgLgHKEcHviHjnGyIFIm7C4pWEW5M5SdEv7SLjLLhWjzGj1YoZ699Hsge+KuddEkN
         dJO8WJtLb8a8COdPIvLpM4h19GffgVi5CrnkDZgLzPKBKWv1DSqoxo73opBJiI8dIVxy
         E1p96BnTAjrwt02lYHZ+X+xAIApSM3YrQu4NzoFc3QIIutmBtzyiaORZR+tU/jm7BiId
         5SXkmVU5R/XZXSnOgfa03V11IVYinw63Fi6RzgVOPigZNEG/wJQOL8u8qR7Cjw+4JWFt
         6Y3Djh8kws2CZmbhfEwJTAuDOw+DNqQI/Cqr9Fjc+ic2+rt1JjZXdMKzzX5g6bj9YF8+
         TSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UiJAIQH+L9+uN6VGb9S2vDqkLLCLa8YUEqig3NBbRlk=;
        b=pSlsm5j6VbrVqrGtSJIkGJteHr/+8GSs5VzoWlmOk3UVjO3ztD2MfO/zsn2m0lPmIq
         UgA5IhWKDat1Q57NGkNGjytTlGiwqwLGAzlQT2mrdq2kSvNGLhjOySwcnLwYI4yPkOYP
         nWyTggb6HtvltP0xxrlMgc+QtgoieBminMPQd82kFCUBiNj4L3WE7aIEcEn5kRO0CX5o
         EqX/e8npr9v+xItgHJXHHdGPP4dz9lBOFuQirlJ1WwwWnWyaO/r6sq9nAWVEjNW16/MH
         gXcE+7caXxQ4fiYfw5hSR9RHhvH4YzEwwOk/zEBYJpqFb+WcqESZm0kcmuzix726+lxb
         GLQA==
X-Gm-Message-State: AJIora/CDhghvI+NLNV1g0tpd6ShSoR/7Lhs0EbbT5Tdi8IEL1hg5LgY
        8JdKGoci3yby60Rl+Zi3jYgDgQ==
X-Google-Smtp-Source: AGRyM1sseeHX1Ai+SIGx5XMY4hZMPKiSM7468kskgD20dhPzboifXHxSx2ujW40qscIZ+wuRRCWr5w==
X-Received: by 2002:a05:6512:3042:b0:47f:ac02:28e9 with SMTP id b2-20020a056512304200b0047fac0228e9mr943511lfb.448.1655985864353;
        Thu, 23 Jun 2022 05:04:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 06/15] clk: qcom: lcc-msm8960: use parent_hws/_data instead of parent_names
Date:   Thu, 23 Jun 2022 15:04:09 +0300
Message-Id: <20220623120418.250589-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/lcc-msm8960.c | 69 ++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 99a3d2d486b4..3926184cc91b 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -33,7 +33,9 @@ static struct clk_pll pll4 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll4",
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "pxo", .name = "pxo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -49,9 +51,9 @@ static const struct parent_map lcc_pxo_pll4_map[] = {
 	{ P_PLL4, 2 }
 };
 
-static const char * const lcc_pxo_pll4[] = {
-	"pxo",
-	"pll4_vote",
+static const struct clk_parent_data lcc_pxo_pll4[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "pll4_vote", .name = "pll4_vote" },
 };
 
 static struct freq_tbl clk_tbl_aif_osr_492[] = {
@@ -112,17 +114,13 @@ static struct clk_rcg prefix##_osr_src = {			\
 		.enable_mask = BIT(9),				\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_osr_src",		\
-			.parent_names = lcc_pxo_pll4,		\
-			.num_parents = 2,			\
+			.parent_data = lcc_pxo_pll4,		\
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4), \
 			.ops = &clk_rcg_ops,			\
 			.flags = CLK_SET_RATE_GATE,		\
 		},						\
 	},							\
 };								\
-								\
-static const char * const lcc_##prefix##_parents[] = {		\
-	#prefix "_osr_src",					\
-};								\
 
 #define CLK_AIF_OSR_CLK(prefix, _ns, hr, en_bit)		\
 static struct clk_branch prefix##_osr_clk = {			\
@@ -134,7 +132,9 @@ static struct clk_branch prefix##_osr_clk = {			\
 		.enable_mask = BIT(en_bit),			\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_osr_clk",		\
-			.parent_names = lcc_##prefix##_parents,	\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_osr_src.clkr.hw,	\
+			},					\
 			.num_parents = 1,			\
 			.ops = &clk_branch_ops,			\
 			.flags = CLK_SET_RATE_PARENT,		\
@@ -150,7 +150,9 @@ static struct clk_regmap_div prefix##_div_clk = {		\
 	.clkr = {						\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_div_clk",		\
-			.parent_names = lcc_##prefix##_parents,	\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_osr_src.clkr.hw,	\
+			},					\
 			.num_parents = 1,			\
 			.ops = &clk_regmap_div_ops,		\
 		},						\
@@ -167,9 +169,9 @@ static struct clk_branch prefix##_bit_div_clk = {		\
 		.enable_mask = BIT(en_bit),			\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_bit_div_clk",		\
-			.parent_names = (const char *[]){	\
-				#prefix "_div_clk"		\
-			}, 					\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_div_clk.clkr.hw,	\
+			},					\
 			.num_parents = 1,			\
 			.ops = &clk_branch_ops,			\
 			.flags = CLK_SET_RATE_PARENT,		\
@@ -185,9 +187,10 @@ static struct clk_regmap_mux prefix##_bit_clk = {		\
 	.clkr = {						\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_bit_clk",		\
-			.parent_names = (const char *[]){	\
-				#prefix "_bit_div_clk",		\
-				#prefix "_codec_clk",		\
+			.parent_data = (const struct clk_parent_data[]){ \
+				{ .hw = &prefix##_bit_div_clk.clkr.hw, }, \
+				{ .fw_name = #prefix "_codec_clk", \
+				  .name = #prefix "_codec_clk", }, \
 			},					\
 			.num_parents = 2,			\
 			.ops = &clk_regmap_mux_closest_ops,	\
@@ -273,8 +276,8 @@ static struct clk_rcg pcm_src = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "pcm_src",
-			.parent_names = lcc_pxo_pll4,
-			.num_parents = 2,
+			.parent_data = lcc_pxo_pll4,
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -290,7 +293,9 @@ static struct clk_branch pcm_clk_out = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "pcm_clk_out",
-			.parent_names = (const char *[]){ "pcm_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&pcm_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -305,9 +310,9 @@ static struct clk_regmap_mux pcm_clk = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcm_clk",
-			.parent_names = (const char *[]){
-				"pcm_clk_out",
-				"pcm_codec_clk",
+			.parent_data = (const struct clk_parent_data[]){
+				{ .hw = &pcm_clk_out.clkr.hw },
+				{ .fw_name = "pcm_codec_clk", .name = "pcm_codec_clk" },
 			},
 			.num_parents = 2,
 			.ops = &clk_regmap_mux_closest_ops,
@@ -341,18 +346,14 @@ static struct clk_rcg slimbus_src = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "slimbus_src",
-			.parent_names = lcc_pxo_pll4,
-			.num_parents = 2,
+			.parent_data = lcc_pxo_pll4,
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
 	},
 };
 
-static const char * const lcc_slimbus_parents[] = {
-	"slimbus_src",
-};
-
 static struct clk_branch audio_slimbus_clk = {
 	.halt_reg = 0xd4,
 	.halt_bit = 0,
@@ -362,7 +363,9 @@ static struct clk_branch audio_slimbus_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "audio_slimbus_clk",
-			.parent_names = lcc_slimbus_parents,
+			.parent_hws = (const struct clk_hw*[]){
+				&slimbus_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -379,7 +382,9 @@ static struct clk_branch sps_slimbus_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "sps_slimbus_clk",
-			.parent_names = lcc_slimbus_parents,
+			.parent_hws = (const struct clk_hw*[]){
+				&slimbus_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.35.1

