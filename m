Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47396C3DA6E
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiLQAYH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiLQAXM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:12 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7310A7E293
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id cf42so5926964lfb.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejXopAhmRRfTQDrdbh16bauZClOndTKd32RJWFyXEFU=;
        b=dYtsxszz6l5UcPVkjExiam2/97xRQisgIa0UB/Il4mVIiT2P252UlZw6bgMIWUFAgQ
         E1DVglMosZw037HOHu/bbpXq1nwUZ7Vplv2VAuO5gfgVqSgbUcmNY5IaJ1XufncEuv6p
         lZpuqODDXyyOceDDjEsNg0k5LoxQ9yxH9tntsg06i4SGCSmvy3avIF0UbZFNPwFsxR3I
         F80PDpxtbv79y0hsNxbX5Y60fAW0/AXxihbRuXS4Ui1L2Jgol8ojckIMJL+sGi7cVKQJ
         fhosyd63VGRs32hF9ksOqZqHebhKR+g3FuRx6dGcIxaH/zGaPPiepPlRH9iXs81wO7tY
         0o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejXopAhmRRfTQDrdbh16bauZClOndTKd32RJWFyXEFU=;
        b=vcD3mUbCQbuwJzc2H9fFlv4nO5gIQyEPDUFAarBwRw1H9V7txm7ryHfbaihQ8twzcZ
         sNG1fZX40jCGeIo9RLLwKqnxmcd+X5U0a1cwCffL81BCrftGgzw+WSJPL+3RaJS3A7SK
         Y4mbvK2ynNRk6XxppN3lidqEIp+szwYW9rQ35G+RmZYf+TDaLC3zoWp9XL7igJ0oFQOy
         tJQy8dCdtkomm+Lyr0jqI+9/Qv/fduRjuAOxlPEIUSCcjtlGvEvqg8pghjfmMbxkTVhs
         va37KQtUf+iUIRcPE0P41dsnusmCwJkUdiU0i57Tfr/2nnbsgu3Sl6Sy2lpOxfYGKXyc
         LEEQ==
X-Gm-Message-State: ANoB5pmGR6j+dz/r1ajYv9O7gbUQH/h4FSzmLjVe0XzO8f+flDLN9cWR
        QfRq80Ite9KKPS/Cokk5sBz2Tw==
X-Google-Smtp-Source: AA0mqf50aFXRjcQx+lhAftVnc/V/OyvpBQagzqCn1VULHTJ2/UKawruwu48xa0lzZ1KO1+1z24ZiPA==
X-Received: by 2002:a05:6512:128e:b0:4a4:68b8:f4e5 with SMTP id u14-20020a056512128e00b004a468b8f4e5mr12619645lfs.43.1671236257843;
        Fri, 16 Dec 2022 16:17:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:37 -0800 (PST)
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
Subject: [PATCH 08/15] clk: qcom: gcc-qcs404: get rid of the test clock
Date:   Sat, 17 Dec 2022 02:17:23 +0200
Message-Id: <20221217001730.540502-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 5636c6524d0f..fb94c57a00af 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -22,7 +22,6 @@
 #include "reset.h"
 
 enum {
-	P_CORE_BI_PLL_TEST_SE,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
 	/* P_GPLL0_OUT_AUX, */
@@ -41,29 +40,24 @@ enum {
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
@@ -84,54 +78,46 @@ static const struct parent_map gcc_parent_map_3[] = {
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
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
 	"dsi0pllbyte",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
 	/* { P_GPLL0_OUT_AUX, 3 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
 	"dsi0pllbyte",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_7[] = {
@@ -140,7 +126,6 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL3_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
 	/* { P_GPLL4_OUT_AUX, 4 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_7[] = {
@@ -149,19 +134,16 @@ static const char * const gcc_parent_names_7[] = {
 	"gpll3_out_main",
 	"gpll6_out_aux",
 	/* "gpll4_out_aux", */
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
@@ -169,7 +151,6 @@ static const struct parent_map gcc_parent_map_9[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_9[] = {
@@ -177,45 +158,38 @@ static const char * const gcc_parent_names_9[] = {
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
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
 	"dsi0pll",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_13[] = {
@@ -223,7 +197,6 @@ static const struct parent_map gcc_parent_map_13[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_13[] = {
@@ -231,47 +204,40 @@ static const char * const gcc_parent_names_13[] = {
 	"gpll0_out_main",
 	"gpll4_out_main",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	/* { P_GPLL4_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_14[] = {
 	"cxo",
 	"gpll0_out_main",
 	/* "gpll4_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_15[] = {
 	{ P_XO, 0 },
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_15[] = {
 	"cxo",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_16[] = {
 	"cxo",
 	"gpll0_out_main",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static struct clk_fixed_factor cxo = {
-- 
2.35.1

