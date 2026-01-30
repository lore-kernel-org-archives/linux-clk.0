Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1343559C3
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795437; cv=none; b=b2w4wZjCb0zWDioUM8fbFiVJQTfLzgaZAxwBNZTPk6pV/dnq3zJUf9SFPx2Q4i1PBV/azyTTnFlBk/n6vYhUNkADSvVeZ5K6c7kIltGajV23rgjU1oqnPiwtg9x5jnaAgyF+XGurReb6C6/VqmNH6uf9Q45Hqo7CP51ZIGDdTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795437; c=relaxed/simple;
	bh=MAiv0fduuWkme5u2DYpSYMKrpbzI/a1tGOAyMy7f51E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8a66/aS4RDwbbjFKIZqOdR6nUzXkUDuzMh5kHKo0l/A63nWLVT1ZYr2yIi6uu2RR0hJre9X/csNtdCN736Pw49x1WHk2yar69bvXOOwqYlD9PyKipckW+XlAIJoe3WAmGGghlgOfX92a7Lb1sjmHb9vjLIRWJ9zze4lfk+OuvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Gd43cvRI; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Gd43cvRI"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64931bbf70cso2177132d50.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 09:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769795434; x=1770400234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZMMTz+zEnEaVc0tT9uLbJMYSdAwAyWPF8xhmiLxTpo=;
        b=Gd43cvRI/p8sLbzTxc//Lf1C+MkIFgu2385eOIrOZQxLw61KFg6gesIXexw7zw64sW
         xxfniKHanDxme4JePpi9d035aOM3zRgwvWAAujb8LjNondgGVjKi/9NGfG/nCmbPar9m
         T6nGXoMa/UMcw5wGRe3Spg5skakjIGffAzh79yFQo/TdT3+xB+tvuXQaSKuegyzo0yy3
         hFYsR9lcPmU+eVOoHcSLBgSCCZHIX6MctCRHep6A4YFFiy4bEfkooKpVqgROTcmbwubQ
         yywfJBazjLNFTtGjyYLBSqN4tXcPWQHXmuF/rILtrVuw8JXQMECwqneNk8xRO0PTxJQl
         Xz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769795434; x=1770400234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UZMMTz+zEnEaVc0tT9uLbJMYSdAwAyWPF8xhmiLxTpo=;
        b=SCFfl2vJKF2tH/4Sqsq3TAeYPzA9ckemZvU7m+6ZZB8AiEoxS2XKGHhBL/aduReXnZ
         1lwkdP9D10gQJqq5DMEHiBdvU0di8y0GP/a5gMxLzXmSzi8dNdsfUTKru66sURROfpqV
         MV+AEZJ6+GdNUorAbUdTPlS4B+H87RZSljhNlvAidQ8QPaxFSU1BiWVxotyff5+O2O6D
         0Lw0nWrzksAznYtqxaoxBvnAZhjfx1b+/pG5yAfCfAPeFyZjKTvg4zz14xt1wkCkOeBy
         VnlVZGa+fu/XPlRG1AP8hcK2YT3pkKoZMfxHLdaWDeWCtDc+TJYWmLhfJufSyRg3ftNs
         IERg==
X-Forwarded-Encrypted: i=1; AJvYcCWvsav34l70O36RolVee883VchaJ9FjzlvmFl/IMGpEg/0rdDz1RR3h+qjf3K1fWU3kFeh2lm91ybQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7e0sbX1vQGDtIAms0TPMLeNIgEtKMV86HTF0QbBHcQaUSswui
	KnI0jF1Ju4hAd/68w88cG6GOSYUL3tB6oj/dDu7th0j3dkbaU24V5zy3b6Ql6sL+B0E=
X-Gm-Gg: AZuq6aKws8SZlgOQFKOJD5uvBfKj9chSoP5q92/uhzSZP0T3YHlpW9BP5ca3HhZ5crK
	ht3gCQB+WcJUG+Drxl/HQlztN55FQXoWV3u6rOUyF+I7J08LK2Sc1e7Efqx9glR/5X6s2RyNBra
	qlQtVTp3JPFvasXKfJ0G6OrxKAexR1aqTq4uafqtpck2JzTBfAG+gmcxhAjYr67XWYkW83UXYHi
	wv8vdnLrrt+RHUxz6KMTwwEQgVFccACZX7OOPg1eQKIP92RVLWQsmVXe4vri+2lW6sx2CHNLcPW
	2iQ+7wndI3kBe/S45m9eCQTjImPLTfMMMaYM3FEjnqg/fjw255+vK+eshGL0eWtyG/UDgnnTD6Z
	0ieEztmHTy83F0OcgJkNyi0ri9Ygtydm+f1LY66Rc0W552TJSA9FYC92zUloh6D3AbwVM/qZRSX
	WnmO0igulZESgbijMktzNjoixoyQEvosjWPXJirQN6NQYQGPRI9/rW+5QAnAMPdulE8A+xGGrwn
	RRea1WCd7jWf74=
X-Received: by 2002:a05:690c:c513:b0:794:25c:2cc4 with SMTP id 00721157ae682-7949df4f9d2mr69480157b3.31.1769795434000;
        Fri, 30 Jan 2026 09:50:34 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960e0965sm3939108d50.13.2026.01.30.09.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:50:33 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 30 Jan 2026 11:50:22 -0600
Subject: [PATCH v4 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-atlantis-clocks-v4-2-46de52d52924@oss.tenstorrent.com>
References: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
In-Reply-To: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
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
 bmasney@redhat.com
X-Mailer: b4 0.14.3

Adds Atlantis Reset Controller and auxiliary device definitions for
reset to share same regmap interface as prcm (clock controller).

This version of the reset controller driver covers resets from the RCPU
prcm.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                                |   2 +
 drivers/reset/Kconfig                      |  11 ++
 drivers/reset/Makefile                     |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c | 160 +++++++++++++++++++++++++++++
 include/soc/tenstorrent/atlantis-prcm.h    |  31 ++++++
 5 files changed, 205 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fc7bc6d0458..0cde1774567d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22537,7 +22537,9 @@ T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
+F:	include/soc/tenstorrent/
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
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
index 000000000000..6fe9143ad76c
--- /dev/null
+++ b/drivers/reset/reset-tenstorrent-atlantis.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tenstorrent Atlantis PRCM Reset Driver
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <dt-bindings/clock/tenstorrent,atlantis-prcm.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+#include <soc/tenstorrent/atlantis-prcm.h>
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
+	struct atlantis_prcm_adev *rdev = to_atlantis_prcm_adev(adev);
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
diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/tenstorrent/atlantis-prcm.h
new file mode 100644
index 000000000000..841516cbefd9
--- /dev/null
+++ b/include/soc/tenstorrent/atlantis-prcm.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Shared definitions for Atlantis PRCM Clock and Reset Drivers
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+#ifndef __SOC_ATLANTIS_PRCM_H__
+#define __SOC_ATLANTIS_PRCM_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct atlantis_prcm_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct atlantis_prcm_adev *
+to_atlantis_prcm_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct atlantis_prcm_adev, adev);
+}
+
+/* RCPU Reset Register Offsets */
+#define RCPU_BLK_RST_REG 0x001c
+#define LSIO_BLK_RST_REG 0x0020
+#define HSIO_BLK_RST_REG 0x000c
+#define PCIE_SUBS_RST_REG 0x0000
+#define MM_RSTN_REG 0x0014
+
+#endif

-- 
2.43.0

