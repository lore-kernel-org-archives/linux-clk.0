Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03B373C17;
	Fri, 13 Mar 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389632; cv=none; b=Kaqr+nIy2oTzPA5h3yPd8XG7Xl9K4O06bAAFnkrpyLqincmnR/7DV7ZUbV8I1NpBLMY5zEkve2OC4Bu1joCoGBa4UwPqsfC/Koy0PMBUS1ztXg7nYtBYkP9bwYSzh5UDP3+kxkrwwIgCEo3qK2g4yVXljNC22xqaSTJ2H182O8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389632; c=relaxed/simple;
	bh=qyrl9e2Tj7dl8krsZwdSkayfVq3+wLNYO/aGx6kD01U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urgT4JifTA7k5C1ss1Je98A9vNqo9d4dPb1FQybl5Zusm0veRTRuR9wNq1QBZHLuHOuJSCdrso1DOyJERi3VXOb1rMTxgiA9vvryjyuQrsLUN2/68SiRN7RkAnph5Ea9j4S6RhqOTPronc/nv9HVw5ysCJzsyKFKcL6sYamSReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=qs9bQciD; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="qs9bQciD"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B1eU4053097, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389461; bh=uoaRU6Wq8zo+rnXooOfv2Ge739awluqlqLlpIGBAad0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qs9bQciDULRoG7cMn1mqzLi7qLls/vputj3XZWahru46BJeQGKYIvoLydY/KQ1mUw
	 CKWfsbvCKLvoqnMZsx8IixPh6t1KhesSh8F7NzSjjtZNezfLRAIJUc2XkRA+tc6UWP
	 P22/Fjf4zyRpx14L2AkSKrSKwbs7zzzNNsk80ZbarFyT1U2fujPOkrHXKWzc/8BTVr
	 XFtwtjiR3eccoFqrKkvIR4GBT6fGxf7csh/YBZ4NbCuFj5+/cg3/f5ayrBW0uQqXrU
	 kX6xrc2iT6IAqJs00KHLOL8XgleTh3csd5xlMKy7feEm9JuYXHPeWxopjm2p76ml52
	 IsXzZLTdHn7oA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B1eU4053097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 13 Mar 2026 16:11:01 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 16:11:01 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v4 03/10] clk: realtek: Add basic reset support
Date: Fri, 13 Mar 2026 16:10:53 +0800
Message-ID: <20260313081100.596224-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260313081100.596224-1-eleanor.lin@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
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
Changes in v4:
- Add forward declaration for struct regmap in reset.h.
- Move struct rtk_reset_data definition into reset.c as it's only used there.
- Remove rtk_reset_reset() due to unnecessary implementation.
- Remove unnecessary parameter from rtk_reset_get_id().
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/realtek/Kconfig  |  27 ++++++++++
 drivers/clk/realtek/Makefile |   4 ++
 drivers/clk/realtek/reset.c  | 104 +++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/reset.h  |  28 ++++++++++
 7 files changed, 167 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/reset.c
 create mode 100644 drivers/clk/realtek/reset.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b7d64cc8d90..53a2f3575c37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22247,6 +22247,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/clk/realtek/*
 F:	include/dt-bindings/clock/realtek*
 
 REALTEK SPI-NAND
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3d803b4cf5c1..d60f6415b0a3 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -519,6 +519,7 @@ source "drivers/clk/nuvoton/Kconfig"
 source "drivers/clk/pistachio/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/ralink/Kconfig"
+source "drivers/clk/realtek/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f7bce3951a30..69b84d1e7bcc 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -140,6 +140,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
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
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_REALTEK
+	bool "Clock driver for Realtek SoCs"
+	depends on ARCH_REALTEK || COMPILE_TEST
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
index 000000000000..45713785d76d
--- /dev/null
+++ b/drivers/clk/realtek/reset.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include "reset.h"
+
+#define RTK_RESET_BANK_SHIFT 5
+#define RTK_RESET_ID_MASK    0x1f
+
+struct rtk_reset_data {
+	struct device *dev;
+	struct reset_controller_dev rcdev;
+	struct rtk_reset_bank *banks;
+	struct regmap *regmap;
+};
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
+static inline int rtk_reset_get_id(unsigned long idx)
+{
+	return idx & RTK_RESET_ID_MASK;
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = rtk_reset_get_bank(data, idx);
+	u32 id = rtk_reset_get_id(idx);
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
+	u32 id = rtk_reset_get_id(idx);
+	u32 mask = bank->write_en ? (0x3 << id) : BIT(id);
+	u32 val = mask;
+
+	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
+}
+
+static int rtk_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = &data->banks[idx >> RTK_RESET_BANK_SHIFT];
+	u32 id = rtk_reset_get_id(idx);
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
index 000000000000..56f944b1dcdd
--- /dev/null
+++ b/drivers/clk/realtek/reset.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_RESET_H
+#define __CLK_REALTEK_RESET_H
+
+#include <linux/reset-controller.h>
+
+struct regmap;
+
+struct rtk_reset_bank {
+	u32 ofs;
+	u32 write_en;
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

