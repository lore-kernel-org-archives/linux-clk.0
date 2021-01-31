Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6B4C433DB
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 01:31:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 146C564E19
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 01:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhAaBbM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Jan 2021 20:31:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhAaBbL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Jan 2021 20:31:11 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBBFC061573
        for <linux-clk@vger.kernel.org>; Sat, 30 Jan 2021 17:30:16 -0800 (PST)
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 139BD3F284;
        Sun, 31 Jan 2021 02:30:14 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: smd-rpm: Add mdm9607 clocks
Date:   Sun, 31 Jan 2021 02:30:09 +0100
Message-Id: <20210131013009.54177-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for RPM-managed clocks on the MDM9607 platform.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index b44a0622fb3a..5ac207d4b8ab 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -10,6 +10,7 @@ Required properties :
 - compatible : shall contain only one of the following. The generic
                compatible "qcom,rpmcc" should be also included.
 
+			"qcom,rpmcc-mdm9607", "qcom,rpmcc"
 			"qcom,rpmcc-msm8660", "qcom,rpmcc"
 			"qcom,rpmcc-apq8060", "qcom,rpmcc"
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0e1dfa89489e..ceea50bae8f8 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -406,6 +406,37 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.unprepare	= clk_smd_rpm_unprepare,
 };
 
+/* mdm9607 */
+DEFINE_CLK_SMD_RPM_BRANCH(mdm9607, xo_clk_src, xo_a_clk_src, QCOM_SMD_RPM_MISC_CLK, 0,
+								19200000);
+DEFINE_CLK_SMD_RPM(mdm9607, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(mdm9607, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(mdm9607, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
+DEFINE_CLK_SMD_RPM_QDSS(mdm9607, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(mdm9607, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(mdm9607, bb_clk1_pin, bb_clk1_a_pin, 1);
+static struct clk_smd_rpm *mdm9607_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]	= &mdm9607_xo_clk_src,
+	[RPM_SMD_XO_A_CLK_SRC]	= &mdm9607_xo_a_clk_src,
+	[RPM_SMD_PCNOC_CLK]		= &mdm9607_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &mdm9607_pcnoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &mdm9607_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &mdm9607_bimc_a_clk,
+	[RPM_SMD_QPIC_CLK]		= &mdm9607_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A]		= &mdm9607_qpic_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &mdm9607_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &mdm9607_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &mdm9607_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &mdm9607_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &mdm9607_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &mdm9607_bb_clk1_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
+	.clks = mdm9607_clks,
+	.num_clks = ARRAY_SIZE(mdm9607_clks),
+};
+
 /* msm8916 */
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -1060,6 +1091,7 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
-- 
2.30.0

