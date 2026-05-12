Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89062DB795;
	Tue, 12 May 2026 02:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.168.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551717; cv=none; b=aYZ842ow+G8Eznbh5JbImxZ82uEdOPYw4lN/++4PLUk7+shoGcjV2mz6oWhHtaPCpyG7UHWvzWQytiIIbcZIbkabEgnB8BBOIL+xscMJiLSMBr3dl5fQZyrmy2HXnA9fNNXztiKcs3l+xwJgh7r9Kde9r6WYUpskorkU1e4+i5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551717; c=relaxed/simple;
	bh=kF448NO8dSgfEhleJ0R05SpPBrhpWEsmbat1P76r544=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o3TUKbwEIqJBF4nhqqxGt9h9NNZ+GElmIWNsm8zEmx5ILKOJ5YJzSJ4hDFBLZA7XDNTd0933qu9S7TYunojkBmJkFFjaO9f9JtSIPfuJbeYD4jxFpNfa9QefrESa0mlROeXbOxJn0HWcFHV5ekuwepCU3XPMeqcoXXwTjqeKJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.229.168.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgBHXJ+RiwJqNa8YAA--.13862S2;
	Tue, 12 May 2026 10:08:24 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com,
	benoit.monin@bootlin.com,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: [PATCH v4 3/3] reset: eswin: Add eic7700 HSP reset driver
Date: Tue, 12 May 2026 10:08:13 +0800
Message-Id: <20260512020813.1045-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260512020432.671-1-dongxuyang@eswincomputing.com>
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgBHXJ+RiwJqNa8YAA--.13862S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFy3KF4DGr1fZw1rXF1DZFb_yoW7Kr48pF
	WrCF13Ar4UXrWfGFZ7GF1qyFy3Xan3try5C3yxJ3WS9rsxWFyUJrWUta40yF9rJr9rGry5
	JF1agF1xuFnIyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjW8BUUUUUU==
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add auxiliary driver to support ESWIN EIC7700 high-speed peripherals
system. The reset controller is created using the auxiliary device
framework and set up in the clock driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/reset/Kconfig             |  11 +++
 drivers/reset/Makefile            |   1 +
 drivers/reset/reset-eic7700-hsp.c | 112 ++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 drivers/reset/reset-eic7700-hsp.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..f63e89ed6a4e 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -83,6 +83,17 @@ config RESET_EIC7700
 	  The driver supports eic7700 series chips and provides functionality for
 	  asserting and deasserting resets on the chip.
 
+config RESET_EIC7700_HSP
+	tristate "EIC7700 HSP Reset controller"
+	depends on ARCH_ESWIN || COMPILE_TEST
+	select AUXILIARY_BUS
+	help
+	  This enables the HSP reset controller driver for ESWIN SoCs. This
+	  driver is specific to ESWIN SoCs and should only be enabled if using
+	  such hardware.
+	  The driver supports EIC7700 series chips and provides functionality
+	  for asserting and deasserting resets on the chip.
+
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
 	depends on EYEQ || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..a75af831ef58 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
+obj-$(CONFIG_RESET_EIC7700_HSP) += reset-eic7700-hsp.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
diff --git a/drivers/reset/reset-eic7700-hsp.c b/drivers/reset/reset-eic7700-hsp.c
new file mode 100644
index 000000000000..bdd4f5e3d7a7
--- /dev/null
+++ b/drivers/reset/reset-eic7700-hsp.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
+ * All rights reserved.
+ *
+ * ESWIN EIC7700 HSP Reset Driver
+ *
+ * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/eswin,eic7700-hspcrg.h>
+
+/**
+ * struct eic7700_hsp_reset_data - reset controller information structure
+ * @rcdev: reset controller entity
+ * @regmap: regmap handle containing the memory-mapped reset registers
+ */
+struct eic7700_hsp_reset_data {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+};
+
+struct eic7700_hsp_reg {
+	u32 reg;
+	u32 bit;
+	bool active_low;
+};
+
+static inline struct eic7700_hsp_reset_data *
+to_eic7700_hsp_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct eic7700_hsp_reset_data, rcdev);
+}
+
+static const struct eic7700_hsp_reg eic7700_hsp_reset[] = {
+	[EIC7700_HSP_RST_SATA_P0]	= {0x340, BIT(0), false},
+	[EIC7700_HSP_RST_SATA_PHY]	= {0x340, BIT(1), false},
+	[EIC7700_HSP_RST_USB0]		= {0x800, BIT(24), true},
+	[EIC7700_HSP_RST_USB1]		= {0x900, BIT(24), true},
+	[EIC7700_HSP_RST_USB0_PHY]	= {0x800, BIT(25), false},
+	[EIC7700_HSP_RST_USB1_PHY]	= {0x900, BIT(25), false},
+};
+
+static int eic7700_hsp_reset_assert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct eic7700_hsp_reset_data *data = to_eic7700_hsp_reset(rcdev);
+
+	return regmap_assign_bits(data->regmap, eic7700_hsp_reset[id].reg,
+				  eic7700_hsp_reset[id].bit,
+				  !eic7700_hsp_reset[id].active_low);
+}
+
+static int eic7700_hsp_reset_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct eic7700_hsp_reset_data *data = to_eic7700_hsp_reset(rcdev);
+
+	return regmap_assign_bits(data->regmap, eic7700_hsp_reset[id].reg,
+				  eic7700_hsp_reset[id].bit,
+				  eic7700_hsp_reset[id].active_low);
+}
+
+static const struct reset_control_ops eic7700_hsp_reset_ops = {
+	.assert = eic7700_hsp_reset_assert,
+	.deassert = eic7700_hsp_reset_deassert,
+};
+
+static int eic7700_hsp_reset_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct eic7700_hsp_reset_data *data;
+	struct device *dev = &adev->dev;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!data->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap!\n");
+
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &eic7700_hsp_reset_ops;
+	data->rcdev.of_node = dev->parent->of_node;
+	data->rcdev.dev = dev;
+	data->rcdev.nr_resets = ARRAY_SIZE(eic7700_hsp_reset);
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static const struct auxiliary_device_id eic7700_hsp_reset_ids[] = {
+	{ .name = "clk_eic7700_hsp.hsp-reset", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, eic7700_hsp_reset_ids);
+
+static struct auxiliary_driver eic7700_hsp_reset_driver = {
+	.probe	= eic7700_hsp_reset_probe,
+	.id_table = eic7700_hsp_reset_ids,
+};
+
+module_auxiliary_driver(eic7700_hsp_reset_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Xuyang Dong <dongxuyang@eswincomputing.com>");
+MODULE_DESCRIPTION("ESWIN EIC7700 HSP Reset Controller Driver");
-- 
2.34.1

