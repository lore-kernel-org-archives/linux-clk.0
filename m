Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E23112B4;
	Wed, 31 Dec 2025 06:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767163442; cv=pass; b=IEhH6xDVeMXZ36JdsaBuILd20fdtoqZCQXHL0/5gw2Ll+wwYi0xom7nY7TVJbMV21qXXkKVPy9+4sfqkFYCxHubOPzARqAfv4HkFoWzMuxa+zoXW7VriioI7dgsoJNWsCh39hxK/NBO/lIbhXzclxXDHTvEMiF4ymsq1DijKWCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767163442; c=relaxed/simple;
	bh=6xxsPe06pP424hmp2lSDvjnTfSkqa057ogeF9N7ArvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBLH2mNZV47jI2piXulLLPU5Aa18QjMjnQ2hzV06Q+VZX4e0D+zPYHOs7tUrNLmQgsCHQsqN6yzVT2XCk1Mj2I777xHTfBA7AycW1NDUNI5gLsvvTRTF42TrVqizLuplUbbW9TeZ4enL63LWg48xl3iUr5d+tkDiqS3PQ48QjdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=C0CdZlzV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="C0CdZlzV"
ARC-Seal: i=1; a=rsa-sha256; t=1767163422; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MZYhWeeSQuxQorcbamR0aRZNpfSu1xZ4m3J+097OvfRhDyilvbNtM0Z0ZnTfZ+1CNCJd7YEQmEwlkZIWPdiwmGJR2pdVSFXsRZ4/Wf8RUjUmla20va4Uv2CJ4NxGhjZWDB665SRTToFbmjw8PBSpNRg/NN5oxIRDCEmZz1+MRkE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767163422; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zhhTX3sB1zXlbXfCVxDXjHNuYAlN+tC4PWtX0p71ri4=; 
	b=lCJGnT/6wp1r8/FUUmxtIf7Pc0/lOclg4iuXg2LGtUJzzgUP7uEbWhKwzts34aCWCu8EkdsJkMv7JrcrgX57ixg9OkSY6GTy/OXHrr2LFx72ZLVrkaFbX16/vyTYYR2N0XwDiQfHLUeHyvfTbE5vgJyoUlpE7Ggm8MlQaGuYqi0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767163422;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zhhTX3sB1zXlbXfCVxDXjHNuYAlN+tC4PWtX0p71ri4=;
	b=C0CdZlzVffVj6UZQmZlWHnDrA4hU/GvQT64Iv6EVizrYoOsaUI1eMYmxkWhkx5nm
	mLwaN9sstDtSRGGzL5ZzBhyqvKxXSncrHtJBQ38LcfKpDiZ3IWx5OZnpdtJaukhx7ov
	oCZaL+MSNXGitenn9UfMuY823q0XJJHNiqiZQHfs=
Received: by mx.zohomail.com with SMTPS id 1767163419968789.3297264926058;
	Tue, 30 Dec 2025 22:43:39 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 31 Dec 2025 14:40:08 +0800
Subject: [PATCH v4 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-dr1v90-cru-v4-4-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
In-Reply-To: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767163372; l=6107;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=6xxsPe06pP424hmp2lSDvjnTfSkqa057ogeF9N7ArvY=;
 b=KYSffAUTrYrkiFJTHPc77iJhv0wN5Z5d4OSI8KpV5ULzDFUzPE/saU/zHATp7toEhUUqYwVzE
 I2H+kOoxGrdAZvD13Bp9g3bpERj8ojdQVVyQJp7YmRGSu9po84uKUTq
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Add reset controller support for the Anlogic DR1V90 SoC, which is an
auxiliary device associated with the Clock and Reset Unit (CRU). All
resets are active-low.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/reset/Kconfig        |  10 +++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-dr1v90.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..5dd07555557e 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -73,6 +73,16 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216 or the BCM2712.
 
+config RESET_DR1V90
+	tristate "Anlogic DR1V90 reset controller"
+	depends on ARCH_ANLOGIC || COMPILE_TEST
+	depends on ANLOGIC_DR1V90_CRU
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
index 9c3e484dfd81..2e6804ff463e 100644
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
index 000000000000..b21d28a68677
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
+	rstc->base = dev->platform_data;
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
+		.name = "anlogic_dr1_cru.reset"
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

