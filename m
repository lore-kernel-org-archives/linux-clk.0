Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B545C43387
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F86E21726
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="jg2B5f5d";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="PapV7NeM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbeLOKgZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Dec 2018 05:36:25 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45476 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbeLOKgZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Dec 2018 05:36:25 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A69A2608FD; Sat, 15 Dec 2018 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870184;
        bh=1KJTF5SpFsswNJK2ZnJErLvMwhZb/6RBxH8+xe/BQkY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jg2B5f5dG1z+Vv1KhLbVrJ7iYQqp2WlYbFsVA38gQrjyJJ7zKXSzOc8j5hHCBCyGW
         xyB/W64UwejQ5t5aMhm+8w8AiaHLhaTvBvttJwl8AZobE79facEz+dx8ajJahldK44
         9FBqfaPvx4MjUcAri7swRt54CoLFUE8zF63c/qzw=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3C6A6087D;
        Sat, 15 Dec 2018 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870183;
        bh=1KJTF5SpFsswNJK2ZnJErLvMwhZb/6RBxH8+xe/BQkY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PapV7NeMl7Hi6M0XUYKrcpCdgGJSxh6CGw2QnKrDp5HjW0Y88HUIDRYoOtjoi6Pyr
         1iQcN7l7gur8xx5HCEkxo8cjJrQHa7bhI33ceuLqELiDUpWhpCu14O9e44q+sEkrKC
         mDBUq1Nn/PDk88eFfYIJ4MOznu1478z5Y5sO62aM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3C6A6087D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 4/7] clk: qcom: Add WCSS gcc clock control for QCS404
Date:   Sat, 15 Dec 2018 16:05:54 +0530
Message-Id: <20181215103557.2748-5-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181215103557.2748-1-govinds@codeaurora.org>
References: <20181215103557.2748-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the WCSS QDSP gcc clock control used on qcs404 based devices.
This would allow wcss remoteproc driver to control the required gcc clocks to
bring the subsystem out of reset.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 51 ++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index f5235cc2d3f1..efb28cff1102 100644
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
+	[GCC_WCSS_Q6_AHB_CBCR_CLK] = NULL,
+	[GCC_WCSS_Q6_AXIM_CBCR_CLK] =  NULL,
+
 };
 
 static const struct qcom_reset_map gcc_qcs404_resets[] = {
@@ -2685,6 +2714,21 @@ static const struct qcom_reset_map gcc_qcs404_resets[] = {
 	[GCC_PCIE_0_SLEEP_ARES] = {0x3e040, 1},
 	[GCC_PCIE_0_PIPE_ARES] = {0x3e040, 0},
 	[GCC_EMAC_BCR] = { 0x4e000 },
+	[GCC_GENI_IR_BCR] = {0x0F000},
+	[GCC_USB_HS_BCR] = {0x41000},
+	[GCC_USB2_HS_PHY_ONLY_BCR] = {0x41034},
+	[GCC_QUSB2_PHY_BCR] = {0x4103C},
+	[GCC_USB_HS_PHY_CFG_AHB_BCR] = {0x0000C, 1},
+	[GCC_USB2A_PHY_BCR] = {0x0000C, 0},
+	[GCC_USB3_PHY_BCR] = {0x39004},
+	[GCC_USB_30_BCR] = {0x39000},
+	[GCC_USB3PHY_PHY_BCR] = {0x39008},
+	[GCC_PCIE_0_BCR] = {0x3E000},
+	[GCC_PCIE_0_PHY_BCR] = {0x3E004},
+	[GCC_PCIE_0_LINK_DOWN_BCR] = {0x3E038},
+	[GCC_PCIEPHY_0_PHY_BCR] = {0x3E03C},
+	[GCC_EMAC_BCR] = {0x4E000},
+	[GCC_WDSP_RESTART] = {0x19000},
 };
 
 static const struct regmap_config gcc_qcs404_regmap_config = {
@@ -2695,7 +2739,7 @@ static const struct regmap_config gcc_qcs404_regmap_config = {
 	.fast_io	= true,
 };
 
-static const struct qcom_cc_desc gcc_qcs404_desc = {
+static struct qcom_cc_desc gcc_qcs404_desc = {
 	.config = &gcc_qcs404_regmap_config,
 	.clks = gcc_qcs404_clocks,
 	.num_clks = ARRAY_SIZE(gcc_qcs404_clocks),
@@ -2726,6 +2770,11 @@ static int gcc_qcs404_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+#ifdef CONFIG_QCS_WCSSCC_404
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] = &gcc_wdsp_q6ss_ahbs_clk.clkr;
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] = &gcc_wdsp_q6ss_axim_clk.clkr;
+#endif
+
 	return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

