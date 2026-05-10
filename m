Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8E255F2D;
	Sun, 10 May 2026 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778436399; cv=none; b=Wzk31Q+35AVOf2ip/G0fia9MTMqz7o6Ro9QYzPjB5Y7I86U7ooveNUHP/6dekkA/WqvhMsxjXXBV8Ny0aGzyCSz9ug2Q9zuRoc1g6u6m5LPuHuHUlA4JuV2/4XcKv3HwGzZo3LlDuPEYXbCTSj/zhC0/+pt5e8XpHE5OSb6qToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778436399; c=relaxed/simple;
	bh=GxWvs9IlOoF/ZDN89rm4mDgQR+vWhSnqrzSjz2qJjhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3gfIrAnyQRvVVCUh9pw7Ze6ah88pyDsDTDBO83nZy5Bt48ALTOBVKYTqEUlJB8K3J67e7LHuFUlHuCghjPOuxCK5xaE0GIl0/MmIyDfGxJwqxXsQU8iLKFNf+9S1OgwTfYPb72RMvD29OTAmi05EM0SHx04t8/2ZaNg9hKecYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNwfzldh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNwfzldh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 505E7C2BCF7;
	Sun, 10 May 2026 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778436399;
	bh=GxWvs9IlOoF/ZDN89rm4mDgQR+vWhSnqrzSjz2qJjhU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YNwfzldh4SCbUX/7HiaKv/QNm0IRWPeKqb/aa7Xo7SLTjdHaQziFr7BUp7Dh+cBwA
	 UDXZG6d2Jw5RxMGxTdYfV8Dv5dW4e02YuSsqVK7XZdql7MB8x9R+NuSqq92W2nE48H
	 AMnakkUQIKPuem14uQaxSBhAyEhLDTQ3VTSABhF1x7dlYi8feZ88wmnGDNBMeotBNk
	 N2qjDB6hsj55GU84sJ8Tegj9aKlkZCF+1En6U4CAo7Ur8AtL3Pw953/tB6B0Do+9Z4
	 0YOe1DsoaEfeblnnQKJwEpkXKEDY9FLDKzyOia/LmNgKQ6yDQT31pjcGxmMwBwfkaz
	 wbVDjbTho7KRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E64CD37B2;
	Sun, 10 May 2026 18:06:39 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Sun, 10 May 2026 18:06:22 +0000
Subject: [PATCH v2 1/2] clk: Add gpio-locked clock driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-feature-clock-guard-v2-1-6c25458d5340@bruker.com>
References: <20260510-feature-clock-guard-v2-0-6c25458d5340@bruker.com>
In-Reply-To: <20260510-feature-clock-guard-v2-0-6c25458d5340@bruker.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778436398; l=9042;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=4C7/G2slFiF6F6Z5DVeO2NVmK6a4RZ7pHLuONCV7JWw=;
 b=6Uy9WknK0a/tvQPLE4AtO8tcKjbT/VyULVGdTX2fMkUc2zEYSiu5qUkJBvfR+XKbSYpd4MhUN
 mEIJww08ewtAfeM+2IxodQ38b5U7k/cVKznuPcSgzfL5e18g4bBeLFJ
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

A gpio-locked clock aggregates one or more input clocks and/or one or
more GPIOs. It's similar to a gated-fixed-clock, but GPIO direction is
inverted. Consumers can use the output clock to wait until all input
clocks are locked and only then initialize dependent peripherals.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 drivers/clk/Makefile          |   1 +
 drivers/clk/clk-gpio-locked.c | 306 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 307 insertions(+)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index a3e2862ebd7e..464ca1c1d8a8 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_CLK_FD_KUNIT_TEST) += clk-fractional-divider_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
 ifeq ($(CONFIG_OF), y)
 obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
+obj-$(CONFIG_COMMON_CLK)	+= clk-gpio-locked.o
 endif
 
 # KUnit specific helpers
