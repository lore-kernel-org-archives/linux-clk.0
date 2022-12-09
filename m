Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47780C2D0CD
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiLIQtJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiLIQtF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:49:05 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2E6941A8
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:49:04 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id c1so7933322lfi.7
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgF0xhfyf0sMDXDilMFLFkye1DFtSDTEyAtgGvs5cCM=;
        b=DCsB07yY2/1EKrLkBmg8rFRGpwsRp8U01p1PwGwaYZC0i+vRorXMUvzo6bsdcXSZl3
         iA8OZBlP2zRRv0EX9w92WuECOOAYTG4U97l+b+d2GLtEx0HPIEgBlWjGWq6yTzOMVySP
         jLPXRC9K/yBy3NHPsoXris9WsPVKfGDvvrtkkRV2qGaleomB4YRX3A3WUXSjT6CjAefo
         KUI1GuUXFtxP4h96R3USK5iHpLDNehRtYkrY/vNzqT8wNRD1i/9KDNjW0VK85TsR5VMr
         0qkrPxZCpGeXyeFF1Rjuc2sjT8iLs46qmnTTaGkQoxRyRxFDbNFJWLD2BFcAdfjWXnOI
         cG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgF0xhfyf0sMDXDilMFLFkye1DFtSDTEyAtgGvs5cCM=;
        b=fGK413U4UofVMhh0Ll0Z+pU5VSQT73EaOx1C77tjkJyxfpo5DewOeUZNeUXRS7yT3V
         O8v8chb4l1BC1PN0SJQ6vxEb7IKFTTb24/lMLRBny9haWzbXQ+DUwOk4ex6PpTsq4BaM
         NQniAGI2cHhq4uGEuymvpL2VDPmo3SjtkBt4JCl4q7SIvFFNhFbGWJwqdTGmZNxDQEW4
         BiNrDwqfLxrwqS6WUfESBt72xrqbGXvCUNbZH955AIcRzvMnVTWtCEdeSSyEebqObCDR
         BxUM2VkEa9e+/TNSmLkugiueXgV4nb1ksPVEJpsWQwmrJRSamxga2H2pjINLgHrGhkiw
         PEXw==
X-Gm-Message-State: ANoB5pkJRwv4RYuG/Z08uAT3wskctJmiHdhHe/UA2xUo8Tf9JqGHrHcy
        wMixqfSPq68mhSdYMlOC1xPA+w==
X-Google-Smtp-Source: AA0mqf6RNqDc0dTj0EMyc5oA9VPSpSppyujoj9zkkzJl87xEt45tUflGCE9rpWrnuU5uvV/EfpG5Mg==
X-Received: by 2002:a19:5e5e:0:b0:4b5:6042:d136 with SMTP id z30-20020a195e5e000000b004b56042d136mr1528451lfi.22.1670604542664;
        Fri, 09 Dec 2022 08:49:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:02 -0800 (PST)
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
Subject: [PATCH v3 08/19] clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125 clocks
Date:   Fri,  9 Dec 2022 18:48:44 +0200
Message-Id: <20221209164855.128798-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reuse sm6125's MMAXI clocks for sm6375.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index add92ecd513d..024665438b62 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1126,8 +1126,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 /* SM6375 */
-DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
@@ -1146,10 +1144,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
 	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
-	[RPM_SMD_MMRT_CLK] = &sm6375_mmrt_clk,
-	[RPM_SMD_MMRT_A_CLK] = &sm6375_mmrt_a_clk,
-	[RPM_SMD_MMNRT_CLK] = &sm6375_mmnrt_clk,
-	[RPM_SMD_MMNRT_A_CLK] = &sm6375_mmnrt_a_clk,
+	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
 	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
 	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
 	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
-- 
2.35.1

