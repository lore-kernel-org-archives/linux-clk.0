Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43360332EAF;
	Thu, 22 Jan 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080158; cv=none; b=QgZBfs/3ZkecaqXTRk9yqBxQhq7900L8mTRZfwKpvpNghmHg008VyRTwcDlCt7hZ1zLwZivL1ybS2MRyqRcjUmTFFpZLoOiHqcJKHIC9TDndAUqF6csIbh0YK7xcRjeu5JSdq/YJo7mH+yYT1yGvM/LmHH/8PGgA0Uq4b6ee/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080158; c=relaxed/simple;
	bh=cB5FCqLMYPosl//x4hFfDY7sLLOPq5OziY+AyOsIQHY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJNYXPWL6S5q+sY+to6O0hWVdKbcJt4xB3vBp21bF1+hUViUrGhMSJsfAPIglet0rugQBkbyjHiAaddqkR5J3EvR5RjZRw+KJUdNEJdpnAuwCue4eCQasMJDRSot5sm6tr6/HrqYxy/eLis2GQHZ9zvacUaucLCaVD/MVLbPbB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MuFpldoi; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MuFpldoi"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60MB8wj36913370, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1769080138; bh=C49V+bKpMIX5oRf9GDZOGvdktiUHOYIk5vTUR3yTe9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MuFpldoiTPH8L+geYNG5mFQ0s3S6foTkZQu84fDuGUu6Q+b3QvHbC4EB1bb1yIM80
	 6u//Nu/h0evgYqZBfAF5uQCsKNf6GfNQ9PJ+B+CoamZQlNWNi/Hb6TEmqz0ZTzstMP
	 Xj5HHtC0DfOZU6TiWK4eRYhifbpBXN6Z1eR+awxtzjv99Y/Zwm9rvrf5lj5VmbX5cN
	 /3mb3DtQzIg1FE237GVc17bXND54V0G5dbxuhQaWUaZ3sLhAHWQDqKPt4l5iMe/2c1
	 b51IcEzH/KtSpsApbcJ5dqFBfTaE2zk5u8rDxGXeHi5t8fKbetW3y/FE++lOtqMAGn
	 6hZy4P1mA9JZg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60MB8wj36913370
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
Subject: [PATCH v3 3/9] clk: realtek: Introduce a common probe()
Date: Thu, 22 Jan 2026 19:08:51 +0800
Message-ID: <20260122110857.12995-4-eleanor.lin@realtek.com>
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

Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
add the clock provider, and optionally register a reset controller when
reset bank data is provided.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Converted macro to static inline function.
- Removed the redundant header.
---
 drivers/clk/realtek/Makefile |  1 +
 drivers/clk/realtek/common.c | 64 ++++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/common.h | 43 ++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
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
index 000000000000..c6540d36560c
--- /dev/null
+++ b/drivers/clk/realtek/common.c
@@ -0,0 +1,64 @@
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
+	if (!desc->num_reset_banks)
+		return 0;
+
+	if (!desc->reset_banks)
+		return dev_err_probe(dev, -EINVAL,
+				     "Missing reset banks data though num_reset_banks is %zu\n",
+				     desc->num_reset_banks);
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
index 000000000000..4e2cc9650a23
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
+#include "reset.h"
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
+	struct rtk_reset_bank *reset_banks;
+	size_t num_reset_banks;
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

