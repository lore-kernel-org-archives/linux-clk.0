Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72F26B74A;
	Mon, 29 Dec 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766994824; cv=none; b=fW9s2bMwFwk/3zcqecz5ceUk18Fs7k6EkpoJHtvmXIhy7VGnWjS4LoYH6XDr6DIZFEIA2toM0PeLYbtKT9ZcArzaHKe7uXettLPhEiqnhB7IQGPFw5bU8lm4/F2NaUZsafBbNKIQIW10ZlRdQLOtpGyYu9Dbi3B7b5OSbik5H/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766994824; c=relaxed/simple;
	bh=bnqMYDBwgzx1CuxT+oS+Q5J/AFp+tUeM57ZUWQq3xkk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oue3aPbBryR+nZPRdRy9rf9r1BHujWn4bwX6EKWeuHyzQWMriLN6BiHt3awx9aKdnaHk3qEsBc9QiOyF3hOcRlp62a6Y7WYJqe68tDmouxh4l9t//vDfm+O99dNzQmYGv19A4CouqTjO+uWO0A6ltVEkEBSzfsNKrFfczTNudtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=wk/uMbGk; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="wk/uMbGk"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BT7rE9A1703570, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766994794; bh=4oNIF7/iPyE4qwzFeWNdz8HsQe0pZ9p8qJaP0k87vSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=wk/uMbGkOaGL7ljKuE8Pj/MyRYOCwLG2Cpj9QoswXY20Zbfq0HJyndEXbGpjfFZrV
	 MckNL4OHS7bcIruJWwLUO7eJUbCqaH/72DJrqdcTdEwy1APzlzsAUCViQHCsgkfiC/
	 Hc45CN+UARlfEgaOwzXI+g1Fhju1BcgvIifYnHKrj26WJmYq1CkQfzhryFVLxNjx0v
	 R5tifY+Hq7UiF8RY25DIRIW3mM9N4ZNSMSMterxMBEfTXLX41hH4KLkmeqEET35LIM
	 KCvdVSlNevkQBjeZeZOgWzOflEcDIJPrPGqjivk5+ZtDGU9/NlLQBBEirpagND+9Uq
	 7O6vs0H57qcfQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BT7rE9A1703570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 15:53:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 29 Dec 2025 15:53:15 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 29 Dec 2025 15:53:14 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 29 Dec 2025 15:53:14 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH 2/9] clk: realtek: Add basic reset support
Date: Mon, 29 Dec 2025 15:53:06 +0800
Message-ID: <20251229075313.27254-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251229075313.27254-1-eleanor.lin@realtek.com>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Define the reset operations backed by a regmap-based register
interface and prepare the reset controller to be registered
through the reset framework.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/realtek/Kconfig  |  27 +++++++
 drivers/clk/realtek/Makefile |   4 +
 drivers/clk/realtek/reset.c  | 138 +++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/reset.h  |  36 +++++++++
 6 files changed, 207 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/reset.c
 create mode 100644 drivers/clk/realtek/reset.h

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
index 000000000000..8577dce93ba6
--- /dev/null
+++ b/drivers/clk/realtek/Kconfig
@@ -0,0 +1,27 @@
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
index 000000000000..0c1925216bbf
--- /dev/null
+++ b/drivers/clk/realtek/reset.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ */
+
+#include <linux/of.h>
+#include <linux/device.h>
+#include "reset.h"
+
+#define RTK_RESET_BANK_SHIFT         8
+#define RTK_RESET_ID_MASK            0xff
+#define to_rtk_reset_controller(r) container_of(r, struct rtk_reset_data, rcdev)
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
+static int rtk_reset_update_bits(struct rtk_reset_data *data, u32 offset,
+				 u32 mask, u32 val)
+{
+	int ret;
+
+	ret = regmap_update_bits(data->regmap, offset, mask, val);
+	return ret;
+}
+
+static int rtk_reset_read(struct rtk_reset_data *data, u32 offset, u32 *val)
+{
+	int ret;
+
+	ret = regmap_read(data->regmap, offset, val);
+	return ret;
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = rtk_reset_get_bank(data, idx);
+	u32 id = rtk_reset_get_id(data, idx);
+	u32 mask = bank->write_en ? (0x3 << id) : BIT(id);
+	u32 val = bank->write_en ? (0x2 << id) : 0;
+
+	return rtk_reset_update_bits(data, bank->ofs, mask, val);
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
+	return rtk_reset_update_bits(data, bank->ofs, mask, val);
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
+	struct rtk_reset_bank *bank = &data->banks[idx >> 8];
+	u32 id = idx & 0xff;
+	u32 val;
+
+	rtk_reset_read(data, bank->ofs, &val);
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
+static int rtk_of_reset_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	int val;
+
+	val = reset_spec->args[0];
+
+	if (val >= rcdev->nr_resets)
+		return -EINVAL;
+
+	return val;
+}
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_initdata *initdata)
+{
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+
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
+	data->rcdev.nr_resets = initdata->num_banks * 0x100;
+	data->rcdev.of_xlate = rtk_of_reset_xlate;
+	data->rcdev.of_reset_n_cells = 1;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_GPL(rtk_reset_controller_add);
+
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

