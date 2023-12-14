Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypxVq5OE"
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB1E13A
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:14 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50e04354de0so4814014e87.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 08:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702572612; x=1703177412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6SBbXxp1rC0u/fpb+9pFf6izaqyPLMi0tUsJJJTofc=;
        b=ypxVq5OEuwhJ4arDyXgBQ7vdqY42gDfeK+9p2b0GrhJ/o++Xak/iKBtPnxhfLvOep0
         zxmQ/U1DNSBss5EzPZ+tAaxAbHZm4SvNLLTxl+uDmFKgq8FFlMDWMLcaORiDJJj8XMgU
         FRn5U/MdgexTuizJChJFJmSOdDT38CRCZxzNeEvVlubY4G4SnL+bIfFSCyuuDSpIWmcY
         PLkygt8eJGkEGc8gi2eARgEn48rAT7RmBt7ymK7Z0dCbBHykA/KRx5CujAx3RisaARPA
         /rjA1ufGpKvWNwFFopDa8p+lPXOYUa24Wby/8LvTB9M2Wbq3qYBbOsg0gMMqR8/RS+Bw
         4zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572612; x=1703177412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6SBbXxp1rC0u/fpb+9pFf6izaqyPLMi0tUsJJJTofc=;
        b=LKTqefk21SRo5AY227LzwpYJd3D6aS3DpN4atDcgJN8hFZYBfSmR9+ZnMstcgLB1MV
         T+AeBxa/L8H8GQzxCANpTS2ZpliUEB84sboVD0oJj4LaLVoOVuCfnc4fsIHR67QgszuL
         Ot9MqvqCX4+CiVUXkE1c2P/e/01PHeDVQaZDL4pItyx7CxlM6iOIxGKPuDSqVAEbxlf1
         AkDgHTujHqQo0jKzPN85iDYZLc27REsay6Qk5zyap9DWc4vONRBlC2PqaY5OzwyXu2eB
         4aB2kD0sbiJtGzF4KF/satEeHLKsTUtqV+Z+Xvw9hsHMf4P4cfsiBKimqeo7epr5JjYJ
         rkhg==
X-Gm-Message-State: AOJu0Yy9ac+xvMtrBCxQz+9+RaAjJMFt+L8v/x2NhD5fQppOz5cSTuAx
	zUrZVe2cTEwlEokoq9eEhHQ0ZQ==
X-Google-Smtp-Source: AGHT+IEroQEIonmk+u8LysqUKKwNxqtDWmkNkwBV6OxdD2SstoSR+sgrec0gA6pfwFFnTwpH7ZPJ3Q==
X-Received: by 2002:a05:6512:3c87:b0:50e:d97:fd25 with SMTP id h7-20020a0565123c8700b0050e0d97fd25mr2257661lfv.73.1702572612225;
        Thu, 14 Dec 2023 08:50:12 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tn9-20020a170907c40900b00a1f7ab65d3fsm8530308ejc.131.2023.12.14.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:50:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 14 Dec 2023 18:49:38 +0200
Subject: [PATCH v2 09/10] clk: qcom: Add TCSR clock driver for x1e80100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-x1e80100-clock-controllers-v2-9-2b0739bebd27@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
In-Reply-To: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9556; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=0fdBFTNPdIYtQjQB293LieWvGefC7AByWCScshpPFuQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlezIynuOSGDPNuNmnMZF01DjqVCEexn5z7ekuI
 ODnQYRrLDaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXsyMgAKCRAbX0TJAJUV
 Voh4EACaGOU0DLcbjR/66wcK8NHPeCKmvITQgSy4mUob+5vOKfy0kf1qLh4tjFbsRCCe1RJPQUA
 qNivchgB5ELf4HRoNBlbtHE9CRRy3fN5CDMmhK0004Z9CN5bZHj1w/hcRWndQXoNYBeL0M3hgBq
 2t4CqqdhgRQtgJyzczUDOJ/pDvW7aJ0dw119XIgpX7aplXIzLXEgyE2sEK8LxhnSS9x6Rll6ggK
 fCLtvIW7KANcsd9B6RhpqRrc/0OeecGN46VXpupJR9uYHgBLwkapIeOe24mV7tKS+hSxCHbgBd+
 REENu8FQygTHz71rbHWnmVvt1lbwpkCGAIt29eDG9C6FBziz2JIyOANFfKBmo7GIUMVHNqPuEU1
 j5BD4i5AV/5eF8xR6NnzF0nig6wDdtOkIytTJ6IQtraJNwZxWBgEkEu7wsuaMUYPytpsqrIVu8t
 MDwpXVwSVNInP62N1JqC5lKjltGXDKpra8DKe9zXrV76HBXwGkYKun/a+40LM3SjY+miGFJMjhe
 dEjhLwtqZTrvseAbdFMar8DyzjWNHiTS7PfzVV+yQoDkYVnl7aRoKY13ff0rDRCTP7Z0UhqxDyj
 JI+88TTQpw53NAbFAYvroDK+msmjFBjc9RGPJ4TfwQrEV9XGdd8YdWQIOSzQ5f14WRrS83G63qC
 vqP+v8ERCYR1k0A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The TCSR clock controller found on X1E80100 provides refclks
