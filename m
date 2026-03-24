Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ECE1FE44A;
	Tue, 24 Mar 2026 02:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321013; cv=none; b=tP7Mu9dO6jLKzwJAkew64liFJhKcJHRJZahoZajiRyLeFbxC6eETrm96lsOeGIiP+T89mUJtI/79RCKzBHyBRoycmBMoq+dHCVLp+otvuI3Ig/PV4QksVIo3iZp1OYqRkEBLQ8Oa4TzHA2btiJ5RhZyJVc2/DnVrL+4zPTRPAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321013; c=relaxed/simple;
	bh=0kah365DbiYZI6c8KWPo7LoB4sSgMEbOVLMpUjxf4wY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7PPnrv29W2EQSm/NOWVbfinmfzp4gjWp86kP8xV216XwzRcx+lCgf2XV3sjwy94m7jrmbzmQJD+8vHHecdAT4ulfnZFpG+buzjDEoSrteXUgDt9v7PkFf+w8KARocUJmnjKlj72siKsEyE9FJMREg2mjSH9cw40u5upYowxX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=sv4YYUe7; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="sv4YYUe7"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62O2rXwK5278459, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774320813; bh=s+NBfkBtjjtc9IaZWRse743V27ZK/I4WahuYAx4/Jpk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=sv4YYUe7+BT66W+9PYYIXBHmQ+e2QwqO4p6nmyx3BylD0ZvvHqliSrEKaFlzfdTwl
	 BhezTfePqON7ZICio2vLWKpbAZZQ2zPknePRqI86ChPXyJQdaLuFpPxfWrkeW4NVoT
	 b2uDvmNj2XVp+9CD4BRUP5rZAl4A9394VAref3/aq7+rXpnyFu/1bxfSQgGGfqBfDH
	 Mfod9xKQnMnMk8X8cGN+DX+Z5hw2Y85RcTqR6lvCxVV2ci2Aw743++qSsOJP++h3at
	 hFLy8zAhuHAJL+gF6jRUR8+UtiRAWbFzg3NTVA/nez9bA+UaAqG6QdYNXZZ/6ClYnu
	 Q+g1q9d3anh6w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62O2rXwK5278459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 10:53:33 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 24 Mar 2026 10:53:33 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Mar 2026 10:53:33 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v5 04/10] clk: realtek: Introduce a common probe()
Date: Tue, 24 Mar 2026 10:53:25 +0800
Message-ID: <20260324025332.3416977-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324025332.3416977-1-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
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
add the clock provider, and optionally register a reset controller when
reset bank data is provided.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v5:
- Synchronized with reset controller changes.
---
 MAINTAINERS                  |  1 +
 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  1 +
 drivers/clk/realtek/Kconfig  | 28 +++++++++++++++++
 drivers/clk/realtek/Makefile |  4 +++
 drivers/clk/realtek/common.c | 59 ++++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/common.h | 43 ++++++++++++++++++++++++++
 7 files changed, 137 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/common.c
 create mode 100644 drivers/clk/realtek/common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9419b0497e0b..31f4a5a66394 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22229,6 +22229,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:      drivers/clk/realtek/*
 F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 
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
index 000000000000..63eb3fb3e79a
--- /dev/null
+++ b/drivers/clk/realtek/Kconfig
@@ -0,0 +1,28 @@
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
+	depends on RESET_CONTROLLER
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
index 000000000000..18a0d82ded0c
--- /dev/null
+++ b/drivers/clk/realtek/common.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include "common.h"
+
+int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
+{
+	int i, ret;
+	struct regmap *regmap;
+	struct device *dev = &pdev->dev;
+	struct rtk_reset_initdata reset_initdata = {0};
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
+	if (!desc->num_reset_descs)
+		return 0;
+
+	reset_initdata.regmap = regmap;
+	reset_initdata.num_descs = desc->num_reset_descs;
+	reset_initdata.descs = desc->reset_descs;
+
+	return rtk_reset_controller_add(dev, &reset_initdata);
+}
+EXPORT_SYMBOL_GPL(rtk_clk_probe);
+
+MODULE_DESCRIPTION("Realtek clock infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/realtek/common.h b/drivers/clk/realtek/common.h
new file mode 100644
index 000000000000..9cf013f9ba2b
--- /dev/null
+++ b/drivers/clk/realtek/common.h
@@ -0,0 +1,43 @@
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
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/reset/realtek.h>
+
+#define __clk_regmap_hw(_p) ((_p)->hw)
+
+struct device;
+struct platform_device;
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
+	struct rtk_reset_desc *reset_descs;
+	size_t num_reset_descs;
+};
+
+static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_regmap, hw);
+}
+
+int rtk_clk_probe(struct platform_device *pdev,
+		  const struct rtk_clk_desc *desc);
+
+#endif /* __CLK_REALTEK_COMMON_H */
-- 
2.34.1

