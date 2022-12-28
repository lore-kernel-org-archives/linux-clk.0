Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6C1C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbiL1Ndb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbiL1NdA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:33:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9AFFAFE
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:59 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id z26so23642015lfu.8
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stqRnlsi18apgRZUrzRrn07ImuYozpaA515MKTA31uc=;
        b=RjJ49XRu33XO1WP3+hJQuTExPY9niK7zFFyT7wqU9d4XiHJmIKz8GBwkoExkx6apCE
         gZSLVQuRkkBE4AtQpw5NQc2GxsBjm6kNBZixvKAddaedXxAJ+q2it6LDuF1axAqITD0D
         5fqYWgHFq97r8lagI3kFN2ByQH09J1qU527lcZ4TxazCQFgvAQRBcjRUo7+2z7H3mGR3
         IrmgZXPL4V4BjlH5SqmeNvKiMA59n4fkUTi8D0YQ2H8tiINvWyDmix85NeZNULyr8zUJ
         vQ6Uqucdu+HoUglbKAc3VdoztGI7KWf/mNpI+T8dvPgf46jJz41fNPZ6QOzGm8po8FLy
         VDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stqRnlsi18apgRZUrzRrn07ImuYozpaA515MKTA31uc=;
        b=bQh/dHehtn3wBOMv66OvcH0wadJUwa3VIwsl8oQSWu/F8x5ilBHCwQ247lbcScSASQ
         tY/pUlIOnALdlgdUCt++LHrVsSTI5Vi06qiYJ/9UfIGTa3zSUrIt1OyjNrqGwOiXcL3q
         WB/UxiWRr5Q3ioLlDNFWCoTHDgUZIpBFkkoAZbm/2uAKphHLf1AGibRKexnl3wG8wcyK
         KmjI+Q2YxFzIqPdUorOQQdrNB1D7Vk9UWm9YF/1K9ZybdxR3Sx+682/i8axGLsRv/ddi
         MRdD4Yfbzya+3J50N3sxH2V+z+oBO1ZMdbY8XvA2wZKg+nTEcxHgxMHRt8D9cMMYvCs6
         G6zg==
X-Gm-Message-State: AFqh2kpXwyTqQtuvSmgFm+SodwO9fQImVeyKKG7Jh+OoqZP7oMIui8P8
        m/OmWd5dmhuR38zD4AETtBrWdg==
X-Google-Smtp-Source: AMrXdXvvvQ5P0vl6/ZQ9gQAf/yo2g5r6EI3SkSCAlOKHG5lG9umdBkCZ+63+6HXlXAbQ8eHH7SX9rA==
X-Received: by 2002:a05:6512:10c3:b0:4ca:dee9:543a with SMTP id k3-20020a05651210c300b004cadee9543amr8797928lfg.32.1672234377475;
        Wed, 28 Dec 2022 05:32:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:57 -0800 (PST)
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
Subject: [PATCH 15/16] clk: qcom: mmcc-msm8998: get rid of test clock
Date:   Wed, 28 Dec 2022 15:32:42 +0200
Message-Id: <20221228133243.3052132-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index c421b1291651..4490594bde69 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -44,7 +44,6 @@ enum {
 	P_HDMIPLL,
 	P_DPVCO,
 	P_DPLINK,
-	P_CORE_BI_PLL_TEST_SE,
 };
 
 static struct clk_fixed_factor gpll0_div = {
@@ -303,69 +302,59 @@ static struct clk_alpha_pll_postdiv mmpll10_out_even = {
 static const struct parent_map mmss_xo_hdmi_map[] = {
 	{ P_XO, 0 },
 	{ P_HDMIPLL, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_hdmi[] = {
 	{ .fw_name = "xo" },
 	{ .fw_name = "hdmipll" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
 	{ P_XO, 0 },
 	{ P_DSI0PLL, 1 },
 	{ P_DSI1PLL, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_dsi0pll_dsi1pll[] = {
 	{ .fw_name = "xo" },
 	{ .fw_name = "dsi0dsi" },
 	{ .fw_name = "dsi1dsi" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_dsibyte_map[] = {
 	{ P_XO, 0 },
 	{ P_DSI0PLL_BYTE, 1 },
 	{ P_DSI1PLL_BYTE, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_dsibyte[] = {
 	{ .fw_name = "xo" },
 	{ .fw_name = "dsi0byte" },
 	{ .fw_name = "dsi1byte" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_dp_map[] = {
 	{ P_XO, 0 },
 	{ P_DPLINK, 1 },
 	{ P_DPVCO, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_dp[] = {
 	{ .fw_name = "xo" },
 	{ .fw_name = "dplink" },
 	{ .fw_name = "dpvco" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_gpll0_gpll0_div[] = {
 	{ .fw_name = "xo" },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
@@ -373,7 +362,6 @@ static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
 	{ P_MMPLL0_OUT_EVEN, 1 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_gpll0_gpll0_div[] = {
@@ -381,7 +369,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_gpll0_gpll0_div[] = {
 	{ .hw = &mmpll0_out_even.clkr.hw },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
@@ -390,7 +377,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
 	{ P_MMPLL1_OUT_EVEN, 2 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
@@ -399,7 +385,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
 	{ .hw = &mmpll1_out_even.clkr.hw },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
@@ -408,7 +393,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
 	{ P_MMPLL5_OUT_EVEN, 2 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
@@ -417,7 +401,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
 	{ .hw = &mmpll5_out_even.clkr.hw },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div_map[] = {
@@ -427,7 +410,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div_map[
 	{ P_MMPLL6_OUT_EVEN, 4 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div[] = {
@@ -437,7 +419,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div
 	{ .hw = &mmpll6_out_even.clkr.hw },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
@@ -447,7 +428,6 @@ static const struct parent_map mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map
 	{ P_MMPLL10_OUT_EVEN, 3 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div[] = {
@@ -457,7 +437,6 @@ static const struct clk_parent_data mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_di
 	{ .hw = &mmpll10_out_even.clkr.hw },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
@@ -467,7 +446,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div_map
 	{ P_MMPLL10_OUT_EVEN, 3 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div[] = {
@@ -477,7 +455,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_di
 	{ .hw = &mmpll10_out_even.clkr.hw },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
@@ -488,7 +465,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_
 	{ P_MMPLL10_OUT_EVEN, 4 },
 	{ P_GPLL0, 5 },
 	{ P_GPLL0_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 }
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div[] = {
@@ -499,7 +475,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_g
 	{ .hw = &mmpll10_out_even.clkr.hw },
 	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static struct clk_rcg2 byte0_clk_src = {
-- 
2.35.1

