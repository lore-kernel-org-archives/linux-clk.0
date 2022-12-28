Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26C4C678DC
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbiL1Nd2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbiL1Nc4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:32:56 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A430F5BF
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:55 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 1so23631828lfz.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcHpjhwd3Vn4U4/hJVP6nnKjBoCImDzUqfwBFS1MqI0=;
        b=a4aqhXEJLJveNgCXieqi35Ycpt8rRnzHl2o12ERhuLpWzuP3Yn9Mp5tyess4EIa1L7
         XwfKpCQ8sNEH7muEpaDxnUCvfUkHJjNvqCsMUeXjA6xJv9MDPQKVSF3XReeyWJiSF1L+
         PWcWSa4yxD9tBzn1ba9YtSpA0jiQ1MA5IUJbDLKK0bcZpqp9yAJ6teQIc5rBIAi844Dh
         31RjOPO+MyxtxR7Pgg8Mlrk0/hAqQ4tr7i70oiQuhY2mBO9WOM6AD08PoCQsImw48wGq
         ZHlHjvrN9p7y+H/r23CeQxrfmta3KiNlV6MnG8n8v3W0MwWsPSZvB6zO9iwKCBIBvpGG
         ypbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcHpjhwd3Vn4U4/hJVP6nnKjBoCImDzUqfwBFS1MqI0=;
        b=G/GNiEOW57CaiPutDz2TdrdKRVYqnvRokRaOVWBbXM5b1kQsHCfaqcJePJevIdiKY9
         LYo2ZfyuKJt3/5jmLV7DvVL9q9gphByEDt16s3fX5RkxtRTcnDWf53rI1eMPuzYLB11P
         mejsRgz0U9MvN+WC0KxWQqPdr7O5MiwyemEgOo0D7+u4bSCUy6MWna+2cA9WKeOU/UOn
         2uEUri3t6/Zo+h2wJ/bGgHetaWcqXqqKt6wTExdTrCkQ9vJcXSzfF71NcCHx6G32o57k
         alj7JzEaXQzFeh1iAzeVNud7zlx21nhUDAWbt+uQcBZjpf+aiQHHH3+zsPV24dC2pder
         oRTg==
X-Gm-Message-State: AFqh2kqRWSF4qec5GV/eGU06fh4OiWkz4sa5dhUH7lVeUySwXLJGajNz
        EIyuL89qXr8uguKp1/SWGfRX5Q==
X-Google-Smtp-Source: AMrXdXtFTbPmLHB5xxh/62Ka+FXJSEpwene4q7441S5CKIlFd6oZEyXUXnY8NmfG9+n2dgazDRUwPA==
X-Received: by 2002:a05:6512:10c3:b0:4b6:e8fa:a48d with SMTP id k3-20020a05651210c300b004b6e8faa48dmr9392450lfg.5.1672234375063;
        Wed, 28 Dec 2022 05:32:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:54 -0800 (PST)
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
Subject: [PATCH 12/16] clk: qcom: gcc-sdx55: get rid of test clock
Date:   Wed, 28 Dec 2022 15:32:39 +0200
Message-Id: <20221228133243.3052132-13-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sdx55.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 758b295e1bfa..d5e17122698c 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -22,7 +22,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_EVEN,
@@ -137,21 +136,18 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct clk_parent_data gcc_parents_0_ao[] = {
 	{ .fw_name = "bi_tcxo_ao" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -160,7 +156,6 @@ static const struct parent_map gcc_parent_map_2[] = {
 	{ P_GPLL4_OUT_EVEN, 2 },
 	{ P_GPLL5_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_2[] = {
@@ -169,7 +164,6 @@ static const struct clk_parent_data gcc_parents_2[] = {
 	{ .hw = &gpll4_out_even.clkr.hw },
 	{ .hw = &gpll5.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
@@ -177,7 +171,6 @@ static const struct parent_map gcc_parent_map_3[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_3[] = {
@@ -185,19 +178,16 @@ static const struct clk_parent_data gcc_parents_3[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
@@ -205,7 +195,6 @@ static const struct parent_map gcc_parent_map_5[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_EVEN, 2 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_5[] = {
@@ -213,7 +202,6 @@ static const struct clk_parent_data gcc_parents_5[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4_out_even.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_i2c_apps_clk_src[] = {
-- 
2.35.1

