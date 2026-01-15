Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F36330D29
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520585; cv=none; b=h/82O7Jk+l7wy1nmljjYHB6tjoEDfQOD1/BwgymND3z+zoNgW1kf3Ibe3y7Oqu+uc495PVF+VwvVsuSXBoBpl7nXfu6kYe6y3UlhiOJeLqGvuECx0do2y8Jg8+bOLl5s8TQ7s5UxDjQKIEmWd79877BJNfOKH2RUC2mG0a13+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520585; c=relaxed/simple;
	bh=qcaaZANCOEyqZ0KFVkNT48fIf3U6ZGNHU51PyrXz1GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkJ/sfdsCBepjyG69zJBLvnqobbdmxbBnMM8x1XoK7mitgokjr0aL4j84nJA9nVQKqfo483vHGCUrXq+TgYYISJYH/1D9xVFAx4cLyqCzFyx7obT2vKXZduT69jVk3UZ6whXM2orBtehLsJIl8s2nM26C5B5siQNv/nl1rHZEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=PiqemR/Z; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="PiqemR/Z"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78e7ba9fc29so14819687b3.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520572; x=1769125372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuXosatL7jUspS52kKMFA09e6GoDFcrqO+bX2qZbTEM=;
        b=PiqemR/Z3CQgL9AoZBmnoOLSN8JoNuKLheviRkzkPdslJMJoUZVu09XQtUleD5MtJB
         6d9Rv+k1pd6i3xO58KhZMEhVeTG9cRqCfE8iFc/B6RSLWgRZNmtaaB6eRJYQM+gZXcNr
         OpswYjgJkHSZgStB+2qptpDqpk3Ts+syBVfKDfDDLALWFHT7O7+fYcoeMXxAFQvhjq1F
         YEFRvycHJV2JX+UxHMwCLjm3eYRW3vAq3NHPT/9BAexW9JcZPYv39hcr1HWAL5eUS3KR
         aBzy5zAxKFrjs3fPa0/M7Yg6u/gH5A7UT4p8hnGbtvWY7s/GogwHcditiFiZOysxr/Hl
         Gufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520572; x=1769125372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YuXosatL7jUspS52kKMFA09e6GoDFcrqO+bX2qZbTEM=;
        b=wMAJgq6ThZdRo6yBBDQR/rTF1dJ4FimvSmrwkjpiv4Gz882ed34CK5pSLbM6F92M6u
         qElFgBaZz2MyMK67V8B6p0U7Ba8baI0MYPsBIc5NhkbknpThNOILuCga8e9uNumM1LZB
         MeFewBfEZT/zFxNu7RvwJ8vwC3oVcvjIbNZqbWvCI1+j0rFZPL1N6Njp5C7I9DbJkCBC
         HeNGbfz1NjZhSQG271wBg15e4vCxF73ClMU02/oGf/F+cE0AjpHzmp8QVdxmDF3VPuPS
         /AmZAizJu6hWHuOD3t813dZbWVjnZ2x/ghYtmjGkn+eodebzBl7wCRjC+haR9RAArLOw
         V86g==
X-Forwarded-Encrypted: i=1; AJvYcCUwX/q7CRdyrvx4aF37uVC2ksQZUwKUsktkQ1w0rUssIoGQG7LJ07RcyDnGQSCqCDgUM2CA4Sa0ngY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlBGPOGeEH6dWkSrYYriNIhpWLKmgUd8ogcrgvkep4XrZv+UJ
	ro1ChCXbla5pTrMf+0OY347eSTTDvWdZcHsAC0NFBFe8KL13vKu4faQVv3/RI/h+8HM=
X-Gm-Gg: AY/fxX4NwisxvKT5N3G5b7lPMjdB9c/ePE6W0bewZqiBP1rtXWgT3pbr+NX4EHh5wS9
	gPR03YfZazRuCrcjuVOlnsM3wzeVJpJeUHvaY2Lkii7QYajSTa2npIYTuFLQXOFpahFkRO5G7eD
	lhTDl9/PtJC7hHyS1Nckn+gf8rx/vkPtZjppMAoY5dZ0vGDRe3O4SOHjIEtXvjQ36WSubpFtOkC
	zaHdn0jlzrGYgSz5lb+rel2SVFRdsM8EyKahkjvMgxYFbLsSt2cdD2MGSJuUlfyIB2m24DlNvH1
	ZG4Y185Hyvc7UjX9fQzrLlhHFlJoYe/l7HcP9dv+DTnLcAP8FjPsfdaw6dJkNYkr6n0nA5WPX/a
	xPcVYurM7V6pTBXo6sPN6NcPYm5pWykpuitHP7LvDhhGdvM1q5QimU6WK+gwYHiWumjJDYl2IKh
	B2GpMuq2/PSvG2mIseJQ7eKkK9xye+lhu4DCCiOoDMLF+lOtNC/1gPbeZjFwlNbjJ+ljK2WfA=
X-Received: by 2002:a05:690c:e3e9:b0:792:7374:7ff4 with SMTP id 00721157ae682-793c66ac5e1mr8413757b3.11.1768520571893;
        Thu, 15 Jan 2026 15:42:51 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:51 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:06 -0600
Subject: [PATCH 7/8] reset: tenstorrent: Add reset controller for Atlantis
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-atlantis-clocks-v1-7-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
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
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3

