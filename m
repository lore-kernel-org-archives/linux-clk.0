Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51DE38BDA1;
	Tue, 13 Jan 2026 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303437; cv=none; b=SgpuExhC63KDqwnp0m5IxIdX50yN/cywuu35OyGKMG2QouyDnKGJkhex99uM5+L8NLrgiDvQD5OVWmpuR8eGekimfHPlz6E3r+w0Ax0mM9HvDxE1dF6gpeC6xCgevim6CYu4tKuHLii5/WPKLKq722i/q4tH9ysmmX83ppPvGVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303437; c=relaxed/simple;
	bh=z5oahDmp+y4QwVOvVhosPhPYzZ3d2flzcODiAbCuMtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OiiGFe1B73gqIb3Qc4x9VcFcveQvV/5qt5NNnHpN9TN+1QiEFizde5s3QSKvkCyosro8SwOLWzgsc3vmFm6Jocreh4L0igPDo5nOoS494Ak2Bymw5EEsjGlYkY/WrEP4GbklhObX9NnGJP5H1kDsWEPIIqJ0ZrkwCWVXg8nz7qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=OQBXIGyU; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="OQBXIGyU"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60DBNYZz82915413, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1768303414; bh=w6kWl/tugk48uO4dGQgKcqAuo/wkrSboNM5e/JXnSzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=OQBXIGyUyz/n7E7ySCakl3qFN18SGWb8rF7XzOn3lBpZAz3K+sUi0nIcesdnNuHDw
	 UdCrnVZ6DSwd6pWXxaOCBJPPbKow8yyaRTDhvFzSnXDWA3UNm0FKyl+vJ7lJlHkLOU
	 vhehe2KqaVIbq5p8f1SpIjnfQATFhXKJkjlzry2jyB43v2Hr2h1yrDn34YE8NCqblA
	 jtC6xqwR4RbIaPc4XX4I5FaB1JhyaMFP6JBSu54bfSLCFO5vHo8ZLvdudpnUokN4lJ
	 ciWnY0+OhZWbzsa8vYtdI/TUocyadiW3Yp8gOb87H+V5oQc+67l4d1YmS5JsNCtcnl
	 oSVb0pV8q73cg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60DBNYZz82915413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 19:23:34 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 13 Jan 2026 19:23:34 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 13 Jan 2026 19:23:33 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 Jan 2026 19:23:33 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v2 3/9] clk: realtek: Introduce a common probe()
Date: Tue, 13 Jan 2026 19:23:26 +0800
Message-ID: <20260113112333.821-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113112333.821-1-eleanor.lin@realtek.com>
References: <20260113112333.821-1-eleanor.lin@realtek.com>
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
Changes in v2:
- Added missing Co-developed-by tag.
- Fixed coding style issues.
- Switched to using dev_err_probe() return value.
- Fixed format specifier (%zu instead of %lu)
---
 drivers/clk/realtek/Makefile |  1 +
 drivers/clk/realtek/common.c | 68 ++++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/common.h | 40 +++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 drivers/clk/realtek/common.c
 create mode 100644 drivers/clk/realtek/common.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 52267de2eef4..4041951b7c62 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
+clk-rtk-y += common.o
 clk-rtk-y += reset.o
diff --git a/drivers/clk/realtek/common.c b/drivers/clk/realtek/common.c
new file mode 100644
index 000000000000..5c9217943898
--- /dev/null
+++ b/drivers/clk/realtek/common.c
@@ -0,0 +1,68 @@
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
+	if (ret) {
+		dev_err(dev, "Failed to add clock provider\n");
+		return ret;
+	}
+
+	if (!desc->num_reset_banks)
+		return 0;
+
+	if (!desc->reset_banks) {
+		dev_err(dev,
+			"Missing reset banks data though num_reset_banks is %zu\n",
+			desc->num_reset_banks);
+		return -EINVAL;
+	}
+
+	reset_initdata.regmap = regmap;
+	reset_initdata.num_banks = desc->num_reset_banks;
+	reset_initdata.banks = desc->reset_banks;
+
+	return rtk_reset_controller_add(dev, &reset_initdata);
+}
+EXPORT_SYMBOL_GPL(rtk_clk_probe);
+
+MODULE_DESCRIPTION("Realtek clock infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/realtek/common.h b/drivers/clk/realtek/common.h
new file mode 100644
index 000000000000..7b700f144e9e
--- /dev/null
+++ b/drivers/clk/realtek/common.h
@@ -0,0 +1,40 @@
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
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include "reset.h"
+
+struct device;
+struct platform_device;
+
+struct clk_regmap {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+#define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
+#define __clk_regmap_hw(_p) ((_p)->hw)
+
+struct rtk_clk_desc {
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_regmap **clks;
+	size_t num_clks;
+	struct rtk_reset_bank *reset_banks;
+	size_t num_reset_banks;
+};
+
+int rtk_clk_probe(struct platform_device *pdev,
+		  const struct rtk_clk_desc *desc);
+
+#endif /* __CLK_REALTEK_COMMON_H */
-- 
2.34.1

