Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEAFC433E9
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FF51223E4
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732127AbhARENw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Jan 2021 23:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732117AbhARENq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Jan 2021 23:13:46 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F156AC06179B
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:41 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j12so1455pjy.5
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9oCBXEeItNyLdmXrVsfC7b3QROxgUzyHxaMFoVN3rtU=;
        b=dZYLUEvv2aqy8qPlTGN+JRXlEikzp9EQxgYh2mJqVVzlBHDYtAzjZclRa6InIpEzvv
         std+ZPbbX65I/Ha795jG+12YqMji04zd0Gy94Kb+nehQ35ojI0PCUq3NR2XfKJArwvfj
         lPAzmY7+UzF3Suy4vSu7ojwZRBx5i4whLojlTIsDV/MroJuLIV2D1AuD6egG+fUsSKQ6
         KfLQV7T+G4fD35H3OB11LYAFR2oB6kPlJdcmg7U0BibpXiFbk9/209dOh9cuPnJB2nkt
         r3QMqLLMaoUbblxbtYCC4mM51fzkkYmnPhyDA7QW3Y4kV76hL8+RtAsbFId8uj9H5PaO
         LTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9oCBXEeItNyLdmXrVsfC7b3QROxgUzyHxaMFoVN3rtU=;
        b=c1faATDjkFnZXP58RiScS53nebjBiZGHhJF+TW45ahs9ig1SVg2OppZHspd522SyHh
         rMogc3/xLsitNVsjKzmq6fpTUbpSyJ+IX7cQWE67R9snZmz/Zlupdqrhcv+UYMb1yeCa
         kEAjve3ZTKzc/DKGQb+6TGw4rLe21qnFqUlV4BwQul5N0RpFlo+7wBHJbvcFUGb9TLJ7
         jCdnrHePpBamrzuWd9BG+wLvw/zh5SU2MzhEo4Cd+oUddhAwgtGfiFktDaqc+wPaJmyt
         wb+Ltq5NUB7qIIdfS6cIOCmOCOAmIhxb4qJVea/qTRqSSBaJLzhHsYpOptb8bZQr4/oT
         ydxQ==
X-Gm-Message-State: AOAM530mxDfCtmhZmadVHXBQbNiEnKk5zjsO+4tB6aUs2e/TPvA+r11p
        dFAjPLuPk06vkidpDtVj/BXE
X-Google-Smtp-Source: ABdhPJx2vxFUvhGa9X43FqtlQ1d/stlFPHsfhbu2i2ZbX28G6+UQEki7Is09FvRxBlZnj9bsZUDNbw==
X-Received: by 2002:a17:902:b688:b029:dc:240a:2bd7 with SMTP id c8-20020a170902b688b02900dc240a2bd7mr24688283pls.50.1610943161348;
        Sun, 17 Jan 2021 20:12:41 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id h15sm6727319pja.4.2021.01.17.20.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 20:12:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/5] clk: qcom: Add A7 PLL support
Date:   Mon, 18 Jan 2021 09:41:55 +0530
Message-Id: <20210118041156.50016-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for PLL found in Qualcomm SDX55 platforms which is used to
provide clock to the Cortex A7 CPU via a mux. This PLL can provide high
frequency clock to the CPU above 1GHz as compared to the other sources
like GPLL0.

In this driver, the power domain is attached to the cpudev. This is
required for CPUFreq functionality and there seems to be no better place
to do other than this driver (no dedicated CPUFreq driver).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/Kconfig  |   8 +++
 drivers/clk/qcom/Makefile |   1 +
 drivers/clk/qcom/a7-pll.c | 100 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 drivers/clk/qcom/a7-pll.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d32bb12cd8d0..d6f4aee4427a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config QCOM_A53PLL
 	  Say Y if you want to support higher CPU frequencies on MSM8916
 	  devices.
 
+config QCOM_A7PLL
+	tristate "SDX55 A7 PLL"
+	help
+	  Support for the A7 PLL on SDX55 devices. It provides the CPU with
+	  frequencies above 1GHz.
+	  Say Y if you want to support higher CPU frequencies on SDX55
+	  devices.
+
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9e5e0e3cb7b4..e7e0ac382176 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
 obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
 obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
+obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
 obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
 obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
new file mode 100644
index 000000000000..e171d3caf2cf
--- /dev/null
+++ b/drivers/clk/qcom/a7-pll.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm A7 PLL driver
+ *
+ * Copyright (c) 2020, Linaro Limited
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-alpha-pll.h"
+
+#define LUCID_PLL_OFF_L_VAL 0x04
+
+static const struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct clk_alpha_pll a7pll = {
+	.offset = 0x100,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "a7pll",
+			.parent_data =  &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config a7pll_config = {
+	.l = 0x39,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x2261,
+	.config_ctl_hi1_val = 0x029A699C,
+	.user_ctl_val = 0x1,
+	.user_ctl_hi_val = 0x805,
+};
+
+static const struct regmap_config a7pll_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x1000,
+	.fast_io		= true,
+};
+
+static int qcom_a7pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	u32 l_val;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &a7pll_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Configure PLL only if the l_val is zero */
+	regmap_read(regmap, a7pll.offset + LUCID_PLL_OFF_L_VAL, &l_val);
+	if (!l_val)
+		clk_lucid_pll_configure(&a7pll, regmap, &a7pll_config);
+
+	ret = devm_clk_register_regmap(dev, &a7pll.clkr);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &a7pll.clkr.hw);
+}
+
+static const struct of_device_id qcom_a7pll_match_table[] = {
+	{ .compatible = "qcom,sdx55-a7pll" },
+	{ }
+};
+
+static struct platform_driver qcom_a7pll_driver = {
+	.probe = qcom_a7pll_probe,
+	.driver = {
+		.name = "qcom-a7pll",
+		.of_match_table = qcom_a7pll_match_table,
+	},
+};
+module_platform_driver(qcom_a7pll_driver);
+
+MODULE_DESCRIPTION("Qualcomm A7 PLL Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

