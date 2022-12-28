Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF15C4708E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbiL1Sww (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbiL1Sws (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:48 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE5615F11
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:47 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u12so13591507ljj.11
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpTfcDalQHAd8GUSxa+F3qrhqRaoihb1U5Bo1ExZrYo=;
        b=msMXScYbn8h5sR4/JLiNcjIrtKoWeyTCLe4SegtfVUa/OKsRw2lahpVU1/x44quVD6
         YvYa3/JhI6upJZpPYttii9+O2Y9SGlPQxPlhXD3Os2hCFXfwTqwlWeVPhllZkEMYJbmR
         PolRChUQr3Vq9szMoMHVCg+uGTlpiqQXSsQLYcXORQBdVFfNDWfLyL/4q7e/Ssue5UFr
         zeqPVG+InMcGVStz/oD9epx6LfofIN7bX3pBPyz4T5Nu/wYhbv0c+A44S7IGqoIzcruC
         x3BOQu0D9UGu94/e186X5qyAsDOcesOxvUTM8G1vvt5o8qyI6fnu7kxg+tv7b0qgNu6M
         uRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpTfcDalQHAd8GUSxa+F3qrhqRaoihb1U5Bo1ExZrYo=;
        b=NTKRppFIf9I/66JCCPdcDvVVSOdY9wd3dX52zfYR3dIY8tbvx0vhCBUXLpbT9jntx/
         wJfOHLD2dqxr4heyhyjtlyRemGgqWeyJofAd2Q7Binq+7ZkRjXw706WsbeXFGJ7WDisw
         LBdGtFWSMSVxR6AG3JEdjqyg3uDMNvIJZFOu5q3ZbuoKcr66fEsz/PIms1RiCzNpOCDT
         AJ51HtZWSginbqnDNyRRiYr8fo3S0Bk9iYPcntCJI922clbhfAU+ejrh1KwjxhoLYgQJ
         VSf4F7FtkTihKRtQ37wE+WoIfJO7S9qOEU9mezDECSwuhLRsd6nbECArCBQeR76OSFPV
         SGAQ==
X-Gm-Message-State: AFqh2kpyv/fcHBTEHA9z7g2G1hi6LmcCEABechXIqUG9wHooXGpLj/T5
        WLujtAyGeDtlWdbE60gWUlR2Wg==
X-Google-Smtp-Source: AMrXdXtDXsT6dEs1NCN9uzeC0rch7vWgIpFP5th4Zey44ttCL4mo4X18Uwukjz+DRafBpfNfv1FGPA==
X-Received: by 2002:a05:651c:301:b0:27f:d652:f397 with SMTP id a1-20020a05651c030100b0027fd652f397mr149643ljp.34.1672253567259;
        Wed, 28 Dec 2022 10:52:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:46 -0800 (PST)
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
Subject: [PATCH v2 08/16] clk: qcom: dispcc-qcm2290: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:29 +0200
Message-Id: <20221228185237.3111988-9-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-qcm2290.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 96b149365912..2ebd9a02b895 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -71,7 +71,6 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -80,7 +79,6 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
@@ -91,7 +89,6 @@ static const struct parent_map disp_cc_parent_map_2[] = {
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo_ao" },
 	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -104,7 +101,6 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .fw_name = "gcc_disp_gpll0_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
@@ -117,7 +113,6 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
 	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -126,7 +121,6 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
 	{ .fw_name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
-- 
2.39.0

