Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251731DE3B5;
	Mon, 29 Dec 2025 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766994824; cv=none; b=YWSUgTmqAj8vUGBT0ewJjva273krdn3ioFzuJYCKiWIWlu1W6mTqovTM/Ue/v1vStsFVj8zN12b5EwFnTgGd3bqnBo18mYhiMn7Zg8HyUp7MPdQAVWyPxjWnmrmAxfySJSZxIb/ZLTXTtFLA8rx2NExCS+fk0kEpkkp2uej9MGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766994824; c=relaxed/simple;
	bh=nwkF9wrSJRy8OtAXEnxc1n2BKlC7xyNiBkRPVJPTB34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqdBHyGNrH/X5gWQjOSsleY022Lzomzn45GnRzxUjvpya52BCgPYFXgzxnqIkm1JNL3SBzN0/YJw4l/lsRfvKtM4kgiFmiAVdOyVWZRRYdCBLJLF6/e4u5czGY3MzWWmnUH0sf8IpZucPCxtsjaSyM0WBA91SOhK3RvWFVLMITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=f6anjCf7; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="f6anjCf7"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BT7rF621703572, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766994795; bh=FxERlrrtpnuqqDgvHfC5QHmw4Rl/klMY6mXW1+gFRHw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=f6anjCf7AkV8fAlnT0rU7gMMLcg1qIeXmtLhfWdnZy89O44gKqC1yYGp1H+A8M3Fc
	 qNqx6cwqkbgGFU5e1hXUYrIFtX/JPxHwsAomTyf7FwEio1GD/wpjm4l5PkBCaovEhA
	 L6v/ripDqawoQc+z4YJZYFqYZzXLYPzmorJ/xQI9zPS0AhpQOwsD2ozopwhYw4JEbB
	 QjC7UC/fDCPT5RN43h2dEwdoqSipvkflyCpqdRqTS1LimBeJ4us3FcgRzbSDAqmzTD
	 4I3XvD+0rY+yUmAZVT2Xo3vrcf2SEcFONA/o2ZECq9FTYsEbel7n/SSwXnZK9wzuhI
	 AkoLnovLdgOHw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BT7rF621703572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 15:53:15 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 29 Dec 2025 15:53:15 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
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
Subject: [PATCH 3/9] clk: realtek: Introduce a common probe()
Date: Mon, 29 Dec 2025 15:53:07 +0800
Message-ID: <20251229075313.27254-4-eleanor.lin@realtek.com>
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

Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
add the clock provider, and optionally register a reset controller when
reset bank data is provided.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/clk/realtek/Makefile |  1 +
 drivers/clk/realtek/common.c | 72 ++++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/common.h | 40 ++++++++++++++++++++
 3 files changed, 113 insertions(+)
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
index 000000000000..df89d2a10291
--- /dev/null
+++ b/drivers/clk/realtek/common.c
@@ -0,0 +1,72 @@
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
+	struct device *dev = &pdev->dev;
+	struct rtk_reset_initdata reset_initdata = { 0 };
+
+	struct regmap *regmap = device_node_to_regmap(pdev->dev.of_node);
+
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err(dev, "Failed to get regmap: %d\n", ret);
+		return ret;
+	}
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
+
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
+			"Missing reset banks data though num_reset_banks is %lu\n",
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

