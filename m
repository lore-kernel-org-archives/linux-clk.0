Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9754CCA47F
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 11:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241387AbiFTLIH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 07:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241311AbiFTLHu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 07:07:50 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469561583A
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:07:46 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w20so16650599lfa.11
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sQ5+1O9VbjvRDK3yHlWG4rq3V/ntDnZCkb1c0Vvaf6A=;
        b=wka5638RRp/lUiS4l4Bw1Z7+OSxqqRaBRdeWdmzEdwocB325nRBj9e5aEKlOnBAAAA
         /Qp8gTqrl4CJ1ySGpolKWcGUxgjHinQorDxO8LoDkbjjCTlloNVgGDFzJIUpLuj2axhC
         kLoO1vNT/J8uSHchxIHiTzxHnCASm4fzMs37aci2/fgwfzU4N7uBQqrbmzq5wcwAav/A
         My9z4UK65BgyJCzDYHihCHftFTDJww0/JLAyMeZpGAE7SdeDCu+fWsBFhCUA9/O98vTw
         d0v4XnaymgMm5hRcuWxEG+2PXKemuqRPSPcBN+FW/Xo8B89F+87cfGzzKeHJvKNw+vH+
         vYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sQ5+1O9VbjvRDK3yHlWG4rq3V/ntDnZCkb1c0Vvaf6A=;
        b=jo8QQrTx3Of1nXH16rONcNrG7+nM4fvOtoIv5xyOBa3NIalX/WlChxd1l84eAWl+mV
         a5VOK3vr+/LKLEOjmGt2WIzzE1kGl5+uIOfx0oLF5aFEGpFm6+/qC3ucjsXZONn6Nacd
         pU8QTHdkaDvkC3vfSga1x5wmao5TU4oIjQa6lvyEKICEzt7Csq3ro5zLHMVIOcibsK58
         Gf8EZS45UMEKBTxkccQngau0pGIJHucyNCWzkWYe1K4sLjsTVE3YBtrxrjp5Jma5Hbwc
         MBGTpXDNY5VE4b1LhyIi2shtFeFkpiaw2FK90dXFcl0oJ34Gpi0FBl/58b2JF/4Prmq2
         v0Rw==
X-Gm-Message-State: AJIora/x25rkwxB6zgiXdlMoJyNba9hCoq8tXF8rdNSMNMW5RDJJot8J
        rnfHPikDEdqfZw5Npb4XSjqxTw==
X-Google-Smtp-Source: AGRyM1vSQ3qHXmQ8FNMoj5Y9e9Ir55K7c0xLxkfMCXc1CX7VxOCLwswcEO1/iuH6jSoA0M4olHjxyw==
X-Received: by 2002:a05:6512:16a7:b0:445:862e:a1ba with SMTP id bu39-20020a05651216a700b00445862ea1bamr12926904lfb.85.1655723264390;
        Mon, 20 Jun 2022 04:07:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a194f13000000b00479a825aa5esm1722564lfb.154.2022.06.20.04.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:07:43 -0700 (PDT)
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
Subject: [PATCH 2/4] clk: qcom: gcc-msm8660: use ARRAY_SIZE instead of specifying num_parents
Date:   Mon, 20 Jun 2022 14:07:37 +0300
Message-Id: <20220620110739.1598514-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8660.c | 82 +++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index 94ea2d84d1b1..3c623dc4977b 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -123,7 +123,7 @@ static struct clk_rcg gsbi1_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -174,7 +174,7 @@ static struct clk_rcg gsbi2_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -225,7 +225,7 @@ static struct clk_rcg gsbi3_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -276,7 +276,7 @@ static struct clk_rcg gsbi4_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -327,7 +327,7 @@ static struct clk_rcg gsbi5_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -378,7 +378,7 @@ static struct clk_rcg gsbi6_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -429,7 +429,7 @@ static struct clk_rcg gsbi7_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -480,7 +480,7 @@ static struct clk_rcg gsbi8_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -529,7 +529,7 @@ static struct clk_rcg gsbi9_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -578,7 +578,7 @@ static struct clk_rcg gsbi10_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -627,7 +627,7 @@ static struct clk_rcg gsbi11_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -676,7 +676,7 @@ static struct clk_rcg gsbi12_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_uart_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -738,7 +738,7 @@ static struct clk_rcg gsbi1_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -787,7 +787,7 @@ static struct clk_rcg gsbi2_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -836,7 +836,7 @@ static struct clk_rcg gsbi3_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -885,7 +885,7 @@ static struct clk_rcg gsbi4_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -934,7 +934,7 @@ static struct clk_rcg gsbi5_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -983,7 +983,7 @@ static struct clk_rcg gsbi6_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1032,7 +1032,7 @@ static struct clk_rcg gsbi7_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1081,7 +1081,7 @@ static struct clk_rcg gsbi8_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1130,7 +1130,7 @@ static struct clk_rcg gsbi9_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1179,7 +1179,7 @@ static struct clk_rcg gsbi10_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1228,7 +1228,7 @@ static struct clk_rcg gsbi11_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1277,7 +1277,7 @@ static struct clk_rcg gsbi12_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_qup_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1339,7 +1339,7 @@ static struct clk_rcg gp0_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_src",
 			.parent_names = gcc_pxo_pll8_cxo,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -1388,7 +1388,7 @@ static struct clk_rcg gp1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_src",
 			.parent_names = gcc_pxo_pll8_cxo,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1437,7 +1437,7 @@ static struct clk_rcg gp2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_src",
 			.parent_names = gcc_pxo_pll8_cxo,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1489,7 +1489,7 @@ static struct clk_rcg prng_src = {
 		.init = &(struct clk_init_data){
 			.name = "prng_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -1548,7 +1548,7 @@ static struct clk_rcg sdc1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1596,7 +1596,7 @@ static struct clk_rcg sdc2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1644,7 +1644,7 @@ static struct clk_rcg sdc3_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1692,7 +1692,7 @@ static struct clk_rcg sdc4_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc4_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1740,7 +1740,7 @@ static struct clk_rcg sdc5_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc5_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1793,7 +1793,7 @@ static struct clk_rcg tsif_ref_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_ref_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1847,7 +1847,7 @@ static struct clk_rcg usb_hs1_xcvr_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1896,7 +1896,7 @@ static struct clk_rcg usb_fs1_xcvr_fs_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_xcvr_fs_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1914,7 +1914,7 @@ static struct clk_branch usb_fs1_xcvr_fs_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_xcvr_fs_clk",
 			.parent_names = usb_fs1_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs1_xcvr_fs_src_p),
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -1929,7 +1929,7 @@ static struct clk_branch usb_fs1_system_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = usb_fs1_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs1_xcvr_fs_src_p),
 			.name = "usb_fs1_system_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1963,7 +1963,7 @@ static struct clk_rcg usb_fs2_xcvr_fs_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_xcvr_fs_src",
 			.parent_names = gcc_pxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_pxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1981,7 +1981,7 @@ static struct clk_branch usb_fs2_xcvr_fs_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_xcvr_fs_clk",
 			.parent_names = usb_fs2_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs2_xcvr_fs_src_p),
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -1997,7 +1997,7 @@ static struct clk_branch usb_fs2_system_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_system_clk",
 			.parent_names = usb_fs2_xcvr_fs_src_p,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(usb_fs2_xcvr_fs_src_p),
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
-- 
2.35.1

