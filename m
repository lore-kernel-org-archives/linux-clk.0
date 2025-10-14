Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7A2D46D8;
	Tue, 14 Oct 2025 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479359; cv=none; b=JspFKEU/rBRmoUgjvuSrdHq0DUWxQvnm0cDu4GIRgaFX6ZQNUXjTL1yMRc8KE48rGzu8LRRNq3tBe+zTVY/fgqlIcDALZUkjS1IIy+ayvCdeJOMternMDy1YcuzqN3dbldAn1CSGTQpiRwM9K0FZSEZ6J/mSrKm603AFuaSZyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479359; c=relaxed/simple;
	bh=06sULeXsxj5SXAikMEejH0aliiGPgGdIi8ou7CkNlKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krIL0LyhALFjQSGRmu6kaQ8Q+LX5OHxQKkr81U6D907QPkAbz5TntY1B2l81R4KzRAIxOHLRW13yiYemW0okTUtVTKA54PxFdUHnIROJKI3M797Dofgy9DooDxZU6a5ryJEHMJiZd47m+SyulrzBDaJydbm9GjnBwc4b2XHJcZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VqglUMfy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BEw3MSqn; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VqglUMfy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BEw3MSqn"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmSr44jyPz9tQ4;
	Wed, 15 Oct 2025 00:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzUVdemPxh33eWt7jzj16quWDjZajUU6+lZgHud0atE=;
	b=VqglUMfyA1Uf7gGksxzcAjMfmFnYNOxtmRW54b1+2ngjylrEEXP1utQ4GnMEy62KLAH4nJ
	qJ9qCmw5At6ZdQVn5I+iKBwLVubo9q82oT4+XP8dSV5OOBG6X6as0VJzzB2TYWgBQ/xQaa
	PfNevFxQwrCV2XOX0g38ENjRgoJi5MEweUNRx2iLy0nntOFokOb/Sicn3fGKrBrDai58p3
	CcS8nYkxfURtnjUKZ/bf/t2TqtvCdwJmk20GvAinWwcyzFMDsh/3IP4eFi28Wnxs0ybrIz
	moRn8IIkAztGFwtUlR7pjkLiVmd6sJ+JWgSDP9ejOp32I67fAFk6ag24qWSR1g==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzUVdemPxh33eWt7jzj16quWDjZajUU6+lZgHud0atE=;
	b=BEw3MSqnNG0Ch2tDaOFB/JP+Nve7t2qNw5fDkGLdYcK/67XQTrJXdyClgjIAMfv3H1gOns
	s/wybmJxmgKoSKsZtXFR4aAEE0K5gCpL3CW+0nMiNY+3l2xzxhjf76/lX9i4hIGDRC3gMu
	bwtkFvYyzYyu145EmMYYloJDj7EjeLr5eanOx1drGu5UKxrAqsCLqgvE6DwSJm4VdJOrxi
	9c59rwFCnWVRkAMKATQ/qYL5BHPst9ZC1PqT+tAeieCgsKt23QtVznFkzy2wFG9TqhBU3l
	yTX1kMnR17zTpJIlaUStNfOdIfX4Kg67H98Qij3Q92WSyitxP6/BPZ1OFJqC+A==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] clk: si522xx: Clock driver for Skyworks Si522xx I2C PCIe clock generators
Date: Wed, 15 Oct 2025 00:01:44 +0200
Message-ID: <20251014220206.52470-2-marek.vasut@mailbox.org>
In-Reply-To: <20251014220206.52470-1-marek.vasut@mailbox.org>
References: <20251014220206.52470-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d715e9e007d2cfd93a9
X-MBO-RS-META: w985xswt646j4pheo16b73azesjg5ane

Add driver for the Skyworks Si522xx PCIe clock generators. Supported models
are Si52202/Si52204/Si52208/Si52212, tested model is Si52202. While chip is
similar to Si521xx, it contains many subtle differences to justify separate
driver.

The Si522xx has different register and bit layout, supports spread spectrum
clocking and slew rate settings, and no longer contains the old BC Byte Count
configuration register. Instead, the I2C protocol is yet again very slightly
different, but this time at least compatible with regmap.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
V2: No change
---
 drivers/clk/Kconfig       |   9 +
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-si522xx.c | 430 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 440 insertions(+)
 create mode 100644 drivers/clk/clk-si522xx.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48e..0b2d9c4ba664e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -423,6 +423,15 @@ config COMMON_CLK_SI521XX
 	  This driver supports the SkyWorks Si521xx PCIe clock generator
 	  models Si52144/Si52146/Si52147.
 
