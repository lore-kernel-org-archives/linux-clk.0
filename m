Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0873BC7EE31
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 20:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbjEAUeL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 16:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjEAUeK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 16:34:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EEA268F
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 13:34:07 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f122ff663eso897047e87.2
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 13:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973246; x=1685565246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TTCQEljbFe1KqftdXkSzvsJxAg1A/lzouGmaKfN9Ao=;
        b=x6uqwR3TjndQsqplIQ7bZkBvEd9pPxzu314sinYGYHiZiw0CXcC6b80Rr8SNI5WCkP
         /SC+zyYH98LRKR0JgMCR5BVf9EzyEX7NZNFtPZB58EtEplHAn/bp805V/AC0Nwvolvj1
         pd4hvbXAP6rKdpSoq27mkGJOSGsPzY/EMnADlOEeRipGbexpy3YTgap0k3mL2hfmgrer
         XrcWhtfYSXdrdXxDS8Syg5pVOYuPAHWPG5jq5TizSgDJ1dLVWdkAgq8UeY8wf2G8Tqoy
         bzNsAEs+aJ6vWgI9EAor3Xy5NIkp10JpHAvuHK1UCBVRAom19SrRoaWuhF/DDTSlf4pK
         3l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973246; x=1685565246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TTCQEljbFe1KqftdXkSzvsJxAg1A/lzouGmaKfN9Ao=;
        b=HgpMiSJxrG6y6Kg6NibqXGw2kTzNqpHenTqr34UbID8r2td9zCh2XzpxEpqbzRr9Tw
         ko4vmJbuSC6n0mrI/ZNzljcIRAyY51rKlGY68Wdn9iSJl0MUsxUKTa4AnnmLXkFCKutO
         6Ee5ypBHemLPWsEvKEG27UoAGZfmWDBOEoldzW5hyjS5Q1uON57AhYzKM/2NEYQK9RhL
         +1Hif/sm2CYITP1+86hubb/GkFKWbVgPPGTZJndUZVPlavU3ykk2QmruMIq9uu8cFns9
         bg50dF63r5+M/IwL/Z/9SO7ShI1hRQ2dQHXjm3/qpJPF1RcSFRGEsopAvnUkW9Ie25nj
         KXCA==
X-Gm-Message-State: AC+VfDwy96B/IlUo8Y5L0RBuOjdjHRMWRLZ2j1Yr2qZs4msFo6aEtC4i
        kwIpJ2nZRpgjNbejG5Iy+KT0Pw==
X-Google-Smtp-Source: ACHHUZ5A//1ID0wF1po4EbUdaR0xKIQnHfekjcyCPIY5DUSiiBW7VgXvOtWGkUyx8KvfUSdaEOb4AA==
X-Received: by 2002:a05:6512:403:b0:4f0:1644:6bbc with SMTP id u3-20020a056512040300b004f016446bbcmr3000154lfk.54.1682973246134;
        Mon, 01 May 2023 13:34:06 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:05 -0700 (PDT)
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
Subject: [PATCH 04/10] clk: qcom: gcc-mdm9615: use ARRAY_SIZE instead of specifying num_parents
Date:   Mon,  1 May 2023 23:33:55 +0300
Message-Id: <20230501203401.41393-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

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

