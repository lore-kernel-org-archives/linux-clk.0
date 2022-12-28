Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD50C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbiL1SxH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:53:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233508AbiL1Sw4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:56 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3126917072
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:53 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id p2so1700959ljn.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ6aBIfAch55lprCsNaNAYzyypRLet5QxQZNo1yihAE=;
        b=lIILyKohaMFRk16A8ND1ZKW+lwrvIH2rVrpMmvdBLtakb/OU+jQNbUXJUTYAy0qkzg
         VpK3U4UrT2QLhS6FEvNxd5KeRQBhJ2SVG/YV52vYsyd/h8Psjv3Sg+ArD5TGjVtdmOwI
         FDFa31qRftmTTYn6aDuNlXEcmp0mLwuS0a++Di42GRPpH0jns89A8yU9ZCw9pAuoT1XL
         e1nN5SU698/pa93+Bti0ZhBZ4HEPUsw8kBLWdiVF7z+nj5waS5Rup9WdFHUQBEJijj2D
         kSk5Mst2eOJp/K0hEEjFD/2hbHOYCy7h9tCG9KqhTe9XiEuMjthcUQqtrdGVchf6Hcfs
         U43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ6aBIfAch55lprCsNaNAYzyypRLet5QxQZNo1yihAE=;
        b=lHNt+sRptNWzHEEVhnrvwwQQi0J7zRHy6eSIYEe4mTDFwVAe0cqZFYUdQQsdjn3epx
         IBlqjslPTsoUj3vh8W6ldY0vXpcoamYNL9ZpXdCYY01MG0cPqm8ilRakCLfuKMqLSNcD
         BrmqBSdJDOz/LKh0K4DQR7uE1LP4FUgWDt6MvLmI/hhqWFKfkFh3D3QVy6ovheCDxpQz
         j9RQm+ogCJT/fnT7dNaFsoV9JyXHLaH1y3OkiX/JA5ZRDC05cC+dHeqLfiHOZ6YTuOJR
         XkGjet0pygHsbO6I+5giyLZ/PcyF5VJPajhiURTfpy0leIDXI3akUczhitffhqaVQ0Y+
         qQzA==
X-Gm-Message-State: AFqh2koO99B8micYHpVxd8lKIa3b2O+vF7tIAHLaRr3Icx2hc9T/0WUw
        AXGJSkbGlNrPrVspoSFvPOpBsQ==
X-Google-Smtp-Source: AMrXdXvz2sKLvxWF/ZKg+vshp1B8r9TRcgf9zsNuNy+6gP5bBWa6BWv7iDCaOKYsZGXGyVEs8w3SFQ==
X-Received: by 2002:a2e:a543:0:b0:27f:c94a:1b07 with SMTP id e3-20020a2ea543000000b0027fc94a1b07mr2212737ljn.48.1672253573168;
        Wed, 28 Dec 2022 10:52:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:52 -0800 (PST)
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
Subject: [PATCH v2 14/16] clk: qcom: gcc-sm8350: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:35 +0200
Message-Id: <20221228185237.3111988-15-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sm8350.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index c3731f96c8e6..af4a1ea28421 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -22,7 +22,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GCC_GPLL0_OUT_EVEN,
 	P_GCC_GPLL0_OUT_MAIN,
 	P_GCC_GPLL4_OUT_MAIN,
@@ -119,14 +118,12 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
 	{ P_GCC_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &gcc_gpll0.clkr.hw },
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
@@ -134,7 +131,6 @@ static const struct parent_map gcc_parent_map_1[] = {
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GCC_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_1[] = {
@@ -142,29 +138,24 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
 	{ .hw = &gcc_gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk" },
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
@@ -193,7 +184,6 @@ static const struct parent_map gcc_parent_map_6[] = {
 	{ P_GCC_GPLL9_OUT_MAIN, 2 },
 	{ P_GCC_GPLL4_OUT_MAIN, 5 },
 	{ P_GCC_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parent_data_6[] = {
@@ -202,7 +192,6 @@ static const struct clk_parent_data gcc_parent_data_6[] = {
 	{ .hw = &gcc_gpll9.clkr.hw },
 	{ .hw = &gcc_gpll4.clkr.hw },
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_7[] = {
@@ -267,25 +256,21 @@ static const struct clk_parent_data gcc_parent_data_12[] = {
 
 static const struct parent_map gcc_parent_map_13[] = {
 	{ P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 1 },
 	{ P_BI_TCXO, 2 },
 };
 
 static const struct clk_parent_data gcc_parent_data_13[] = {
 	{ .fw_name = "usb3_phy_wrapper_gcc_usb30_pipe_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 	{ .fw_name = "bi_tcxo" },
 };
 
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 1 },
 	{ P_BI_TCXO, 2 },
 };
 
 static const struct clk_parent_data gcc_parent_data_14[] = {
 	{ .fw_name = "usb3_uni_phy_sec_gcc_usb30_pipe_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 	{ .fw_name = "bi_tcxo" },
 };
 
-- 
2.39.0

