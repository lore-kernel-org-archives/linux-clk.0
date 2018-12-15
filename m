Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE83C43444
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04A952086D
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Z1dGWblh";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="KOtkSYwU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbeLOKgS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Dec 2018 05:36:18 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45212 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbeLOKgS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Dec 2018 05:36:18 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B923E60863; Sat, 15 Dec 2018 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870176;
        bh=2vV9O6X7X1l/x3txVSZQsx/35yOy4ubE04agsedhZoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z1dGWblhyL5Ntv3aZFExMAOSH+QKZnXmowkmYsUbb/icmRj/m4vpnYfTJrxSrsdcN
         8uFiGqKm+6Sjf5wket1OMPC7fconiZDwnSZHCq97TbbRDcUk5X1tNBwAPyzE1ArgOM
         ZxELKstCZj77+7iRQbGgQJgCuV+HIE+4YJ1rW1Ho=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 13DEA6081E;
        Sat, 15 Dec 2018 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870174;
        bh=2vV9O6X7X1l/x3txVSZQsx/35yOy4ubE04agsedhZoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KOtkSYwU7/YMCS1IUtsQLNzMd39vXqjA1kkYsLXXPmOS8GGJ4DZN26rWS7GfsiFuU
         uCCIm/aAlps01sdVmNPfEg8+P10OSo8YvVK8AUU0P716STqEhj8962h3Fan8muUctm
         e4SbQ22KJ/1u322Eo/ix5VTP27fGZRD0Mw2Umeqs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13DEA6081E
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
Subject: [PATCH v3 2/7] clk: qcom: Add WCSS Q6DSP clock controller for QCS404
Date:   Sat, 15 Dec 2018 16:05:52 +0530
Message-Id: <20181215103557.2748-3-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181215103557.2748-1-govinds@codeaurora.org>
References: <20181215103557.2748-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the WCSS QDSP clock control used on qcs404
based devices. This would allow wcss remoteproc driver to
control the required WCSS QDSP clock/reset controls to
bring the subsystem out of reset and shutdown the WCSS QDSP.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/Kconfig         |   9 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/wcsscc-qcs404.c | 297 +++++++++++++++++++++++++++++++
 3 files changed, 307 insertions(+)
 create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9fe28b9ceba8..84acc7718691 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -222,6 +222,15 @@ config QCS_GCC_404
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
 
+config QCS_WCSSCC_404
+	tristate "QCS404 WCSS Clock Controller"
+	depends on COMMON_CLK_QCOM
+	select QCS_GCC_404
+	help
+	  Support for the WCSS clock controller on QCS404 devices.
+	  Say Y if you want to use the WCSS branch clocks of the WCSS clock
+	  controller to reset the WCSS subsystem.
+
 config SDM_GCC_845
 	tristate "SDM845 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 108c27d648a2..44563cb10cd5 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
+obj-$(CONFIG_QCS_WCSSCC_404) += wcsscc-qcs404.o
 obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
 obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
