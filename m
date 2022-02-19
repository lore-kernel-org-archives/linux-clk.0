Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117B8C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 01:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239053AbiBSBup (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 20:50:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234255AbiBSBuo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 20:50:44 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7419F25BD68;
        Fri, 18 Feb 2022 17:50:24 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 929F883B93;
        Sat, 19 Feb 2022 02:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645235423;
        bh=IXbg4siln+tAyRany3zGzO7MFnI3wwlquqLGN/x77AA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U8Ovhp1zu+pDpvdlPmAsLvJk5hV9poddWEK3CXHG5DXtCL8NkhpKYe1lMhsmH4nun
         VQpMxSB1r95jfygjkuVOteEt+Ro2LVz3sWeML48qFdemzhRir6mgo2hXvHLqgqd/m8
         b6sd6n57OBlT9eAfEHn1SjRc0f24z8Fh10pskjPIR7IGwjdlG4tu0I41rAduqKJXJ/
         YUTvDDqvo0EAt/Tz2Q4GeXeUwoBzDTzAeyo0FGn2wFs5oMqLmre/ez7i4XQPeSbumU
         JlMr2y/0/SDIRcp54dVgOuA9GGWo+DW+Fsh+JLuDytS7Q1mVmYIscyhc/hWoRJPAsy
         3LnZ04vhNCXaA==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] clk: rs9: Add Renesas 9-series PCIe clock generator driver
Date:   Sat, 19 Feb 2022 02:50:03 +0100
Message-Id: <20220219015003.507601-3-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219015003.507601-1-marex@denx.de>
References: <20220219015003.507601-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add driver for Renesas 9-series PCIe clock generators. This driver
is designed to support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ series I2C
PCIe clock generators, currently the only tested and supported chip
is 9FGV0241.

The driver is capable of configuring per-chip spread spectrum mode
and output amplitude, as well as per-output slew rate.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-clk@vger.kernel.org
---
V2: - Drop unused includes
    - Use REGCACHE_FLAT for smaller reg file
    - Move of_node_put() in rs9_get_output_config() a bit higher up
    - Drop forward declaration of clk_rs9_of_match
    - Use device_get_match_data() instead of of_device_get_match_data()
      and check for its return value, verify it is non-NULL
    - Use newly available __clk_hw_register_fixed_factor() with
      parent_data index=0 and drop of_clk_get_parent_name() altogether
---
 drivers/clk/Kconfig            |   9 +
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-renesas-pcie.c | 321 +++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)
 create mode 100644 drivers/clk/clk-renesas-pcie.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3cdf33470a750..05fc6fb2fddd5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -340,6 +340,15 @@ config COMMON_CLK_OXNAS
 	help
 	  Support for the OXNAS SoC Family clocks.
 
+config COMMON_CLK_RS9_PCIE
+	tristate "Clock driver for Renesas 9-series PCIe clock generators"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  This driver supports the Renesas 9-series PCIe clock generator
+	  models 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ.
+
 config COMMON_CLK_VC5
 	tristate "Clock driver for IDT VersaClock 5,6 devices"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 6a98291350b64..3ec27842ec779 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
+obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+= clk-renesas-pcie.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
new file mode 100644
index 0000000000000..51b9144d87cab
--- /dev/null
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Renesas 9-series PCIe clock generator driver
+ *
+ * The following series can be supported:
+ *   - 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ
+ * Currently supported:
+ *   - 9FGV0241
+ *
+ * Copyright (C) 2022 Marek Vasut <marex@denx.de>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define RS9_REG_OE				0x0
+#define RS9_REG_OE_DIF_OE(n)			BIT((n) + 1)
+#define RS9_REG_SS				0x1
+#define RS9_REG_SS_AMP_0V6			0x0
+#define RS9_REG_SS_AMP_0V7			0x1
+#define RS9_REG_SS_AMP_0V8			0x2
+#define RS9_REG_SS_AMP_0V9			0x3
+#define RS9_REG_SS_AMP_MASK			0x3
+#define RS9_REG_SS_SSC_100			0
+#define RS9_REG_SS_SSC_M025			(1 << 3)
+#define RS9_REG_SS_SSC_M050			(3 << 3)
+#define RS9_REG_SS_SSC_MASK			(3 << 3)
+#define RS9_REG_SS_SSC_LOCK			BIT(5)
+#define RS9_REG_SR				0x2
+#define RS9_REG_SR_2V0_DIF(n)			0
+#define RS9_REG_SR_3V0_DIF(n)			BIT((n) + 1)
+#define RS9_REG_SR_DIF_MASK(n)		BIT((n) + 1)
+#define RS9_REG_REF				0x3
+#define RS9_REG_REF_OE				BIT(4)
+#define RS9_REG_REF_OD				BIT(5)
+#define RS9_REG_REF_SR_SLOWEST			0
+#define RS9_REG_REF_SR_SLOW			(1 << 6)
+#define RS9_REG_REF_SR_FAST			(2 << 6)
+#define RS9_REG_REF_SR_FASTER			(3 << 6)
+#define RS9_REG_VID				0x5
+#define RS9_REG_DID				0x6
+#define RS9_REG_BCP				0x7
+
+/* Supported Renesas 9-series models. */
+enum rs9_model {
+	RENESAS_9FGV0241,
+};
+
+/* Structure to describe features of a particular 9-series model */
+struct rs9_chip_info {
+	const enum rs9_model	model;
+	unsigned int		num_clks;
+};
+
+struct rs9_driver_data {
+	struct i2c_client	*client;
+	struct regmap		*regmap;
+	const struct rs9_chip_info *chip_info;
+	struct clk		*pin_xin;
+	struct clk_hw		*clk_dif[2];
+	u8			pll_amplitude;
+	u8			pll_ssc;
+	u8			clk_dif_sr;
+};
+
+/*
+ * Renesas 9-series i2c regmap
+ */
+static const struct regmap_range rs9_readable_ranges[] = {
+	regmap_reg_range(RS9_REG_OE, RS9_REG_REF),
+	regmap_reg_range(RS9_REG_VID, RS9_REG_BCP),
+};
+
+static const struct regmap_access_table rs9_readable_table = {
+	.yes_ranges = rs9_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rs9_readable_ranges),
+};
+
+static const struct regmap_range rs9_writeable_ranges[] = {
+	regmap_reg_range(RS9_REG_OE, RS9_REG_REF),
+	regmap_reg_range(RS9_REG_BCP, RS9_REG_BCP),
+};
+
+static const struct regmap_access_table rs9_writeable_table = {
+	.yes_ranges = rs9_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rs9_writeable_ranges),
+};
+
+static const struct regmap_config rs9_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_FLAT,
+	.max_register = 0x8,
+	.rd_table = &rs9_readable_table,
+	.wr_table = &rs9_writeable_table,
+};
+
+static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
+{
+	struct i2c_client *client = rs9->client;
+	unsigned char name[5] = "DIF0";
+	struct device_node *np;
+	int ret;
+	u32 sr;
+
+	/* Set defaults */
+	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
+	rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
+
+	snprintf(name, 5, "DIF%d", idx);
+	np = of_get_child_by_name(client->dev.of_node, name);
+	if (!np)
+		return 0;
+
+	/* Output clock slew rate */
+	ret = of_property_read_u32(np, "renesas,slew-rate", &sr);
+	of_node_put(np);
+	if (!ret) {
+		if (sr == 2000000) {		/* 2V/ns */
+			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
+			rs9->clk_dif_sr |= RS9_REG_SR_2V0_DIF(idx);
+		} else if (sr == 3000000) {	/* 3V/ns (default) */
+			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
+			rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
+		} else
+			ret = dev_err_probe(&client->dev, -EINVAL,
+					    "Invalid renesas,slew-rate value\n");
+	}
+
+	return ret;
+}
+
+static int rs9_get_common_config(struct rs9_driver_data *rs9)
+{
+	struct i2c_client *client = rs9->client;
+	struct device_node *np = client->dev.of_node;
+	unsigned int amp, ssc;
+	int ret;
+
+	/* Set defaults */
+	rs9->pll_amplitude = RS9_REG_SS_AMP_0V7;
+	rs9->pll_ssc = RS9_REG_SS_SSC_100;
+
+	/* Output clock amplitude */
+	ret = of_property_read_u32(np, "renesas,out-amplitude", &amp);
+	if (!ret) {
+		if (amp == 600000)	/* 0.6V */
+			rs9->pll_amplitude = RS9_REG_SS_AMP_0V6;
+		else if (amp == 700000)	/* 0.7V (default) */
+			rs9->pll_amplitude = RS9_REG_SS_AMP_0V7;
+		else if (amp == 800000)	/* 0.8V */
+			rs9->pll_amplitude = RS9_REG_SS_AMP_0V8;
+		else if (amp == 900000)	/* 0.9V */
+			rs9->pll_amplitude = RS9_REG_SS_AMP_0V9;
+		else
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid renesas,out-amplitude value\n");
+	}
+
+	/* Output clock spread spectrum */
+	ret = of_property_read_u32(np, "renesas,out-spread-spectrum", &ssc);
+	if (!ret) {
+		if (ssc == 100000)	/* 100% ... no spread (default) */
+			rs9->pll_ssc = RS9_REG_SS_SSC_100;
+		else if (ssc == 99750)	/* -0.25% ... down spread */
+			rs9->pll_ssc = RS9_REG_SS_SSC_M025;
+		else if (ssc == 99500)	/* -0.50% ... down spread */
+			rs9->pll_ssc = RS9_REG_SS_SSC_M050;
+		else
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid renesas,out-spread-spectrum value\n");
+	}
+
+	return 0;
+}
+
+static void rs9_update_config(struct rs9_driver_data *rs9)
+{
+	int i;
+
+	/* If amplitude is non-default, update it. */
+	if (rs9->pll_amplitude != RS9_REG_SS_AMP_0V7) {
+		regmap_update_bits(rs9->regmap, RS9_REG_SS, RS9_REG_SS_AMP_MASK,
+				   rs9->pll_amplitude);
+	}
+
+	/* If SSC is non-default, update it. */
+	if (rs9->pll_ssc != RS9_REG_SS_SSC_100) {
+		regmap_update_bits(rs9->regmap, RS9_REG_SS, RS9_REG_SS_SSC_MASK,
+				   rs9->pll_ssc);
+	}
+
+	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+		if (rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i))
+			continue;
+
+		regmap_update_bits(rs9->regmap, RS9_REG_SR, RS9_REG_SR_3V0_DIF(i),
+				   rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i));
+	}
+}
+
+static struct clk_hw *
+rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct rs9_driver_data *rs9 = data;
+	unsigned int idx = clkspec->args[0];
+
+	return rs9->clk_dif[idx];
+}
+
+static int rs9_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	unsigned char name[5] = "DIF0";
+	struct rs9_driver_data *rs9;
+	struct clk_hw *hw;
+	int i, ret;
+
+	rs9 = devm_kzalloc(&client->dev, sizeof(*rs9), GFP_KERNEL);
+	if (!rs9)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, rs9);
+	rs9->client = client;
+	rs9->chip_info = device_get_match_data(&client->dev);
+	if (!rs9->chip_info)
+		return -EINVAL;
+
+	/* Fetch common configuration from DT (if specified) */
+	ret = rs9_get_common_config(rs9);
+	if (ret)
+		return ret;
+
+	/* Fetch DIFx output configuration from DT (if specified) */
+	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+		ret = rs9_get_output_config(rs9, i);
+		if (ret)
+			return ret;
+	}
+
+	rs9->regmap = devm_regmap_init_i2c(client, &rs9_regmap_config);
+	if (IS_ERR(rs9->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
+				     "Failed to allocate register map\n");
+
+	/* Register clock */
+	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+		snprintf(name, 5, "DIF%d", i);
+		hw = __clk_hw_register_fixed_factor(&client->dev, NULL, name,
+						    NULL, 0, 0, 4, 1, true);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		rs9->clk_dif[i] = hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&client->dev, rs9_of_clk_get, rs9);
+	if (!ret)
+		rs9_update_config(rs9);
+
+	return ret;
+}
+
+static int __maybe_unused rs9_suspend(struct device *dev)
+{
+	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
+
+	regcache_cache_only(rs9->regmap, true);
+	regcache_mark_dirty(rs9->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused rs9_resume(struct device *dev)
+{
+	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(rs9->regmap, false);
+	ret = regcache_sync(rs9->regmap);
+	if (ret)
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	return ret;
+}
+
+static const struct rs9_chip_info renesas_9fgv0241_info = {
+	.model		= RENESAS_9FGV0241,
+	.num_clks	= 2,
+};
+
+static const struct i2c_device_id rs9_id[] = {
+	{ "9fgv0241", .driver_data = RENESAS_9FGV0241 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rs9_id);
+
+static const struct of_device_id clk_rs9_of_match[] = {
+	{ .compatible = "renesas,9fgv0241", .data = &renesas_9fgv0241_info },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
+
+static SIMPLE_DEV_PM_OPS(rs9_pm_ops, rs9_suspend, rs9_resume);
+
+static struct i2c_driver rs9_driver = {
+	.driver = {
+		.name = "clk-renesas-pcie-9series",
+		.pm	= &rs9_pm_ops,
+		.of_match_table = clk_rs9_of_match,
+	},
+	.probe		= rs9_probe,
+	.id_table	= rs9_id,
+};
+module_i2c_driver(rs9_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
+MODULE_DESCRIPTION("Renesas 9-series PCIe clock generator driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

