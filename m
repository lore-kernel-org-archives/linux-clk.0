Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902E747A874;
	Tue,  4 Aug 2026 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861575; cv=none; b=sOImNCb89aDVX8NcLfnM3eEKE52FDODUo2wMlB1D+RSlPPh054RowMrQyOdt3OpXMzEPqsVrnO3BiCg+xQMW8T8EUUhaWX7oSzTA3EEzQEaJlXxR69o4tUrCChnd0MytvU0Jl1k4wzGj41u1K0xPrTHMCbo0h2il82UX4SJBmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861575; c=relaxed/simple;
	bh=fFmA4HX2xSM59oxXTewAU5s431+yDGnZUQI7TV/lfec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkwh5LcsATOIYFcnkH4sUJcSpy9EoGDbcIZ5HXtMLmfeYzbimJ4VBpYaSyZKInre3uhJqc4vEiBBTZ/oP2BCQnF25ZLNFGD9bxdPmN70eNlpMH5/qqY/qYlwN+ikyYVKSBX2u/mTNKezNuyTuX8JZkrfQpUTZVAB8bMh8cZQhhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=pb2Hlo3W; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="pb2Hlo3W"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 674Gc9y751231941, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785861489; bh=5FUKGKQX/xUY9F07T4vswayol6atIYlKoL805XEhk5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=pb2Hlo3WHmupoja2a6SJ6c9FQb0IpBd8zO5rVprkiFENsYFqmYbFx8zCu6sDB8kj7
	 j7beWuToIPlZ9+uRcyp4lacnw2M2sEN+GV86EhMQ9EuMywjtXNVI0Yshbn2mMtkzuC
	 91C6Wt0kOcfVf2ZMvXqr1qu1nIZaYsrX+1vfwMFEYhg9hXwZvlnBWnsrZdQhx9K9P3
	 zmhwZjSazBfIllUzqpp0ijCR4+H6tQIVeVpeAjn9V/6ZBysTzy5D0N9gV7zNOJnDiB
	 aJX8wfCa5I718PCaPOMZB32ts089j+N01tkKg9+eNZSWNonR9yPNATA3uDpyGfb/yA
	 AG42q8xgRv8+A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 674Gc9y751231941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 00:38:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Aug 2026 00:38:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Aug 2026 00:38:09 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Aug 2026 00:38:09 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v12 04/11] clk: realtek: Introduce common probe() and remove()
Date: Wed, 5 Aug 2026 00:38:00 +0800
Message-ID: <20260804163807.1285869-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804163807.1285869-1-eleanor.lin@realtek.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
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

Add rtk_clk_remove() to clear the regmap pointers in the clock descriptors
during driver unbind to prevent dangling pointers.

Additionally, if the "#reset-cells" property is present in the device tree,
it creates and registers an auxiliary device using the provided aux_name.
This allows the dedicated reset driver to bind to this device, enabling
both clock and reset drivers to share the same regmap.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v12:
- Add rtk_clk_remove().
- Rename symbol namespace from REALTEK_CLK to CLK_REALTEK.
- Add Reviewed-by tag from Brian.
---
 MAINTAINERS                          |  1 +
 drivers/clk/Kconfig                  |  1 +
 drivers/clk/Makefile                 |  1 +
 drivers/clk/realtek/Kconfig          | 30 ++++++++++
 drivers/clk/realtek/Makefile         |  4 ++
 drivers/clk/realtek/clk-rtk-common.c | 83 ++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-rtk-common.h | 38 +++++++++++++
 7 files changed, 158 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a752551f32f9..e55eb1c06119 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22746,6 +22746,7 @@ M:	Cheng-Yu Lee <cylee12@realtek.com>
 M:	Yu-Chun Lin <eleanor.lin@realtek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/clk/realtek/*
 F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..97ad817457db 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -525,6 +525,7 @@ source "drivers/clk/nuvoton/Kconfig"
 source "drivers/clk/pistachio/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/ralink/Kconfig"
+source "drivers/clk/realtek/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..b1aa373e9f84 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
+obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
 obj-y					+= renesas/
 obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
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
index 000000000000..e8422ecbad79
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtk-common.c
@@ -0,0 +1,83 @@
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
+int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	struct clk_hw *hw;
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
+		hw = desc->clk_data->hws[i];
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
+	platform_set_drvdata(pdev, (void *)desc);
+
+	return rtk_reset_controller_register(dev, desc->aux_name, regmap);
+}
+EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
+
+void rtk_clk_remove(struct platform_device *pdev)
+{
+	const struct rtk_clk_desc *desc = platform_get_drvdata(pdev);
+
+	if (!desc)
+		return;
+
+	for (int i = 0; i < desc->num_clks; i++)
+		desc->clks[i]->regmap = NULL;
+}
+EXPORT_SYMBOL_NS_GPL(rtk_clk_remove, "CLK_REALTEK");
+
+MODULE_DESCRIPTION("Realtek clock infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
new file mode 100644
index 000000000000..87a0ff8729d5
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtk-common.h
@@ -0,0 +1,38 @@
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
+void rtk_clk_remove(struct platform_device *pdev);
+
+#endif /* __CLK_REALTEK_COMMON_H */
-- 
2.43.0