diff --git a/drivers/clk/qcom/wcsscc-qcs404.c b/drivers/clk/qcom/wcsscc-qcs404.c
new file mode 100644
index 000000000000..bd694ef1b6ac
--- /dev/null
+++ b/drivers/clk/qcom/wcsscc-qcs404.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <dt-bindings/clock/qcom,wcss-qcs404.h>
+#include <linux/reset-controller.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+#include "reset.h"
+
+/* Q6SSTOP clocks. These clocks are voted
+ * during by remoteproc client when loaded from
+ * user space, soc hang is seen when CCF turns
+ * off unused clocks. As a temp solution use
+ * CLK_IGNORE_UNUSED flags which prevent these
+ * clocks from being gated during bootup.
+ */
+static struct clk_branch lcc_ahbfabric_cbc_clk = {
+	.halt_reg = 0x1b004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1b004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_ahbfabric_cbc_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_ahbs_cbc_clk = {
+	.halt_reg = 0x22000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x22000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_ahbs_cbc_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_tcm_slave_cbc_clk = {
+	.halt_reg = 0x1c000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1c000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_tcm_slave_cbc_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_ahbm_cbc_clk = {
+	.halt_reg = 0x22004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x22004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_ahbm_cbc_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_axim_cbc_clk = {
+	.halt_reg = 0x1c004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_axim_cbc_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_bcr_sleep_clk = {
+	.halt_reg = 0x6004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x6004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_bcr_sleep_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+/* TCSR clock */
+static struct clk_branch wcss_lcc_csr_cbcr_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_lcc_csr_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+/* Q6SSTOP_QDSP6SS clock */
+static struct clk_branch q6ss_xo_clk = {
+	.halt_reg = 0x38,
+	/* CLK_OFF would not toggle until WCSS is out of reset */
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x38,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "q6ss_xo_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch q6ss_slp_clk = {
+	.halt_reg = 0x3c,
+	/* CLK_OFF would not toggle until WCSS is out of reset */
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x3c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "q6ss_slp_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch q6sstop_q6ss_gfmux_clk_src = {
+	.halt_reg = 0x20,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x20,
+		.enable_mask = BIT(1) | BIT(3) | BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "q6sstop_q6ss_gfmux_clk_src",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct regmap_config wcss_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static struct clk_regmap *wcss_q6sstop_qcs404_clocks[] = {
+	[WCSS_AHBFABRIC_CBCR_CLK] = &lcc_ahbfabric_cbc_clk.clkr,
+	[WCSS_AHBS_CBCR_CLK] = &lcc_q6ss_ahbs_cbc_clk.clkr,
+	[WCSS_TCM_CBCR_CLK] = &lcc_q6ss_tcm_slave_cbc_clk.clkr,
+	[WCSS_AHBM_CBCR_CLK] = &lcc_q6ss_ahbm_cbc_clk.clkr,
+	[WCSS_AXIM_CBCR_CLK] = &lcc_q6ss_axim_cbc_clk.clkr,
+	[WCSS_BCR_CBCR_CLK] = &lcc_q6ss_bcr_sleep_clk.clkr,
+};
+
+static const struct qcom_reset_map qdsp6ss_qcs404_resets[] = {
+	[Q6SSTOP_QDSP6SS_RESET] = {0x14, 0},
+	[Q6SSTOP_QDSP6SS_CORE_RESET] = {0x14, 1},
+	[Q6SSTOP_QDSP6SS_BUS_RESET] = {0x14, 2},
+};
+
+static const struct qcom_reset_map q6sstop_qcs404_resets[] = {
+	[Q6SSTOP_BCR_RESET] = {0x6000},
+};
+
+static const struct qcom_cc_desc wcss_q6sstop_qcs404_desc = {
+	.config = &wcss_regmap_config,
+	.clks = wcss_q6sstop_qcs404_clocks,
+	.num_clks = ARRAY_SIZE(wcss_q6sstop_qcs404_clocks),
+	.resets = q6sstop_qcs404_resets,
+	.num_resets = ARRAY_SIZE(q6sstop_qcs404_resets),
+};
+
+static struct clk_regmap *wcnss_tcsr_qcs404_clocks[] = {
+	[WCSS_LCC_CBCR_CLK] = &wcss_lcc_csr_cbcr_clk.clkr,
+};
+
+static const struct qcom_cc_desc wcnss_tcsr_qcs404_desc = {
+	.config = &wcss_regmap_config,
+	.clks = wcnss_tcsr_qcs404_clocks,
+	.num_clks = ARRAY_SIZE(wcnss_tcsr_qcs404_clocks),
+};
+
+static struct clk_regmap *wcnss_qdsp6ss_qcs404_clocks[] = {
+	[WCSS_QDSP6SS_XO_CBCR_CLK] = &q6ss_xo_clk.clkr,
+	[WCSS_QDSP6SS_SLEEP_CBCR_CLK] = &q6ss_slp_clk.clkr,
+	[WCSS_QDSP6SS_GFMMUX_CLK] = &q6sstop_q6ss_gfmux_clk_src.clkr,
+};
+
+static const struct qcom_cc_desc wcnss_qdsp6ss_qcs404_desc = {
+	.config = &wcss_regmap_config,
+	.clks = wcnss_qdsp6ss_qcs404_clocks,
+	.num_clks = ARRAY_SIZE(wcnss_qdsp6ss_qcs404_clocks),
+	.resets = qdsp6ss_qcs404_resets,
+	.num_resets = ARRAY_SIZE(qdsp6ss_qcs404_resets),
+};
+
+static int wcss_clocks_qcs404_probe(struct platform_device *pdev, int index,
+				    const struct qcom_cc_desc *desc)
+{
+	struct regmap *regmap;
+	struct resource *res;
+	void __iomem *base;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(pdev, desc, regmap);
+}
+
+static const struct of_device_id wcss_cc_qcs404_match_table[] = {
+	{ .compatible = "qcom,qcs404-wcsscc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wcss_cc_qcs404_match_table);
+
+static int wcss_cc_qcs404_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+	int ret;
+
+	wcss_regmap_config.name = "wcss_q6sstop";
+	desc = &wcss_q6sstop_qcs404_desc;
+
+	ret = wcss_clocks_qcs404_probe(pdev, 0, desc);
+	if (ret)
+		return ret;
+
+	wcss_regmap_config.name = "wcnss_tcsr";
+	desc = &wcnss_tcsr_qcs404_desc;
+
+	ret = wcss_clocks_qcs404_probe(pdev, 1, desc);
+	if (ret)
+		return ret;
+
+	wcss_regmap_config.name = "wcss_qdsp6ss";
+	desc = &wcnss_qdsp6ss_qcs404_desc;
+
+	return wcss_clocks_qcs404_probe(pdev, 2, desc);
+}
+
+static struct platform_driver wcss_cc_qcs404_driver = {
+	.probe		= wcss_cc_qcs404_probe,
+	.driver		= {
+		.name	= "qcs404-wcsscc",
+		.of_match_table = wcss_cc_qcs404_match_table,
+	},
+};
+
+static int __init wcss_cc_qcs404_init(void)
+{
+	return platform_driver_register(&wcss_cc_qcs404_driver);
+}
+subsys_initcall(wcss_cc_qcs404_init);
+
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

