Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A588FC4167B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiL1Sw4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiL1Swv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:51 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AE11659D
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:50 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id s25so17309462lji.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNedLXPnHziu5Hoq26YbLdIZJt5Qx8tFBkNMdAPv8pQ=;
        b=nyhM0DpUs+8IDP/ZrFr5c48EeQoci4cxtigAeCN3P5Rn9Dbv2dJE6KSNzMVLPBg5yR
         jZ5CuML7FHEfTdmhSV/DX4Wmk2fmFVhFQaqSusVnYubfoMU6gEl5vuyMLEHANlOMbFGA
         i8hD0OKdnJMwLi38yuQlmm8rI5vSG4jT+5A2kYgVaez/Rs892W4ZOeAgzwmW5DCzKvp/
         LvIQgTspPSX1R82lUEnpTrjJT+bPjbTTkzIH6QLmB2UdmJRzdop9fbcTBK78+Iy95K4v
         +q1AOX+0gQOV0iySRx6CN1hs1hZSc6K97XnZS6PkX6yhOc0Cm0RNY8f02EoOJLNjyLLJ
         EgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNedLXPnHziu5Hoq26YbLdIZJt5Qx8tFBkNMdAPv8pQ=;
        b=drheo+AqL+DtNiuoB4tHvhL8CJnicfp5FbSsPHmDrlXlc1MCFaIP/wDyG/hNTmPUXq
         dUi9Mx0uF/fVWW3xynFudw02XfzazYzwNsOwTVaj3Tg6qiljDPtzT8fsNbQcoKg9qGLZ
         YjBv8CyaP/4t/Wblptk6V6/c1mWcdp7Zf+4mDokvfvbF2w5ghE2teIX1TCZpFooWzvEp
         IEWUGdx/1/71ARbi8qs5pBQQ32XszaJJ/sYhiYiqHuQie+2/sSajomT8kWi4pB733sB3
         YJsiIJPQ+376JYA95F8LakZ8bNZvaltybUkwluaagbpdTjwg3zPumBMhC5f/JZndESC1
         cKkg==
X-Gm-Message-State: AFqh2kqQOKyDSZ1nuMDU1aCId37vxTzFXY5RKkqszlTpbwGvnOS85HTL
        UCV1jaNwh7B0iB+6VHYijXg8mA==
X-Google-Smtp-Source: AMrXdXv0+xzIAENO0l21OjfpknCEzVEAsIf1w1bvRM8o/IiNdidbpxA05hBPvyrf9IT3g4+5IJPXOQ==
X-Received: by 2002:a2e:3e19:0:b0:27f:b3e6:162d with SMTP id l25-20020a2e3e19000000b0027fb3e6162dmr5082824lja.32.1672253569806;
        Wed, 28 Dec 2022 10:52:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:49 -0800 (PST)
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
Subject: [PATCH v2 11/16] clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 28 Dec 2022 20:52:32 +0200
Message-Id: <20221228185237.3111988-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data/names/hws easy and errorproof.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sdx55.c | 52 ++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 4fca19006a77..758b295e1bfa 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -232,7 +232,7 @@ static struct clk_rcg2 gcc_blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup1_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -258,7 +258,7 @@ static struct clk_rcg2 gcc_blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup1_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -272,7 +272,7 @@ static struct clk_rcg2 gcc_blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup2_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -286,7 +286,7 @@ static struct clk_rcg2 gcc_blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup2_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -300,7 +300,7 @@ static struct clk_rcg2 gcc_blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup3_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -314,7 +314,7 @@ static struct clk_rcg2 gcc_blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup3_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -328,7 +328,7 @@ static struct clk_rcg2 gcc_blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup4_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -342,7 +342,7 @@ static struct clk_rcg2 gcc_blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup4_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -386,7 +386,7 @@ static struct clk_rcg2 gcc_blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart1_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -400,7 +400,7 @@ static struct clk_rcg2 gcc_blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart2_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -414,7 +414,7 @@ static struct clk_rcg2 gcc_blsp1_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart3_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -428,7 +428,7 @@ static struct clk_rcg2 gcc_blsp1_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart4_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -450,7 +450,7 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_cpuss_ahb_clk_src",
 		.parent_data = gcc_parents_0_ao,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0_ao),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -469,7 +469,7 @@ static struct clk_rcg2 gcc_cpuss_rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_cpuss_rbcpr_clk_src",
 		.parent_data = gcc_parents_0_ao,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0_ao),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -493,7 +493,7 @@ static struct clk_rcg2 gcc_emac_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_emac_clk_src",
 		.parent_data = gcc_parents_5,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_5),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -514,7 +514,7 @@ static struct clk_rcg2 gcc_emac_ptp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_emac_ptp_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -537,7 +537,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -551,7 +551,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -565,7 +565,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -579,7 +579,7 @@ static struct clk_rcg2 gcc_pcie_aux_phy_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_aux_phy_clk_src",
 		.parent_data = gcc_parents_4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -598,7 +598,7 @@ static struct clk_rcg2 gcc_pcie_rchng_phy_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_rchng_phy_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -619,7 +619,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -633,7 +633,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -652,7 +652,7 @@ static struct clk_rcg2 gcc_usb30_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_master_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -671,7 +671,7 @@ static struct clk_rcg2 gcc_usb30_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_mock_utmi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -691,7 +691,7 @@ static struct clk_rcg2 gcc_usb3_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_phy_aux_clk_src",
 		.parent_data = gcc_parents_4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.39.0

