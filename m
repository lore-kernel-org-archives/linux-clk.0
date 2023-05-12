Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E266C7EE32
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239663AbjELAcj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239640AbjELAch (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:32:37 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329C65FDD
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:35 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4eed764a10cso10421129e87.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851554; x=1686443554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rGi/NnkYpsaHJmbUKuFpyB62vBDUc9bbRKMXo+UCkc=;
        b=uW4CUZA2JrJDj2lSzLUJTYaygk/Uv0wJinfTPFgnq4+MtveyYOefj5/5grv0ibYWjl
         yhvdz2tcR++ivK9HAgnUTqgG+FktsQtIMr3R95YONAR4p1sKANi+MYirW2Ax+49mKOPr
         uzASELcKAO/s1PuxR1ZY3wMlhq/zkFV92/Z6Jd7IUH1d46WGmUCQwaTDjNVLaw8+NZ9u
         mkK3JVgBAwU9NBpnW67JD08qGzpqQHoTlOp15RalxrGX7RWdd36ZCp9+v4KV9YbZeBbl
         t8Kqwt0qX3pTXWJF7GgvGCHDYzxbGagn06+wvNEL1vSiMu0DGW8D6LTz3cTWSrk71bXv
         +vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851554; x=1686443554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rGi/NnkYpsaHJmbUKuFpyB62vBDUc9bbRKMXo+UCkc=;
        b=NcJBKEu5WGljLVb03BRdSeS3Qzx+JKnP/oz5xX8pXjFltiA5jDlrAM4fH6GCwYKg8b
         jj3Iy9rpPpk/1ur2QGOU0fMNzxVFHNmE6V7io2EHTCyr6mmugH/pJyOWSVQMeoZ5VDQ0
         IhAZxa+vOK+TKCWhNH1E016dneeX0RLwQw3Cwu1RD53okxVDFw1UMIocz4u8UxkUp9Gu
         e1D8evf0VsuIZG2Au4PfdI1/bsLbV8QwPgpCkvrxmqXv4xsfWD6A242QpnJQKI3EDsls
         LkcQWktcp8/YlzRlwfWxecvATqAMp8hX5B9TTrZjoft87ZaS5R0MaJMES/TwYcUXEHAm
         t4mg==
X-Gm-Message-State: AC+VfDy4t0dDILk9eDfKDFcaffdiUFQQE2nNc5PT+2uJRhBC5nd8Wgsf
        gyA+oDFF977w3fMOwcajNqfKcQ==
X-Google-Smtp-Source: ACHHUZ5/O+yCx+X7Mtu8YViE1nONIWjXZs/necUFsPTOGhZ09zM7q0gYfHKFBMWyBqf/EWcId+5T8Q==
X-Received: by 2002:a19:7403:0:b0:4f0:4b:538f with SMTP id v3-20020a197403000000b004f0004b538fmr3139063lfe.29.1683851554659;
        Thu, 11 May 2023 17:32:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:34 -0700 (PDT)
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
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 04/10] clk: qcom: gcc-mdm9615: use ARRAY_SIZE instead of specifying num_parents
Date:   Fri, 12 May 2023 03:32:24 +0300
Message-Id: <20230512003230.3043284-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 42 +++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index 8bed02a748ab..fb5c1244fb97 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -207,7 +207,7 @@ static struct clk_rcg gsbi1_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -258,7 +258,7 @@ static struct clk_rcg gsbi2_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -309,7 +309,7 @@ static struct clk_rcg gsbi3_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -360,7 +360,7 @@ static struct clk_rcg gsbi4_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -411,7 +411,7 @@ static struct clk_rcg gsbi5_uart_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -474,7 +474,7 @@ static struct clk_rcg gsbi1_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -523,7 +523,7 @@ static struct clk_rcg gsbi2_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -572,7 +572,7 @@ static struct clk_rcg gsbi3_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -621,7 +621,7 @@ static struct clk_rcg gsbi4_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -670,7 +670,7 @@ static struct clk_rcg gsbi5_qup_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -725,7 +725,7 @@ static struct clk_rcg gp0_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_src",
 			.parent_names = gcc_cxo,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(gcc_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
 		},
@@ -774,7 +774,7 @@ static struct clk_rcg gp1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_src",
 			.parent_names = gcc_cxo,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(gcc_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -823,7 +823,7 @@ static struct clk_rcg gp2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_src",
 			.parent_names = gcc_cxo,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(gcc_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -875,7 +875,7 @@ static struct clk_rcg prng_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "prng_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -937,7 +937,7 @@ static struct clk_rcg sdc1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -985,7 +985,7 @@ static struct clk_rcg sdc2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
 	}
@@ -1038,7 +1038,7 @@ static struct clk_rcg usb_hs1_xcvr_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1087,7 +1087,7 @@ static struct clk_rcg usb_hsic_xcvr_fs_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_xcvr_fs_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1142,7 +1142,7 @@ static struct clk_rcg usb_hs1_system_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_system_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1197,7 +1197,7 @@ static struct clk_rcg usb_hsic_system_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_system_src",
 			.parent_names = gcc_cxo_pll8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -1252,7 +1252,7 @@ static struct clk_rcg usb_hsic_hsic_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_hsic_src",
 			.parent_names = gcc_cxo_pll14,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_cxo_pll14),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
-- 
2.39.2

