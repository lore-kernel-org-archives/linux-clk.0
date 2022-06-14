Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D20BC43334
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jun 2022 18:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239232AbiFNSC7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Jun 2022 14:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238037AbiFNSC6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2022 14:02:58 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0795544A1E
        for <linux-clk@vger.kernel.org>; Tue, 14 Jun 2022 11:02:53 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7FE7E843A9;
        Tue, 14 Jun 2022 20:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655229771;
        bh=nmt6hKLNNwrBLN0Ny6DiQww3SNZGMxBs39oedellKME=;
        h=From:To:Cc:Subject:Date:From;
        b=Y831NPVsnHSIcpDITOOHrUALu4F5GHT1/7UJ01pB6ZUmahBEhc+zMeOMSVkLLd0Z0
         LxMqvIsAEF+tkWNkyKmR1uXV9UDXPAqbHQdDnbKqSJm4eFTHdNmdCW7W9FH/2Rg69f
         6wO+Ds/REJ9Q0xxL/zNzIeBlAN1SgHsD4aya1QkCNqqqPe0BdMct5CPEd73Ut+3SuO
         oh8xTcT/LsqIAXKilzHgaDGJSpMf/xWNSypqRcovrNvvbHGkGUttYRhWbuErAiA5pZ
         D6Mout6r8l4Hyv23mPslpTbYujzp1ng9tATHab5LhqkRoBnsbbh1b3KMWUPCtyZTrU
         c8areIpf9uicg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: [PATCH v2 1/4] clk: imx: imx8mp: Add audiomix block control
Date:   Tue, 14 Jun 2022 20:02:36 +0200
Message-Id: <20220614180239.778334-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
series of clock gates and muxes. Model it as a large static table of
gates and muxes with one exception, which is the PLL14xx . The PLL14xx
SAI PLL has to be registered separately.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
To: linux-clk@vger.kernel.org
Cc: linux-imx@nxp.com
---
V2: No change
---
 drivers/clk/imx/Makefile              |   2 +-
 drivers/clk/imx/clk-imx8mp-audiomix.c | 262 ++++++++++++++++++++++++++
 2 files changed, 263 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-imx8mp-audiomix.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 88b9b9285d22e..c4290937637eb 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_MXC_CLK) += mxc-clk.o
 
 obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm.o
 obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
-obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
+obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
 obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
