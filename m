Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39245C4338F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 22:24:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19E2B6113C
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 22:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238356AbhHEWY1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 18:24:27 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:36825 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbhHEWY0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Aug 2021 18:24:26 -0400
Received: from localhost.localdomain (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 0A5A23F402;
        Fri,  6 Aug 2021 00:24:08 +0200 (CEST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: smd-rpm: Add mdm9607 clocks
Date:   Fri,  6 Aug 2021 00:24:00 +0200
Message-Id: <20210805222400.39027-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805222400.39027-1-konrad.dybcio@somainline.org>
References: <20210805222400.39027-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for RPM-managed clocks on the MDM9607 platform.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 800b2fef1887..05bca01bf476 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -913,7 +913,30 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 	.num_clks = ARRAY_SIZE(sdm660_clks),
 };
 
+static struct clk_smd_rpm *mdm9607_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
+	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A]		= &qcs404_qpic_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
+	.clks = mdm9607_clks,
+	.num_clks = ARRAY_SIZE(mdm9607_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
-- 
2.32.0

