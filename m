Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5666BC7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 17:44:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjB0RoL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjB0RoJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 12:44:09 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D9923C78;
        Mon, 27 Feb 2023 09:43:44 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E074F851B1;
        Mon, 27 Feb 2023 18:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677519802;
        bh=QVMjstfs2GK/UUzfSLodP30ddUd12j9p+gC9mr54AYA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BOJGq7Xrneik9BixL4Y/pkz9BnA+83m868vcOvT95gBcSXEQDf8wTrZRmxigLLMED
         9ODMjtWhXcNfXr/5X3w/Iqau8bL0WzIWsJPKtbnSJpK6oL2Qre7QVSufVYlhn6MYUv
         fzx4GtiZWWcvno4uhrFZgCRggJq6ZaHyVlBltcISNc3SjkpBkTMW6diLflzbTuqHxQ
         xQoIn+x/Me7dcVl1whx+wDacBs5ScSIHTh3e6I+h2INqZHlaXVqvtNgDKBOClh5mJv
         RoJl+Yh/VE/7F/MZsR7x4OMN6XHkbhMV8AGKxolOIQYugIrTMVfKpU6HIT6rnQMaPG
         M39J761nvGazQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/5] clk: imx: imx8mp: Add audiomix block control
Date:   Mon, 27 Feb 2023 18:43:05 +0100
Message-Id: <20230227174308.87286-2-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227174308.87286-1-marex@denx.de>
References: <20230227174308.87286-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
series of clock gates and muxes. Model it as a large static table of
gates and muxes with one exception, which is the PLL14xx . The PLL14xx
SAI PLL has to be registered separately.

Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: No change
V3: - Use devm_platform_ioremap_resource
    - Use clk_hw_onecell_data instead of clk_imx8mp_audiomix_priv
    - Include mod_devicetable.h for of_device_id struct
    - Use struct clk_parent_data instead of string parent_name
V4: - Fix SAI_MCLK_SEL offset as pointed out by Marco
    - Add TB from Luca
    - Use devm_clk_hw_register_mux_parent_data_table() and drop
      custom devm_clk_hw_register_mux_parent_data() patch, tweak
      the indent to be less hideous
    - Rebase on next 20230223
V5: Add TB from Adam and Alexander
---
 drivers/clk/imx/Makefile              |   2 +-
 drivers/clk/imx/clk-imx8mp-audiomix.c | 277 ++++++++++++++++++++++++++
 2 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-imx8mp-audiomix.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index a75d59f7cb8a6..ae9d84ef046ba 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_MXC_CLK) += mxc-clk.o
 
 obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm.o
 obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
-obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
+obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
 obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
