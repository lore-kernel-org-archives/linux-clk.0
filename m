Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E38C282DA
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 442E120857
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="PErXfSO8";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="dopYmPRu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfBBP0q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:26:46 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37404 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfBBP0q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:26:46 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4958760960; Sat,  2 Feb 2019 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121205;
        bh=I5GwVj9SqQ0wr9P82gWN4dFKiDiO0GK0PgBOJAnQTF8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PErXfSO8TtBVYr2QFSVXIz2jL6+BApJYJ8ieUj+cvgW5V1kzrTL4d/DPQlUYszR1x
         V4atecncBN+qzckGofG1AWtczhfe5cnSE5nfpBzF61RPalMzj9OlBB4IXCIPmtbALE
         IIy68JdnjGT9pMv9SMEmlvtMXVwXz8OE7lCXLw4c=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77D556090B;
        Sat,  2 Feb 2019 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121204;
        bh=I5GwVj9SqQ0wr9P82gWN4dFKiDiO0GK0PgBOJAnQTF8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dopYmPRu8llkrB6vZDXPmMlLOgoTUI8TMXb9xzY+aywJGIZ4bYutCY1WBhp6Pw6HR
         nUbBT9WQVywQBq3riTUQ1FGZ4pUvEKrx/4p/M+MOLQKC7tc4gCmbL+75hKgrKw42vU
         zBfr1+Kz/lQoNHQHI9QF4V9hDGtXZsTx4gJacA+Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77D556090B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 2/8] clk: qcom: Add WCSS gcc clock control for QCS404
Date:   Sat,  2 Feb 2019 20:56:20 +0530
Message-Id: <20190202152626.1006-3-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the WCSS QDSP gcc clock control used on qcs404
based devices. This would allow wcss remoteproc driver to control
the required gcc clocks to bring the subsystem out of reset.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 37 ++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index f5235cc2d3f1..e3e1cb322cdd 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2520,6 +2520,32 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 	},
 };
 
+static struct clk_branch gcc_wdsp_q6ss_ahbs_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wdsp_q6ss_ahbs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wdsp_q6ss_axim_clk = {
+	.halt_reg = 0x1e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wdsp_q6ss_axim_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_hw *gcc_qcs404_hws[] = {
 	&cxo.hw,
 };
@@ -2661,6 +2687,9 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
 	[GCC_DCC_XO_CLK] = &gcc_dcc_xo_clk.clkr,
+	[GCC_WCSS_Q6_AHB_CLK] = NULL,
+	[GCC_WCSS_Q6_AXIM_CLK] =  NULL,
+
 };
 
 static const struct qcom_reset_map gcc_qcs404_resets[] = {
@@ -2685,6 +2714,7 @@ static const struct qcom_reset_map gcc_qcs404_resets[] = {
 	[GCC_PCIE_0_SLEEP_ARES] = {0x3e040, 1},
 	[GCC_PCIE_0_PIPE_ARES] = {0x3e040, 0},
 	[GCC_EMAC_BCR] = { 0x4e000 },
+	[GCC_WDSP_RESTART] = {0x19000},
 };
 
 static const struct regmap_config gcc_qcs404_regmap_config = {
@@ -2695,7 +2725,7 @@ static const struct regmap_config gcc_qcs404_regmap_config = {
 	.fast_io	= true,
 };
 
-static const struct qcom_cc_desc gcc_qcs404_desc = {
+static struct qcom_cc_desc gcc_qcs404_desc = {
 	.config = &gcc_qcs404_regmap_config,
 	.clks = gcc_qcs404_clocks,
 	.num_clks = ARRAY_SIZE(gcc_qcs404_clocks),
@@ -2726,6 +2756,11 @@ static int gcc_qcs404_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,wcss-unprotected")) {
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CLK] = &gcc_wdsp_q6ss_ahbs_clk.clkr;
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CLK] = &gcc_wdsp_q6ss_axim_clk.clkr;
+	}
+
 	return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