Implement reset controller as an auxiliary device of the clock
controller, sharing the same regmap interface. This version of the
driver covers resets from the RCPU syscon.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                                |   1 +
 drivers/reset/Kconfig                      |  11 ++
 drivers/reset/Makefile                     |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c | 164 +++++++++++++++++++++++++++++
 4 files changed, 177 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93d941d2886b..31c3e5bcb32d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22538,6 +22538,7 @@ F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
 F:	drivers/clk/tenstorrent/
+F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
 F:	include/soc/tenstorrent/
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..cade77717492 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -324,6 +324,17 @@ config RESET_SUNXI
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
index 9c3e484dfd81..a31959da0a88 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
+obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
diff --git a/drivers/reset/reset-tenstorrent-atlantis.c b/drivers/reset/reset-tenstorrent-atlantis.c
new file mode 100644
index 000000000000..b1e934a5b054
--- /dev/null
+++ b/drivers/reset/reset-tenstorrent-atlantis.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+
+#include <soc/tenstorrent/atlantis-syscon.h>
+#include <dt-bindings/clock/tenstorrent,atlantis-syscon.h>
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
+#define to_atlantis_reset_controller(_rcdev) \
+	container_of((_rcdev), struct atlantis_reset_controller, rcdev)
+
+#define RESET_DATA(_reg, _bit, _active_low)                          \
+	{                                                            \
+		.bit = _bit, .reg = _reg, .active_low = _active_low, \
+	}
+
+static const struct atlantis_reset_data atlantis_rcpu_resets[] = {
+	[RST_SMNDMA0] = RESET_DATA(RCPU_BLK_RST_REG, 0, true),
+	[RST_SMNDMA1] = RESET_DATA(RCPU_BLK_RST_REG, 1, true),
+	[RST_WDT0] = RESET_DATA(RCPU_BLK_RST_REG, 2, true),
+	[RST_WDT1] = RESET_DATA(RCPU_BLK_RST_REG, 3, true),
+	[RST_TMR] = RESET_DATA(RCPU_BLK_RST_REG, 4, true),
+	[RST_PVTC] = RESET_DATA(RCPU_BLK_RST_REG, 12, true),
+	[RST_PMU] = RESET_DATA(RCPU_BLK_RST_REG, 13, true),
+	[RST_MAILBOX] = RESET_DATA(RCPU_BLK_RST_REG, 14, true),
+	[RST_SPACC] = RESET_DATA(RCPU_BLK_RST_REG, 26, true),
+	[RST_OTP] = RESET_DATA(RCPU_BLK_RST_REG, 28, true),
+	[RST_TRNG] = RESET_DATA(RCPU_BLK_RST_REG, 29, true),
+	[RST_CRC] = RESET_DATA(RCPU_BLK_RST_REG, 30, true),
+
+	[RST_QSPI] = RESET_DATA(LSIO_BLK_RST_REG, 0, true),
+	[RST_I2C0] = RESET_DATA(LSIO_BLK_RST_REG, 1, true),
+	[RST_I2C1] = RESET_DATA(LSIO_BLK_RST_REG, 2, true),
+	[RST_I2C2] = RESET_DATA(LSIO_BLK_RST_REG, 3, true),
+	[RST_I2C3] = RESET_DATA(LSIO_BLK_RST_REG, 4, true),
+	[RST_I2C4] = RESET_DATA(LSIO_BLK_RST_REG, 5, true),
+	[RST_UART0] = RESET_DATA(LSIO_BLK_RST_REG, 6, true),
+	[RST_UART1] = RESET_DATA(LSIO_BLK_RST_REG, 7, true),
+	[RST_UART2] = RESET_DATA(LSIO_BLK_RST_REG, 8, true),
+	[RST_UART3] = RESET_DATA(LSIO_BLK_RST_REG, 9, true),
+	[RST_UART4] = RESET_DATA(LSIO_BLK_RST_REG, 10, true),
+	[RST_SPI0] = RESET_DATA(LSIO_BLK_RST_REG, 11, true),
+	[RST_SPI1] = RESET_DATA(LSIO_BLK_RST_REG, 12, true),
+	[RST_SPI2] = RESET_DATA(LSIO_BLK_RST_REG, 13, true),
+	[RST_SPI3] = RESET_DATA(LSIO_BLK_RST_REG, 14, true),
+	[RST_GPIO] = RESET_DATA(LSIO_BLK_RST_REG, 15, true),
+	[RST_CAN0] = RESET_DATA(LSIO_BLK_RST_REG, 17, true),
+	[RST_CAN1] = RESET_DATA(LSIO_BLK_RST_REG, 18, true),
+	[RST_I2S0] = RESET_DATA(LSIO_BLK_RST_REG, 19, true),
+	[RST_I2S1] = RESET_DATA(LSIO_BLK_RST_REG, 20, true),
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
+		val = ~mask;
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
+	struct atlantis_ccu_adev *rdev = to_atlantis_ccu_adev(adev);
+	struct atlantis_reset_controller *controller;
+	struct device *dev = &adev->dev;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+	controller->data =
+		(const struct atlantis_reset_controller_data *)id->driver_data;
+	controller->regmap = rdev->regmap;
+
+	return atlantis_reset_controller_register(dev, controller);
+}
+
+static const struct auxiliary_device_id atlantis_reset_ids[] = {
+	{ .name = "atlantis_ccu.rcpu-reset",
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
+MODULE_DESCRIPTION("Atlantis reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

