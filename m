Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE06EC352A1
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 17:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiLCR6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiLCR6P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Dec 2022 12:58:15 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD22140A3
        for <linux-clk@vger.kernel.org>; Sat,  3 Dec 2022 09:58:14 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id bn5so8873863ljb.2
        for <linux-clk@vger.kernel.org>; Sat, 03 Dec 2022 09:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPKQiDwDGK1jSCvzUh2oqBkx66Tm9NW6WGzbYlY3Yhk=;
        b=Rg4r1i56sSCGa2vozWzswyH0uaJHpAuBOv9T7qXGqb3u2RDUvirWhS6Wj6qYgNcDfI
         EaObK5s86XjSc8d9yl8LBFwjib9t0yy2pXgGEP6ssOE6GdAOoYrYJNt/yGEkBEbUlAsa
         X+vnG8Hx2n90Emst0MLQuu3HWUo/vwFwpGO5pj7kYjEWW+GWomgalpN8obZwC4cN7h2X
         lADc5vb5utgKKMXzoqM/TAJrAlcfbL24gmXEp9emiqmgo8Vyeim8FcmdR8QoxFktC5Cb
         Ngv2foP2jM2VCrBZ0sPnh25nFFsvWyg+TFsTPttD+x5QBgW0JzpRhLp/LCD2oA1CA2R4
         Lx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPKQiDwDGK1jSCvzUh2oqBkx66Tm9NW6WGzbYlY3Yhk=;
        b=2NL0APthGAd30SyJ4lQA6JZFfoxQb7nh/JVzFCTbxITYkrAxDCr7gujk/JdHFLw/NE
         zOXX/TEwu+2yGtr0Ytkd435FpZSyeqP41lREzkmyKqMlpXsAB3vLjWSTEa1Vp9JQKqFJ
         r7PRtBe3Rbl9WhuRhFdL0vUazQk45eKH9+V/Ojgaa9wlxjFlSg64cWEFxcDQJjkZBq8K
         EfYRcjH28uotUF5q9VGoWQUCa+KVdmWQ9j+cRhbhxuTRfclbDeXCBHvH3Ogf0f0Nwjy2
         qW0CZ/03o68LKNXB+6vzquaGslvzLSaLeRxeVNbvgsI+aD80xAE2QrpPqiqrzJG/4zka
         c7Fw==
X-Gm-Message-State: ANoB5plAcCQeu20Y73F4sW5KNPLU8BVrbVxYKOpiQD93mNzeyG7JAbEX
        x5Ot9jRcaMJic0Qgdd9FRE/xPA==
X-Google-Smtp-Source: AA0mqf5x4jtuAe7YRaDB3n0KI2Y8OziDd9FGeryHKeEn0evHIpVqTYCeg/sf1nYqroW1V7pNgRy2fQ==
X-Received: by 2002:a2e:3309:0:b0:279:d1ef:69f7 with SMTP id d9-20020a2e3309000000b00279d1ef69f7mr4121624ljc.167.1670090292377;
        Sat, 03 Dec 2022 09:58:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.11
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
Subject: [PATCH 03/16] clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290 clocks
Date:   Sat,  3 Dec 2022 19:57:55 +0200
Message-Id: <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.

Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 877ffda42ee9..26c4738eaacf 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1166,7 +1166,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
 
-DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
 		   QCOM_SMD_RPM_MEM_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
@@ -1201,14 +1200,14 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
-	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
+	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
 	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
 	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
 	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
 	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
-	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
-	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
 	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
 	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
 };
-- 
2.35.1

