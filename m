Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761E43CECB;
	Fri,  2 Oct 2026 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927072; cv=none; b=DvGgkuKj8gg8TT/gHHcJwVuaI4tny6U6odCg9cAz2j9pMb0nV6bK8cl6YfSa/GO1YNnjc34H61RHdz01gNZZlOLcRuBeu6c3Ow7gKjMg84tTgbpmARwlIG6x64b1Ij1iB3LFF+fDrmbrOmVM0fJlTxhriIDXj55uyngc9mJbT9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927072; c=relaxed/simple;
	bh=8CosamnzkQkgnzghTclv18kUUcs61MiizHX/P/AwX7o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ky9UtoYppK+U7ylMZ3c9mnh5FV9VLqi39wOxiyR1PgkWOfOOI/wSV8kQFtPU8u+UMB3STCWupUaf5L83Ci+MiL5oGvIoueztX9p2u51yUTabfkmUpKd/X4WEyJjVaJ9KP7c4YQR3nbshDRSrW+pAcWDfB3iQT5q9nsxb3TBkb9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Vylj89Eo; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Vylj89Eo"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6927hmOxB3646808, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790927028; bh=XlHC6fA6VQVWkQ9J336cjfS6Div7d/KU6aROe8n7PLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Vylj89Eo3E3ZLMTE8LwYqGhwctcnjpyVOO5j7dFeY1rJvzw/FsSm9CnRJkSMcwuMg
	 iriTKJvo+B7qAOGWaHHtqezeS320IQrFM/Homb4M6J7BTUuymhrLbTifOXMG5TKC41
	 FkshOX1qnu7IUZttUVow2IvAG/Lczmaim1kEmOQkvsYBQ71HeYwrymcEu5dPon42vY
	 4wTgrkLd2RbqQ+ICX+WUqadFhHXpypz/u0Iy2l7qXZ/N67F+/ftTIu4qgSqynCXZrr
	 8E91EmjMYfp0SHvecrGKrB6ympU0JRVvNVIi9Jq0tLQnsH6NUuq9IDNIaUA9+IeCns
	 ukd4YslqEx/Ng==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6927hmOxB3646808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Oct 2026 15:43:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:43:32 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:32 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <jbrunet+clk@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney+clk@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, Brian Masney <bmasney@redhat.com>
Subject: [PATCH v15 04/11] clk: realtek: Introduce common probe()
Date: Fri, 2 Oct 2026 15:43:24 +0800
Message-ID: <20261002074331.3066919-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
and add the clock provider.

Additionally, if the "#reset-cells" property is present in the device tree,
it creates and registers an auxiliary device using the provided aux_name.
This allows the dedicated reset driver to bind to this device, enabling
both clock and reset drivers to share the same regmap.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v15:
- Remove reset-related configurations.
- Switch the registration order of clock and reset controllers.
---
 MAINTAINERS                          |  1 +
 drivers/clk/Kconfig                  |  1 +
 drivers/clk/Makefile                 |  1 +
 drivers/clk/realtek/Kconfig          | 29 ++++++++++
 drivers/clk/realtek/Makefile         |  4 ++
 drivers/clk/realtek/clk-rtk-common.c | 84 ++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-rtk-common.h | 37 ++++++++++++
 7 files changed, 157 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 16c9ba043126..1784703a0e36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23030,6 +23030,7 @@ M:	Cheng-Yu Lee <cylee12@realtek.com>
 M:	Yu-Chun Lin <eleanor.lin@realtek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/clk/realtek/*
 F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 983bf74b86fb..9ddd9f7391ff 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -531,6 +531,7 @@ source "drivers/clk/nuvoton/Kconfig"
 source "drivers/clk/pistachio/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/ralink/Kconfig"
+source "drivers/clk/realtek/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index d94de2988167..0f9f49dbcf81 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -156,6 +156,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
+obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
 obj-y					+= renesas/
 obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
new file mode 100644
index 000000000000..e8deccf93f94
--- /dev/null
+++ b/drivers/clk/realtek/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_REALTEK
+	tristate "Clock driver for Realtek SoCs"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	default ARCH_REALTEK
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
+	select AUXILIARY_BUS
+	select REGMAP_MMIO
+	help
+	  Common helper code shared by Realtek clock controller drivers.
+
+	  This provides utility functions and data structures used by
+	  multiple Realtek clock implementations. It also provides the
+	  infrastructure to spawn reset controllers via the auxiliary bus
+	  where required.
+
+endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
new file mode 100644
index 000000000000..13000ed4ba11
--- /dev/null
+++ b/drivers/clk/realtek/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
+
+clk-rtk-y += clk-rtk-common.o
diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/clk-rtk-common.c
new file mode 100644
index 000000000000..7df6d04bb95a
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtk-common.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include "clk-rtk-common.h"
+
+static int rtk_reset_controller_register(struct device *dev, const char *aux_name,
+					 struct regmap *map)
+{
+	struct auxiliary_device *adev;
+
+	if (!of_property_present(dev->of_node, "#reset-cells"))
+		return 0;
+
+	if (!aux_name) {
+		dev_err(dev, "DTS requires reset controller, but aux_name is missing\n");
+		return -EINVAL;
+	}
+
+	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
+	if (!adev)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static const struct regmap_config rtk_clk_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+};
+
+int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	struct clk_hw *hw;
+	int i, ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &rtk_clk_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	for (i = 0; i < desc->num_clks; i++)
+		desc->clks[i]->regmap = regmap;
+
+	for (i = 0; i < desc->clk_data->num; i++) {
+		hw = desc->clk_data->hws[i];
+		if (!hw)
+			continue;
+
+		ret = devm_clk_hw_register(dev, hw);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
+	}
+
+	ret = rtk_reset_controller_register(dev, desc->aux_name, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register reset controller\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  desc->clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
+
+MODULE_DESCRIPTION("Realtek clock infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
new file mode 100644
index 000000000000..de3f23120b53
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtk-common.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2016-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_COMMON_H
+#define __CLK_REALTEK_COMMON_H
+
+#include <linux/clk-provider.h>
+
+#define __rtk_clk_regmap_hw(_p) ((_p)->hw)
+
+struct device;
+struct platform_device;
+struct regmap;
+
+struct rtk_clk_regmap {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+struct rtk_clk_desc {
+	struct clk_hw_onecell_data *clk_data;
+	struct rtk_clk_regmap **clks;
+	size_t num_clks;
+	char *aux_name;
+};
+
+static inline struct rtk_clk_regmap *to_rtk_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct rtk_clk_regmap, hw);
+}
+
+int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc);
+
+#endif /* __CLK_REALTEK_COMMON_H */
-- 
2.43.0

