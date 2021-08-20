Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B58EC43216
	for <linux-clk@archiver.kernel.org>; Fri, 20 Aug 2021 20:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C0CC61164
	for <linux-clk@archiver.kernel.org>; Fri, 20 Aug 2021 20:33:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240335AbhHTUdi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Aug 2021 16:33:38 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:33025 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238872AbhHTUdg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Aug 2021 16:33:36 -0400
Received: from localhost.localdomain (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id A7C053F34A;
        Fri, 20 Aug 2021 22:32:54 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: rpmh: Add support for RPMH clocks on SM6350
Date:   Fri, 20 Aug 2021 22:32:43 +0200
Message-Id: <20210820203243.230157-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210820203243.230157-1-konrad.dybcio@somainline.org>
References: <20210820203243.230157-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for RPMH clocks on SM6350 SoCs.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/clk-rpmh.c           | 21 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmh.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 552d1cbfea4c..441d7a20e6f3 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -536,6 +536,26 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 	.num_clks = ARRAY_SIZE(sc7280_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
+DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
+
+static struct clk_hw *sm6350_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
+	[RPMH_QLINK_CLK]	= &sm6350_qlink.hw,
+	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
+	.clks = sm6350_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -623,6 +643,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
+	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 583a99161aaa..0a7d1be0d124 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -31,5 +31,7 @@
 #define RPMH_RF_CLK5_A				22
 #define RPMH_PKA_CLK				23
 #define RPMH_HWKM_CLK				24
+#define RPMH_QLINK_CLK				25
+#define RPMH_QLINK_CLK_A			26
 
 #endif
-- 
2.33.0

