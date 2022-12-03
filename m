Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70324C4708D
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 17:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiLCR6Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiLCR6R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Dec 2022 12:58:17 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9370D120
        for <linux-clk@vger.kernel.org>; Sat,  3 Dec 2022 09:58:16 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id q7so8850921ljp.9
        for <linux-clk@vger.kernel.org>; Sat, 03 Dec 2022 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0k2ahzHCzE9/mItm4L4idzbhsbmv2xtP5GOLWhjXv0=;
        b=ch9RsGjyjD1P/BbHabPZfmbjKF83u4dvu5jhbOYj4adyhGckSVajKMXWojnJ6end8K
         0eQK3WgGrlCawVseLx4ejG9+2hHfl4YYgdoHd0qgx87P7NDS3hMfc8nbQn1PAzrak7If
         R3APMcE3RIe1Nys6e4KPkYRW3kUz7Owg/z9hMALiqFfKSUGUQa4hUjLQpYPgk22fB7jc
         OawZzMMLZcD0m/bR2gJoDX1+HXNekITHw0dBP+VK+FZMNJ0PqZOh0cXQSKOXR2JcfT47
         VI6+Z6/jxRqbLbVsZH5c69w7fNqWyY4OoveP4KVQvaAVQ0xhvHSFGVSOxbE/aTTBnFVK
         O0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0k2ahzHCzE9/mItm4L4idzbhsbmv2xtP5GOLWhjXv0=;
        b=iyTmLnJiP8Wt4gvxbcamMAcOLFnOhUgn7ezRNcyb/gdIWZ7QJa83Q1dzwDh53OuO+e
         0uNW6DjJeRavCuZISeXjnYS4qLDxIH+wSOfeP9JzJ0Rn3kqT7rqcEEOehzyulWfYKrQ1
         K1R1LCa4O+3VHc0qO9b4ca6GOZ3gMUKsuZ4nbCEGCQ60kbhYsw7VlIMHjgl5xpI97CIF
         rt4d6qxSc3UeuCdLoYJ95kfqlj2x1kAXzX815oJ8niBBoaxdt+XQTQZGl4eqooZ/AEi4
         adQOCL5HRhWRPNuo2JztpDdT0ZdpsoG1E0wqlxb9QvDDZKW7iVbp6Ni1OIoHS4v8BxOS
         Gp1w==
X-Gm-Message-State: ANoB5pkV8YTpfk75GacOE8LwlFmMrkhPmuUbUqlKkHJLGCRVlBfJMM4+
        Kx64UxWM0JUaQjAiRDhBC3WnCQ==
X-Google-Smtp-Source: AA0mqf47WarJ25h9R5GR1SElUZoN4RV7s5Q5ENl9ZPK7CsLXugHfbi/bwvS+kgoiyi01h5WCn8V3oQ==
X-Received: by 2002:a2e:b526:0:b0:26e:494a:de3f with SMTP id z6-20020a2eb526000000b0026e494ade3fmr24250067ljm.85.1670090295082;
        Sat, 03 Dec 2022 09:58:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 06/16] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
Date:   Sat,  3 Dec 2022 19:57:58 +0200
Message-Id: <20221203175808.859067-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Follow the usual practice and rename msm8992_ln_bb_* clocks to use
qcs404_ln_bb_* prefix, since there is already a family of pin-controlled
ln_bb_clk clocks defined for the latter platform. This is mostly a
preparation step for the next patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 6af0753454ea..3a526a231684 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -635,7 +635,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 };
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
 
 DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
@@ -673,8 +674,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
 	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
@@ -733,8 +734,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
 	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
@@ -798,8 +799,8 @@ static struct clk_smd_rpm *msm8996_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
 	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
 	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
@@ -822,7 +823,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 };
 
 DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
 
 static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
@@ -841,8 +841,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
 	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
 };
@@ -1014,8 +1014,8 @@ static struct clk_smd_rpm *msm8953_clks[] = {
 	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
 	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
 	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
-	[RPM_SMD_RF_CLK3]		= &msm8992_ln_bb_clk,
-	[RPM_SMD_RF_CLK3_A]		= &msm8992_ln_bb_a_clk,
+	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
+	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
 	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
 	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
-- 
2.35.1

