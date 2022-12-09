Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76938C25B04
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiLIQtG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiLIQtD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:49:03 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFEE94187
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:49:01 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id f16so5496549ljc.8
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnqrTSbkJyuo5I31bQQ+wroCE17TRU6AvhMX1/MhOH0=;
        b=kAWtI4EENbm2peRdjMsVtgWEVk9rRB8zAJSrFHb8c9v9SXZVaCfgouLn1I5XKbUtIi
         0wXm8UW0uwfo537GJxzR9n709vStGLblSGSMWmqZOyv68YMOKoS3FkBuJnGODlQZx6k8
         F+X3MgLRZT4gODkp16f2Ii4cqNFGJH0ohMhXCIjYlg4tXTl0Sxdw66ZlISon2P5nZnWH
         9g1AILdj91e41wbUJL2UQxitNogHql/vcPeV8QupxSMcjKEhWjIaemuNPxxxly/eeTP/
         UgLUJwtVwxybKDoMBe3i80Oz+dEyKlwrSxoxMI2O01n42IdgKoZS5pEpWUUBDtedDmRu
         XLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnqrTSbkJyuo5I31bQQ+wroCE17TRU6AvhMX1/MhOH0=;
        b=R3xcM4ImXsaKQR1vZHc8k4mRPNfMYraOMC37xTESlLkZ7WXgHSwKaWJB2fYScQ7kbz
         eBZv+akQVG3UsdSkDU3oq5+nWu7iBlUBl31nPJl02wZR+njcSlPZkwITSDoXTdzRVrRL
         72fU/z21BPZA8TtdbszJLKPRX7yqncz4lgdJcMMm7wiJkYULJOpCNcBjZymk0t72jn36
         rGDKcySCtswAJlE90llXBlYJpYg8pqIsueb5bfmrHSobwzanoVkJD0BLkpjIdVcxulVT
         iwlO7yDbsLMGfnurcD1i3HaZVn4vGAilUuyc6n8xcZpyFqM9tA/FNfPciFyJ+hBHHlHp
         EeFg==
X-Gm-Message-State: ANoB5pndTVpXb/XWtYR3yqSJa6HfQ3VTAy7xaAnwtxZTodc49vUH3lk8
        imxyG6RgkG3b1/I999Py1dTTDw==
X-Google-Smtp-Source: AA0mqf5KwlPb9WxsBiJ8wkoyUOEfv0HkCM2rIhTqSYyn6DU/fGF6Co/UWbq7LJUQxXi7fhbVvWizfQ==
X-Received: by 2002:a05:651c:905:b0:277:155c:f4a3 with SMTP id e5-20020a05651c090500b00277155cf4a3mr1590903ljq.38.1670604540209;
        Fri, 09 Dec 2022 08:49:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:48:59 -0800 (PST)
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
Subject: [PATCH v3 05/19] clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
Date:   Fri,  9 Dec 2022 18:48:41 +0200
Message-Id: <20221209164855.128798-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Newer platforms (msm8998, sdm660, sm6125) have low noise LN_BB_CLKn
clocks. The driver already uses proper clock indices
(RPM_SMD_LN_BB_CLKn). Fix clock names used by these platforms.

Fixes: a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")
Fixes: edeb2ca74716 ("clk: qcom: smd: Add support for SM6125 rpm clocks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 44 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 31ef6345ff01..a0bf58785921 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -852,6 +852,10 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 	.num_clks = ARRAY_SIZE(qcs404_clks),
 };
 
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1_pin, ln_bb_clk1_a_pin, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2_pin, ln_bb_clk2_a_pin, 2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
@@ -882,16 +886,16 @@ static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
 	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
-	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
 	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
 	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
 	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
@@ -946,18 +950,18 @@ static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
 	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
-	[RPM_SMD_LN_BB_CLK] = &msm8916_bb_clk1,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8916_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
 	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
 	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
 	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
 	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
 	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
 };
@@ -1057,10 +1061,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
 	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
 	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
-- 
2.35.1

