Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22CE48B39E
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559376; cv=none; b=VxDpbkF7Yc4ij549a0fSQ+Zpn3HZ9Wn/LE8J8mca+TD7O9kuRVtioNRmQiVar0SlDvJhy8N+ycCqhzEu14pyByG8+kdNCpa2f45eh8GTFCZwdVaUAga3hU6JUUKReuLkpvZ0/7QW/Gq5lzrLVRZVMBzrb01W/ioe13j21h6tsak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559376; c=relaxed/simple;
	bh=ikU3SYm4fZtzx41B43XT3sQXiHe6rX7H2mkSsOmUHxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MuCrTfBX1WpGs2A2skEyCEkkBJu7OzoQKCZiQyYmkYh9OvQelv42CXnWnIOwKKorPXVczROVKnJ3ZouASM+GD3DWKM4nmXHHbZ7W6WjHWfL8q6l7bjhixpoyv8AXrlbPrJhQ2xXqV4cGOZ+EPtl4iMkf2ShUCLydvK13Fj++s5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=LguPl6Ff; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="LguPl6Ff"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-798527f822cso60250967b3.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 09:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772559374; x=1773164174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pU1PBZaWQzhkP+Ano32jZ9EnpFmmd1ZMsGzX+u3jJp8=;
        b=LguPl6FfvETs3UeJXc+axVLa5CXKYEYNB6f7225KuMJFUYYSz1y/idAxd5P0s9Jhf+
         x/b2nJqZLbQIQ33xphw0IjXeoDDoKvhZ3X0RrVCA/m5x2YhZzI199izuTm48NaEff8dn
         bXcxaWa02YFnAu34mL0/798sBZHck6V5N8c7WWuuub166Marz1+4p9ZWVY2P8rvQwCb3
         sUd0oAGxhEeYRAVFAxJ8FRan+H8wO+zpkFGxXGe5Q1vdZiDoI6moPSxzdCUTXIDS1F7Q
         eTb00FXNrNsEo9NuIle1ECQ0CIDnpGEb74AClfZosjnzb/tZRX9H0JocF+RFzMffYzQU
         4lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559374; x=1773164174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pU1PBZaWQzhkP+Ano32jZ9EnpFmmd1ZMsGzX+u3jJp8=;
        b=nBIDtXoKI4ZkCIcRKMzU8z01vXh2fEZuTt9fjjHYK1ADJT6QEMbuuflkoMUR3GN+zT
         B6adIZIFEfzM0+PNmyZxkNKGuNu5R8EHS/Q6zWJRhL9Jn/8TXARx/Gjdm7S1r2Um+0w4
         HJ+h/Ba9d1MwIBG/1nYowU331bsGWm2DFQxCgf/QmIZp48VKdaC+EvY4yz9i3AZnzNqP
         Q9hiIZog0SXXsGF2scuoG8LcP/iwe/9bARL5jYdAPf3/FsULGaOrNC5nKfzaaNXOuBme
         +XGmAGRexEZeLzB10jbDr0P19WYHSQbC7pYopFZsTSYuTg0re+xXcZSejPpFVEogRmR2
         u4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWA0diNZCMNdJtDsgAkr/D5Xvo3xfZSOo5XgAqc0kSTJX11aayrAxJnCmaUNEw6oH2zzUtfTu+vC9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjvb7cL0rAiWFyuZ47bhNevy2vuysJJdE4sxjJcwacFssgfEWt
	j7964gEBgpC+fY0gs31nwPqChK5W6QawxLz+1yoXgionRk/pTUf1+SCLA7gumniuPrYJwrLkfMh
	pJx0q
X-Gm-Gg: ATEYQzxjSz0AQXFX3ZV5lDwE5/s9JiBsRoNeCIc+IAGn+oK9BkTwy10UuXb390L8M4P
	QxsaycIHZAbGbwz2csvXsmxoOqgqxbb2300cUJXVBcx7RXxQx9fvFdcF+Rr/rsDCSM1svPJc7IB
	irfE6WCJXCep/i8sIKFP1G4S2f5YZ/cqzOZrnU7YLlqolhC1jBQhhKTkHsNxBNN0kf6iH4wvEPA
	ktP6xCYkhc31R/EVPawsFmadvHedUQMDX4cWF3h8FpeaAlL+8HM0n+aHpqTaNQAjItEMf+lVrUS
	2Nisz/cGFWFw4EV3CqVjwC2w4Oj7xtQqknwVHgGrzQYEg6T/V9Gbi6AbohPuXpx/AiM3i1mupWi
	jra4TIO8sRUKwLSkAf7xy+KS1F+ijd/4tFI61RYfd1MmyuiDf0XVxNyBNb89lf/yWxiJQG7tqa1
	xOABV1nenVmKPeRGWpG2g5Z0ySrCo7soAcqh+XwpVG+cUooXfWbDn9czS6uQEYP+KhVFGxiZkO+
	sM3nzSBzQ==
