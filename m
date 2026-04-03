Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8B72F99B8;
	Fri,  3 Apr 2026 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209007; cv=none; b=h5DjirNhUGcIRBVrmMPk5HltdZariNm4/I74X9TWMDe/q/vKxB6MrXacSF9FJhjkDv11OUtqKjiBeKW+s07qckMkAroD6I+5T2CcEm7bTHW6p/jMDR5OLhx8WLBhUL9ZkWtwf7jVAP7wTvs5cJyBl6QAGWafjwsFOp/Tni3os6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209007; c=relaxed/simple;
	bh=Uxkvx+Lx+j12W7ooN1uNceoLuY2p+hNty/77PtX8kuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAB273yaaOXsVYW6XJAIj1dO/R/QzhoxQnoKZow22KQHRvUf65sbXMG2lJtzrLmthHG0JarTUCRqmxrLDXkhYpzZRxlP4XfH8o0Zed1Xrp/anQ5T29XziChcMp8FdqXrJvl5+1rbIdE7OpyQOehfleAbTM98jurmGexWrSFvTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgAXLaAeis9pX4QOAA--.61774S2;
	Fri, 03 Apr 2026 17:36:32 +0800 (CST)
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
	dongxuyang@eswincomputing.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: [PATCH 3/3] reset: eswin: Add eic7700 HSP reset driver
Date: Fri,  3 Apr 2026 17:36:28 +0800
Message-Id: <20260403093628.780-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260403093459.612-1-dongxuyang@eswincomputing.com>
References: <20260403093459.612-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgAXLaAeis9pX4QOAA--.61774S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFyxZFW8ZFWkJFWDuF4Uurg_yoWxur13pF
	WrAF43Ar4UXr4fGrZ3GF12yFyaqan3tFy5C3yxJ3WI9rs8WryUJrWUta40yr9rGr9rGry5
	Jr13GFyxuFnIyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOEfODUUUU
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add auxiliary driver to support ESWIN EIC7700 high-speed peripherals
system. The reset controller is created using the auxiliary device
framework and set up in the clock driver.

Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/reset/Kconfig             |  13 +++
 drivers/reset/Makefile            |   1 +
 drivers/reset/reset-eic7700-hsp.c | 151 ++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/reset/reset-eic7700-hsp.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7ce151f6a7e4..50bb0cd069ba 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -83,6 +83,19 @@ config RESET_EIC7700
 	  The driver supports eic7700 series chips and provides functionality for
 	  asserting and deasserting resets on the chip.
 
+config RESET_EIC7700_HSP
+	tristate "EIC7700 HSP Reset controller"
+	depends on ARCH_ESWIN || COMPILE_TEST
+	depends on COMMON_CLK_EIC7700_HSP
+	select AUXILIARY_BUS
+	default COMMON_CLK_EIC7700_HSP
+	help
+	  This enables the HSP reset controller driver for ESWIN SoCs. This
+	  driver is specific to ESWIN SoCs and should only be enabled if using
+	  such hardware.
+	  The driver supports EIC7700 series chips and provides functionality
+	  for asserting and deasserting resets on the chip.
+
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
 	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index fc0cc99f8514..c8baaab75508 100644
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
index 000000000000..fe9822078bcc
--- /dev/null
+++ b/drivers/reset/reset-eic7700-hsp.c
@@ -0,0 +1,151 @@
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
+#include <linux/delay.h>
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
+static const struct regmap_config eic7700_hsp_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.max_register = 0x1ffc,
+	.reg_stride = 4,
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
+	int ret;
+
+	if (eic7700_hsp_reset[id].active_low)
+		ret = regmap_clear_bits(data->regmap, eic7700_hsp_reset[id].reg,
+					eic7700_hsp_reset[id].bit);
+	else
+		ret = regmap_set_bits(data->regmap, eic7700_hsp_reset[id].reg,
+				      eic7700_hsp_reset[id].bit);
+
+	return ret;
+}
+
+static int eic7700_hsp_reset_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct eic7700_hsp_reset_data *data = to_eic7700_hsp_reset(rcdev);
+	int ret;
+
+	if (eic7700_hsp_reset[id].active_low)
+		ret = regmap_set_bits(data->regmap, eic7700_hsp_reset[id].reg,
+				      eic7700_hsp_reset[id].bit);
+	else
+		ret = regmap_clear_bits(data->regmap, eic7700_hsp_reset[id].reg,
+					eic7700_hsp_reset[id].bit);
+
+	return ret;
+}
+
+static int eic7700_hsp_reset_reset(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	int ret;
+
+	ret = eic7700_hsp_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 15);
+
+	return eic7700_hsp_reset_deassert(rcdev, id);
+}
+
+static const struct reset_control_ops eic7700_hsp_reset_ops = {
+	.reset = eic7700_hsp_reset_reset,
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
+	data->regmap = devm_regmap_init_mmio
+			(dev, (__force void __iomem *)adev->dev.platform_data,
+			&eic7700_hsp_regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap),
+				     "failed to get regmap!\n");
+
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &eic7700_hsp_reset_ops;
+	data->rcdev.of_node = dev->parent->of_node;
+	data->rcdev.of_reset_n_cells = 1;
+	data->rcdev.dev = dev;
+	data->rcdev.nr_resets = ARRAY_SIZE(eic7700_hsp_reset);
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static const struct auxiliary_device_id eic7700_hsp_reset_dt_ids[] = {
+	{ .name = "clk_eic7700_hsp.hsp-reset", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, eic7700_hsp_reset_dt_ids);
+
+static struct auxiliary_driver eic7700_hsp_reset_driver = {
+	.probe	= eic7700_hsp_reset_probe,
+	.id_table = eic7700_hsp_reset_dt_ids,
+};
+
+module_auxiliary_driver(eic7700_hsp_reset_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Xuyang Dong <dongxuyang@eswincomputing.com>");
+MODULE_DESCRIPTION("ESWIN EIC7700 HSP Reset Controller Driver");
-- 
2.34.1