diff --git a/drivers/clk/clk-gpio-locked.c b/drivers/clk/clk-gpio-locked.c
new file mode 100644
index 000000000000..79098f9b6532
--- /dev/null
+++ b/drivers/clk/clk-gpio-locked.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Clock Controller Guard Driver
+ *
+ * Copyright 2026 Bruker Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define MAX_INPUT_GPIO_COUNT 32
+
+/**
+ * struct gpio_locked_clk_priv - private state for the whole driver
+ * @dev:		platform device
+ *
+ * @clks:		array of input clock descriptors
+ * @num_clks:		number of entries in @inputs
+ *
+ * @gpios:		array of GPIO descriptors
+ * @gpio_names:		GPIO names
+ * @num_gpios:		number of input GPIOs
+ *
+ * @output_hw_clk:      output clock HW descriptor
+ * @output_clock_name:  output clock name
+ */
+struct gpio_locked_clk_priv {
+	struct device *dev;
+
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	struct gpio_descs *gpios;
+	const char **gpio_names;
+	int num_gpios;
+
+	struct clk_hw output_hw_clk;
+	const char *output_clock_name;
+};
+
+#define to_gpio_locked_clk_priv(_hw) \
+	container_of(_hw, struct gpio_locked_clk_priv, output_hw_clk)
+
+static int is_gpio_ready(struct gpio_locked_clk_priv *priv)
+{
+	unsigned long values[BITS_TO_LONGS(MAX_INPUT_GPIO_COUNT)] = {0};
+	int ret = 0;
+
+	if (priv->num_gpios == 0)
+		return 0;
+
+	ret = gpiod_get_array_value(priv->gpios->ndescs,
+		priv->gpios->desc,
+		priv->gpios->info,
+		values);
+
+	if (ret) {
+		dev_err(priv->dev, "Failed to read GPIOs");
+		return -EIO;
+	}
+
+	for (int i = 0; i < priv->gpios->ndescs; i++) {
+		if (!test_bit(i, values)) {
+			dev_warn(priv->dev, "GPIO %s is not ready", priv->gpio_names[i]);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static int gpio_locked_clk_is_enabled(struct clk_hw *hw)
+{
+	struct gpio_locked_clk_priv *priv = to_gpio_locked_clk_priv(hw);
+	int ret = 0;
+
+	if (priv->num_gpios > 0) {
+		ret = is_gpio_ready(priv);
+		if (ret < 0)
+			return ret;
+	}
+
+	// Now check for the clocks
+	for (int i = 0; i < priv->num_clks; i++) {
+		struct clk_hw *hw_clk = __clk_get_hw(priv->clks[i].clk);
+
+		if (!clk_hw_is_enabled(hw_clk)) {
+			dev_dbg(priv->dev, "Clock %i (%s) is not ready",
+				i, priv->clks[i].id);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+/* We can't enable the clock, but the Common Clock Framework calls only
+ * enable() not is_enabled()
+ */
+static int gpio_locked_clk_enable(struct clk_hw *hw)
+{
+	return gpio_locked_clk_is_enabled(hw);
+}
+
+/* We have to implement it, but we are not going to control
+ * parent clock selection
+ */
+static u8 gpio_locked_clk_get_parent(struct clk_hw *hw)
+{
+	return 0;
+}
+
+static const struct clk_ops gpio_locked_clk_ops = {
+	.enable =	gpio_locked_clk_enable,
+	.is_enabled =	gpio_locked_clk_is_enabled,
+	.get_parent =	gpio_locked_clk_get_parent,
+};
+
+static int gpio_locked_clk_parse_inputs(struct gpio_locked_clk_priv *priv)
+{
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = devm_clk_bulk_get_all(dev, &priv->clks);
+	if (ret < 0) {
+		dev_err(dev, "failed to get input clocks: %d\n", ret);
+		return ret ? ret : -ENOENT;
+	}
+
+	priv->num_clks = ret;
+
+	if (priv->num_clks == 0)
+		dev_info(dev, "No input clocks provided\n");
+
+	for (int i = 0; i < priv->num_clks; i++)
+		dev_dbg(dev, "input clk[%d]: name='%s' rate=%lu Hz\n",
+			i, priv->clks[i].id,
+			clk_get_rate(priv->clks[i].clk));
+
+	return 0;
+}
+
+static int gpio_locked_clk_parse_gpios(struct gpio_locked_clk_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	int i;
+
+	priv->gpios = devm_gpiod_get_array_optional(dev, "locked", GPIOD_ASIS);
+	if (IS_ERR(priv->gpios)) {
+		dev_err(dev, "failed to get GPIO array: %ld\n",
+				PTR_ERR(priv->gpios));
+		return PTR_ERR(priv->gpios);
+	}
+
+	if (!priv->gpios) {
+		dev_info(dev, "No GPIOs provided, continue\n");
+		priv->num_gpios = 0;
+		return 0;
+	}
+
+	priv->num_gpios = priv->gpios->ndescs;
+	if (priv->num_gpios > MAX_INPUT_GPIO_COUNT) {
+		dev_err(priv->dev, "Maximum number of input GPIOs is 32\n");
+		return -EINVAL;
+	}
+
+	/* gpio_descs carries no names, so read "gpio-names" separately */
+	priv->gpio_names = devm_kcalloc(dev, priv->num_gpios, sizeof(*priv->gpio_names),
+			GFP_KERNEL);
+	if (!priv->gpio_names)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->num_gpios; i++) {
+		of_property_read_string_index(np, "gpio-names", i,
+				&priv->gpio_names[i]);
+
+		dev_dbg(dev, "gpio[%d]: name='%s'\n",
+				i, priv->gpio_names[i] ? priv->gpio_names[i] : "(unnamed)");
+	}
+
+	return 0;
+}
+
+static int gpio_locked_clk_parse_outputs(struct gpio_locked_clk_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct clk_init_data init = {};
+	int ret;
+
+	of_property_read_string_index(np, "clock-output-names", 0,
+		&priv->output_clock_name);
+
+	if (!priv->output_clock_name)
+		priv->output_clock_name = dev_name(priv->dev);
+
+	init.name = priv->output_clock_name;
+	init.ops = &gpio_locked_clk_ops;
+	init.flags = 0;
+	init.num_parents = priv->num_clks;
+
+	if (priv->num_clks) {
+		const char **parent_names;
+		int j;
+
+		parent_names = devm_kcalloc(dev, priv->num_clks,
+					    sizeof(*parent_names),
+					    GFP_KERNEL);
+		if (!parent_names)
+			return -ENOMEM;
+
+		for (j = 0; j < priv->num_clks; j++)
+			parent_names[j] = priv->clks[j].id;
+
+		init.parent_names = parent_names;
+	}
+
+	priv->output_hw_clk.init = &init;
+
+	ret = devm_clk_hw_register(dev, &priv->output_hw_clk);
+	if (ret) {
+		dev_err(dev, "failed to register output clk'%s': %d\n",
+			priv->output_clock_name, ret);
+		return ret;
+	}
+
+	dev_info(priv->dev, "Output clock '%s' registered\n", priv->output_clock_name);
+
+	return 0;
+}
+
+static int gpio_locked_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_locked_clk_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
+	ret = gpio_locked_clk_parse_inputs(priv);
+	if (ret)
+		return ret;
+
+	ret = gpio_locked_clk_parse_gpios(priv);
+	if (ret)
+		return ret;
+
+	if (priv->num_clks == 0 && priv->num_gpios == 0) {
+		dev_err(priv->dev, "At least 1 input clock or input GPIO is required\n");
+		return -EINVAL;
+	}
+
+	ret = gpio_locked_clk_parse_outputs(priv);
+	if (ret)
+		return ret;
+
+	ret = devm_of_clk_add_hw_provider(priv->dev, of_clk_hw_simple_get,
+		&priv->output_hw_clk);
+	if (ret) {
+		dev_err(priv->dev, "failed to register clock provider '%s': %d\n",
+			priv->output_clock_name, ret);
+		return ret;
+	}
+
+	dev_info(dev, "registered %u input clocks, %u GPIOs\n",
+		 priv->num_clks, priv->num_gpios);
+
+	return 0;
+}
+
+static void gpio_locked_clk_remove(struct platform_device *pdev)
+{
+	dev_dbg(&pdev->dev, "removed\n");
+}
+
+static const struct of_device_id gpio_locked_clk_of_match[] = {
+	{ .compatible = "gpio-locked-fixed-clock" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, gpio_locked_clk_of_match);
+
+static struct platform_driver gpio_locked_clk_driver = {
+	.probe  = gpio_locked_clk_probe,
+	.remove = gpio_locked_clk_remove,
+	.driver = {
+		.name           = "gpio-locked-fixed-clock",
+		.of_match_table = gpio_locked_clk_of_match,
+	},
+};
+module_platform_driver(gpio_locked_clk_driver);
+
+MODULE_AUTHOR("Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>");
+MODULE_DESCRIPTION("GPIO-locked clock driver");
+MODULE_LICENSE("Dual BSD/GPL");

-- 
2.34.1