X-Received: by 2002:a05:690c:6a04:b0:798:67f2:92b9 with SMTP id 00721157ae682-7988561b583mr131829257b3.65.1772559373970;
        Tue, 03 Mar 2026 09:36:13 -0800 (PST)
Received: from [192.168.5.15] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a8df9bsm64750477b3.1.2026.03.03.09.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:36:13 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 03 Mar 2026 11:36:08 -0600
Subject: [PATCH v7 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-atlantis-clocks-v7-2-415c9dda086a@oss.tenstorrent.com>
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
In-Reply-To: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Adds Atlantis Reset Controller driver, which shares the same regmap as
prcm ( clock controller).

This version of the reset controller driver covers resets from the RCPU
prcm.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                                |   1 +
 drivers/reset/Kconfig                      |  11 ++
 drivers/reset/Makefile                     |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c | 173 +++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40c179c8de1e..493d007d3c65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22812,6 +22812,7 @@ T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
 
 RISC-V THEAD SoC SUPPORT
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7ce151f6a7e4..85ee9da809ee 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -315,6 +315,17 @@ config RESET_SUNXI
 	help
 	  This enables the reset driver for Allwinner SoCs.
 
+config RESET_TENSTORRENT_ATLANTIS
+	tristate "Tenstorrent atlantis reset driver"
+	depends on ARCH_TENSTORRENT || COMPILE_TEST
+	select AUXILIARY_BUS
+	default ARCH_TENSTORRENT
+	help
+	  This enables the driver for the reset controller
+	  present in the Tenstorrent Atlantis SoC.
+	  Enable this option to be able to use hardware
+	  resets on Atalantis based systems.
+
 config RESET_TH1520
 	tristate "T-HEAD TH1520 reset controller"
 	depends on ARCH_THEAD || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index fc0cc99f8514..7c086baeb02a 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
+obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
diff --git a/drivers/reset/reset-tenstorrent-atlantis.c b/drivers/reset/reset-tenstorrent-atlantis.c
new file mode 100644
index 000000000000..ab8be52fdd5e
--- /dev/null
+++ b/drivers/reset/reset-tenstorrent-atlantis.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tenstorrent Atlantis PRCM Reset Driver
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+
+/* RCPU Reset Register Offsets */
+#define RCPU_BLK_RST_REG 0x001c
+#define LSIO_BLK_RST_REG 0x0020
+#define HSIO_BLK_RST_REG 0x000c
+#define PCIE_SUBS_RST_REG 0x0000
+#define MM_RSTN_REG 0x0014
+
+struct atlantis_reset_data {
+	u8 bit;
+	u16 reg;
+	bool active_low;
+};
+
+struct atlantis_reset_controller_data {
+	const struct atlantis_reset_data *reset_data;
+	size_t count;
+};
+
+struct atlantis_reset_controller {
+	struct reset_controller_dev rcdev;
+	const struct atlantis_reset_controller_data *data;
+	struct regmap *regmap;
+};
+
+static inline struct atlantis_reset_controller *
+to_atlantis_reset_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct atlantis_reset_controller, rcdev);
+}
+
+#define RESET_DATA(_reg, _bit, _active_low)                          \
+	{                                                            \
+		.bit = _bit, .reg = _reg, .active_low = _active_low, \
+	}
+
+static const struct atlantis_reset_data atlantis_rcpu_resets[] = {
+	[RST_SMNDMA0]	= RESET_DATA(RCPU_BLK_RST_REG, 0, true),
+	[RST_SMNDMA1]	= RESET_DATA(RCPU_BLK_RST_REG, 1, true),
+	[RST_WDT0]	= RESET_DATA(RCPU_BLK_RST_REG, 2, true),
+	[RST_WDT1]	= RESET_DATA(RCPU_BLK_RST_REG, 3, true),
+	[RST_TMR]	= RESET_DATA(RCPU_BLK_RST_REG, 4, true),
+	[RST_PVTC]	= RESET_DATA(RCPU_BLK_RST_REG, 12, true),
+	[RST_PMU]	= RESET_DATA(RCPU_BLK_RST_REG, 13, true),
+	[RST_MAILBOX]	= RESET_DATA(RCPU_BLK_RST_REG, 14, true),
+	[RST_SPACC]	= RESET_DATA(RCPU_BLK_RST_REG, 26, true),
+	[RST_OTP]	= RESET_DATA(RCPU_BLK_RST_REG, 28, true),
+	[RST_TRNG]	= RESET_DATA(RCPU_BLK_RST_REG, 29, true),
+	[RST_CRC]	= RESET_DATA(RCPU_BLK_RST_REG, 30, true),
+	[RST_QSPI]	= RESET_DATA(LSIO_BLK_RST_REG, 0, true),
+	[RST_I2C0]	= RESET_DATA(LSIO_BLK_RST_REG, 1, true),
+	[RST_I2C1]	= RESET_DATA(LSIO_BLK_RST_REG, 2, true),
+	[RST_I2C2]	= RESET_DATA(LSIO_BLK_RST_REG, 3, true),
+	[RST_I2C3]	= RESET_DATA(LSIO_BLK_RST_REG, 4, true),
+	[RST_I2C4]	= RESET_DATA(LSIO_BLK_RST_REG, 5, true),
+	[RST_UART0]	= RESET_DATA(LSIO_BLK_RST_REG, 6, true),
+	[RST_UART1]	= RESET_DATA(LSIO_BLK_RST_REG, 7, true),
+	[RST_UART2]	= RESET_DATA(LSIO_BLK_RST_REG, 8, true),
+	[RST_UART3]	= RESET_DATA(LSIO_BLK_RST_REG, 9, true),
+	[RST_UART4]	= RESET_DATA(LSIO_BLK_RST_REG, 10, true),
+	[RST_SPI0]	= RESET_DATA(LSIO_BLK_RST_REG, 11, true),
+	[RST_SPI1]	= RESET_DATA(LSIO_BLK_RST_REG, 12, true),
+	[RST_SPI2]	= RESET_DATA(LSIO_BLK_RST_REG, 13, true),
+	[RST_SPI3]	= RESET_DATA(LSIO_BLK_RST_REG, 14, true),
+	[RST_GPIO]	= RESET_DATA(LSIO_BLK_RST_REG, 15, true),
+	[RST_CAN0]	= RESET_DATA(LSIO_BLK_RST_REG, 17, true),
+	[RST_CAN1]	= RESET_DATA(LSIO_BLK_RST_REG, 18, true),
+	[RST_I2S0]	= RESET_DATA(LSIO_BLK_RST_REG, 19, true),
+	[RST_I2S1]	= RESET_DATA(LSIO_BLK_RST_REG, 20, true),
+
+};
+
+static const struct atlantis_reset_controller_data atlantis_rcpu_reset_data = {
+	.reset_data = atlantis_rcpu_resets,
+	.count = ARRAY_SIZE(atlantis_rcpu_resets),
+};
+
+static int atlantis_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	unsigned int val;
+	struct atlantis_reset_controller *rst =
+		to_atlantis_reset_controller(rcdev);
+	const struct atlantis_reset_data *data = &rst->data->reset_data[id];
+	unsigned int mask = BIT(data->bit);
+	struct regmap *regmap = rst->regmap;
+
+	if (data->active_low ^ assert)
+		val = mask;
+	else
+		val = 0;
+
+	return regmap_update_bits(regmap, data->reg, mask, val);
+}
+
+static int atlantis_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return atlantis_reset_update(rcdev, id, true);
+}
+
+static int atlantis_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return atlantis_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops atlantis_reset_control_ops = {
+	.assert = atlantis_reset_assert,
+	.deassert = atlantis_reset_deassert,
+};
+
+static int
+atlantis_reset_controller_register(struct device *dev,
+				   struct atlantis_reset_controller *controller)
+{
+	struct reset_controller_dev *rcdev = &controller->rcdev;
+
+	rcdev->ops = &atlantis_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = controller->data->count;
+
+	return devm_reset_controller_register(dev, &controller->rcdev);
+}
+static int atlantis_reset_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct atlantis_reset_controller *controller;
+	struct device *dev = &adev->dev;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+	controller->data =
+		(const struct atlantis_reset_controller_data *)id->driver_data;
+	controller->regmap = regmap;
+
+	return atlantis_reset_controller_register(dev, controller);
+}
+
+static const struct auxiliary_device_id atlantis_reset_ids[] = {
+	{ .name = "atlantis_prcm.rcpu-reset",
+	  .driver_data = (kernel_ulong_t)&atlantis_rcpu_reset_data },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, atlantis_reset_ids);
+
+static struct auxiliary_driver atlantis_reset_driver = {
+	.probe = atlantis_reset_probe,
+	.id_table = atlantis_reset_ids,
+};
+module_auxiliary_driver(atlantis_reset_driver);
+
+MODULE_AUTHOR("Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>");
+MODULE_DESCRIPTION("Atlantis PRCM reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