for PCIE, USB and UFS. Add clock driver for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/Kconfig           |   8 ++
 drivers/clk/qcom/Makefile          |   1 +
 drivers/clk/qcom/tcsrcc-x1e80100.c | 285 +++++++++++++++++++++++++++++++++++++
 3 files changed, 294 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d66934ca5e94..0633728c870c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -49,6 +49,14 @@ config CLK_X1E80100_GPUCC
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config CLK_X1E80100_TCSRCC
+	tristate "X1E80100 TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on X1E80100 devices.
+	  Say Y if you want to use peripheral devices such as SD/UFS.
+
 config QCOM_A53PLL
 	tristate "MSM8916 A53 PLL"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index a037a29e9d61..750b084553c6 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
+obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
 obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc-x1e80100.c
new file mode 100644
index 000000000000..a815e10ef6f0
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_edp_clkref_en = {
+	.halt_reg = 0x15130,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_edp_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_2l_4_clkref_en = {
+	.halt_reg = 0x15100,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15100,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_pcie_2l_4_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_2l_5_clkref_en = {
+	.halt_reg = 0x15104,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15104,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_pcie_2l_5_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_8l_clkref_en = {
+	.halt_reg = 0x15108,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15108,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_pcie_8l_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_mp0_clkref_en = {
+	.halt_reg = 0x1510c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1510c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_usb3_mp0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_mp1_clkref_en = {
+	.halt_reg = 0x15110,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15110,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_usb3_mp1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_1_clkref_en = {
+	.halt_reg = 0x15114,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15114,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_usb2_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_phy_clkref_en = {
+	.halt_reg = 0x15118,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15118,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_ufs_phy_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb4_1_clkref_en = {
+	.halt_reg = 0x15120,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15120,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_usb4_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb4_2_clkref_en = {
+	.halt_reg = 0x15124,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15124,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_usb4_2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_2_clkref_en = {
+	.halt_reg = 0x15128,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15128,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_usb2_2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_4l_clkref_en = {
+	.halt_reg = 0x1512c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1512c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_pcie_4l_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_x1e80100_clocks[] = {
+	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
+	[TCSR_PCIE_2L_4_CLKREF_EN] = &tcsr_pcie_2l_4_clkref_en.clkr,
+	[TCSR_PCIE_2L_5_CLKREF_EN] = &tcsr_pcie_2l_5_clkref_en.clkr,
+	[TCSR_PCIE_8L_CLKREF_EN] = &tcsr_pcie_8l_clkref_en.clkr,
+	[TCSR_USB3_MP0_CLKREF_EN] = &tcsr_usb3_mp0_clkref_en.clkr,
+	[TCSR_USB3_MP1_CLKREF_EN] = &tcsr_usb3_mp1_clkref_en.clkr,
+	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
+	[TCSR_UFS_PHY_CLKREF_EN] = &tcsr_ufs_phy_clkref_en.clkr,
+	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
+	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
+	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
+	[TCSR_PCIE_4L_CLKREF_EN] = &tcsr_pcie_4l_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_x1e80100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_x1e80100_desc = {
+	.config = &tcsr_cc_x1e80100_regmap_config,
+	.clks = tcsr_cc_x1e80100_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_x1e80100_clocks),
+};
+
+static const struct of_device_id tcsr_cc_x1e80100_match_table[] = {
+	{ .compatible = "qcom,x1e80100-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_x1e80100_match_table);
+
+static int tcsr_cc_x1e80100_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_x1e80100_desc);
+}
+
+static struct platform_driver tcsr_cc_x1e80100_driver = {
+	.probe = tcsr_cc_x1e80100_probe,
+	.driver = {
+		.name = "tcsr_cc-x1e80100",
+		.of_match_table = tcsr_cc_x1e80100_match_table,
+	},
+};
+
+static int __init tcsr_cc_x1e80100_init(void)
+{
+	return platform_driver_register(&tcsr_cc_x1e80100_driver);
+}
+subsys_initcall(tcsr_cc_x1e80100_init);
+
+static void __exit tcsr_cc_x1e80100_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_x1e80100_driver);
+}
+module_exit(tcsr_cc_x1e80100_exit);
+
+MODULE_DESCRIPTION("QTI TCSRCC X1E80100 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

