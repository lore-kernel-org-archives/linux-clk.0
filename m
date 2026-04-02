Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FE131A576;
	Thu,  2 Apr 2026 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115778; cv=none; b=aBCQMNzY3TRsb42r6UEe6rIJ7zdl+FaiUbpwa8ejaaS+1sD+a6kURs2R2jPZVPEyopMQPr0XdV4I6JhWC5aE10nTxnZcT5Klds2s7lGk/zanQZdCZYDi5fGqyVeNDWL9vB68QcKSTzGYmFAJCoov7b559kyzFUugUseSHbW2kIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115778; c=relaxed/simple;
	bh=wCSN6NemUWyYzRGj4j6b9Bf9f3341teIRv0jX771lFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCfqdu+mOTGuB/s0VKB1X+1QtGzSQQPq/F2TI5F6orqTQdU4tZdzylwu0D4taNpk/MDxRGR8NLqRxzch2cOghQ2hpPjG57wPlX5DOHC7sfdvBhvCNxn3yTKN0dsojKYllfzXYoqzgOsKBKrxMY/Wihwk7ZFc8sSKgVShg/sKxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=OXJM0epR; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="OXJM0epR"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6327dxzP72694958, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775115599; bh=kZ94YyV8/l/kht7nEJZ9dAzhd0eUAXDoFb6F4pOLiSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=OXJM0epR9Qf/eVIFpuKgzGDKNu/YH4lWaWVqfFCpCgZ8KRNN2mBjDD4sgvd3vsn6W
	 cbS4AYavLrvJwMChZwQzqSRlMJ1WREJtRTtEmHIzi7nTm6DUbYEOYqmCHDriQ+wCKy
	 3QdvYsvXmiqN018ju5YvStf06AxvxbAw52c3NT4EaZvwOpg60U+RsZhqNVTESI1Mcb
	 PQukIbNl2MqhSS6hruYZIfBrrsvpb6l9uc3FBZp0tJ9wEHfxRSQoR7SDv9tw9Ms1PP
	 6meiRtO434trN9m1JiDPSCUQzOXHehDvK96xNTZId/gqfSPk4vTKCCPViGt64WGpsd
	 PmPI6XQPNKKzA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6327dxzP72694958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 15:39:59 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:39:59 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:39:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 2 Apr 2026 15:39:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v6 03/10] clk: realtek: Introduce a common probe()
Date: Thu, 2 Apr 2026 15:39:50 +0800
Message-ID: <20260402073957.2742459-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260402073957.2742459-1-eleanor.lin@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
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
Changes in v6:
- Replace direct reset controller initialization with auxiliary device creation.
- Add aux_name parameter to rtk_clk_probe() to register the reset auxiliary device.
- Simplify rtk_clk_desc because reset data is handled entirely by the auxiliary reset driver.
- In Kconfig, change "depends on RESET_CONTROLLER" to "select RESET_CONTROLLER"
- Remove unused includes headers and added <linux/auxiliary_bus.h>.
---
 MAINTAINERS                  |  1 +
 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  1 +
 drivers/clk/realtek/Kconfig  | 28 +++++++++++++++
 drivers/clk/realtek/Makefile |  4 +++
 drivers/clk/realtek/common.c | 67 ++++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/common.h | 37 ++++++++++++++++++++
 7 files changed, 139 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/common.c
 create mode 100644 drivers/clk/realtek/common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f355896583b..8318156a02b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22240,6 +22240,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/clk/realtek/*
 F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
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
index 000000000000..bc47d3f1c452
--- /dev/null
+++ b/drivers/clk/realtek/Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_REALTEK
+	bool "Clock driver for Realtek SoCs"
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
+	select RESET_CONTROLLER
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
index 000000000000..377ec776ee47
--- /dev/null
+++ b/drivers/clk/realtek/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
+
+clk-rtk-y += common.o
diff --git a/drivers/clk/realtek/common.c b/drivers/clk/realtek/common.c
new file mode 100644
index 000000000000..c5aea15a3714
--- /dev/null
+++ b/drivers/clk/realtek/common.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "common.h"
+
+static int rtk_reset_controller_register(struct device *dev, const char *aux_name)
+{
+	struct auxiliary_device *adev;
+
+	if (!of_property_present(dev->of_node, "#reset-cells"))
+		return 0;
+
+	adev = devm_auxiliary_device_create(dev, aux_name, NULL);
+
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+	return 0;
+}
+
+int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc,
+		  const char *aux_name)
+{
+	int i, ret;
+	struct regmap *regmap;
+	struct device *dev = &pdev->dev;
+
+	regmap = device_node_to_regmap(pdev->dev.of_node);
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
+
+		if (ret) {
+			dev_warn(dev, "failed to register hw of clk%d: %d\n", i,
+				 ret);
+			desc->clk_data->hws[i] = NULL;
+		}
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  desc->clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return rtk_reset_controller_register(dev, aux_name);
+}
+EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "REALTEK_CLK");
+
+MODULE_DESCRIPTION("Realtek clock infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/realtek/common.h b/drivers/clk/realtek/common.h
new file mode 100644
index 000000000000..93a746d9bbf0
--- /dev/null
+++ b/drivers/clk/realtek/common.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2016-2019 Realtek Semiconductor Corporation
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
+	struct clk_regmap **clks;
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
2.34.1