new file mode 100644
index 0000000000000..e4300df88f1ac
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for i.MX8M Plus Audio BLK_CTRL
+ *
+ * Copyright (C) 2022 Marek Vasut <marex@denx.de>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "clk.h"
+
+#define CLKEN0			0x000
+#define CLKEN1			0x004
+#define SAI_MCLK_SEL(n)		(0x300 + 4 * (n))	/* n in 0..5 */
+#define PDM_SEL			0x318
+#define SAI_PLL_GNRL_CTL	0x400
+
+#define SAIn_MCLK1_PARENT(n)						\
+static const struct clk_parent_data					\
+clk_imx8mp_audiomix_sai##n##_mclk1_parents[] = {			\
+	{								\
+		.fw_name = "sai"__stringify(n),				\
+		.name = "sai"__stringify(n)				\
+	}, {								\
+		.fw_name = "sai"__stringify(n)"_mclk",			\
+		.name = "sai"__stringify(n)"_mclk"			\
+	},								\
+}
+
+SAIn_MCLK1_PARENT(1);
+SAIn_MCLK1_PARENT(2);
+SAIn_MCLK1_PARENT(3);
+SAIn_MCLK1_PARENT(5);
+SAIn_MCLK1_PARENT(6);
+SAIn_MCLK1_PARENT(7);
+
+static const struct clk_parent_data clk_imx8mp_audiomix_sai_mclk2_parents[] = {
+	{ .fw_name = "sai1", .name = "sai1" },
+	{ .fw_name = "sai2", .name = "sai2" },
+	{ .fw_name = "sai3", .name = "sai3" },
+	{ .name = "dummy" },
+	{ .fw_name = "sai5", .name = "sai5" },
+	{ .fw_name = "sai6", .name = "sai6" },
+	{ .fw_name = "sai7", .name = "sai7" },
+	{ .fw_name = "sai1_mclk", .name = "sai1_mclk" },
+	{ .fw_name = "sai2_mclk", .name = "sai2_mclk" },
+	{ .fw_name = "sai3_mclk", .name = "sai3_mclk" },
+	{ .name = "dummy" },
+	{ .fw_name = "sai5_mclk", .name = "sai5_mclk" },
+	{ .fw_name = "sai6_mclk", .name = "sai6_mclk" },
+	{ .fw_name = "sai7_mclk", .name = "sai7_mclk" },
+	{ .fw_name = "spdif_extclk", .name = "spdif_extclk" },
+	{ .name = "dummy" },
+};
+
+static const struct clk_parent_data clk_imx8mp_audiomix_pdm_parents[] = {
+	{ .fw_name = "pdm", .name = "pdm" },
+	{ .name = "sai_pll_out_div2" },
+	{ .fw_name = "sai1_mclk", .name = "sai1_mclk" },
+	{ .name = "dummy" },
+};
+
+
+static const struct clk_parent_data clk_imx8mp_audiomix_pll_parents[] = {
+	{ .fw_name = "osc_24m", .name = "osc_24m" },
+	{ .name = "dummy" },
+	{ .name = "dummy" },
+	{ .name = "dummy" },
+};
+
+static const struct clk_parent_data clk_imx8mp_audiomix_pll_bypass_sels[] = {
+	{ .fw_name = "sai_pll", .name = "sai_pll" },
+	{ .fw_name = "sai_pll_ref_sel", .name = "sai_pll_ref_sel" },
+};
+
+#define CLK_GATE(gname, cname)						\
+	{								\
+		gname"_cg",						\
+		IMX8MP_CLK_AUDIOMIX_##cname,				\
+		{ .fw_name = "ahb", .name = "ahb" }, NULL, 1,		\
+		CLKEN0 + 4 * !!(IMX8MP_CLK_AUDIOMIX_##cname / 32),	\
+		1, IMX8MP_CLK_AUDIOMIX_##cname % 32			\
+	}
+
+#define CLK_SAIn(n)							\
+	{								\
+		"sai"__stringify(n)"_mclk1_sel",			\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1_SEL, {},		\
+		clk_imx8mp_audiomix_sai##n##_mclk1_parents,		\
+		ARRAY_SIZE(clk_imx8mp_audiomix_sai##n##_mclk1_parents), \
+		SAI_MCLK_SEL(n), 1, 0					\
+	}, {								\
+		"sai"__stringify(n)"_mclk2_sel",			\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2_SEL, {},		\
+		clk_imx8mp_audiomix_sai_mclk2_parents,			\
+		ARRAY_SIZE(clk_imx8mp_audiomix_sai_mclk2_parents),	\
+		SAI_MCLK_SEL(n), 4, 1					\
+	}, {								\
+		"sai"__stringify(n)"_ipg_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG,			\
+		{ .fw_name = "ahb", .name = "ahb" }, NULL, 1,		\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG		\
+	}, {								\
+		"sai"__stringify(n)"_mclk1_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1,			\
+		{							\
+			.fw_name = "sai"__stringify(n)"_mclk1_sel",	\
+			.name = "sai"__stringify(n)"_mclk1_sel"		\
+		}, NULL, 1,						\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1		\
+	}, {								\
+		"sai"__stringify(n)"_mclk2_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2,			\
+		{							\
+			.fw_name = "sai"__stringify(n)"_mclk2_sel",	\
+			.name = "sai"__stringify(n)"_mclk2_sel"		\
+		}, NULL, 1,						\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2		\
+	}, {								\
+		"sai"__stringify(n)"_mclk3_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3,			\
+		{							\
+			.fw_name = "sai_pll_out_div2",			\
+			.name = "sai_pll_out_div2"			\
+		}, NULL, 1,						\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3		\
+	}
+
+#define CLK_PDM								\
+	{								\
+		"pdm_sel", IMX8MP_CLK_AUDIOMIX_PDM_SEL, {},		\
+		clk_imx8mp_audiomix_pdm_parents,			\
+		ARRAY_SIZE(clk_imx8mp_audiomix_pdm_parents),		\
+		PDM_SEL, 2, 0						\
+	}
+
+struct clk_imx8mp_audiomix_sel {
+	const char			*name;
+	int				clkid;
+	const struct clk_parent_data	parent;		/* For gate */
+	const struct clk_parent_data	*parents;	/* For mux */
+	int				num_parents;
+	u16				reg;
+	u8				width;
+	u8				shift;
+};
+
+static struct clk_imx8mp_audiomix_sel sels[] = {
+	CLK_GATE("asrc", ASRC_IPG),
+	CLK_GATE("pdm", PDM_IPG),
+	CLK_GATE("earc", EARC_IPG),
+	CLK_GATE("ocrama", OCRAMA_IPG),
+	CLK_GATE("aud2htx", AUD2HTX_IPG),
+	CLK_GATE("earc_phy", EARC_PHY),
+	CLK_GATE("sdma2", SDMA2_ROOT),
+	CLK_GATE("sdma3", SDMA3_ROOT),
+	CLK_GATE("spba2", SPBA2_ROOT),
+	CLK_GATE("dsp", DSP_ROOT),
+	CLK_GATE("dspdbg", DSPDBG_ROOT),
+	CLK_GATE("edma", EDMA_ROOT),
+	CLK_GATE("audpll", AUDPLL_ROOT),
+	CLK_GATE("mu2", MU2_ROOT),
+	CLK_GATE("mu3", MU3_ROOT),
+	CLK_PDM,
+	CLK_SAIn(1),
+	CLK_SAIn(2),
+	CLK_SAIn(3),
+	CLK_SAIn(5),
+	CLK_SAIn(6),
+	CLK_SAIn(7)
+};
+
+static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *priv;
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+	struct clk_hw *hw;
+	int i;
+
+	priv = devm_kzalloc(dev,
+			    struct_size(priv, hws, IMX8MP_CLK_AUDIOMIX_END),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->num = IMX8MP_CLK_AUDIOMIX_END;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	for (i = 0; i < ARRAY_SIZE(sels); i++) {
+		if (sels[i].num_parents == 1) {
+			hw = devm_clk_hw_register_gate_parent_data(dev,
+				sels[i].name, &sels[i].parent, 0,
+				base + sels[i].reg, sels[i].shift, 0, NULL);
+		} else {
+			hw = devm_clk_hw_register_mux_parent_data_table(dev,
+				sels[i].name, sels[i].parents,
+				sels[i].num_parents, 0,
+				base + sels[i].reg,
+				sels[i].shift, sels[i].width,
+				0, NULL, NULL);
+		}
+
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		priv->hws[sels[i].clkid] = hw;
+	}
+
+	/* SAI PLL */
+	hw = devm_clk_hw_register_mux_parent_data_table(dev,
+		"sai_pll_ref_sel", clk_imx8mp_audiomix_pll_parents,
+		ARRAY_SIZE(clk_imx8mp_audiomix_pll_parents),
+		CLK_SET_RATE_NO_REPARENT, base + SAI_PLL_GNRL_CTL,
+		0, 2, 0, NULL, NULL);
+	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_REF_SEL] = hw;
+
+	hw = imx_dev_clk_hw_pll14xx(dev, "sai_pll", "sai_pll_ref_sel",
+				    base + 0x400, &imx_1443x_pll);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL] = hw;
+
+	hw = devm_clk_hw_register_mux_parent_data_table(dev,
+		"sai_pll_bypass", clk_imx8mp_audiomix_pll_bypass_sels,
+		ARRAY_SIZE(clk_imx8mp_audiomix_pll_bypass_sels),
+		CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
+		base + SAI_PLL_GNRL_CTL, 16, 1, 0, NULL, NULL);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_BYPASS] = hw;
+
+	hw = devm_clk_hw_register_gate(dev, "sai_pll_out", "sai_pll_bypass",
+				       0, base + SAI_PLL_GNRL_CTL, 13,
+				       0, NULL);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	priv->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_OUT] = hw;
+
+	hw = devm_clk_hw_register_fixed_factor(dev, "sai_pll_out_div2",
+					       "sai_pll_out", 0, 1, 2);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+					   priv);
+}
+
+static const struct of_device_id clk_imx8mp_audiomix_of_match[] = {
+	{ .compatible = "fsl,imx8mp-audio-blk-ctrl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
+
+static struct platform_driver clk_imx8mp_audiomix_driver = {
+	.probe	= clk_imx8mp_audiomix_probe,
+	.driver = {
+		.name = "imx8mp-audio-blk-ctrl",
+		.of_match_table = clk_imx8mp_audiomix_of_match,
+	},
+};
+
+module_platform_driver(clk_imx8mp_audiomix_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
+MODULE_DESCRIPTION("Freescale i.MX8MP Audio Block Controller driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

