Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C60D284B26;
	Tue, 16 Dec 2025 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765856817; cv=pass; b=lCmpC90mIiTtTUuct+cdDaM0EW/tsdmJSQpSeUlTkeoCEfDfsQYXKEszx/QurbhThmXAZHPqgOurN7+vAoho/rpcUvN8rf7EKKjUbg3p1tgob8LZKqB5yWZCyNfE7IXCuVCz8ZsBpkTj+3j0s3pA6quPk04L/PyNHEL2ZhK6hMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765856817; c=relaxed/simple;
	bh=tfsY0yVqMtvwZ458fh6j7kraZS5lT+eBjVFMQZYRvnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeYM+wKZ1iTqMsFLbQHIyorZ3R8seR/T1ZPRpG+cFtG1iEfMfaBcMxETrzm/4TwiGZeLb+Oc7P4G46hagHXGtzq5EFuWzU4JGNX2nJuPcYamYeRfXU7o6ct8J+oSVUck0eUoylKl1f12f9o5cFDQIKWcMma8w/iUPBd4x1w1cY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=CTBnOxBS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="CTBnOxBS"
ARC-Seal: i=1; a=rsa-sha256; t=1765856801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PXo4V+gS/2tAM69u+ydLvplVP6zo90czP/gPb3Y7EF6r+nPFFZ2O5fb6mvCGVBGUIv7kczoraWaNUC135XrbbhlhMpzlkGHeObmQ4jrM/lB8CMEc6M5JvO1m9cYwMvtu+pttS3MXDHmhS4MTi+zStR+rUVMDhg0r4jPC67C2t+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856801; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AiupJZd/vcY7o8scBXZAtdz3Y8DTB8H2FBtmaYjx7+Y=; 
	b=TGeAa1+/CRDBdAk6W0BNBSdmKyoJBZY0JyiaV39s0ANjDMBinnT2kr2NaKZmq0bTGY8pqqxjLAq1pMhxbPLnRur95TA4oVYpgO7/vBBbNuna9bt8gBARLWhFN/O8U0sILspFwOQGB8XnuBCBFhWgAxwNsMjD9WXokJ/BKowKZ2g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856801;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AiupJZd/vcY7o8scBXZAtdz3Y8DTB8H2FBtmaYjx7+Y=;
	b=CTBnOxBSsCICtN4i1pJBY6sJM9hqs0hZdXWy39pZZqdcEZ2my4dKmgltzTr6pUxt
	iZFJ+xppaw82Bfifwa4/NvxtO/TTDp9T2076IFr3E0U12FW2T7Dxug2EhZVsVLIMfcv
	WydL9YCNkdjWLvpxDgRF8e2zIHk2MNhboWOfsTKk=
Received: by mx.zohomail.com with SMTPS id 1765856799899114.29961420362406;
	Mon, 15 Dec 2025 19:46:39 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 16 Dec 2025 11:39:44 +0800
Subject: [PATCH v3 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dr1v90-cru-v3-4-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
In-Reply-To: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=6260;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=tfsY0yVqMtvwZ458fh6j7kraZS5lT+eBjVFMQZYRvnc=;
 b=lijSNI7pCRFqkf4yE8Cwg15oX5IivMMlWpYY9dax+5p3igSwhX365hneekHQpTE6Mgmit8ce5
 MJlXoyke1rCAg+zxDbOqe0ehwbVyA1TKf1bfb5ZtYPWiGC07muD2rDM
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External

Add reset controller support for the Anlogic DR1V90 SoC, which is an
auxiliary device associated with the Clock and Reset Unit (CRU). All
resets are active-low.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/reset/Kconfig        |   9 +++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-dr1v90.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d367040b0b380b78ce02d775a3a63..be45de8b1681578dfd511bafd1973699aa95358b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -73,6 +73,15 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216 or the BCM2712.
 
+config RESET_DR1V90
+	tristate "Anlogic DR1V90 reset controller"
+	depends on ARCH_ANLOGIC || COMPILE_TEST
+	select AUXILIARY_BUS
+	default ARCH_ANLOGIC
+	help
+	  This enables the reset controller driver for Anlogic DR1V90 SoCs
+	  provided by the CRU unit.
+
 config RESET_EIC7700
 	bool "Reset controller driver for ESWIN SoCs"
 	depends on ARCH_ESWIN || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 9c3e484dfd81a4f7b2f156a6226d5fa233600f9f..2e6804ff463e5e1da3b697373d56ace1351125af 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_DR1V90) += reset-dr1v90.o
 obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
