Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE95AC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiLQAXf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiLQAXF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:05 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED5D7E28B
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:35 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y25so5868170lfa.9
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLCQS/qyadMYzhZe+WKwfd/qeqY2NB2bw2gUTzVHsiQ=;
        b=QX2FeG8BeCiqCtwIDLu55mL1M+frzyUA0axYrr9KmN65jxE9IYkeGq8bpG4tOYJfw3
         uJ9rcNUeByW81vRO15l5slE2bnO6NdMXEjNkPsYHjKsNXFqJewOIYvTsLYfhUbw7hN1N
         AaemDDgiRIHG/pXn/gsCpprD1at+1nNWstafAm1jNwo1z6GZdGr66XT1eMF5e74Is/1g
         uQKekWKCnn2ysdp57mYt1LdKRcJXq6yViFwTAIyjVUWLle+atg0S1yiu/1sTsljN5bDC
         LYUj2j3WGdofQXk1g0vhJBcWllfVsyzH6//408p6LLHan2OHsRoGUwOFgkbQEiPyMjb4
         FB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLCQS/qyadMYzhZe+WKwfd/qeqY2NB2bw2gUTzVHsiQ=;
        b=4ZTW/BXh/LIkoIkpTUKdFe48SmGHQT4EDGSg0yDy1qH7YGp21iRjG3Psz8T2PFPb+C
         FvfixmsUGHmRn5oN2cNpzrvmjKJym21Qx7PO39Y9yQflRInAPBlpS4YPTb0RgkHa9Z+c
         1Jiqx8TP2YUmWeIDXT06PSoEr0qB417oA3qeWJTS1pBQ43FdhvmK/Bt4u6VnkHHcyVaV
         5I9G35jtTi3Z9xUZgZXni4jPPw4AJMYFCeIm3YgfpNyE8JutLyj48q3z9zUMlFYv2w9L
         3UO7i8ly43TjDVEnvmuhfWtIeqQp0qEeBE68O9Z+LZ/Sy7JbCks6WfwEEnGilOm25Lx0
         P1qA==
X-Gm-Message-State: ANoB5plp3zbyoh0V8e5gIHYm9dAyC4Ab9vYAAf+CIcjoBUOkmpbjmTBN
        3P4htQ7UJl0NIMR7im62xpIMfg==
X-Google-Smtp-Source: AA0mqf7sa4XimbTgeL+8mE5buOGeTVE1zuqMf1oaozBa6trF7N2S29zZTYSgJyGo0f8utIBkJOOaPA==
X-Received: by 2002:a05:6512:790:b0:4b5:9b8f:cc82 with SMTP id x16-20020a056512079000b004b59b8fcc82mr8396473lfr.0.1671236255382;
        Fri, 16 Dec 2022 16:17:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:35 -0800 (PST)
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
Subject: [PATCH 05/15] clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
Date:   Sat, 17 Dec 2022 02:17:20 +0200
Message-Id: <20221217001730.540502-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On the QCS404 platform the driver for the Global Clock Controller
doens't define gpll0_out_aux and gpll4_out_aux clocks, so it's not
possible to use them as parents. Comment out entries for these clocks.

Note: backporting this patch to earlier kernels would also require a
previous patch which switches the gcc driver to use ARRAY_SIZE for
parent data arrays.

Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index f60a0ab42da1..c48326da1bb3 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -25,11 +25,11 @@ enum {
 	P_CORE_BI_PLL_TEST_SE,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
-	P_GPLL0_OUT_AUX,
+	/* P_GPLL0_OUT_AUX, */
 	P_GPLL0_OUT_MAIN,
 	P_GPLL1_OUT_MAIN,
 	P_GPLL3_OUT_MAIN,
-	P_GPLL4_OUT_AUX,
+	/* P_GPLL4_OUT_AUX, */
 	P_GPLL4_OUT_MAIN,
 	P_GPLL6_OUT_AUX,
 	P_HDMI_PHY_PLL_CLK,
@@ -109,28 +109,28 @@ static const char * const gcc_parent_names_4[] = {
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
 	"dsi0pll_byteclk_src",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_GPLL0_OUT_AUX, 3 },
+	/* { P_GPLL0_OUT_AUX, 3 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
 	"dsi0_phy_pll_out_byteclk",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
@@ -139,7 +139,7 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL3_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_GPLL4_OUT_AUX, 4 },
+	/* { P_GPLL4_OUT_AUX, 4 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
@@ -148,7 +148,7 @@ static const char * const gcc_parent_names_7[] = {
 	"gpll0_out_main",
 	"gpll3_out_main",
 	"gpll6_out_aux",
-	"gpll4_out_aux",
+	/* "gpll4_out_aux", */
 	"core_bi_pll_test_se",
 };
 
@@ -207,14 +207,14 @@ static const char * const gcc_parent_names_11[] = {
 static const struct parent_map gcc_parent_map_12[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
 	"dsi0pll_pclk_src",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
@@ -237,40 +237,40 @@ static const char * const gcc_parent_names_13[] = {
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL4_OUT_AUX, 2 },
+	/* { P_GPLL4_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_14[] = {
 	"cxo",
 	"gpll0_out_main",
-	"gpll4_out_aux",
+	/* "gpll4_out_aux", */
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_15[] = {
 	{ P_XO, 0 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_15[] = {
 	"cxo",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_16[] = {
 	"cxo",
 	"gpll0_out_main",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
-- 
2.35.1

