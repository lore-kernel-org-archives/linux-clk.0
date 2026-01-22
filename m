Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E2355044;
	Thu, 22 Jan 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080159; cv=none; b=N0HYYUllaZHrAq7laJgAs2hUdoiogQP0O1GKhgvO4f7tMzFbSr1RTTAOS3ZLxgG4whz3ZVEeIG2ROQNo0bvMNXW8P9Da2WmvFxdVnKlSh12I7Igb0p14p6ANlDGkyvWkltjfuVD51CvwesW+bPzWooMhGfb816E0tC/+yve/lCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080159; c=relaxed/simple;
	bh=LdvNZ3fiRfVBdcevPEyq1yoH5DQnCSVZ07/fJlEf40I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UuR0KxFGdmEduf510a4zpwifWXEngSEVdr1Br3V62V6SkxSvHGKhsaU2VXOMKAD9Q03IoJ28NqVsGHLN9ROps1tTKxoCUMlC5CZmlb8ziOsrAErzvJR1jTiWtMmzlm6DAzBaUMFrSYGUVRx9vdk42sewUm32UNoa4nu4SpE2AQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ZtAoo31N; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ZtAoo31N"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60MB8wZT2913368, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1769080138; bh=WvcX7Bz904aJMwRrxCICNXyfuFBUFM8BsCtX/ffQhvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ZtAoo31NkDfO2AYz6K2fxu/gBYddi+suyRWZIi/GH6voNDQ0IUnoyi+Eee0lDY16S
	 lTjMx8LNNSRT2GOfuawOmsD0ZVHxv05BpaVl51MjPNbYVy+VyEaEHn3zCDUWcr9NY2
	 OyMHbdGADsQ79A3SrfE6RxuiiVyHH9d4/EyUEqZKRsnJXJtwsTHN6lcIOf4YTgaCk7
	 IVpuKAi7sLu+ZoB89qx3LLWCgG+9DVkxvCcCpkY8g2D8kpLUoyxLyiYoeCqn/E6ZGf
	 opU4oF/VkTLITde8BckQsiyCrnhEY5HCZlX7PCcZm9pl92xct+DVg15H6zpPr6ZrG3
	 q2BpkxFnr4gJQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60MB8wZT2913368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 19:08:58 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 22 Jan 2026 19:08:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 Jan 2026 19:08:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v3 2/9] clk: realtek: Add basic reset support