new file mode 100644
index 0000000000000..bfa6080f274ff
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for i.MX8M Plus Audio BLK_CTRL
+ *
+ * Copyright (C) 2022 Marek Vasut <marex@denx.de>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
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
+#define SAI_MCLK_SEL(n)		(300 + 4 * (n))	/* n in 0..5 */
+#define PDM_SEL			0x318
+#define SAI_PLL_GNRL_CTL	0x400
+
+#define SAIn_MCLK1_PARENT(n)						\
+static const char *clk_imx8mp_audiomix_sai##n##_mclk1_parents[] = {	\
+	"sai"__stringify(n), "sai"__stringify(n)"_mclk"			\
+}
+
+SAIn_MCLK1_PARENT(1);
+SAIn_MCLK1_PARENT(2);
+SAIn_MCLK1_PARENT(3);
+SAIn_MCLK1_PARENT(5);
+SAIn_MCLK1_PARENT(6);
+SAIn_MCLK1_PARENT(7);
+
+static const char *clk_imx8mp_audiomix_sai_mclk2_parents[] = {
+	"sai1", "sai2", "sai3", "dummy",
+	"sai5", "sai6", "sai7",
+	"sai1_mclk", "sai2_mclk", "sai3_mclk", "dummy",
+	"sai5_mclk", "sai6_mclk", "sai7_mclk",
+	"spdif_extclk", "dummy"
+};
+
+static const char *clk_imx8mp_audiomix_pdm_parents[] = {
+	"ccm_pdm", "sai_pll_out_div2", "sai1_mclk", "dummy"
+};
+
+
+static const char * const clk_imx8mp_audiomix_pll_parents[] = {
+	"osc_24m", "dummy", "dummy", "dummy"
+};
+
+static const char * const clk_imx8mp_audiomix_pll_bypass_sels[] = {
+	"sai_pll", "sai_pll_ref_sel"
+};
+
+#define CLK_GATE(name, cname)						\
+	{								\
+		name"_cg",						\
+		IMX8MP_CLK_AUDIOMIX_##cname,				\
+		"audio_ahb", NULL, 1,					\
+		CLKEN0 + 4 * !!(IMX8MP_CLK_AUDIOMIX_##cname / 32),	\
+		1, IMX8MP_CLK_AUDIOMIX_##cname % 32			\
+	}
+
+#define CLK_SAIn(n)							\
+	{								\
+		"sai"__stringify(n)"_mclk1_sel",			\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1_SEL,			\
+		NULL,							\
+		clk_imx8mp_audiomix_sai##n##_mclk1_parents,		\
+		ARRAY_SIZE(clk_imx8mp_audiomix_sai##n##_mclk1_parents), \
+		SAI_MCLK_SEL(n), 1, 0					\
+	}, {								\
+		"sai"__stringify(n)"_mclk2_sel",			\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2_SEL,			\
+		NULL,							\
+		clk_imx8mp_audiomix_sai_mclk2_parents,		\
+		ARRAY_SIZE(clk_imx8mp_audiomix_sai_mclk2_parents),	\
+		SAI_MCLK_SEL(n), 4, 1					\
+	}, {								\
+		"sai"__stringify(n)"_ipg_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG,			\
+		"audio_ahb", NULL, 1,					\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG		\
+	}, {								\
+		"sai"__stringify(n)"_mclk1_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1,			\
+		"sai"__stringify(n)"_mclk1_sel", NULL, 1,		\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1		\
+	}, {								\
+		"sai"__stringify(n)"_mclk2_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2,			\
+		"sai"__stringify(n)"_mclk2_sel", NULL, 1,		\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2		\
+	}, {								\
+		"sai"__stringify(n)"_mclk3_cg",				\
+		IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3,			\
+		"sai_pll_out_div2", NULL, 1,				\
+		CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3		\
+	}
+
+#define CLK_PDM								\
+	{								\
+		"pdm_sel", IMX8MP_CLK_AUDIOMIX_PDM_SEL, NULL,		\
+		clk_imx8mp_audiomix_pdm_parents,			\
+		ARRAY_SIZE(clk_imx8mp_audiomix_pdm_parents),		\
+		PDM_SEL, 2, 0						\
+	}
+
+struct clk_imx8mp_audiomix_sel {
+	const char	*name;
+	int		clkid;
+	const char	*parent;	/* For gate */
+	const char	**parents;	/* For mux */
+	int		num_parents;
+	u16		reg;
+	u8		width;
+	u8		shift;
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
+struct clk_imx8mp_audiomix_priv {
+	struct clk_hw		*clk[IMX8MP_CLK_AUDIOMIX_END];
+};
+
+static struct clk_hw *
+clk_imx8mp_audiomix_of_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct clk_imx8mp_audiomix_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	return priv->clk[idx];
+}
+
+static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
+{
+	struct clk_imx8mp_audiomix_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	struct clk_hw *hw;
+	int i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	for (i = 0; i < ARRAY_SIZE(sels); i++) {
+		if (sels[i].num_parents == 1) {
+			hw = devm_clk_hw_register_gate(dev,
+						       sels[i].name,
+						       sels[i].parent,
+						       0,
+						       base + sels[i].reg,
+						       sels[i].shift,
+						       0, NULL);
+		} else {
+			hw = devm_clk_hw_register_mux(dev, sels[i].name,
+						      sels[i].parents,
+						      sels[i].num_parents,
+						      0,
+						      base + sels[i].reg,
+						      sels[i].shift,
+						      sels[i].width,
+						      0, NULL);
+		}
+
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		priv->clk[sels[i].clkid] = hw;
+	}
+
+	/* SAI PLL */
+	hw = devm_clk_hw_register_mux(dev, "sai_pll_ref_sel",
+				      clk_imx8mp_audiomix_pll_parents,
+				      ARRAY_SIZE(clk_imx8mp_audiomix_pll_parents),
+				      CLK_SET_RATE_NO_REPARENT,
+				      base + SAI_PLL_GNRL_CTL, 0, 2, 0, NULL);
+	priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL_REF_SEL] = hw;
+
+	hw = imx_dev_clk_hw_pll14xx(dev, "sai_pll", "sai_pll_ref_sel",
+				    base + 0x400, &imx_1443x_pll);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL] = hw;
+
+	hw = devm_clk_hw_register_mux(dev, "sai_pll_bypass",
+				      clk_imx8mp_audiomix_pll_bypass_sels,
+				      ARRAY_SIZE(clk_imx8mp_audiomix_pll_bypass_sels),
+				      CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
+				      base + SAI_PLL_GNRL_CTL, 16, 1, 0, NULL);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL_BYPASS] = hw;
+
+	hw = devm_clk_hw_register_gate(dev, "sai_pll_out", "sai_pll_bypass",
+				       0, base + SAI_PLL_GNRL_CTL, 13,
+				       0, NULL);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL_OUT] = hw;
+
+	hw = devm_clk_hw_register_fixed_factor(dev, "sai_pll_out_div2",
+					       "sai_pll_out", 0, 1, 2);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	return devm_of_clk_add_hw_provider(&pdev->dev,
+					   clk_imx8mp_audiomix_of_clk_get,
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
2.35.1