+config COMMON_CLK_SI522XX
+	tristate "Clock driver for SkyWorks Si522xx PCIe clock generators"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  This driver supports the SkyWorks Si522xx PCIe clock generator
+	  models Si52202/Si52204/Si52208/Si52212.
+
 config COMMON_CLK_VC3
 	tristate "Clock driver for Renesas VersaClock 3 devices"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b74a1767ca278..d667730ae188c 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+= clk-renesas-pcie.o
 obj-$(CONFIG_COMMON_CLK_SI521XX)	+= clk-si521xx.o
+obj-$(CONFIG_COMMON_CLK_SI522XX)	+= clk-si522xx.o
 obj-$(CONFIG_COMMON_CLK_VC3)		+= clk-versaclock3.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_VC7)		+= clk-versaclock7.o
diff --git a/drivers/clk/clk-si522xx.c b/drivers/clk/clk-si522xx.c
new file mode 100644
index 0000000000000..0114ed98dbaa4
--- /dev/null
+++ b/drivers/clk/clk-si522xx.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Skyworks Si522xx PCIe clock generator driver
+ *
+ * The following series can be supported:
+ *   - Si52202 - 2x DIFF
+ *   - Si52204 - 4x DIFF
+ *   - Si52208 - 8x DIFF
+ *   - Si52212 - 12x DIFF
+ * Currently tested:
+ *   - Si52202
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut@mailbox.org>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitrev.h>
+#include <linux/clk-provider.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+/* Register 0 and 1 (OE1 and OE2) */
+#define SI522XX_REG_OE(n)			((n) & 0x1)
+
+/* Register 2 (software spread settings) */
+#define SI522XX_REG_SS				0x2
+#define SI522XX_REG_SS_SS_EN_SW_HW_CTRL		BIT(7)
+#define SI522XX_REG_SS_SS_EN_SW			GENMASK(6, 5)
+#define SI522XX_REG_SS_SS_EN_SW_M025P		0
+#define SI522XX_REG_SS_SS_EN_SW_OFF		2
+#define SI522XX_REG_SS_SS_EN_SW_M050P		3
+
+/* Register 3 (slew rate control) and 4 (slew rate control and amplitude) */
+#define SI522XX_REG_SR(n)			(((n) & 0x1) + 3)
+#define SI522XX_REG_SR_AMP_MASK			GENMASK(3, 0)
+#define SI522XX_REG_SR_AMP_BASE			300000
+#define SI522XX_REG_SR_AMP_MIN			600000
+#define SI522XX_REG_SR_AMP_DEFAULT		700000
+#define SI522XX_REG_SR_AMP_MAX			850000
+#define SI522XX_REG_SR_AMP_STEP			50000
+#define SI522XX_REG_SR_AMP(UV)			\
+	FIELD_PREP(SI522XX_REG_SR_AMP_MASK,	\
+		   ((UV) - SI522XX_REG_SR_AMP_BASE) / SI522XX_REG_SR_AMP_STEP)
+
+/* Register 5 and 6 (identification data) */
+#define SI522XX_REG_ID				0x5
+#define SI522XX_REG_ID_REV			GENMASK(7, 4)
+#define SI522XX_REG_ID_VENDOR			GENMASK(3, 0)
+#define SI522XX_REG_PG				0x6
+
+/* Count of populated OE bits in control register ref, 0 and 1 */
+#define SI522XX_OE_MAP(cr1, cr2)	(((cr2) << 8) | (cr1))
+#define SI522XX_OE_MAP_GET_OE(oe, map)	(((map) >> ((oe) * 8)) & 0xff)
+
+#define SI522XX_DIFF_MULT	4
+#define SI522XX_DIFF_DIV	1
+
+/* Supported Skyworks Si522xx models. */
+enum si522xx_model {
+	SI52202 = 0x02,
+	SI52204 = 0x04,
+	SI52208 = 0x08,
+	SI52212 = 0x12,
+};
+
+struct si522xx;
+
+struct si_clk {
+	struct clk_hw		hw;
+	struct si522xx		*si;
+	u8			reg;
+	u8			bit;
+	bool			slew_slow;
+};
+
+struct si522xx {
+	struct i2c_client	*client;
+	struct regmap		*regmap;
+	struct si_clk		clk_dif[12];
+	u16			chip_info;
+	u8			pll_amplitude;
+	u8			pll_ssc;
+};
+
+/*
+ * Si522xx i2c regmap
+ */
+static const struct regmap_range si522xx_readable_ranges[] = {
+	regmap_reg_range(SI522XX_REG_OE(0), SI522XX_REG_PG),
+};
+
+static const struct regmap_access_table si522xx_readable_table = {
+	.yes_ranges = si522xx_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(si522xx_readable_ranges),
+};
+
+static const struct regmap_range si522xx_writeable_ranges[] = {
+	regmap_reg_range(SI522XX_REG_OE(0), SI522XX_REG_SR(1)),
+};
+
+static const struct regmap_access_table si522xx_writeable_table = {
+	.yes_ranges = si522xx_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(si522xx_writeable_ranges),
+};
+
+static const struct regmap_config si522xx_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_base = 0x80,
+	.cache_type = REGCACHE_NONE,
+	.max_register = SI522XX_REG_PG,
+	.rd_table = &si522xx_readable_table,
+	.wr_table = &si522xx_writeable_table,
+};
+
+static unsigned long si522xx_diff_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	unsigned long long rate;
+
+	rate = (unsigned long long)parent_rate * SI522XX_DIFF_MULT;
+	do_div(rate, SI522XX_DIFF_DIV);
+	return (unsigned long)rate;
+}
+
+static int si522xx_diff_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	unsigned long best_parent;
+
+	best_parent = (req->rate / SI522XX_DIFF_MULT) * SI522XX_DIFF_DIV;
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+
+	req->rate = (req->best_parent_rate / SI522XX_DIFF_DIV) * SI522XX_DIFF_MULT;
+
+	return 0;
+}
+
+static int si522xx_diff_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	/*
+	 * We must report success but we can do so unconditionally because
+	 * si522xx_diff_round_rate returns values that ensure this call is a
+	 * nop.
+	 */
+
+	return 0;
+}
+
+#define to_si522xx_clk(_hw) container_of(_hw, struct si_clk, hw)
+
+static int si522xx_diff_prepare(struct clk_hw *hw)
+{
+	struct si_clk *si_clk = to_si522xx_clk(hw);
+	struct si522xx *si = si_clk->si;
+
+	regmap_update_bits(si->regmap, SI522XX_REG_SR(si_clk->reg), si_clk->bit,
+			   si_clk->slew_slow ? 0 : si_clk->bit);
+	regmap_set_bits(si->regmap, SI522XX_REG_OE(si_clk->reg), si_clk->bit);
+
+	return 0;
+}
+
+static void si522xx_diff_unprepare(struct clk_hw *hw)
+{
+	struct si_clk *si_clk = to_si522xx_clk(hw);
+	struct si522xx *si = si_clk->si;
+
+	regmap_clear_bits(si->regmap, SI522XX_REG_OE(si_clk->reg), si_clk->bit);
+}
+
+static const struct clk_ops si522xx_diff_clk_ops = {
+	.determine_rate = si522xx_diff_determine_rate,
+	.set_rate	= si522xx_diff_set_rate,
+	.recalc_rate	= si522xx_diff_recalc_rate,
+	.prepare	= si522xx_diff_prepare,
+	.unprepare	= si522xx_diff_unprepare,
+};
+
+static int si522xx_get_common_config(struct si522xx *si)
+{
+	struct i2c_client *client = si->client;
+	struct device_node *np = client->dev.of_node;
+	unsigned int amp, ssc;
+	int ret;
+
+	/* Set defaults */
+	si->pll_amplitude = SI522XX_REG_SR_AMP(SI522XX_REG_SR_AMP_DEFAULT);
+	si->pll_ssc = SI522XX_REG_SS_SS_EN_SW_M050P;
+
+	/* Output clock amplitude */
+	ret = of_property_read_u32(np, "skyworks,out-amplitude-microvolt",
+				   &amp);
+	if (!ret) {
+		if (amp < SI522XX_REG_SR_AMP_MIN || amp > SI522XX_REG_SR_AMP_MAX ||
+		    amp % SI522XX_REG_SR_AMP_STEP) {
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid skyworks,out-amplitude-microvolt value\n");
+		}
+		si->pll_amplitude = SI522XX_REG_SR_AMP(amp);
+	}
+
+	/* Output clock spread spectrum */
+	ret = of_property_read_u32(np, "skyworks,out-spread-spectrum", &ssc);
+	if (!ret) {
+		if (ssc == 100000)	/* 100% ... no spread (default) */
+			si->pll_ssc = SI522XX_REG_SS_SS_EN_SW_OFF;
+		else if (ssc == 99750)	/* -0.25% ... down spread */
+			si->pll_ssc = SI522XX_REG_SS_SS_EN_SW_M025P;
+		else if (ssc == 99500)	/* -0.50% ... down spread */
+			si->pll_ssc = SI522XX_REG_SS_SS_EN_SW_M050P;
+		else
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid skyworks,out-spread-spectrum value\n");
+	}
+
+	return 0;
+}
+
+static int si522xx_get_output_config(struct si522xx *si, int idx)
+{
+	struct i2c_client *client = si->client;
+	unsigned char name[16] = "DIFF0";
+	struct device_node *np;
+	int ret;
+	u32 sr;
+
+	/* Set defaults */
+	si->clk_dif[idx].slew_slow = false;
+
+	snprintf(name, sizeof(name), "DIFF%d", idx);
+	np = of_get_child_by_name(client->dev.of_node, name);
+	if (!np)
+		return 0;
+
+	/* Output clock slew rate */
+	ret = of_property_read_u32(np, "skyworks,slew-rate", &sr);
+	of_node_put(np);
+	if (!ret) {
+		if (sr == 1900000) {		/* 1.9V/ns */
+			si->clk_dif[idx].slew_slow = true;
+		} else if (sr == 2400000) {	/* 2.4V/ns (default) */
+			si->clk_dif[idx].slew_slow = false;
+		} else {
+			ret = dev_err_probe(&client->dev, -EINVAL,
+					    "Invalid skyworks,slew-rate value\n");
+		}
+	}
+
+	return ret;
+}
+
+static void si522xx_update_config(struct si522xx *si)
+{
+	/* If amplitude is non-default, update it. */
+	if (si->pll_amplitude != SI522XX_REG_SR_AMP(SI522XX_REG_SR_AMP_DEFAULT)) {
+		regmap_update_bits(si->regmap, SI522XX_REG_SR(1),
+				   SI522XX_REG_SR_AMP_MASK, si->pll_amplitude);
+	}
+
+	/* If SSC is non-default, update it. */
+	if (si->pll_ssc != SI522XX_REG_SS_SS_EN_SW_M050P) {
+		regmap_update_bits(si->regmap, SI522XX_REG_SS,
+				   SI522XX_REG_SS_SS_EN_SW_HW_CTRL |
+				   SI522XX_REG_SS_SS_EN_SW,
+				   SI522XX_REG_SS_SS_EN_SW_HW_CTRL |
+				   FIELD_PREP(SI522XX_REG_SS_SS_EN_SW, si->pll_ssc));
+	}
+}
+
+static void si522xx_diff_idx_to_reg_bit(const u16 chip_info, const int idx,
+					struct si_clk *clk)
+{
+	unsigned long mask;
+	int oe, b, ctr = 0;
+
+	for (oe = 0; oe <= 1; oe++) {
+		mask = bitrev8(SI522XX_OE_MAP_GET_OE(oe, chip_info));
+		for_each_set_bit(b, &mask, 8) {
+			if (ctr++ != idx)
+				continue;
+			clk->reg = SI522XX_REG_OE(oe);
+			clk->bit = BIT(7 - b);
+			return;
+		}
+	}
+}
+
+static struct clk_hw *
+si522xx_of_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct si522xx *si = data;
+	unsigned int idx = clkspec->args[0];
+
+	return &si->clk_dif[idx].hw;
+}
+
+static int si522xx_probe(struct i2c_client *client)
+{
+	const u16 chip_info = (u16)(uintptr_t)i2c_get_match_data(client);
+	const struct clk_parent_data clk_parent_data = { .index = 0 };
+	struct device *dev = &client->dev;
+	unsigned char name[16] = "DIFF0";
+	struct clk_init_data init = {};
+	struct si522xx *si;
+	int i, ret;
+
+	if (!chip_info)
+		return -EINVAL;
+
+	si = devm_kzalloc(dev, sizeof(*si), GFP_KERNEL);
+	if (!si)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, si);
+	si->client = client;
+
+	/* Fetch common configuration from DT (if specified) */
+	ret = si522xx_get_common_config(si);
+	if (ret)
+		return ret;
+
+	/* Fetch DIFFx output configuration from DT (if specified) */
+	for (i = 0; i < hweight16(chip_info); i++) {
+		ret = si522xx_get_output_config(si, i);
+		if (ret)
+			return ret;
+	}
+
+	/* Get and enable optional power supply regulator */
+	ret = devm_regulator_get_enable_optional(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulator\n");
+
+	si->regmap = devm_regmap_init_i2c(client, &si522xx_regmap_config);
+	if (IS_ERR(si->regmap))
+		return dev_err_probe(dev, PTR_ERR(si->regmap),
+				     "Failed to allocate register map\n");
+
+	/* Register clock */
+	for (i = 0; i < hweight16(chip_info); i++) {
+		memset(&init, 0, sizeof(init));
+		snprintf(name, sizeof(name), "DIFF%d", i);
+		init.name = name;
+		init.ops = &si522xx_diff_clk_ops;
+		init.parent_data = &clk_parent_data;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT;
+
+		si->clk_dif[i].hw.init = &init;
+		si->clk_dif[i].si = si;
+
+		si522xx_diff_idx_to_reg_bit(chip_info, i, &si->clk_dif[i]);
+
+		ret = devm_clk_hw_register(dev, &si->clk_dif[i].hw);
+		if (ret)
+			return ret;
+	}
+
+	/* Wait t_STABLE = 5ms */
+	usleep_range(5000, 6000);
+
+	ret = devm_of_clk_add_hw_provider(dev, si522xx_of_clk_get, si);
+	if (!ret)
+		si522xx_update_config(si);
+
+	return ret;
+}
+
+static int __maybe_unused si522xx_suspend(struct device *dev)
+{
+	struct si522xx *si = dev_get_drvdata(dev);
+
+	regcache_cache_only(si->regmap, true);
+	regcache_mark_dirty(si->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused si522xx_resume(struct device *dev)
+{
+	struct si522xx *si = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(si->regmap, false);
+	ret = regcache_sync(si->regmap);
+	if (ret)
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	return ret;
+}
+
+static const struct i2c_device_id si522xx_id[] = {
+	{ "si52202", .driver_data = SI522XX_OE_MAP(0x40, 0x20) },
+	{ "si52204", .driver_data = SI522XX_OE_MAP(0x64, 0x10) },
+	{ "si52208", .driver_data = SI522XX_OE_MAP(0x67, 0xd0) },
+	{ "si52212", .driver_data = SI522XX_OE_MAP(0xff, 0xf0) },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, si522xx_id);
+
+static const struct of_device_id clk_si522xx_of_match[] = {
+	{ .compatible = "skyworks,si52202", .data = (void *)SI522XX_OE_MAP(0x40, 0x20) },
+	{ .compatible = "skyworks,si52204", .data = (void *)SI522XX_OE_MAP(0x64, 0x10) },
+	{ .compatible = "skyworks,si52208", .data = (void *)SI522XX_OE_MAP(0x67, 0xd0) },
+	{ .compatible = "skyworks,si52212", .data = (void *)SI522XX_OE_MAP(0xff, 0xf0) },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, clk_si522xx_of_match);
+
+static SIMPLE_DEV_PM_OPS(si522xx_pm_ops, si522xx_suspend, si522xx_resume);
+
+static struct i2c_driver si522xx_driver = {
+	.driver = {
+		.name = "clk-si522xx",
+		.pm	= &si522xx_pm_ops,
+		.of_match_table = clk_si522xx_of_match,
+	},
+	.probe		= si522xx_probe,
+	.id_table	= si522xx_id,
+};
+module_i2c_driver(si522xx_driver);
+
+MODULE_AUTHOR("Marek Vasut <marek.vasut@mailbox.org>");
+MODULE_DESCRIPTION("Skyworks Si522xx PCIe clock generator driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0