Date: Thu, 22 Jan 2026 19:08:50 +0800
Message-ID: <20260122110857.12995-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260122110857.12995-1-eleanor.lin@realtek.com>
References: <20260122110857.12995-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Define the reset operations backed by a regmap-based register
interface and prepare the reset controller to be registered
through the reset framework.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Reduced the number of IDs per bank from 256 to 32, eliminating unnecessary
gaps.
- Converted macro to static inline function.
- Removed redundant functions.
- Used UL() to prevent undefined behavior.
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/realtek/Kconfig  |  28 +++++++++
 drivers/clk/realtek/Makefile |   4 ++
 drivers/clk/realtek/reset.c  | 111 +++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/reset.h  |  36 +++++++++++
 7 files changed, 183 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/reset.c
 create mode 100644 drivers/clk/realtek/reset.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 66c0f4924c1e..de772e0026de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21975,6 +21975,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/clk/realtek/*
 F:	include/dt-bindings/clock/realtek*
 
 REALTEK SPI-NAND
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48..2f2cacf87c38 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -530,6 +530,7 @@ source "drivers/clk/nuvoton/Kconfig"
 source "drivers/clk/pistachio/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/ralink/Kconfig"
+source "drivers/clk/realtek/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 61ec08404442..075a1c410b90 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
+obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
 obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
new file mode 100644
index 000000000000..121158f11dd1
--- /dev/null
+++ b/drivers/clk/realtek/Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_REALTEK
+	bool "Clock driver for Realtek SoCs"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select MFD_SYSCON
+	default y
+	help
+	  Enable the common clock framework infrastructure for Realtek
+	  system-on-chip platforms.
+
+	  This provides the base support required by individual Realtek
+	  clock controller drivers to expose clocks to peripheral devices.
+
+	  If you have a Realtek-based platform, say Y.
+
+if COMMON_CLK_REALTEK
+
+config RTK_CLK_COMMON
+	tristate "Realtek Clock Common"
+	select RESET_CONTROLLER
+	help
+	  Common helper code shared by Realtek clock controller drivers.
+
+	  This provides utility functions and data structures used by
+	  multiple Realtek clock implementations, and include integration
+	  with reset controllers where required.
+
+endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
new file mode 100644
index 000000000000..52267de2eef4
--- /dev/null
+++ b/drivers/clk/realtek/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
+
+clk-rtk-y += reset.o
diff --git a/drivers/clk/realtek/reset.c b/drivers/clk/realtek/reset.c
new file mode 100644
index 000000000000..4d60a73fc335
--- /dev/null
+++ b/drivers/clk/realtek/reset.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ */
+
+#include <linux/of.h>
+#include <linux/device.h>
+#include "reset.h"
+
+#define RTK_RESET_BANK_SHIFT 5
+#define RTK_RESET_ID_MASK    0x1f
+
+static inline struct rtk_reset_data *to_rtk_reset_controller(struct reset_controller_dev *r)
+{
+	return container_of(r, struct rtk_reset_data, rcdev);
+}
+
+static inline struct rtk_reset_bank *
+rtk_reset_get_bank(struct rtk_reset_data *data, unsigned long idx)
+{
+	int bank_id = idx >> RTK_RESET_BANK_SHIFT;
+
+	return &data->banks[bank_id];
+}
+
+static inline int rtk_reset_get_id(struct rtk_reset_data *data,
+				   unsigned long idx)
+{
+	return idx & RTK_RESET_ID_MASK;
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = rtk_reset_get_bank(data, idx);
+	u32 id = rtk_reset_get_id(data, idx);
+	u32 mask = bank->write_en ? (UL(0x3) << id) : BIT(id);
+	u32 val = bank->write_en ? (UL(0x2) << id) : 0;
+
+	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
+}
+
+static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = rtk_reset_get_bank(data, idx);
+	u32 id = rtk_reset_get_id(data, idx);
+	u32 mask = bank->write_en ? (0x3 << id) : BIT(id);
+	u32 val = mask;
+
+	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
+}
+
+static int rtk_reset_reset(struct reset_controller_dev *rcdev,
+			   unsigned long idx)
+{
+	int ret;
+
+	ret = rtk_reset_assert(rcdev, idx);
+	if (ret)
+		return ret;
+	return rtk_reset_deassert(rcdev, idx);
+}
+
+static int rtk_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = &data->banks[idx >> RTK_RESET_BANK_SHIFT];
+	u32 id = idx & RTK_RESET_ID_MASK;
+	u32 val;
+	int ret;
+
+	ret = regmap_read(data->regmap, bank->ofs, &val);
+	if (ret)
+		return ret;
+
+	return !((val >> id) & 1);
+}
+
+static const struct reset_control_ops rtk_reset_ops = {
+	.reset    = rtk_reset_reset,
+	.assert   = rtk_reset_assert,
+	.deassert = rtk_reset_deassert,
+	.status   = rtk_reset_status,
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_initdata *initdata)
+{
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+	data->num_banks = initdata->num_banks;
+	data->banks = initdata->banks;
+	data->regmap = initdata->regmap;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &rtk_reset_ops;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = dev->of_node;
+	data->rcdev.nr_resets = initdata->num_banks * 32;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_GPL(rtk_reset_controller_add);
diff --git a/drivers/clk/realtek/reset.h b/drivers/clk/realtek/reset.h
new file mode 100644
index 000000000000..cd446b098429
--- /dev/null
+++ b/drivers/clk/realtek/reset.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_RESET_H
+#define __CLK_REALTEK_RESET_H
+
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/hwspinlock.h>
+
+struct rtk_reset_bank {
+	u32 ofs;
+	u32 write_en;
+};
+
+struct rtk_reset_data {
+	struct device *dev;
+	struct reset_controller_dev rcdev;
+	struct rtk_reset_bank *banks;
+	u32 num_banks;
+	struct regmap *regmap;
+};
+
+struct rtk_reset_initdata {
+	struct rtk_reset_bank *banks;
+	u32 num_banks;
+	struct regmap *regmap;
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_initdata *initdata);
+
+#endif /* __CLK_REALTEK_RESET_H */
-- 
2.34.1

