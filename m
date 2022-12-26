Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3C4C5479D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 04:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbiLZEWP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Dec 2022 23:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbiLZEWE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Dec 2022 23:22:04 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B149F272A
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:02 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id z26so14684651lfu.8
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM1NA3WnzCUzuM7DIb0MXBpOI8QpMEHVGqr4lbpcw6E=;
        b=ePvzrTg0SDyKWv3XcziFp1y3BAjEtmWHW0GA+1aKDoQWIHSufAbsqo/gqVd43mYIiC
         a1pGnvqhD2pQmtpvKi2sWN830SGZjT65qpsccCFbpkI64CyDsPrneC44V10WaXqu7fjO
         xi4HlgaUni/JBmaFqOS8mTaWKEDtkVyOL0i8baT/Ckoauet9D7gjTWpranLvOLGoT5Co
         Ksq+ZnV2iY0IhJrO17Oihss6u3N2T2+wVmZnsCr2tSoCaep9a2XWARtpdxfTw7fUnNY4
         A/vrDsoammeRN5ZjLIFlE+m+5hmTC/tepjj/B4TsOUDcgRp3c8tbuLm7L+qIKF+JVGMV
         Oefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM1NA3WnzCUzuM7DIb0MXBpOI8QpMEHVGqr4lbpcw6E=;
        b=AvvGS6VtIjlRi/bsLPqGRa+xZI+E+5qNdBs3tjRTDv0V+zifrq5NdaTITrHXTnBH3g
         qeXS5C3J962wZh6dmblGRDCDYNYa1PvGPS/0zDbQbtvyk6fPHAJ+FI0cs/9N2UAv9gDf
         E5UZzDi4tsfIlqu9Hju4w6yLDfV95zywBzzM4DwvKBNTnAcedHbjh8YWhaNpImwsiu4S
         4XkLWRlh+dWENCjUKcYddcakg+5C0D0911zUbGchAk2xSZ/AJcg7c6386RIXgww/cPP5
         v4zZ22bQTUDmvhHZEVWWdwPxaBqmEGQuN10i5j0Hh99KWgNVEGog3qoigTwmuBSGge1Y
         SlaQ==
X-Gm-Message-State: AFqh2kq8HzPhObgkR8pS5+nbeXpsM+/7ySIDxkn481h5yVUsxjd7uud9
        ax/2T2lv8iOo1i87PGw5I+tbgw==
X-Google-Smtp-Source: AMrXdXtW1nCgdkbrHXhcjicn6j2V9OWLvwvd/Dr0BDIf9EddSzEQOU0pvITg7xzFjdqMkeGI5CcTQQ==
X-Received: by 2002:a05:6512:c7:b0:4cb:7c2:8cb6 with SMTP id c7-20020a05651200c700b004cb07c28cb6mr567846lfp.44.1672028521102;
        Sun, 25 Dec 2022 20:22:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:00 -0800 (PST)
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
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 08/16] clk: qcom: gcc-qcs404: get rid of the test clock
Date:   Mon, 26 Dec 2022 06:21:46 +0200
Message-Id: <20221226042154.2666748-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 241768da2263..e1d1d3a700f7 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -22,7 +22,6 @@
 #include "reset.h"
 
 enum {
-	P_CORE_BI_PLL_TEST_SE,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
 	P_GPLL0_OUT_MAIN,
@@ -39,29 +38,24 @@ enum {
 static const struct parent_map gcc_parent_map_0[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_0[] = {
 	"cxo",
 	"gpll0_out_main",
-	"core_bi_pll_test_se",
 };
 
 static const char * const gcc_parent_names_ao_0[] = {
 	"cxo",
 	"gpll0_ao_out_main",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
 	{ P_XO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_1[] = {
 	"cxo",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -82,50 +76,42 @@ static const struct parent_map gcc_parent_map_3[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL6_OUT_AUX, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_3[] = {
 	"cxo",
 	"gpll0_out_main",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_XO, 0 },
 	{ P_GPLL1_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_4[] = {
 	"cxo",
 	"gpll1_out_main",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
 	"dsi0pllbyte",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
 	"dsi0pllbyte",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_7[] = {
@@ -133,7 +119,6 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL3_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_7[] = {
@@ -141,19 +126,16 @@ static const char * const gcc_parent_names_7[] = {
 	"gpll0_out_main",
 	"gpll3_out_main",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_8[] = {
 	{ P_XO, 0 },
 	{ P_HDMI_PHY_PLL_CLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_8[] = {
 	"cxo",
 	"hdmi_pll",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_9[] = {
@@ -161,7 +143,6 @@ static const struct parent_map gcc_parent_map_9[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_9[] = {
@@ -169,43 +150,36 @@ static const char * const gcc_parent_names_9[] = {
 	"gpll0_out_main",
 	"dsi0pll",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_10[] = {
 	{ P_XO, 0 },
 	{ P_SLEEP_CLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_10[] = {
 	"cxo",
 	"sleep_clk",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_11[] = {
 	{ P_XO, 0 },
 	{ P_PCIE_0_PIPE_CLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_11[] = {
 	"cxo",
 	"pcie_0_pipe_clk",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_12[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
 	"dsi0pll",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_13[] = {
@@ -213,7 +187,6 @@ static const struct parent_map gcc_parent_map_13[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_13[] = {
@@ -221,41 +194,34 @@ static const char * const gcc_parent_names_13[] = {
 	"gpll0_out_main",
 	"gpll4_out_main",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_14[] = {
 	"cxo",
 	"gpll0_out_main",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_15[] = {
 	{ P_XO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_15[] = {
 	"cxo",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_16[] = {
 	"cxo",
 	"gpll0_out_main",
-	"core_bi_pll_test_se",
 };
 
 static struct clk_fixed_factor cxo = {
-- 
2.35.1

