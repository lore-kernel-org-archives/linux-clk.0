Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1A13E0731;
	Tue, 19 May 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178648; cv=none; b=rltRR9qYtI+QltJgBJ4SDw879ifpTHT7do67jBxzEo1fQaE8vQ1kP6sldlTaXfPdj/2pi6CclheN4QFbv0jchYwq/VEffpBlJBxwhiw+lkoKnvKkp2tatro3g6F4RO74YWKjUMRoArDe9hrbA7ZWy1MBl5Ui0XVcogLabd3DhX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178648; c=relaxed/simple;
	bh=EEEW8rJ1d4eDTFU3GMj/R6i/rV5mm+bLe/au5f9GY7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KPgmXtNOtXF1QxOHXjdSyIRiRhI6wKJ7UGNabvSHNv1V+diZHmF5naoO+p3EgI2apVSpfNjmeZHTTvodYc0oWHtEh01Vtx0jOR1Rfy9FoyPZmCzzG22LC3JiCEFBLRQ09ghKDXN4H+USDw+jStgQ32njnvNtK5AHjzfggRHNpCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgBH2293HAxqNbEaAA--.1154S2;
	Tue, 19 May 2026 16:16:57 +0800 (CST)
From: Xuyang Dong <dongxuyang@eswincomputing.com>
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
Subject: [PATCH v6 3/3] reset: eswin: Add eic7700 HSP reset driver
Date: Tue, 19 May 2026 16:16:52 +0800
Message-Id: <20260519081652.1643-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260519081431.1424-1-dongxuyang@eswincomputing.com>
References: <20260519081431.1424-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgBH2293HAxqNbEaAA--.1154S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFy7Kw4UCrWDKF4DKFyrXrb_yoW7tw4UpF
	WrCF13Ar4UXrWfGFZ7GF1qyFy3Wan3tryYk3yxJ3WS9rsxWFyUJrWUta40yF9rJr9rGry5
	JF1agF1xuFnIyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

Add auxiliary driver to support ESWIN EIC7700 high-speed peripherals
system. The reset controller is created using the auxiliary device
framework and set up in the clock driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/reset/Kconfig             |  11 +++
 drivers/reset/Makefile            |   1 +
 drivers/reset/reset-eic7700-hsp.c | 113 ++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
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
index 000000000000..1575ee4a20d6
--- /dev/null
+++ b/drivers/reset/reset-eic7700-hsp.c
@@ -0,0 +1,113 @@
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
+#include <linux/module.h>
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

