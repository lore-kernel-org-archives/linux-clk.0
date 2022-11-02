Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ACAC4167B
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 09:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbiKBJC4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 05:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiKBJCK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 05:02:10 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FD3286E6
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 02:01:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r186-20020a1c44c3000000b003cf4d389c41so826850wma.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGxrVhiJog6cCrvFJyjRDALKwnKqI8styrZPsF0tpuc=;
        b=kjwpxsOgQwE9alprOtJ0BTkuMscZHfa0/qF8YpaFy718J9rnASNG8RqGiBb7tVuR+J
         +ntSZhm7Ehz6yCJm8Gog01fOFoCnqNr3LCYSpCPRkfubOlFMaOC5jqJRj6yKLbViAbDg
         gjoGQT1x1Ch4FSdz0aeC1X/TBV0wPW9wwMSBSIIdL365DhTWGe1oXxfy1sNjy4URkc9A
         r8o2L007YVyaLb6JoFrWL+AfRjjhY1bmlkmud26QsHSiJDKmhnc0HLQDeXn5oZDthqrN
         NoG7vg69uNQHfYoLUeiEYSZ7zOb2gF39qVUvv7xi5yq3pmbADF61zMDfG3EoNTQOYtBc
         tdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGxrVhiJog6cCrvFJyjRDALKwnKqI8styrZPsF0tpuc=;
        b=JU9qy8sJ+XlbGAzvFZRHJjwnEcVZnrpPKIIuFV0jtET8cRUGHMbCk/pQNnZDh13+Si
         bbF7ZXuCmB5/jADmXQ/ubFOd4HRFdmPvtI0H8TFTYAXpPBwlNHmdBfj3xVHq/tqDGbW1
         1EJ6bNcosg426LyTw9kYuqbiQwvWyLiV7Yt/tlmiZRLvZX289VUbYc0Uak0hmmMAj8Qk
         OK/pe0HyDE2OkmG3Ir4cxZR5z1UcviX5mk7VkWsUdwxXynOlhWSCyg3Z+IxNWeOCI9l2
         4P9G2hCQNtbSWRd7R1mMZpOTMfB1uYXQDR+6HYaL/KZXqS/2rY8Gp4KPkMbp7L+euMXb
         +P3w==
X-Gm-Message-State: ACrzQf3nf06wE29BlKkoArGlBTMsLzubzlLhwC+/cDKQ8L2QU6gTxQUo
        bznKEMF7Stw7IexO4owxGTphPQ==
X-Google-Smtp-Source: AMsMyM4MC0JGcTklkwECadkBDppF5ZEhGBwjMvkfsMCRbvsYjvboD+bjpdL5KkOk74CFY7+IwmmORA==
X-Received: by 2002:a05:600c:4618:b0:3cf:54ad:7bb3 with SMTP id m24-20020a05600c461800b003cf54ad7bb3mr20940293wmo.4.1667379711970;
        Wed, 02 Nov 2022 02:01:51 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id bd26-20020a05600c1f1a00b003cf6c2f9513sm1425322wmb.2.2022.11.02.02.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:01:51 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        dmitry.baryshkov@linaro.org, Jonathan Marek <jonathan@marek.ca>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 4/5] clk: qcom: dispcc-sm8250: Add missing EDP clocks for sm8350
Date:   Wed,  2 Nov 2022 10:01:39 +0100
Message-Id: <20221102090140.965450-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102090140.965450-1-robert.foss@linaro.org>
References: <20221102090140.965450-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SM8350 supports embedded displayport, but the clocks for this
were previously not accounted for.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index a7606580cf22..d2aaa44ed3d4 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -462,6 +462,20 @@ static struct clk_branch disp_cc_mdss_edp_link_clk = {
 	},
 };
 
+static struct clk_regmap_div disp_cc_mdss_edp_link_div_clk_src = {
+	.reg = 0x2288,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_edp_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_mdss_edp_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
 static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
 	.halt_reg = 0x2074,
 	.halt_check = BRANCH_HALT,
@@ -471,7 +485,7 @@ static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_edp_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]){
-				&disp_cc_mdss_edp_link_clk_src.clkr.hw,
+				&disp_cc_mdss_edp_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_GET_RATE_NOCACHE,
@@ -1175,6 +1189,7 @@ static struct clk_regmap *disp_cc_sm8250_clocks[] = {
 	[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = &disp_cc_mdss_edp_gtc_clk_src.clkr,
 	[DISP_CC_MDSS_EDP_LINK_CLK] = &disp_cc_mdss_edp_link_clk.clkr,
 	[DISP_CC_MDSS_EDP_LINK_CLK_SRC] = &disp_cc_mdss_edp_link_clk_src.clkr,
+	[DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = &disp_cc_mdss_edp_link_div_clk_src.clkr,
 	[DISP_CC_MDSS_EDP_LINK_INTF_CLK] = &disp_cc_mdss_edp_link_intf_clk.clkr,
 	[DISP_CC_MDSS_EDP_PIXEL_CLK] = &disp_cc_mdss_edp_pixel_clk.clkr,
 	[DISP_CC_MDSS_EDP_PIXEL_CLK_SRC] = &disp_cc_mdss_edp_pixel_clk_src.clkr,
@@ -1285,7 +1300,11 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 			&disp_cc_mdss_dp_pixel1_clk_src,
 			&disp_cc_mdss_dp_pixel2_clk_src,
 			&disp_cc_mdss_dp_pixel_clk_src,
+			&disp_cc_mdss_edp_aux_clk_src,
+			&disp_cc_mdss_edp_link_clk_src,
+			&disp_cc_mdss_edp_pixel_clk_src,
 			&disp_cc_mdss_esc0_clk_src,
+			&disp_cc_mdss_esc1_clk_src,
 			&disp_cc_mdss_mdp_clk_src,
 			&disp_cc_mdss_pclk0_clk_src,
 			&disp_cc_mdss_pclk1_clk_src,
@@ -1297,6 +1316,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 			&disp_cc_mdss_byte1_div_clk_src,
 			&disp_cc_mdss_dp_link1_div_clk_src,
 			&disp_cc_mdss_dp_link_div_clk_src,
+			&disp_cc_mdss_edp_link_div_clk_src,
 		};
 		unsigned int i;
 		static bool offset_applied;
-- 
2.34.1

