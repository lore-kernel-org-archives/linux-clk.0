Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2131DC54EBC
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiLQAYJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbiLQAXP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:15 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5BB7E2A0
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:40 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id cf42so5927051lfb.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOTCjV+liMFCiMVQWm/dz56fIC+0pWALeNa+WSMKaKQ=;
        b=feK2BzMlgVpbWgZo9xkjTvqq4h3fCQhapTO9dueMOoCtl+op2HXmPWHrCgja3GWkLq
         JZhN+GhPOi24/XyAO6MIF/p2BW9wygCFkwE52Ho+Xs/K6KjJcNglKOi6kYtqtbYinyOR
         yDd/qNocBLKeWc97Gm5z7zRlZelKl0fXGeoPIalzm2SlIJyG0IgudkOKX9AaJKR42Vs5
         sF85dLr7KM9M/bY0mTwforlGocFsXWiqe8CKjHRbm2KnpdZS83BnzWu3F7G3j17XN4a4
         Fc7L+bAC8ZYXso6raeP65aJ9g7EPnQ3W3vSWndjZcZeEsXwOwe0Fk29ia2uVGu3tv7z2
         YnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOTCjV+liMFCiMVQWm/dz56fIC+0pWALeNa+WSMKaKQ=;
        b=LV60Q41WaVbSc2UvXv6NoowDUzaj3FsQHD8u3WHqNO/JOcQF1l9FvzRvp4LvM4iEVF
         AfIUbGcxZzsy5O1Pfgy2Fmf8p4eoi6+VQMH1D8j1R0u1BdXV0V5EPCYq/mmNhkn37t9c
         +Z+0EhknL7WNUI3dOPnJKQmOFbbG50qKAvnOdu4106sKUG8XLYYOcLtaBRryGINIwN73
         4+8MYFNa3iwEUk49Zv1dQr3XAZ22KrmhrVUaqDB8jXH7txs8y4pZ8MCCHZi9VoMMbTvR
         kRGjXHazZYfl+wNBHuslpX59KmyMd59TsarqABU31y3I1GLtI2U1ET0dvZYRbUWayY6B
         9bYg==
X-Gm-Message-State: ANoB5pnb18410orXqGrZEVwj6nvl+8iKj58IjcjcWn6cIw/iWezwWa5e
        25HmO2fwYTQxFLqgV1cM82RT5w==
X-Google-Smtp-Source: AA0mqf50LRwjYdF6wl6WBbd8tOtHhpobZuhhhHxMpo8GzDj69YbuoLxBuxqjmtrOuTq9hAuLM2Nl3g==
X-Received: by 2002:a05:6512:1193:b0:4a9:4061:1dc8 with SMTP id g19-20020a056512119300b004a940611dc8mr12676013lfr.33.1671236260378;
        Fri, 16 Dec 2022 16:17:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 11/15] clk: qcom: gcc-qcs404: sort out the cxo clock
Date:   Sat, 17 Dec 2022 02:17:26 +0200
Message-Id: <20221217001730.540502-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GCC driver registers the cxo clock as a thin wrapper around board's
xo_board clock. Nowadays we can use the xo_board directly in all the
clocks that use it. Use the fw_name "cxo" for this clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 97 +++++++++++++++--------------------
 1 file changed, 41 insertions(+), 56 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 3941175d73a5..8fb268671f0c 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -37,14 +37,21 @@ enum {
 	P_XO,
 };
 
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_XO, 0 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .fw_name = "cxo", .name = "xo-board" },
+};
+
 static struct clk_fixed_factor cxo = {
 	.mult = 1,
 	.div = 1,
 	.hw.init = &(struct clk_init_data){
 		.name = "cxo",
-		.parent_data = &(const struct clk_parent_data) {
-			.name = "xo-board",
-		},
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -59,10 +66,8 @@ static struct clk_alpha_pll gpll0_sleep_clk_src = {
 		.enable_is_inverted = true,
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_sleep_clk_src",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -77,10 +82,8 @@ static struct clk_alpha_pll gpll0_out_main = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -95,10 +98,8 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_ao_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_alpha_pll_fixed_ops,
 		},
@@ -113,10 +114,8 @@ static struct clk_alpha_pll gpll1_out_main = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll1_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -146,10 +145,8 @@ static struct clk_alpha_pll gpll3_out_main = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll3_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -163,10 +160,8 @@ static struct clk_alpha_pll gpll4_out_main = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -182,10 +177,8 @@ static struct clk_pll gpll6 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll6",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cxo.hw,
-		},
-		.num_parents = 1,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_pll_ops,
 	},
 };
@@ -209,23 +202,15 @@ static const struct parent_map gcc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 };
 
 static const struct clk_parent_data gcc_parent_data_ao_0[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_ao_out_main.clkr.hw },
 };
 
-static const struct parent_map gcc_parent_map_1[] = {
-	{ P_XO, 0 },
-};
-
-static const struct clk_parent_data gcc_parent_data_1[] = {
-	{ .hw = &cxo.hw },
-};
-
 static const struct parent_map gcc_parent_map_2[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
@@ -234,7 +219,7 @@ static const struct parent_map gcc_parent_map_2[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
@@ -247,7 +232,7 @@ static const struct parent_map gcc_parent_map_3[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
 };
@@ -258,7 +243,7 @@ static const struct parent_map gcc_parent_map_4[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_4[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll1_out_main.clkr.hw },
 };
 
@@ -269,7 +254,7 @@ static const struct parent_map gcc_parent_map_5[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_5[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
 	/* "gpll0_out_aux", */
 };
@@ -281,7 +266,7 @@ static const struct parent_map gcc_parent_map_6[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_6[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
 	/* "gpll0_out_aux", */
 };
@@ -295,7 +280,7 @@ static const struct parent_map gcc_parent_map_7[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_7[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll3_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
@@ -308,7 +293,7 @@ static const struct parent_map gcc_parent_map_8[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_8[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .fw_name = "hdmi_pll", .name = "hdmi_pll" },
 };
 
@@ -320,7 +305,7 @@ static const struct parent_map gcc_parent_map_9[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_9[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
 	{ .hw = &gpll6_out_aux.hw },
@@ -332,7 +317,7 @@ static const struct parent_map gcc_parent_map_10[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_10[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
@@ -342,7 +327,7 @@ static const struct parent_map gcc_parent_map_11[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_11[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .fw_name = "pcie_0_pipe_clk", .name = "pcie_0_pipe_clk" },
 };
 
@@ -353,7 +338,7 @@ static const struct parent_map gcc_parent_map_12[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_12[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
 	/* "gpll0_out_aux", */
 };
@@ -366,7 +351,7 @@ static const struct parent_map gcc_parent_map_13[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_13[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll4_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
@@ -379,7 +364,7 @@ static const struct parent_map gcc_parent_map_14[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_14[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	/* "gpll4_out_aux", */
 };
@@ -390,7 +375,7 @@ static const struct parent_map gcc_parent_map_15[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_15[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	/* "gpll0_out_aux", */
 };
 
@@ -401,7 +386,7 @@ static const struct parent_map gcc_parent_map_16[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_16[] = {
-	{ .hw = &cxo.hw },
+	{ .fw_name = "cxo", .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	/* "gpll0_out_aux", */
 };
-- 
2.35.1

