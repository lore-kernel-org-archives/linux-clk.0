Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB72C3DA7A
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbiL1SxJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbiL1Sw5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:57 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CF91707F
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:54 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e13so14728494ljn.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbtaM2Wz4Z6Utdhudlq5PsWTUUjlX5sdXiGE35Vlwrg=;
        b=H8J1TqET5xuJRKa9dvJS0+ht05qGXb58TDIcz3uuzLRclmSkzsJRl2UzPGL02d3zg4
         WJgALcCPBPBG/SV+see6vUZiVINlMXoL/Tcyu2h3D4eZd8fGANuuVHyXdrR4GzBDtrG9
         ygnzHlE+JxD8Eo1xigzjIhEWxfHB21qrtgq+xFZS9iCvyW+06g7/u1xA2L6wM+zQvSFq
         bHnjFsArmVBc536iRDmjjJRp7fkliZZ3yFU4V3jSBuNPkzj6HI7r0Xf1gt4oltmiuaHU
         ZQAp8nHF89k0wNnMenzNyi5f4VCFhvumlT4l1V5GqKaInGQHOo+5TvHP0xfwjU5bhiYO
         kqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbtaM2Wz4Z6Utdhudlq5PsWTUUjlX5sdXiGE35Vlwrg=;
        b=oMdbDc2bZrJGbGRVQuQ7txze5yYw9b6hwjhC3LKPAK4riNBrrso9TmRqVhIrJXhhhi
         BviD2Y2dwB5MrtyZ6KqnF2EYoZ7JfnrHRlbocPuZeBfP4VKpWGL2NwqdAoMkEcQHsyF1
         LfgYFQW3ziIeUj//aOJHgIvJJSEl7jXOy4U5U4bs5B3uYVD7i+cLnXYJz1vTMWYQVOIM
         L8TBAAf0LCK0VLFC7ZryJR0PqAUMrXsAypN4rPHxkyZ9HNpFi4RCGE+NemrUaAEGyD85
         oo1dy6y8KkktvmZ1G9uvSKcpncHheYIoJaL9nYIdIIgfdNKBXRLAObjPRm9O8LLPDzRM
         w+jQ==
X-Gm-Message-State: AFqh2kpnHZn512hjlVfvfecpA6vCnsfw84BMi+8KOptrkWl2CVPM1Jz6
        F63Rdp7W1eLJYW4+oXVTi+4qjw==
X-Google-Smtp-Source: AMrXdXuNnMea4klmkkG7omZPIVbkQlSxvlnXh9NH9YB3LC0DweM7u4/PEpAB8StkMCMMcWSFGkiitw==
X-Received: by 2002:a2e:91c2:0:b0:27b:4ba8:e202 with SMTP id u2-20020a2e91c2000000b0027b4ba8e202mr11521511ljg.33.1672253574011;
        Wed, 28 Dec 2022 10:52:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:53 -0800 (PST)
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
Subject: [PATCH v2 15/16] clk: qcom: mmcc-msm8998: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:36 +0200
Message-Id: <20221228185237.3111988-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.39.0