diff --git a/drivers/reset/reset-dr1v90.c b/drivers/reset/reset-dr1v90.c
new file mode 100644
index 0000000000000000000000000000000000000000..7be8536b16c1ead1121390f4f7453ad6f2927982
--- /dev/null
+++ b/drivers/reset/reset-dr1v90.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include "linux/device.h"
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/anlogic,dr1v90-cru.h>
+
+struct dr1v90_reset_map {
+	u32 offset;
+	u32 bit;
+};
+
+struct dr1v90_reset_controller {
+	struct reset_controller_dev rcdev;
+	void __iomem *base;
+	spinlock_t lock; /* protect register read-modify-write */
+};
+
+static inline struct dr1v90_reset_controller *
+to_dr1v90_reset_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct dr1v90_reset_controller, rcdev);
+}
+
+static const struct dr1v90_reset_map dr1v90_resets[] = {
+	[RESET_OCM]		= { 0x74, BIT(4)},
+	[RESET_QSPI]		= { 0x74, BIT(5)},
+	[RESET_SMC]		= { 0x74, BIT(6)},
+	[RESET_WDT]		= { 0x74, BIT(7)},
+	[RESET_DMAC_AXI]	= { 0x74, BIT(8)},
+	[RESET_DMAC_AHB]	= { 0x74, BIT(9)},
+	[RESET_NPU]		= { 0x74, BIT(12)},
+	[RESET_JPU]		= { 0x74, BIT(13)},
+	[RESET_DDRBUS]		= { 0x74, BIT(14)},
+	[RESET_NIC_HP0]		= { 0x78, BIT(0)},
+	[RESET_NIC_HP1]		= { 0x78, BIT(1)},
+	[RESET_NIC_GP0M]	= { 0x78, BIT(4)},
+	[RESET_NIC_GP1M]	= { 0x78, BIT(5)},
+	[RESET_GPIO]		= { 0x78, BIT(8)},
+	[RESET_IPC]		= { 0x78, BIT(12)},
+	[RESET_USB0]		= { 0x7C, BIT(0)},
+	[RESET_USB1]		= { 0x7C, BIT(1)},
+	[RESET_GBE0]		= { 0x7C, BIT(4)},
+	[RESET_GBE1]		= { 0x7C, BIT(5)},
+	[RESET_SDIO0]		= { 0x7C, BIT(8)},
+	[RESET_SDIO1]		= { 0x7C, BIT(9)},
+	[RESET_UART0]		= { 0x7C, BIT(12)},
+	[RESET_UART1]		= { 0x7C, BIT(13)},
+	[RESET_SPI0]		= { 0x7C, BIT(16)},
+	[RESET_SPI1]		= { 0x7C, BIT(17)},
+	[RESET_CAN0]		= { 0x7C, BIT(20)},
+	[RESET_CAN1]		= { 0x7C, BIT(21)},
+	[RESET_TTC0]		= { 0x7C, BIT(24)},
+	[RESET_TTC1]		= { 0x7C, BIT(25)},
+	[RESET_I2C0]		= { 0x7C, BIT(28)},
+	[RESET_I2C1]		= { 0x7C, BIT(29)}
+};
+
+static int dr1v90_reset_control_update(struct reset_controller_dev *rcdev,
+				       unsigned long id, bool assert)
+{
+	struct dr1v90_reset_controller *rstc = to_dr1v90_reset_controller(rcdev);
+	u32 offset = dr1v90_resets[id].offset;
+	u32 bit = dr1v90_resets[id].bit;
+	u32 reg;
+
+	guard(spinlock_irqsave)(&rstc->lock);
+
+	reg = readl(rstc->base + offset);
+	if (assert)
+		reg &= ~bit;
+	else
+		reg |= bit;
+	writel(reg, rstc->base + offset);
+
+	return 0;
+}
+
+static int dr1v90_reset_control_assert(struct reset_controller_dev *rcdev,
+				       unsigned long id)
+{
+	return dr1v90_reset_control_update(rcdev, id, true);
+}
+
+static int dr1v90_reset_control_deassert(struct reset_controller_dev *rcdev,
+					 unsigned long id)
+{
+	return dr1v90_reset_control_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops dr1v90_reset_control_ops = {
+	.assert = dr1v90_reset_control_assert,
+	.deassert = dr1v90_reset_control_deassert,
+};
+
+static int dr1v90_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct dr1v90_reset_controller *rstc;
+	struct device *dev = &adev->dev;
+
+	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return -ENOMEM;
+
+	spin_lock_init(&rstc->lock);
+
+	rstc->base = of_iomap(dev->parent->of_node, 0);
+	rstc->rcdev.dev = dev;
+	rstc->rcdev.nr_resets = ARRAY_SIZE(dr1v90_resets);
+	rstc->rcdev.of_node = dev->parent->of_node;
+	rstc->rcdev.ops = &dr1v90_reset_control_ops;
+	rstc->rcdev.owner = THIS_MODULE;
+
+	return devm_reset_controller_register(dev, &rstc->rcdev);
+}
+
+static const struct auxiliary_device_id dr1v90_reset_ids[] = {
+	{
+		.name = "anlogic_dr1v90_cru.reset"
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, dr1v90_reset_ids);
+
+static struct auxiliary_driver dr1v90_reset_driver = {
+	.probe = dr1v90_reset_probe,
+	.id_table = dr1v90_reset_ids,
+};
+module_auxiliary_driver(dr1v90_reset_driver);
+
+MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
+MODULE_DESCRIPTION("Anlogic DR1V90 reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.52.0

