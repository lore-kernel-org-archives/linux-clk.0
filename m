Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C6286AC;
	Wed, 24 Jun 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300642; cv=none; b=LG/QcEudY+z3G1YvDFqs6QdQoAoKvSYJBiiuS+JsQx3HG6wa91Bie3qD7e8ycvya7KNwfvVRLRYWe+5Jc4s7Vd+lsj70TAd2C6jkPM0lRMx2K71RQTo1wEQ8h73/S3JcWI2UA2XLX2tcwsEoj9ZNlhbYlfBQ+6ZnN9DnuhhuDkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300642; c=relaxed/simple;
	bh=iLnKPqbNpXHgl+wrhoJxMA29BMyB5f9SLv8sq9r7ncg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rj2DXCsJQrc4UszQaI65yl9T1OiHd5M8P4O2WhN8sI4tFn1q7b4p1ynkF6djuHXQGpjbTOE03ikL7XjhMAuSeEItWlCQ+wG1NVJoFSfDUig5cdQhYoE4fG1ynqJb1zCLl5mX9TorDP83RA6EqG0Q4yau4S7a37+A1VJZIExyyp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Pp8w3vim; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Pp8w3vim"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65OBTjEI24147253, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782300585; bh=MLTRbdcInA6nyLqoCNrwBKRTLG5pQWpW8t5mlzl2B98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Pp8w3vimUfZ7ouq3LBxIlShDKQozT+qUXWbayapBHHmcEDj0DXxkiK0wnc61HOaZB
	 5ssflsu647gfS7avOObbIK21WfGa2ZqkKqWN/c2aNfQrQUT79AjMAQRAKf9IvUXf+8
	 lIVeyP5pX+xMkIyv8WVCDW4iKSj+3GvkX6e/1eN48hgW1pc2/PL79oNIHSxaZc/sLW
	 Ldktqdi22escljxoP1NmOo8c4D8TEDNgX1XCcDUAV6OjhQqEYmKOzNmcIS0p5KpDk2
	 awbsmJzHBSPCf8v8RtPkP02TUzw8E4Zy3XVCTyylgkYwfIqUAxCIq61YFIUxjLs7Wd
	 vXlGE6zZN692A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65OBTjEI24147253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jun 2026 19:29:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Jun 2026 19:29:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 24 Jun 2026 19:29:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v9 05/12] clk: realtek: Introduce a common probe()
Date: Wed, 24 Jun 2026 19:29:33 +0800
Message-ID: <20260624112940.3475605-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260624112940.3475605-1-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
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
---
Changes in v9:
- Rename common.[ch] to clk-rtk-common.[ch].
---
 MAINTAINERS                          |  1 +
 drivers/clk/Kconfig                  |  1 +
 drivers/clk/Makefile                 |  1 +
 drivers/clk/realtek/Kconfig          | 30 +++++++++++++
 drivers/clk/realtek/Makefile         |  4 ++
 drivers/clk/realtek/clk-rtk-common.c | 66 ++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-rtk-common.h | 37 ++++++++++++++++
 7 files changed, 140 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bc431a2a7d1..9cdcb333b68f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22675,6 +22675,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/clk/realtek/*
 F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2efbe9f6acb..8bf262dd23a9 100644
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
index a3e2862ebd7e..e226bee2d039 100644
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
index 000000000000..ed97531e321d
--- /dev/null
+++ b/drivers/clk/realtek/Kconfig
@@ -0,0 +1,30 @@
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
+	depends on RESET_CONTROLLER
+	select AUXILIARY_BUS
+	select MFD_SYSCON
+	select RESET_RTK_COMMON
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
index 000000000000..4fd16585dbf4
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtk-common.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
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
+	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
+
+	if (!adev)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc,
+		  const char *aux_name)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	int i, ret;
+
+	regmap = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
+
+	for (i = 0; i < desc->num_clks; i++)
+		desc->clks[i]->regmap = regmap;
+
+	for (i = 0; i < desc->clk_data->num; i++) {
+		struct clk_hw *hw = desc->clk_data->hws[i];
+
+		if (!hw)
+			continue;
+
+		ret = devm_clk_hw_register(dev, hw);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  desc->clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return rtk_reset_controller_register(dev, aux_name, regmap);
+}
+EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "REALTEK_CLK");
+
+MODULE_DESCRIPTION("Realtek clock infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
new file mode 100644
index 000000000000..c52fcdbff5ee
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
+#define __clk_regmap_hw(_p) ((_p)->hw)
+
+struct device;
+struct platform_device;
+struct regmap;
+
+struct clk_regmap {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+struct rtk_clk_desc {
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_regmap * const *clks;
+	size_t num_clks;
+};
+
+static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_regmap, hw);
+}
+
+int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc,
+		  const char *aux_name);
+
+#endif /* __CLK_REALTEK_COMMON_H */
-- 
2.43.0

