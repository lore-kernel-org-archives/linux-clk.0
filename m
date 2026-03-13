Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC61373C16;
	Fri, 13 Mar 2026 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389632; cv=none; b=NaNxXyruzpyEbl80QjNUJo+MTRaCY+Q0h7RAOKgacc5gJN+215Bq21gauWbuLzjESZjhruIHuT8xjeNpW5rBkL/iUNsb20rYXFvHvB1iFKYU7GbrDMmoyxpasVqRDY4/ekG5IZ164IVad3t32vniwfpeydTGGEVLqAj4CzLctGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389632; c=relaxed/simple;
	bh=STz+KrKriVbn/Yi9tj9YoWqYlYGemVhtjz1CxiW3504=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWhf/CRN2SvY3Htrd7Bpawrv0z4h5dQBI3eZioa2JplXMhtnqxpdCwUGMKwc81+KbwLNsLJV5xCv1+dqaUszA+aJsI+FAelXGUBLqYPU34U+ow7nZ/BzRj6dWcnOa7RCa3dXFvTwkFHzjxUSZ9ofiBlpOcSCcR99i6EoEdiU2ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=rWX6Fx7i; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="rWX6Fx7i"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B13i8053105, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389461; bh=Rvj1u7dJN3NtS3hNMu0YqdgNoq25DOqHQM5HKAgQ9Nk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=rWX6Fx7i/NAGzq1PqoFgepMUQfoBOHF6litSME5gBxdj7hpX2XvZ2D8Aim40iMWIQ
	 yLb1IEm9wiJgw5Kj/xcF90ecdKFGwVW0gn5UrTteurpsCICK5D2dmVqy447fKdls/C
	 J3FinTTXyT8xQ4OkLB1wvU0gMxnswGtJEgTy327qTE8QWIs+L24xXFoovsj0NtwaZ3
	 8s0JZjOdzHbMBjRAIDo03VSKRS1eSMKz5KYcX0rAiN4SceLOzzP+DQTDkMx7Zp8Ytg
	 vOt3JvDZf8Gi5124/i8uhggl2gTFhkGTR6KFzQZEBVbrL2l0JzOIyIdU22wQfHDo0l
	 X+bNzEdsiOHwQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B13i8053105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:02 +0800
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
Subject: [PATCH v4 04/10] clk: realtek: Introduce a common probe()
Date: Fri, 13 Mar 2026 16:10:54 +0800
Message-ID: <20260313081100.596224-5-eleanor.lin@realtek.com>
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

Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
add the clock provider, and optionally register a reset controller when
reset bank data is provided.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- None.
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

