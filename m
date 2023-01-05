Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77E9C54EBE
	for <linux-clk@archiver.kernel.org>; Thu,  5 Jan 2023 13:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbjAENlp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Jan 2023 08:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbjAENlm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Jan 2023 08:41:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE4A13D37
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 05:41:40 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g13so55047713lfv.7
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijyCIc2+1LdDHm2IZSFRYU98nKrajPamZIXNdyTLYPk=;
        b=f969wRH0k1gVj5+JTgy90oCvDPrrrz8qUj9kDM1F3Ag3tAMU5oacD1MG4Z6OSkaXfu
         iUHbI06rTTt4VQVSPlmqrCg7qwYFzulqnlx/68ay2wrCLB6GTmQWrkEg6iZ5VJ0LZ87R
         9nq3FbIM0D6lFqM2Y7RuhRktheGw5+ig8EmK7c5RJagBc4T75bGwXZjltGkY2xmN6caI
         geSPguYDlV2bcwYwqAysXWIT23972FmN7m0BJq90LtE1GvHB8i5vR4D2rOkfSDFm7URp
         GKzgCD5Nz7ocWZN3kxveHGq4ZHwk7skX+OPjy8rwg5hK+hRHxgUo33YF6biLea0ZhERI
         pN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijyCIc2+1LdDHm2IZSFRYU98nKrajPamZIXNdyTLYPk=;
        b=2gmHOM6LIn/FnYSDyov5lEzEA19N+EuDyLsBbmr424dhTM4NkcflyUWdGm96wXOJoL
         8MPp/UFPllwWROaZG6BSMoaTt9Y7sdhiLkqJ9udz6VkTZXpFego8d3kR7VOAUfgWpGd4
         yhrihNUsf8tZrctZ/QrBkQiyA83HujESesvaI2NZrab32r0cOHZ+ldSZawJQX7YKpMmw
         CSmGuZodWu/HukCFqC2vtMawhFzzLvPCaUXGZl/41zqIRaS0Kum+Et9bU5JUIBpwGxRf
         OA5+n3mpTjeL0s6TQepZHT55AWPgixWkEWvonErgpEIaY+6Bx6OpBj6nJMnp0Nn+9qW+
         hYzw==
X-Gm-Message-State: AFqh2kqVIbxZged8on1c1oQo77liyDrsovVava5GkH1YB7QvCXgItC+k
        5P8mON5cN9i1bLcdUsE7BBmCjQ==
X-Google-Smtp-Source: AMrXdXtpuzCFjcP23N3Bq22jg1RDvhSZ5O1gATkKirzYRLBxh0+b16jsLjFiaFypjwlx6AJQcVElBA==
X-Received: by 2002:ac2:5503:0:b0:4b5:9845:c8a9 with SMTP id j3-20020ac25503000000b004b59845c8a9mr13630877lfk.47.1672926100492;
        Thu, 05 Jan 2023 05:41:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:40 -0800 (PST)
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
Subject: [PATCH v2 08/12] clk: qcom: mmcc-apq8084: use ARRAY_SIZE instead of specifying num_parents
Date:   Thu,  5 Jan 2023 15:41:29 +0200
Message-Id: <20230105134133.1550618-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-apq8084.c | 88 ++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index e9f971359155..4acbcb43927f 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -319,7 +319,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmss_ahb_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -344,7 +344,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmss_axi_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -368,7 +368,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ocmemnoc_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -387,7 +387,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -400,7 +400,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -413,7 +413,7 @@ static struct clk_rcg2 csi2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -426,7 +426,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi3_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -456,7 +456,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -469,7 +469,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -497,7 +497,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_names = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -509,7 +509,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_2_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_2_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -532,7 +532,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -545,7 +545,7 @@ static struct clk_rcg2 jpeg1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -558,7 +558,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg2_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -571,7 +571,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -585,7 +585,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -610,7 +610,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_3_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_3_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -629,7 +629,7 @@ static struct clk_rcg2 vp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vp_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -648,7 +648,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -672,7 +672,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -686,7 +686,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -714,7 +714,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -728,7 +728,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -742,7 +742,7 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -756,7 +756,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk3_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -775,7 +775,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -788,7 +788,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -801,7 +801,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2phytimer_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -824,7 +824,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -836,7 +836,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -849,7 +849,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -868,7 +868,7 @@ static struct clk_rcg2 edpaux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edpaux_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -887,7 +887,7 @@ static struct clk_rcg2 edplink_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edplink_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -907,7 +907,7 @@ static struct clk_rcg2 edppixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edppixel_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp),
 		.ops = &clk_edp_pixel_ops,
 	},
 };
@@ -925,7 +925,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -938,7 +938,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -956,7 +956,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "extpclk_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_byte_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -975,7 +975,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -993,7 +993,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1011,7 +1011,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbcpr_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1029,7 +1029,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbbmtimer_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1052,7 +1052,7 @@ static struct clk_rcg2 maple_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "maple_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1074,7 +1074,7 @@ static struct clk_rcg2 vdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vdp_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1093,7 +1093,7 @@ static struct clk_rcg2 vpu_bus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vpu_bus_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.39.0

