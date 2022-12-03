Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673E9C63703
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 17:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiLCR6W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiLCR6Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Dec 2022 12:58:16 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD104DFEB
        for <linux-clk@vger.kernel.org>; Sat,  3 Dec 2022 09:58:14 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p36so7865615lfa.12
        for <linux-clk@vger.kernel.org>; Sat, 03 Dec 2022 09:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUJ15M77Tok2Zaayoxae5VmyDseRcNckpU0MOnyCe9I=;
        b=OoYPeZ+F1CnlvUg/3hqholx/Q0CaqKKisDT3eIqnGbpgTamagLhSjpYeS+zH/aeHWy
         XyUlE1BDxkli07+cvvYmsHQg67caNDLul93ngXKz9N4UkKebRi8F6Mqr3wHZaJ6+r9c8
         oeC0y4tNkRcjhICBAad+E302lx+hMHQA+GcyvvgfRUqpVGj8SLBY4grcDM6QT+gzNWEx
         tuVoIw+WoOeVJL+k6s4tYqyQfRH+SoFNL7wIlI3Db+Dg7D+UD300iuzGlgA/ol0B7nmn
         1RID1Irn7YW9ZUm6cGalRRRAru498QGrc3TNRv5NbnE1tBtdXbj1XohR0042H4CoQB5q
         o/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUJ15M77Tok2Zaayoxae5VmyDseRcNckpU0MOnyCe9I=;
        b=ObPlwDjqz6EIGYIMNS1lAMXGGBZdgtTWPib+IljKgUyULOwSp1H/OhJcf6oAbzdKgT
         hCvMdHEitwmwriye3HqVJememtwdI/IAsfjvSP5TWm/XaD927pIKXcC7Zzsi/x3Me+4J
         f6VWubrIS5iM8MFwQS6KE7nN2j3997A5oK99n8uDVqQWcbkpwb5wDe5cpAPKl+Sdyjs6
         EZb2jiFjVuemkdosCcO05NUBOYUu362I2dynvQ2wzAfGXGGPEQbCMI8ylC5mV2CEvHHi
         kMHJGirMzyskzGdX1x848gcP5XUqnHwFVXLIC7Dj5Ctw9pPhhD4u2atjfzq9/czdnyWx
         7AgA==
X-Gm-Message-State: ANoB5pnAWercn2dfeavMgthyEVOQLdFbr1PTcRwCpyXrSRTYAbKgDfHv
        a5B1F+8VUSmR4wJTbfG4aXeVPQ==
X-Google-Smtp-Source: AA0mqf7u721BRvwaBlzShwi8RDx96cdY9J8whhYti2QiwlRxInoZ6A7QXPu1120gT7dklYR1ZczbjQ==
X-Received: by 2002:a05:6512:39c8:b0:4b4:b893:3536 with SMTP id k8-20020a05651239c800b004b4b8933536mr21827714lfu.111.1670090293295;
        Sat, 03 Dec 2022 09:58:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 04/16] clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
Date:   Sat,  3 Dec 2022 19:57:56 +0200
Message-Id: <20221203175808.859067-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 44 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 26c4738eaacf..42d55bf35a33 100644
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

