Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE1BC25B04
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiLIQtS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiLIQtK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:49:10 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4491944E4
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:49:07 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id l8so5472393ljh.13
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zB1Vk8ZnYIkzrMW7hyqKmN1sCcWUGj+vMrhA03ubek=;
        b=jqIr8HLsF9PqkmZkXtNBdvT8VN4FrGqqRjq/P4guxGDfyouy7IB5tcfNZ1cyI6dfCZ
         jMxsCnxICWAgqxPx3vQGUWHQjyD4BtrMcIfAoWypFVetO7h1AsOfRiyMEV0O9D1ICvDo
         jr5EqHKuYFlASQW0YP/3KiRgVk/7Ue+ROj97M40nl1IhqlVSqnYIawexIhBWCs0yAD/a
         nx+vuIAhc9vOKHr//g3kDdFZ24S66NkjfPO+YyJxfudLt4a9t/3HtApEgBRBrieaSt2V
         +78k0E98Rdtd2SOp4dRfXA9mK4hycpV8YSW1jtmA5lhw9nAeOL7EmwGtQH57s1btB3v/
         9K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zB1Vk8ZnYIkzrMW7hyqKmN1sCcWUGj+vMrhA03ubek=;
        b=a6UFICWqtOJIgYJbbemvB8RamUm367tf3mnjmNeXl2JyzXGm7iJ58yxAZTYruFOwr7
         SwQj4d7m6UKG3PUvumzZAIwLPhtGyunA4V+0EQfJy4oq7E8zH0yISJu4paG8VRMSX96e
         TZRL/CcEFaXL/I+RQ7tH1HmSnns8hDw9z6i0BWbPj+5aB+eq2p/zbeAdbYJMcASOKHQ2
         QxaNYqj8QcSZsLnPrnv63gQ6mcSl33LqFUqiPuhXthpBRkvM24/XuKvgTV4hsJVQdwcL
         HJmrO3eU/oM192SIXwxjmaxd9+fW+G3kl6ubHVMyFBoBSkF0J9F7QZsRYsLvsH+B0fcX
         /kqQ==
X-Gm-Message-State: ANoB5pkNAu6Ja/CAQWYuCHbFPDHEBEo49uSemA6KawPKSlRtlGS54VPx
        k23QJ5CgomA9QDOwNofcsINCYA==
X-Google-Smtp-Source: AA0mqf7NMKyiblFlU+ixCU3J8iwxnqyFPHuj4Kry0CTmzoDk9av/NykJ3qM3/HqlKUW7D3ZhosVFdA==
X-Received: by 2002:a2e:998d:0:b0:279:f9a4:fbc with SMTP id w13-20020a2e998d000000b00279f9a40fbcmr1622451lji.11.1670604547248;
        Fri, 09 Dec 2022 08:49:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:06 -0800 (PST)
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
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 13/19] clk: qcom: smd-rpm: rename some msm8974 active-only clocks
Date:   Fri,  9 Dec 2022 18:48:49 +0200
Message-Id: <20221209164855.128798-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rename msm8974_diff_a_clk, msm8974_div_a_clk1 and msm8974_div_a_clk2 to
move the _a suffix to the end of the name. This follows the pattern used
by other active-only clocks and thus makes it possible to simplify clock
definitions.
This changes the userspace-visible names for this clocks.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 98d82d1f3a75..b32fc7cc1332 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -474,9 +474,9 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_clk_a, 7, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_clk1_a, 11, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_clk2_a, 12, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
 
 static struct clk_smd_rpm *msm8909_clks[] = {
@@ -607,11 +607,11 @@ static struct clk_smd_rpm *msm8974_clks[] = {
 	[RPM_SMD_CXO_A2]		= &msm8974_cxo_a2,
 	[RPM_SMD_CXO_A2_A]		= &msm8974_cxo_a2_a,
 	[RPM_SMD_DIFF_CLK]		= &msm8974_diff_clk,
-	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_a_clk,
+	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_clk_a,
 	[RPM_SMD_DIV_CLK1]		= &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
 	[RPM_SMD_CXO_D0_PIN]		= &msm8974_cxo_d0_pin,
 	[RPM_SMD_CXO_D0_A_PIN]		= &msm8974_cxo_d0_a_pin,
 	[RPM_SMD_CXO_D1_PIN]		= &msm8974_cxo_d1_pin,
@@ -653,7 +653,7 @@ static struct clk_smd_rpm *msm8976_clks[] = {
 	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
 	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 };
@@ -687,9 +687,9 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
 	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -745,9 +745,9 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
 	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -813,9 +813,9 @@ static struct clk_smd_rpm *msm8996_clks[] = {
 	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
@@ -875,9 +875,9 @@ static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -945,7 +945,7 @@ static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
 	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
 	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
@@ -1013,7 +1013,7 @@ static struct clk_smd_rpm *msm8953_clks[] = {
 	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
 	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
 	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
 	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
 	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
-- 
2.35.1

